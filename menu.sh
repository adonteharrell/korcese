#!/bin/bash
clear -x
time=$(date +%l:%M)
pm=$(date +%p)
movies=$(ls /storage/webserver/*.mp4 | wc -l)
BOLD="\e[1;32m"
CLEAR="\e[0m"
RED="\e[1;31m"
#echo "Loading Korcese..." 
#sudo sh /home/remuser/diff.sh
#diff=$(cat diff) 
clear -x 

while true
do
         echo -e " Movies: ${BOLD} $movies ${CLEAR}                                  $time $pm"
        # if [ $diff -eq 0 ]; then
         #   echo -e " Movies: ${BOLD} $movies          Pending: $diff ${CLEAR}             $time $pm"
        # else
          #  echo -e " Movies: ${BOLD} $movies ${CLEAR}      ${RED}    Pending: $diff ${CLEAR}             $time $pm"
        # fi 
         cat /home/remuser/splash   
         read -p "
         1. Search Movies
         2. Move Movies
         3. README
         4. Exit
Enter Option: 
" CHOICE 
        case "$CHOICE" in
               1) 
                       clear -x
                       sudo sh /home/remuser/searchmovies.sh
                       clear -x
                       ;;
               2)      
                       clear -x 
                       sudo sh /home/remuser/quickmove.sh
                       clear -x
                       ;;
               3)      
                       clear -x 
                       cat /home/remuser/README.md | less
                       clear -x 
                       ;;
               4)   
                       break
                       ;;
        esac 
done 
