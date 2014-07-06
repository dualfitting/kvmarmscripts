#!/bin/sh

for guest in 53 58 56 70 71 72
do
    ssh root@192.168.1.$guest dmesg | grep ktnsec | awk '{print $5}' >> ping$guest.log
done;


