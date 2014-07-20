#!/bin/sh

for guest in 80 46 67 76 68 55
do
    scp root@192.168.1.$guest:/root/$guest.log $guest.log
    cat $guest.log | awk '{print $7}' >> $guest.csv.log
done;
