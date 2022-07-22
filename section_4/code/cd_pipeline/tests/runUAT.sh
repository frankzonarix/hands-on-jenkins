#!/bin/bash

# set variables
hostname='localhost'
port=$1

# wait for the app to start
sleep 10 

# ping the app
curl -LI ${hostname}:${port}|head -1
status_code=$(curl -LI ${hostname}:${port} -o /dev/null -w '%{http_code}\n' -s)
echo $status_code

if [[ "$status_code" == 200 ]]; then echo "PASS: ${hostname}:${port} is reachable"; else echo "FAIL: ${hostname}:${port} is unreachable";exit 1;fi
#fi
