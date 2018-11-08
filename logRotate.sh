#!/bin/bash

filename=$1
size=$2
time=$3
rotations=$4
compress=$5
checkif=$6

echo "$1 $2 $3 $4 $5 $6"

echo "$filename
{
    rotate $rotations
    $time
    $compress
    size $size
    $checkif
}

" >> /etc/logrotate.conf
