#!/bin/sh

benchmark="iperf"
mode="-t 1000 -i 5"

$benchmark -s $mode &

for guest in 80 46 67 76 68 55
do
    ssh root@192.168.1.$guest rm /root/$guest.log
    ssh root@192.168.1.$guest "$benchmark -c 192.168.1.77 $mode >> $guest.log" &
done;

