#!/bin/sh

tool="lat_tcp"
benchmark="/usr/lib/lmbench/bin/armv5tel-linux-gnu/$tool"

ps aux | grep $benchmark | awk '{print $2}' | xargs kill

for guest in 80 46 67 76 68 55
do
    ssh root@192.168.1.$guest dmesg -c
    ssh root@192.168.1.$guest $benchmark -s  &
done;

for guest in 46 67 55 80 76 68
do
    $benchmark -W 60 -N 10 192.168.1.$guest &
done;

