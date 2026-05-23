#!/bin/sh

# Si se rompe al arrancar porbar con: ollama pull mistral
# ssh -L 0.0.0.0:11434:localhost:11434 -p 22 usuario@IP_Publica

ollama run mistral
