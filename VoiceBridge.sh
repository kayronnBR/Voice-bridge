#!/usr/bin/env bash

echo "Resetando o Pipewire para garantir que não haja conexões antigas..."
systemctl --user restart pipewire pipewire-pulse
sleep 1
echo "-------------------------------------------------------------"

# =====================================================================
# CRIAÇÃO DOS DISPOSITIVOS VIRTUAIS
# =====================================================================
echo "Criando os canais virtuais..."

# Cria os alto-falantes virtuais (onde os apps vão soltar o som)
pactl load-module module-null-sink sink_name="VirtualSpeaker_1" sink_properties=device.description="Saida_1"
pactl load-module module-null-sink sink_name="VirtualSpeaker_2" sink_properties=device.description="Saida_2"

# Cria os microfones virtuais (o que os apps vão escutar)
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic_1" sink_properties=device.description="Microfone_1" channel_map=front-left,front-right
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic_2" sink_properties=device.description="Microfone_2" channel_map=front-left,front-right

# Pausa para o Pipewire registrar todos os nomes no sistema
echo "Aguardando o sistema registrar os novos dispositivos..."
sleep 1.5

# =====================================================================
# ROTEAMENTO CRUZADO (A MÁGICA ACONTECE AQUI)
# =====================================================================
echo "Cruzando as conexões de áudio..."

# PONTE 1: Todo som que sair do Discord (Saida_1) VAI PARA o microfone do Nerimity (Microfone_2)
pw-link VirtualSpeaker_1:monitor_FL VirtualMic_2:input_FL
pw-link VirtualSpeaker_1:monitor_FR VirtualMic_2:input_FR

# PONTE 2: Todo som que sair do Nerimity (Saida_2) VAI PARA o microfone do Discord (Microfone_1)
pw-link VirtualSpeaker_2:monitor_FL VirtualMic_1:input_FL
pw-link VirtualSpeaker_2:monitor_FR VirtualMic_1:input_FR

# =====================================================================
# MONITORAMENTO (OPCIONAL - PARA VOCÊ OUVIR OS DOIS)
# =====================================================================
# Adiciona o retorno para que você escute nos seus fones o áudio de ambos os can
