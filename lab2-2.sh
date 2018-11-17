#!/bin/bash

getent group |  nawk -v len="$1" -F":" 'split($4, arr, ",") == len {print $1}';

