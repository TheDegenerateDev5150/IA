

#!/bin/sh
# IA en Local sin GPU offline !
# @antonio_taboada - hackingyseguridad.com - 2026

echo " "
echo "IA en Local sin GPU !"
echo "ejecuta deepseek-r1:1.5b de ollama en LOCAL offline, con opencode "
echo " "

# otros modelos similares en LOCAL y sin GPU !! solo CPU
#
# ollama launch opencode --model monotykamary/whiterabbitneo-v1.5a 
# ollama launch opencode --model captainkyd/whiterabbitneo7b
# ollama launch opencode --model lazarevtill/WhiteRabbitNeo-2.5-Qwen-2.5-Coder-7B
#
ollama launch opencode --model deepseek-r1:1.5b

