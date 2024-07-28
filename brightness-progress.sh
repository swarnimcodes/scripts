#!/bin/sh

current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
brightness_percentage=$((100 * current_brightness / max_brightness))

notify-send -e -t 175 -h int:value:$brightness_percentage "Brightness: $brightness_percentage%"

