#!/bin/sh
# Start xsetroot loop to update the status bar
while true; do
    status="$(date)"
    xsetroot -name "$status"
    sleep 1
done &
