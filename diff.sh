#!/bin/bash

sudo find /windows/Videos -type f -iname "*.mp4" > windowsinv
sudo find /windows/Videos -type f -iname "*.mkv" >> windowsinv
basename -a /storage/webserver/*.mp4 | wc -l > compare 

win=$(cat /home/remuser/windowsinv | wc -l) 
lin=$(cat /home/remuser/compare)
diff=$(( $win - $lin ))

echo $diff > diff

