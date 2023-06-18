#!/bin/bash

function total_number_of_folders
{
	echo -n "Total number of folders (including all nested ones) = "
	find $1 -mindepth 1 -type d | wc -l
}

function total_numbers_of_files
{
	echo -n "Total number of files = "
	find $1 -type f | wc -l
}

function number_of_different_file_types
{
	echo "Number of:"
	echo -n "Configuration files (with the .conf extension) = " ; find $1 -type f -name \*.conf | wc -l
	echo -n "Text files = "; find $1* -type f -exec grep -Iq . {} \; -print | wc -l
	echo -n "Executable files = " ; find $1 -type f -name "*.exe" | wc -l
	echo -n "Log files (with the extension .log) = " ; find $1 -type f -name \*.log | wc -l
	echo -n "Archive files = " ; find $1 -type f -name \*.tar -o -name \*.zip -o -name \*.tar -o -name \*.7z | wc -l
	echo -n "Symbolic links = " ; ls -lR $1 | grep ^l | wc -l
}