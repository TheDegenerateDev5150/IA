<img align="left" alt="hackingyseguridad.com" src="https://github.com/hackingyseguridad/ia/blob/main/banner.png" style="margin-bottom: 20px;">

<br clear="left"/>

---

# IA aplicada a la Ciberseguridad Ofensiva — *Offensive AI*

> **Inteligencia Artificial aplicada a la detección y explotación de vulnerabilidades en entornos de auditoría de seguridad autorizada.**

📖 [INTRODUCCIÓN](https://github.com/hackingyseguridad/IA/blob/main/INTRODUCCION.md) · 💻 [USO IA POR CONSOLA TERMINAL(CLI)](https://github.com/hackingyseguridad/IA/blob/main/CONSOLA.md) · 📝 [PROMPTS](https://github.com/hackingyseguridad/IA/blob/main/PROMPTS.md) · 📝 [SKILLs](https://github.com/hackingyseguridad/IA/tree/main/.claude/) · ⚖️ [AVISO LEGAL](https://github.com/hackingyseguridad/IA/blob/main/DISCLAIMER.md)

---

## IA ( Pentesting con inteligencia artificial )

La Inteligencia Artificial actúa como un **asistente experto especializado** con alto nivel de conocimiento en programación y ciberseguridad. Sus capacidades en el contexto de una auditoría de seguridad incluyen:

- **Conocimiento de vulnerabilidades:** evalúa y describe CVEs (*Common Vulnerabilities and Exposures*), sugiere vectores de ataque y analiza código en busca de fallos de lógica que herramientas tradicionales ignoran.
- **Generación de scripts:** produce código de prueba en múltiples lenguajes (Bash, Python, C) para: pruebas de detección, pruebas de concepto (POC) y scripts de explotación de vulnerabilidades confirmadas.
- **Aceleración del proceso:** ayuda a ejecutar las pruebas de forma más rápida y eficiente, reduciendo el tiempo invertido en tareas repetitivas o de análisis masivo de datos.

>  **-** La IA no sustituye todavia el criterio humano en una auditoría. El auditor sigue siendo quien rige el proceso y el único responsable de validar hallazgos, acciones y conclusiones.

---

## Proceso de Pentesting Integrado: Kali Linux + IA

| Fase | 1º | 2º | 3º | 4º | 5º | 6º |
|------|:--:|:--:|:--:|:--:|:--:|:--:|
| **Etapa** | Reconocimiento (RECON / OSINT) | Escaneo de vulnerabilidades (SCAN) | Clasificación y análisis IA (VULN) | Prueba de concepto (POC) | Explotación (EXPLOIT) | Informe final (REPORT) |
| **Herramienta** | IA + OSINT | nmap, Nessus, Nikto… | IA analiza `.xml/.csv/.txt` | Scripts IA | Scripts IA | Informe PDF con IA |

---

## Claude AI Skills para Pentesting

Las **SKILL** de Claude son asistentes especializados que se activan automáticamente según el contexto del pentest. Están organizadas siguiendo el ciclo de vida completo de una auditoría de seguridad:

### 📊 Organización por Fases de Ataque

| Fase | SKILL | Descripción | Ubicación |
|:-----|:------|:-----------|:----------|
| **1. Reconocimiento** | `recon` | Análisis inicial del activo, recopilación OSINT, identificación de superficies de ataque | [recon/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/recon/SKILL.md) |
| **2. Análisis de Vulnerabilidades** | `Vuln` | Clasificación y análisis de vulnerabilidades CVE genéricas | [Vuln/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/Vuln/SKILL.md) |
| | `webaudit` | Análisis de vulnerabilidades en aplicaciones web a partir de IP/FQDN | [webaudit/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/webaudit/SKILL.md) |
| | `api` | Análisis de vulnerabilidades en APIs a partir de IP/FQDN | [api/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/api/SKILL.md) |
| | `path-traversal` | Búsqueda de vulnerabilidades path traversal en APIs/web con catálogo de payloads | [path-traversal/](https://github.com/hackingyseguridad/IA/tree/main/.claude/skills/path-traversal) |
| | `ssh` | Vulnerabilidades SSH, enumeración, cifrados débiles, explotación | [ssh/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/ssh/SKILL.md) |
| | `listanegra` | Auditoría de reputación de IPs y dominios en listas negras (DNSBL/RBL) | [listanegra/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/listanegra/SKILL.md) |
| | `email` | Análisis de vulnerabilidades en servidores de correo electrónico | [email/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/email/SKILL.md) |
| **3. Prueba de Concepto** | `poc` | Generación de pruebas de concepto simples, verificación y descarte de falsos positivos | [poc/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/poc/SKILL.md) |
| **4. Explotación** | `exploit` | Desarrollo de exploits para vulnerabilidades confirmadas | [exploit/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/exploit/SKILL.md) |
| **5. Ataques Específicos** | `brute` | Ataques de fuerza bruta: SSH, FTP, HTTP, RDP, SMB, diccionarios | [brute/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/brute/SKILL.md) |
| **6. Informe Final** | `report` | Redacción de informes técnicos, resúmenes ejecutivos, recomendaciones de remediación | [report/SKILL.md](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/report/SKILL.md) |

### 🎯 Flujo Recomendado de Skills

```
┌─────────────────────────────────────────────────────────────────┐
│                   CICLO DE PENTESTING CON CLAUDE IA              │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  1️⃣  recon        → Análisis inicial del activo               │
│       ↓                                                          │
│  2️⃣  Vuln/webaudit/api/path-traversal/ssh/listanegra/email   │
│       → Identificar vulnerabilidades CVE                        │
│       ↓                                                          │
│  3️⃣  poc          → Pruebas de concepto, validar hallazgos    │
│       ↓                                                          │
│  4️⃣  exploit      → Explotación de vulnerabilidades            │
│       ↓                                                          │
│  5️⃣  brute        → Ataques de fuerza bruta (si aplica)       │
│       ↓                                                          │
│  6️⃣  report       → Redacción del informe técnico y ejecutivo │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

### 📁 Estructura de SKILLs en el Repositorio

```
.claude/skills/
├── recon/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/recon/SKILL.md
├── Vuln/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/Vuln/SKILL.md
├── webaudit/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/webaudit/SKILL.md
├── api/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/api/SKILL.md
├── path-traversal/
│   ├── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/path-traversal/SKILL.md
│   └── payloads-catalog.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/path-traversal/payloads-catalog.md
├── ssh/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/ssh/SKILL.md
├── listanegra/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/listanegra/SKILL.md
├── email/
│   ├── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/email/SKILL.md
│   └── README.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/email/README.md
├── poc/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/poc/SKILL.md
├── exploit/
│   └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/exploit/SKILL.md
├── brute/
│   ├── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/brute/SKILL.md
│   └── README.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/brute/README.md
└── report/
    └── SKILL.md — https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/report/SKILL.md
```

> **💡 Nota:** Las SKILL se activan automáticamente en Claude cuando mencionas conceptos relacionados. Por ejemplo:
> - Menciona *"analizar vulnerabilidades web en esta IP"* → se activa [`webaudit`](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/webaudit/SKILL.md)
> - Menciona *"verificar si esta IP está en blacklist"* → se activa [`listanegra`](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/listanegra/SKILL.md)
> - Menciona *"generar POC para esta CVE"* → se activa [`poc`](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/poc/SKILL.md)
> - Menciona *"buscar path traversal en esta API"* → se activa [`path-traversal`](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/path-traversal/SKILL.md)
> - Menciona *"enumerar SSH en este servidor"* → se activa [`ssh`](https://github.com/hackingyseguridad/IA/blob/main/.claude/skills/ssh/SKILL.md)

---

## Fases del Proceso de Hacking Ético

| Fase | Descripción | Acción / Scripts / Prompt |
|:-----|:------------|:--------------------------|
| **1. Reconocimiento (Recon)** | Recopilación de activos: IPs, FQDNs, rangos, URLs, puertos y URIs. La IA analiza y clasifica los datos proporcionados por el auditor, identificando superficies de ataque potenciales. | **Entrada:** listado de activos → la IA clasifica infraestructura y prioriza vectores de ataque. |
| **2. Escaneo y análisis** | Ejecución de herramientas de escaneo activo (nmap NSE, Nessus, Nikto, scripts personalizados). Los resultados se guardan en archivos estructurados (`.xml`, `.csv`, `.txt`) para su posterior análisis. | **Scripts disponibles:**<br>`redaudit.sh` — escaneo de puertos y servicios de red<br>`webaudit.sh` — auditoría de aplicaciones web y APIs<br>`fqdnaudit.sh` — análisis a partir de un FQDN |
| **3. Análisis IA de vulnerabilidades** | Analiza y clasifica las vulnerabilidades con IA. Segun [Modo accesos IA](https://github.com/hackingyseguridad/IA/blob/main/INTRODUCCION.md#privacidad-de-los-datos-del-usuario-ia-modos): Web o modo comandos [ por consola / terminal (Cli) ](https://github.com/hackingyseguridad/IA/blob/main/CONSOLA.md): anexar fichero (`resultado.xml`) a la IA con los datos obtenidos para que procese la informacion, con la instruccion [Prompt](https://github.com/hackingyseguridad/IA/blob/main/PROMPTS.md).: | **Prompt:** "ordena en una tabla resumen ejecutivo, los puertos/servicios con las vulnerabilidades CVE criticas y que hay exploit, son explotables" | **Prompt sugerido:** *"Ordena en una tabla resumen ejecutivo los puertos/servicios con vulnerabilidades CVE críticas que tengan exploit conocido y sean explotables."* |
| **4. Prueba de Concepto (POC)** | Generación de scripts sencillos para verificar la existencia real de cada vulnerabilidad y descartar falsos positivos, sin causar daño en el sistema objetivo. | **Prompt sugerido:** *"Ordenados de más fácil a menos, genera la prueba de concepto (POC) en código simple: Bash Shell, Python o C."* |
| **5. Explotación (Exploit)** | Desarrollo o adaptación de exploits para las vulnerabilidades confirmadas en la fase anterior, priorizadas por facilidad de explotación. | **Prompt sugerido:** *"Código de los exploits disponibles, ordenados de mayor a menor facilidad de explotación."* |
| **6. Post-explotación e Informe** | Documentación de hallazgos, eliminación de huellas, redacción de recomendaciones de mitigación y generación del informe técnico y ejecutivo en formato PDF. | **Prompt sugerido:** *"Redacta un informe técnico y resumen ejecutivo con recomendaciones de parcheo basadas en las notas de hallazgos proporcionadas."* |

---

## Scripts de Escaneo y Análisis

| Script | Descripción | Ejemplo de uso |
|:-------|:------------|:---------------|
| `redaudit.sh` | Escaneo de puertos y servicios de red (rango o CIDR) | `./redaudit.sh 192.168.1.0/24` |
| `webaudit.sh` | Auditoría completa de aplicaciones web y APIs | `./webaudit.sh ejemplo.com` |
| `fqdnaudit.sh` | Análisis de infraestructura a partir de un FQDN | `./fqdnaudit.sh www2.ejemplo.com` |

> Los resultados se almacenan en ficheros estructurados listos para adjuntar a la IA en la fase de análisis.

---

## Modelos de IA compatibles

La metodología es agnóstica al modelo. Puede utilizarse con:

- **Modelos en la nube:** Claude (Anthropic), Gemini (Google), GPT-4 (OpenAI), Grok (xAI)
- **Modelos locales (privacidad total):** Llama, Mistral, DeepSeek, Qwen — ejecutados en local vía Ollama u otras interfaces


---

## Aviso Legal

Este conjunto de herramientas y técnicas está destinado **exclusivamente a pruebas de seguridad autorizadas**. Los usuarios deben contar con la **autorización escrita** correspondiente antes de utilizar estas herramientas en cualquier sistema o infraestructura.

- [DISCLAIMER.md](https://github.com/hackingyseguridad/IA/blob/main/DISCLAIMER.md) — Términos y condiciones completos
- [Código de conducta](https://github.com/hackingyseguridad/IA/blob/main/CODIGODECONDUCTA.md)

El uso indebido de estas herramientas fuera de un entorno autorizado puede constituir un delito. Los autores no se responsabilizan del uso ilegítimo o malintencionado de este repositorio.

---

## Licencia

Distribuido bajo [Licencia MIT](https://github.com/hackingyseguridad/IA/blob/main/LICENSE).

---

<div align="center">

 [**www.hackingyseguridad.com**](http://www.hackingyseguridad.com/)

</div>
