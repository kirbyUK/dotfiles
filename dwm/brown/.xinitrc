#!/bin/bash

#Set font path:
xset +fp /usr/share/fonts/icons/ &
xset fp rehash &

#Load the X themeing settings:
xrdb .Xresources &

#Turn off the beep:
xset b off &

#Set the background:
feh --bg-tile /home/alex/Pictures/Wallpapers/pattern_154.gif &

#Ready xscreensaver:
xscreensaver -nosplash &

#Run dwmstatus:
dwmstatus &

#Run dwm:
exec dwm
