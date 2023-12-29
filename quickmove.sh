# This script will move movies filtering by time. 

#!/bin/bash
date=$(date +%F---%r)

# User will enter how many hours ago the movies were downloaded. 
clear -x 
read -p "How many hours do you want to scan?: " HOURS

# This variable does the math to multiply the hours by minutes. 
TIME=$(( $HOURS*60 ))

# Append to log file starting the time on log file. 
logfile="/storage/webserver/movies/movements.txt"
echo "==============================================================================================" | sudo tee -a "$logfile"
echo "MOVEMENT STARTED AT $(date)" | sudo tee -a "$logfile"
echo "==============================================================================================" | sudo tee -a "$logfile"

echo "Moving mp4 files..."
sleep 2
# Find all mp4 files and move them to movies path.
sudo find /windows/Videos -type f -name "*.mp4" -mmin -$TIME -exec cp -u -v {} /storage/webserver/movies \;

echo "Moving mkv files..."
# Find all mkv files and move them to movies path.
sudo find /windows/Videos -type f -name "*.mkv" -mmin -$TIME -exec cp -u -v {} /storage/webserver/movies \;


# CD into movies directory to run convert script.
cd "/storage/webserver/movies"

sleep 2
# Convert mkv to mp4 if needed.
sudo sh /storage/webserver/movies/convert.sh

echo "Removing all mkv files..."
sleep 2
# Remove all mkv files after conversion.
sudo rm -f /storage/webserver/movies/*.mkv

echo "Logging..."
sleep 2
# Display end of file time on log file.
sudo sh /home/remuser/currenttime.sh

echo "Movement complete!!"
i=5
while [ $i -gt 0 ] ; do
    echo "Going back to main menu...$i"
    let i=i-1
    sleep 1
done
echo "Complete!"
sleep 1 
