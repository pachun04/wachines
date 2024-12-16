#!/bin/bash

java -Xms128M -Xmx1024M -jar server.jar nogui

git add .

git commit -m "save_success"

expect << EOF
spawn git push
send "ifabregat\r"
expect eof
EOF
