#!/bin/bash
IFS=$'\n';
# $1: dirName where to search for subdirs
function getSubs {
	gfind "$1" -maxdepth 1 -type d -printf "%C@ %p\n" | sort | awk -F/ ' /.\//{print $2}';
}

subdirs=$(getSubs "$1");
cd -- "$1";
for dir in $subdirs
do
	read -ra subs <<< "$(getSubs "$dir")";
	if [ ${#subs[@]} -ne 0 ]; then
		echo "$dir"
	fi
done