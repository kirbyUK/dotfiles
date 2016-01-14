#!/bin/bash

while true; do
	time="$(date +"%a %b %d, %l:%M %p")"
	volume="$(amixer | grep -A 6 Master | grep 'Mono: Playback' | grep -o '[0-9%]*%')"
	memfree="$(free -m | grep 'Mem' | awk '{print $3}')"
	memtotal="$(free -m | grep 'Mem' | awk '{print $2}')"
	batcurrent="$(cat /sys/class/power_supply/BAT1/capacity)"
	songtitle="$(cmus-remote -Q | grep -m 1 title | cut -d ' ' -f3-)"
	artist="$(cmus-remote -Q | grep -m 1 artist | cut -d ' ' -f3-)"
	song=""
	if [ "$songtitle" = "" ] || [ "$artist" = "" ]; then
		song=""
	else
		song="$songtitle - $artist |"
	fi
	#xsetroot -name "$song $battery | $volume | $time"
	xsetroot -name "$song vol $volume | bat ${batcurrent}% | mem ${memfree}MB/${memtotal}MB | $time"
	sleep 1
done
