#!/bin/sh

tool="lat_udp"
benchmark="/usr/lib/lmbench/bin/armv5tel-linux-gnu/$tool"

ps aux | grep $benchmark | awk '{print $2}' | xargs kill

$benchmark -s

for guest in 28 #52 53 54 28 50 46
do
    ssh root@192.168.1.$guest $benchmark 192.168.1.22 &
done;

