[Áudio do Nerimity] ──> (Saída Nerimity) ───[ Cruzamento ]───> (Microfone Discord) ──> [Ouvido no Discord]
[Áudio do Discord]  ──> (Saída Discord)  ───[ Cruzamento ]───> (Microfone Nerimity) ──> [Ouvido no Nerimity]
```

Além disso, o script adiciona canais de *Loopback* para que você continue ouvindo o áudio de ambos os aplicativos em seus fones de ouvido físicos normalmente.

---

## 📋 Pré-requisitos

O projeto foi projetado para sistemas Linux modernos que utilizam o servidor de som **PipeWire** (como Ubuntu, Fedora, Pop!_OS, Debian, Q4OS, etc.).

Antes de rodar, instale as ferramentas de gerenciamento de áudio necessárias:

### No Debian / Ubuntu / Q4OS / Mint:
```bash
sudo apt update && sudo apt install pulseaudio-utils pavucontrol -y

```
### No Fedora:
```bash
sudo dnf install pulseaudio-utils pavucontrol -y

```
## ⚙️ Instalação e Uso
 1. **Baixe o script** ou clone este repositório.
 2. Dê permissão de execução para o arquivo:
   ```bash
   chmod +x discord-nerimity-VoiceBridge.sh
   
   ```
 3. Execute o script no terminal:
   ```bash
   ./discord-nerimity-VoiceBridge.sh
   
   ```
> ⚠️ **Nota:** Como o Linux gerencia esses cabos virtuais na memória volátil, eles desaparecerão quando você reiniciar o computador. Para limpar as conexões manualmente a qualquer momento sem reiniciar, use o comando:
> systemctl --user restart pipewire pipewire-pulse
> 
## 🎛️ Configuração nos Aplicativos (Obrigatório)
Após executar o script com sucesso, abra as configurações de áudio de cada aplicativo e altere os dispositivos exatamente como indicado abaixo:
### 🔹 No Discord:
 * **Dispositivo de Entrada (Microfone):** Selecionar Microfone_Discord
 * **Dispositivo de Saída (Alto-falante):** Selecionar Saida_Discord
### 🔹 No Nerimity:
 * **Dispositivo de Entrada (Microfone):** Selecionar Microfone_Nerimity
 * **Dispositivo de Saída (Alto-falante):** Selecionar Saida_Nerimity
## 🔄 Inicialização Automática (Opcional)
Se você não quiser rodar o script manualmente toda vez que ligar o computador, adicione-o aos **Aplicativos de Inicialização** da sua interface gráfica:
 1. Abra o gerenciador de *Aplicativos de Inicialização* (Autostart) do seu Linux.
 2. Clique em **Adicionar**.
 3. Escolha um nome (ex: VoiceBridge Discord-Nerimity).
 4. No campo **Comando**, selecione o caminho do arquivo discord-nerimity-VoiceBridge.sh.
 5. Salve e pronto! O áudio estará cruzado automaticamente a cada login.
## 📄 Créditos e Inspiração
Baseado nos conceitos iniciais de roteamento virtual para Linux encontrados em Virtual-Cables-Linux.
"""
with open("README.md", "w", encoding="utf-8") as f:
f.write(readme_content)
print("README.md criado com sucesso!")
```
O seu arquivo `README.md` foi gerado e está pronto para o GitHub. Ele foi estruturado de forma profissional, incluindo explicações de pré-requisitos (como o erro do `pactl` que resolvemos), um diagrama visual em texto do fluxo do áudio e um passo a passo detalhado de configuração.

Seu arquivo Markdown (MD) está pronto:
[file-tag: code-generated-file-0-1779856378784802336]

Aqui está o conteúdo do arquivo caso queira apenas copiar e colar diretamente no editor do GitHub:

```markdown
# 🎙️ VoiceBridge: PipeWire Discord-Nerimity Cross-Audio Bridge

A lightweight, automated Bash script for Linux (PipeWire/PulseAudio) that creates a bidirectional audio bridge between **Discord** and **Nerimity**. 

Every sound output from Nerimity is routed directly into Discord's microphone input, and vice versa. This allows seamless audio sharing and cross-platform communication between both applications.

---

## 🚀 Como Funciona (Fluxo de Áudio)

O script automatiza a criação de dispositivos virtuais nulos (`module-null-sink`) e cruza as conexões de áudio (`pw-link`) de forma transparente:


```
[Áudio do Nerimity] ──> (Saída Nerimity) ───[ Cruzamento ]───> (Microfone Discord) ──> [Ouvido no Discord]
[Áudio do Discord]  ──> (Saída Discord)  ───[ Cruzamento ]───> (Microfone Nerimity) ──> [Ouvido no Nerimity]
```

Além disso, o script adiciona canais de *Loopback* para que você continue ouvindo o áudio de ambos os aplicativos em seus fones de ouvido físicos normalmente.

---

## 📋 Pré-requisitos

O projeto foi projetado para sistemas Linux modernos que utilizam o servidor de som **PipeWire** (como Ubuntu, Fedora, Pop!_OS, Debian, Q4OS, etc.).

Antes de rodar, instale as ferramentas de gerenciamento de áudio necessárias:

### No Debian / Ubuntu / Q4OS / Mint:
```bash
sudo apt update && sudo apt install pulseaudio-utils pavucontrol -y

```
### No Fedora:
```bash
sudo dnf install pulseaudio-utils pavucontrol -y

```
## ⚙️ Instalação e Uso
 1. **Baixe o script** ou clone este repositório.
 2. Dê permissão de execução para o arquivo:
   ```bash
   chmod +x discord-nerimity-VoiceBridge.sh
   
   ```
 3. Execute o script no terminal:
   ```bash
   ./discord-nerimity-VoiceBridge.sh
   
   ```
> ⚠️ **Nota:** Como o Linux gerencia esses cabos virtuais na memória volátil, eles desaparecerão quando você reiniciar o computador. Para limpar as conexões manualmente a qualquer momento sem reiniciar, use o comando:
> systemctl --user restart pipewire pipewire-pulse
> 
## 🎛️ Configuração nos Aplicativos (Obrigatório)
Após executar o script com sucesso, abra as configurações de áudio de cada aplicativo e altere os dispositivos exatamente como indicado abaixo:
### 🔹 No Discord:
 * **Dispositivo de Entrada (Microfone):** Selecionar Microfone_Discord
 * **Dispositivo de Saída (Alto-falante):** Selecionar Saida_Discord
### 🔹 No Nerimity:
 * **Dispositivo de Entrada (Microfone):** Selecionar Microfone_Nerimity
 * **Dispositivo de Saída (Alto-falante):** Selecionar Saida_Nerimity
## 🔄 Inicialização Automática (Opcional)
Se você não quiser rodar o script manualmente toda vez que ligar o computador, adicione-o aos **Aplicativos de Inicialização** da sua interface gráfica:
 1. Abra o gerenciador de *Aplicativos de Inicialização* (Autostart) do seu Linux.
 2. Clique em **Adicionar**.
 3. Escolha um nome (ex: VoiceBridge Discord-Nerimity).
 4. No campo **Comando**, selecione o caminho do arquivo discord-nerimity-VoiceBridge.sh.
 5. Salve e pronto! O áudio estará cruzado automaticamente a cada login.
## 📄 Créditos e Inspiração
Baseado nos conceitos iniciais de roteamento virtual para Linux encontrados em Virtual-Cables-Linux.
```

```

