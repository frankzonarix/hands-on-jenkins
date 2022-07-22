#!/bin/bash

# set variables
hostname='localhost'
port=$1

# wait for the app to start
sleep 5 

# ping the app
status_code=$(curl -LI ${hostname}:${port} -o /dev/null -w '%{http_code}\n' -s)

if [[ "$status_code" == 200 ]];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
