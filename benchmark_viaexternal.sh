#!/bin/sh

tool="bw_tcp"
benchmark="/usr/lib/lmbench/bin/armv5tel-linux-gnu/$tool"

#ps aux | grep $benchmark | awk '{print $2}' | xargs kill

#$benchmark -s

for guest in 46 55 58 28 53 56
do
    echo $guest
    #ssh root@192.168.1.$guest $benchmark -s &
done;

for guest in 46 55 58 28 53 56
do
    /home/dualfitting/Downloads/lmbench3/bin/x86_64-linux-gnu/bw_tcp 192.168.1.$guest &
done;

