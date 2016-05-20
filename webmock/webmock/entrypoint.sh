#!/bin/sh

trap 'exit 0' SIGTERM

python2.7 /app.py $PORT &

while true; do sleep 1; done

