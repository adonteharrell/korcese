#!/bin/bash
file="The.Matrix.1999.1080p.BrRip.x264.YIFY.mp4"
begin="/windows/Videos/$file"
destination="/home/remuser/$file"
endsize=$(ls -l $begin | awk '{print $5}')
currentsize=$(ls -l $destination | awk '{print $5}')

cp -u $begin $destination
while [ $endsize -gt $currentsize ]; do
    echo "$endsize out of $currentsize completed"
    sleep 1
done
echo "$file copied successfully!"
