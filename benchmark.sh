#!/bin/sh

tool="bw_tcp"
benchmark="/usr/lib/lmbench/bin/armv5tel-linux-gnu/$tool"

ps aux | grep $benchmark | awk '{print $2}' | xargs kill

for guest in 53 60 54 52 57 59
do
    ssh root@192.168.1.$guest $benchmark -s  &
done;

for guest in 53 60 54 52 57 59
do
    $benchmark 192.168.1.$guest &
done;

