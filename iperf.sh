#!/bin/sh

benchmark="iperf"

$benchmark -s -u &

for guest in 52 #28 46 47 48
do
    ssh root@192.168.1.$guest $benchmark -c 192.168.1.22 -u &
done;

