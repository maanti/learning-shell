#!/bin/bash

# $1: dirName where to search for subdirs
function getSubs {
	ls -lt "$1" | awk '/^d/ {print $9}'
}

for dir in $(getSubs)
do
	read -ra subs <<< "$(getSubs "$dir")";
	if [ ${#subs[@]} -ne '0' ]; then
		echo "$dir"
	fi
done