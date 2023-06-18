#!/bin/bash

. print_numbers.sh
. print_tops.sh

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then
	total_number_of_folders $1
	top_5 $1
	total_numbers_of_files $1
	number_of_different_file_types $1
	top_10_files $1
	top_10_exec $1

	end_time=$(date +%s.%N)
	echo "Script execution time (in seconds) = " `echo "$end_time $start_time" | awk '{printf "%.1lf", $1-$2}'`
else
	echo "Wrong arguments! Usage: /"
fi