#!/bin/bash
. ./print.sh

echo -n "Wish to write this in a file? (Y/N) "; read Answer
 if [[ "$Answer" == "y" || "$Answer" == "Y" ]]
    then
        Filename=$(date +"%d_%m_%y_%H_%M_%S")
        bash ./print.sh > $Filename.status
        echo "File saved in the current directory."
    fi