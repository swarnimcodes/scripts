#!/bin/sh

PRE_WM_SCRIPT=prewm.sh

while true; do
    $PRE_WM_SCRIPT
    dwm 2> ~/.dwm.log
    # Alternative: No error logging
    # dwm >/dev/null 2>&1
done
