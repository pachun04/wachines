#!/bin/bash

# Inicia el agente SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Nombre de la sesión de screen
SESSION_NAME="minecraft"

# Inicia el servidor en una sesión de screen
screen -dmS $SESSION_NAME java -Xms128M -Xmx1024M -jar server.jar nogui
echo "Servidor iniciado en una sesión de screen llamada '$SESSION_NAME'."

# Monitorea la sesión de screen y espera a que termine
while screen -list | grep -q "$SESSION_NAME"; do
    echo "Esperando a que el servidor termine..."
    sleep 10  # Espera 10 segundos antes de verificar nuevamente
done

# Realiza backup del servidor después de que termine
git add .
git commit -m "save_success"
git push

echo "Servidor cerrado y cambios guardados en Git."

