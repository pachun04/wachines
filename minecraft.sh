#!/bin/bash

eval "$(ssh-agent -s)"  # Inicia el agente SSH
ssh-add ~/.ssh/id_ed25519  # Carga la clave SSH (asegúrate de que esta es tu clave privada correcta)

# Realiza back up del servidor
git add .

git commit -m "save_success"

git push

# Inicia el servidor de Minecraft en segundo plano
screen -dmS minecraft java -Xms128M -Xmx1024M -jar server.jar nogui

