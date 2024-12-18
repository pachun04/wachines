#!/bin/bash

eval "$(ssh-agent -s)"  # Inicia el agente SSH
ssh-add ~/.ssh/id_ed25519  # Carga la clave SSH (asegúrate de que esta es tu clave privada correcta)

# Inicia el servidor de Minecraft en segundo plano
java -Xms128M -Xmx1024M -jar server.jar nogui &
server_pid=$!  # Guarda el PID del proceso del servidor

wait $server_pid

git add .

git commit -m "save_success"

git push

echo "/r"

