#!/bin/bash

i=5
while [ $i -gt 0 ] ; do 
    echo "This will shutdown in $i"
    let i=i-1
    sleep 1
done
echo "Complete!"
