#!/bin/bash

java -Xms128M -Xmx1024M -jar server.jar nogui

git add .

git commit -m "save_success"

git push https://pachun04:ifabregat04@github.com/pachun04/wachines.git

