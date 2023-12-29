#!/bin/bash
date=$(date +%F---%r)


# Append to log file starting the time on log file. 
logfile="/storage/webserver/movies/movements.txt"
echo "==============================================================================================" | sudo tee -a "$logfile"
echo "MOVEMENT STARTED AT $(date)" | sudo tee -a "$logfile"
echo "==============================================================================================" | sudo tee -a "$logfile"

# Find all mp4 files and move them to movies path.
sudo find /windows/Videos -type f -name "*.mp4" -exec cp -u -v {} /storage/webserver/movies \;

# Find all mkv files and move them to movies path.
sudo find /windows/Videos -type f -name "*.mkv" -exec cp -u -v {} /storage/webserver/movies \;


# CD into movies directory to run convert script.
cd "/storage/webserver/movies"

# Convert mkv to mp4 if needed, also copies these files to index directory and ddelimits them to be served on webpage. 
sudo sh /storage/webserver/movies/convert.sh

# Remove all mkv files after conversion.
sudo rm -f /storage/webserver/movies/*.mkv

# Display end of file time on log file to finish program.
sudo sh /home/remuser/currenttime.sh
