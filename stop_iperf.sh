#!/bin/sh

benchmark="iperf"

ps aux | grep $benchmark | awk '{print $2}' | xargs kill

for guest in 84 79 82 78 81 83
do
    scp root@192.168.1.$guest:/root/$guest.log $guest.log
    cat $guest.log | awk '{print $5}' >> $guest.log.csv
done;

