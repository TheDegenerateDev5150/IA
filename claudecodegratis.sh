#!/bin/sh
# hackingyseguridad.com 2026 
# Script Bash Shell 1.0.x para ejecutar Claude Code, con ollana
# ejecuta Claude (sin GPU NVIDIA)
# Tenemos que instalar primero Claude , con API Gratuita, sin saldo ni inscripcion


# Opcion1
# ollama launch claude --config
# escogemos una opcion para ejecutar claude code online o local impulsado 

# Opcion2
# CLaude Code impulstado por Gemma4 online!!!
ollama launch claude --model gemma4:31b-cloud

# Opcion3
# Claude Code impuslado por minimax-m3:cloud
# ollama launch claude --model minimax-m3:cloud

# Opcion4
# Claude Code impulsado por Qwen en local PC
# ollama launch claude --model qwen3-coder
