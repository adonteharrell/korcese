#!/bin/bash

echo "Converting .mkv file(s)..."
sleep 2
# Covert mkv to mp4 if needed. 
for i in *.mkv; do
    sudo ffmpeg -hide_banner -loglevel error -y -i "$i" -codec copy "${i%.*}.mp4"
done

# Copy all movies into index directory.
cd "/storage/webserver/movies"

echo "Moving movie(s) to index directory..."
sleep 2
for i in *.mp4; do
    sudo mv -u -v "${i}" /storage/webserver/"$i"
done

# Switch directories and run script to delimit spaces and characters out of names. 
cd "/storage/webserver"
echo "Removing illegal characters..."
sleep 2
sudo sh /storage/webserver/delimiter.sh 

# Run scripts to generate html pages for movies. 
echo "Creating html page(s)..."
sleep 2
sudo sh /storage/webserver/htmltemp.sh

# Run scripts to add links to webpage. 
echo "Posting links to webpage..."
sleep 2
sudo sh /storage/webserver/indextemp.sh

