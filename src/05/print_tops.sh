#!/bin/bash

function top_5
{
	echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
	du -h -- $1* | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}'
	echo "etc up to 5"
}

function top_10_files
{	
	echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
	for i in {1..10}
	do
		file_path=$(find $1 -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") 
		if ! [[ -z $file_path ]]
		then
			echo -n "$i - "
			echo -n "$(echo $file_path | awk '{print $2}'), " # path
			echo -n "$(echo $file_path | awk '{print $1}'), " # size
			echo "$(echo $file_path | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" # extension
		fi
	done
	echo "etc up to 10"
}

function top_10_exec
{
	echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
	for i in {1..10}
	do
		file_path=$(find $1 -type f -name "*.exe" -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") 
		if ! [[ -z $file_path ]]
		then
			echo -n "$i - "
			echo -n "$(echo $file_path | awk '{print $2}'), " # path
			echo -n "$(echo $file_path | awk '{print $1}'), " # size
			echo "$(echo $file_path | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" # extension
		fi
	done
	echo "etc up to 10"
}