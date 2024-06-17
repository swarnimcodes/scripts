#!/bin/sh

DWM_VERSION=$(dwm -v)

# Set the screen resolution
xrandr --output eDP-1 --mode 1920x1080 &

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Notifications
pkill dunst
dunst &

# Restart unclutter for hiding the mouse pointer when idle
pkill unclutter
unclutter &

# Restart the compositor
pkill picom
picom -f &

# Ensure Numlock is enabled
pkill numlockx
numlockx &

# Restore wallpaper using nitrogen
pkill nitrogen
nitrogen --restore &

# Restart network manager applet
pkill nm-applet
nm-applet &

pkill pasystray
pasystray &


# End of script

