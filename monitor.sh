#!/bin/bash

PORT1=8066
PORT2=8060

while :
do
    port1=$(ss -tln | grep ":$PORT1 ")
    port2=$(ss -tln | grep ":$PORT2 ")

    if [ -z "$port1" ]; then
        cd ./admin
        nohup yarn dev > admin.log 2>&1 &
        echo "Start admin complete!"
        cd ..
    fi

    if [ -z "$port2" ]; then
        cd ./client
        nohup yarn dev > client.log 2>&1 &
        echo "Start client complete!"
        cd ..
    fi

    sleep 120
done

