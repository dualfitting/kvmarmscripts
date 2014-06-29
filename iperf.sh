#!/bin/sh

benchmark="iperf"
mode=""

$benchmark -s $mode &

for guest in 60 50 57 52 54 59
do
    ssh root@192.168.1.$guest $benchmark -c 192.168.1.22 $mode &
done;

