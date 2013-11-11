#!/bin/bash

#Set font path:
xset +fp /usr/share/fonts/icons/ &
xset fp rehash &

#Load the X themeing settings:
xrdb .Xresources &

#Turn off the beep:
xset b off &

#Set the background:
feh --bg-scale /home/alex/Pictures/Wallpapers/wallpaper-2631270.png &

#Ready xscreensaver:
xscreensaver -nosplash &

#Run dwmstatus:
dwmstatus &

#Run dwm:
exec dwm
