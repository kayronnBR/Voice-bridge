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
pactl load-module module-null-sink sink_name="VirtualSpeaker_Discord" sink_properties=device.description="Saida_Discord"
pactl load-module module-null-sink sink_name="VirtualSpeaker_Nerimity" sink_properties=device.description="Saida_Nerimity"

# Cria os microfones virtuais (o que os apps vão escutar)
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic_Discord" sink_properties=device.description="Microfone_Discord" channel_map=front-left,front-right
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic_Nerimity" sink_properties=device.description="Microfone_Nerimity" channel_map=front-left,front-right

# Pausa para o Pipewire registrar todos os nomes no sistema
echo "Aguardando o sistema registrar os novos dispositivos..."
sleep 1.5

# =====================================================================
# ROTEAMENTO CRUZADO (A MÁGICA ACONTECE AQUI)
# =====================================================================
echo "Cruzando as conexões de áudio..."

# PONTE 1: Todo som que sair do Discord (VirtualSpeaker_Discord) VAI PARA o microfone do Nerimity (VirtualMic_Nerimity)
pw-link VirtualSpeaker_Discord:monitor_FL VirtualMic_Nerimity:input_FL
pw-link VirtualSpeaker_Discord:monitor_FR VirtualMic_Nerimity:input_FR

# PONTE 2: Todo som que sair do Nerimity (VirtualSpeaker_Nerimity) VAI PARA o microfone do Discord (VirtualMic_Discord)
pw-link VirtualSpeaker_Nerimity:monitor_FL VirtualMic_Discord:input_FL
pw-link VirtualSpeaker_Nerimity:monitor_FR VirtualMic_Discord:input_FR

# =====================================================================
# MONITORAMENTO (OPCIONAL - PARA VOCÊ OUVIR OS DOIS)
# =====================================================================
# Se você não quiser ouvir o áudio deles no seu fone físico, pode apagar as linhas abaixo
pactl load-module module-loopback sink_name="Loopback_Discord" source="VirtualSpeaker_Discord.monitor"
pactl load-module module-loopback sink_name="Loopback_Nerimity" source="VirtualSpeaker_Nerimity.monitor"

echo "-------------------------------------------------------------"
echo "Configuração concluída com sucesso!"
echo "Agora configure os aplicativos conforme as instruções."
