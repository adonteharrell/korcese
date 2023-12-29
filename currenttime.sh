#!/bin/bash

date=$(date +%F---%r)


logfile="/storage/webserver/movies/movements.txt"
echo "==============================================================================================" | sudo tee -a "$logfile"
echo "MOVEMENT FINISHED AT $(date)" | sudo tee -a "$logfile"
echo "==============================================================================================" | sudo tee -a "$logfile"


