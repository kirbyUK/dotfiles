#!/usr/local/bin/bash

while true; do
	time="$(date -j +"%a %b %d, %l:%M %p")"
	battery="$(apm -l)%"
	volume="$(mixer -s vol)"
	songtitle="$(cmus-remote -Q | grep -m 1 title | cut -d ' ' -f3-)"
	artist="$(cmus-remote -Q | grep -m 1 artist | cut -d ' ' -f3-)"
	song=""
	if [ "$songtitle" = "" ] || [ "$artist" = ]; then
		song=""
	else
		song="$songtitle - $artist |"
	fi
	xsetroot -name "$song $battery | $volume | $time"
	sleep 1
done
