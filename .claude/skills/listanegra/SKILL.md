---
name: blacklist-ip
description: >
  Usar esta skill SIEMPRE que el usuario quiera comprobar si una IP, rango de IPs o dominio
  está en una lista negra (blacklist), RBL o DNSBL (Spamhaus, SORBS, Barracuda, UCEPROTECT, etc.).
  Activar cuando se mencionen: lista negra, blacklist, DNSBL, RBL, IP listada/bloqueada, reputación
  de IP, spam blacklist, comprobar reputación de dominio/correo, deliverability de email, servidor
  SMTP bloqueado, o IP marcada como spam/phishing/malware/botnet/proxy abierto. También activar
  cuando el usuario proporcione una IP o fichero de IPs y pida: auditar reputación, verificar
  blacklisting, sacar de lista negra (delisting), o análisis forense de por qué un servidor de
  correo rebota. Repositorio de referencia: https://github.com/hackingyseguridad/listanegra
---

# Blacklist IP Skill — hackingyseguridad/listanegra

Skill de auditoría de reputación IP. Cubre todo el ciclo: consulta masiva contra ~150 RBL/DNSBL,
análisis forense de contexto (whois, PTR, geolocalización, Shodan, puertos abiertos), verificación
específica en Spamhaus, y generación de hallazgo/informe con pasos de remediación (delisting).

Motivo por el que una IP acaba en lista negra (contexto para el análisis):

1. Spam de correo electrónico, phishing, scam, bulletproof hosting, spambots.
2. Sitios de phishing / suplantación de identidad.
3. Distribución de malware / equipos infectados.
4. Command & Control de botnets / equipos zombis.
5. Proxies abiertos HTTP/SOCKS comprometidos.

---

## FASE 0 — Preparación del entorno

```bash
git clone https://github.com/hackingyseguridad/listanegra
cd listanegra
chmod 777 *

# Dependencias necesarias (Kali Linux normalmente ya las trae)
sudo apt install -y whois dnsutils curl traceroute nmap jq --break-system-packages 2>/dev/null || \
sudo apt install -y whois dnsutils curl traceroute nmap jq
```

| Herramienta | Uso en la skill |
|---|---|
| `whois` | Datos del propietario/ASN de la IP |
| `dig` / `host` | Resolución inversa (PTR) y consultas DNSBL |
| `curl` + `jq` | Geolocalización (ipapi.co) y Shodan InternetDB |
| `nmap` | Puertos abiertos (contexto: relay abierto, proxy, C2) |
| `traceroute` | Ruta de red hacia la IP |

---

## FASE 1 — Consulta rápida en Spamhaus (una IP)

Usa `listanegra.sh`: análisis forense completo de una IP pública (whois, PTR, geo, Shodan, nmap,
traceroute y Spamhaus zen/sbl/xbl/pbl).

```bash
# Consultar tu propia IP pública de salida
./listanegra.sh --self

# Consultar una IP concreta
./listanegra.sh <IP>
```

**Salida clave a interpretar:**
- `LISTADA -> zen.spamhaus.org` → la IP está en Spamhaus (spam/malware/exploited).
- `LISTADA -> xbl.spamhaus.org` → indicios de exploit/malware/botnet en el host.
- `LISTADA -> pbl.spamhaus.org` → rango de IP dinámica/residencial, no debería enviar correo directo.
- `LISTADA -> sbl.spamhaus.org` → spam/spam-support confirmado por analistas de Spamhaus.
- Spamhaus DNSBL solo soporta IPv4 (las IPv6 rara vez se listan por SPAM).

---

## FASE 2 — Consulta masiva contra ~150 RBL/DNSBL (una IP)

Usa `checkip.sh`: recorre el listado completo de servidores DNSBL conocidos (Spamhaus, SORBS,
Barracuda, UCEPROTECT, Mailspike, SenderScore, Abuse.ch, dnswl, etc.) mediante consulta DNS inversa.

```bash
./checkip.sh <IP>
```

**Interpretación:**
- Cada línea `IP en lista negra, blacklisted en: <dominio_rbl>` es una listada positiva → documentar.
- Al final: `No listada en RBL` si no aparece en ninguna.
- Una única listada en un RBL poco relevante (ej. listas experimentales) tiene bajo impacto; múltiples
  listadas en RBLs de referencia (Spamhaus, SORBS, Barracuda, UCEPROTECT) indican reputación
  seriamente comprometida y bloqueo real de entrega de correo.

---

## FASE 3 — IPv4 / IPv6 e IPs múltiples

```bash
# Soporta tanto IPv4 como IPv6
./listanegra2.sh <IP>

# Consulta masiva desde fichero (una IP por línea en ip.txt)
cat > ip.txt << 'EOF'
203.0.113.10
198.51.100.25
2001:db8::1
EOF
./check2.sh
```

Recomendado para auditorías de rango completo (ej. bloque `/24` de un cliente) o para verificar
reputación de todos los servidores SMTP salientes de una organización.

---

## FASE 4 — Consulta manual / verificación cruzada (web)

Cuando se requiera confirmación visual, evidencia para el informe, o delisting:

| Servicio | URL |
|---|---|
| WhatIsMyIPAddress Blacklist Check | https://whatismyipaddress.com/blacklist-check |
| BlacklistAlert | https://blacklistalert.org/ |
| DNSBL.info | https://www.dnsbl.info/ |
| Spamhaus (consulta directa) | https://check.spamhaus.org/query/ip/$IP |
| MXToolbox | https://mxtoolbox.com/ |
| MultiRBL (Valli) | https://multirbl.valli.org/lookup/$IP.html |

Estos paneles suelen incluir el enlace directo de **delisting/removal request** cuando la IP figura
listada, dato imprescindible para la sección de remediación del informe.

---

## FASE 5 — Decisión: siguiente paso según resultado

| Resultado | Acción recomendada |
|---|---|
| No listada en ninguna RBL | Documentar como OK / baseline de reputación limpia |
| Listada solo en RBL secundarias/experimentales | Riesgo bajo, monitorizar, revisar SPF/DKIM/DMARC |
| Listada en Spamhaus PBL | Verificar si la IP es dinámica/residencial y no debería enviar correo directo (usar smarthost/relay del ISP) |
| Listada en Spamhaus SBL/XBL/ZEN, SORBS, Barracuda o UCEPROTECT | Riesgo alto: iniciar investigación de compromiso (malware, relay abierto, cuenta comprometida) antes de solicitar delisting |
| Puertos abiertos sospechosos en `nmap` (25 saliente sin control, proxy abierto, C2 típico) | Correlacionar con el listado — probable causa raíz del blacklisting |

---

## FASE 6 — Remediación / Delisting (checklist)

1. Confirmar y **corregir la causa raíz** (limpiar malware, cerrar relay/proxy abierto, rotar
   credenciales SMTP comprometidas, filtrar salida SMTP con firewall).
2. Verificar registros de autenticación de correo: SPF, DKIM y DMARC correctamente publicados.
3. Solicitar el delisting en cada RBL donde aparezca (cada proveedor tiene su propio formulario;
   Spamhaus: https://check.spamhaus.org/query/ip/$IP incluye el enlace de "Remove me from this list").
4. Volver a ejecutar `checkip.sh` y `listanegra.sh` transcurridas 24–72h para confirmar la baja.
5. Monitorización continua recomendada (cron diario con `checkip.sh` sobre las IPs de salida SMTP).

---

## PLANTILLA DE HALLAZGO PARA INFORME

```
HALLAZGO: IP en lista negra (Blacklist / DNSBL)
IP/Rango:  [objetivo]
PTR:       [resultado de dig -x]
ASN/Whois: [organización propietaria]
CVSS v3.1: N/A (hallazgo operativo, no vulnerabilidad técnica clásica) — clasificar como
           Informativo/Medio/Alto según impacto en entregabilidad de correo

LISTAS EN LAS QUE APARECE:
- zen.spamhaus.org   -> [SI/NO]
- sbl.spamhaus.org   -> [SI/NO]
- xbl.spamhaus.org   -> [SI/NO]
- pbl.spamhaus.org   -> [SI/NO]
- [otras RBL detectadas por checkip.sh]

DESCRIPCIÓN:
[Contexto: motivo probable — spam, phishing, malware, botnet C&C, proxy abierto]

EVIDENCIA:
$ ./listanegra.sh <IP>
[output recortado]
$ ./checkip.sh <IP>
[output recortado]

IMPACTO:
[Correo rebotado/marcado como spam, reputación de dominio afectada, posible indicador de compromiso]

REMEDIACIÓN:
- Identificar y neutralizar la causa raíz (ver FASE 6)
- Publicar/corregir SPF, DKIM, DMARC
- Solicitar delisting en cada RBL afectada
- Monitorización periódica de reputación

REFERENCIAS:
- https://github.com/hackingyseguridad/listanegra
- https://check.spamhaus.org/query/ip/[IP]
```

---

## REFERENCIAS

- Repositorio: https://github.com/hackingyseguridad/listanegra
- Scripts: `listanegra.sh` (análisis forense + Spamhaus), `listanegra2.sh` (IPv4/IPv6),
  `checkip.sh` (consulta masiva ~150 RBL de una IP), `check2.sh` (consulta masiva desde `ip.txt`)
- Spamhaus DNSBL: https://www.spamhaus.org/
- www.hackingyseguridad.com
