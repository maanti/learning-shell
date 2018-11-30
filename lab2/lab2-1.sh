#!/bin/bash

# like this for simplicity, but prefer one-line
#IFS="
#";

IFS=$'\n';

# $1: dirName where to search for subdirs
function getSubs {

	gfind "$1" -maxdepth 1 -type d -printf "%C@ %p\n" | sort | awk -F/ ' /.\//{print $2}';
	
}

for dir in $(getSubs .)
do
	read -ra subs <<< "$(getSubs "$dir")";
	if [ ${#subs[@]} -ne 0 ]; then
		echo "$dir"
	fi
done