#!/bin/sh

tool="lat_udp"
benchmark="/usr/lib/lmbench/bin/armv5tel-linux-gnu/$tool"

ps aux | grep $benchmark | awk '{print $2}' | xargs kill

for guest in 53 58 56 70 71 72
do
    ssh root@192.168.1.$guest dmesg -c
    ssh root@192.168.1.$guest $benchmark -s  &
done;

for guest in 53 58 56 70 71 72
do
    $benchmark 192.168.1.$guest &
done;

