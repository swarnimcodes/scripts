#!/bin/bash

# Check if the calculator is already running
if pgrep -f "kitty --name calculator -e python3" > /dev/null; then
    # If running, kill it
    pkill -f "kitty --name calculator -e python3"
else
    # If not running, launch it
    kitty --name calculator -e python3 &
fi

