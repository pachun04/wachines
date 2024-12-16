#!/bin/bash

eval "$(ssh-agent -s)"  # Inicia el agente SSH
ssh-add ~/.ssh/id_ed25519  # Carga la clave SSH (asegúrate de que esta es tu clave privada correcta)

java -Xms128M -Xmx1024M -jar server.jar nogui

git add .

git commit -m "save_success"

expect << EOF
spawn git push
send "/r"
expect eof
EOF
