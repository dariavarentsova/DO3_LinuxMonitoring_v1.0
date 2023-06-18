#!/bin/bash

if ! [ $# -eq 4 ]; then
    echo "Enter 4 arguments"
else
    for parameter in "$@"; do
        if ! [[ $parameter =~ [1-6] ]]; then
           echo "Incorrect arguments. Please rerun the script with digits 1-6"
           exit 1
        fi
    done
    if [[ "$1" == "$2" || "$3" == "$4" ]]
    then
        echo "The first argument should not be equal the second and the third should not be equal the fourth"
    else
        Colors=$(bash ./colors.sh $@)
        bash ./print.sh $Colors
    fi
fi