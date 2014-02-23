#!/bin/sh

#Load the X themeing settings:
xrdb .Xresources &

#Set the keybpard layout:
setxkbmap gb &

#Turn off the beep:
xset b off &

#Set the background:
feh --bg-scale /home/alex/Pictures/Wallpapers/blown-away.jpg &

#Ready xscreensaver:
xscreensaver -nosplash &

#Run dwmstatus:
/home/alex/Code/dwm/dwmgetstatus.sh &

#Run dwm:
exec dwm
