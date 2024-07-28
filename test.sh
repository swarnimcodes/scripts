#!/bin/bash

# Launch the application you want in floating mode
gsimplecal &
sleep 1  # Adjust delay if necessary

# Get the window ID of the launched application
window_id=$(wmctrl -l | grep "Window Title" | awk '{print $1}')

# Move the window to specific coordinates
xdotool windowmove $window_id X Y

# Set the window to floating mode in DWM
xprop -id $window_id -f _NET_WM_STATE 32a -set _NET_WM_STATE "_NET_WM_STATE_ABOVE,_NET_WM_STATE_FLOATING"

