#!/bin/bash
time=$(date +%r)
while [ 4 -gt 1 ]; do
    sh /home/remuser/current.sh
    cat /home/remuser/splash
    sleep 10
    clear -x
done 
