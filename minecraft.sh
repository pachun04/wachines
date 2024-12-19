#!/bin/bash

nohup java -Xms128M -Xmx1024M -jar server.jar nogui &

wait

./git.sh
