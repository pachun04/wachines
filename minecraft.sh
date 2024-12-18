#!/bin/bash

eval "$(ssh-agent -s)"  # Inicia el agente SSH
ssh-add ~/.ssh/id_ed25519  # Carga la clave SSH (asegúrate de que esta es tu clave privada correcta)

screen -dmS minecraft java -Xms128M -Xmx1024M -jar server.jar nogui

sleep 5

git add .

git commit -m "save_success"

git push

echo "/r"

kill $SSH_AGENT_PID
