#!/bin/sh

# ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default $FILE
# ffmpeg -i input.avi -b:v 64k -bufsize 64k output.mp4 # bitrate = 64 kbits/s
# framerate -r: -r 24
# alsa_input.pci-0000_00_1f.3.analog-stereo

DRI_PRIME=1 ffmpeg -x11
