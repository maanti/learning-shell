#!/bin/bash
IFS=$'\n';
# $1: dirName where to search for subdirs
function getSubs {
	gfind "$1" -maxdepth 1 -type d -printf "%C@ %p\n" | sort -r | awk -F/ ' /.\//{print $2}';
}

# $1: dirName where to search for subdirs
function getSubsWithMtime {
	gfind "$1" -maxdepth 1 -type d -printf "%C@ %p\n" | sort -r;
}

subdirs=$(getSubsWithMtime "$1");
cd -- "$1";
for dirWithMtime in $subdirs
do
	dir=$(echo "$dirWithMtime" | awk -F/ ' /.\//{print $2}');
	if [ "$dir" != '' ]; then
		read -ra subs <<< "$(getSubs "$dir")";
		if [ ${#subs[@]} -ne 0 ]; then
			echo "$dirWithMtime";
		fi
	fi;
done
