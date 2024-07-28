#! /bin/sh

pkill lxpolkit emacs dunst unclutter picom numlockx nm-applet polybar

lxpolkit &
emacs --daemon &
systemctl --user import-environment DISPLAY
xrandr --output eDP-1 --mode 1920x1080
xsetroot -cursor_name left_ptr
dunst &
unclutter &
picom -b &
numlockx &
nitrogen --restore &
nm-applet &
clipmenud &
polybar bspwm 2>&1 | tee -a /tmp/polybar.log & disown

# End of script

