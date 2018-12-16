#!/bin/bash

# list users who can execute file
# $1 file path

if [[ $# -eq 0 ]]; then
 	echo "ERROR: no argument" >&2
fi;

if [[ ! ( -f "$1" ) ]]; then 
	echo "ERROR: $1 is not file" >&2
fi;

uid=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[4]' "$1");
gid=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[5]' "$1");
perm=$(perl -e 'printf "%d\n", (stat($ARGV[0]))[2] & 0777' "$1");
canUserExec=$(( perm & 64 ));
canGroupExec=$(( perm & 8 ));
canOthersExec=$(( perm & 1 ));

if [[ ! ( $canGroupExec -eq 0 ) ]]; then
	getent passwd | grep "$gid" | nawk -F: -v uid=$uid '$3!=uid {print $1}';
fi;
if [[ ! ( $canUserExec -eq 0 ) ]]; then
	getent passwd | grep "$uid" | nawk -F: '{print $1}';
fi;
if [[ ! ( $canOthersExec -eq 0 ) ]]; then
	getent passwd | nawk -F: -v uid=$uid -v gid=$gid '$3!=uid && $4!=gid {print $1}'
fi;