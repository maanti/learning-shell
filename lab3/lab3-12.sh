#!/bin/bash

# list dirs where user can delete files
# $1 uid

if [[ $# -eq 0 ]]; then
 	echo "ERROR: no argument" >&2
fi;
FILES="$PWD/*"
for dirname in $FILES; do
    if [  -d "$dirname" ]; then 
    	perm=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[2] & 0777' "$dirname");
		uid=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[4]' "$dirname");

		gid=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[5]' "$dirname");

		isUserInGroup=$(getent passwd | nawk -F: -v gid="$gid" -v uid="$1"  '$4==gid && $3==uid {print 1}');


		if [[ "$isUserInGroup" -eq 1 ]]; then

			if [[ "$uid" = "$1" ]]; then
				canUserDel=$(( perm & 192 ));
				if [[ ! ( $canUserDel -eq 0 ) ]]; then
					echo "$dirname";
					continue;
				fi;
			fi;

			canGroupDel=$(( perm & 24 ));
			if [[ ! ( $canGroupDel -eq 0 ) ]]; then
				echo "$dirname";
			fi;
		else
			canOthersDel=$(( perm & 3 ));
			if [[ ! ( $canOthersDel -eq 0 ) ]]; then
				echo "$dirname";
			fi;
		fi;
	fi;
done;
