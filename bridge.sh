#!/bin/bash
# bridge.sh

brctl addbr br0
tunctl -u root
tunctl -u root
tunctl -u root
tunctl -u root
tunctl -u root
tunctl -u root

ifconfig eth1 0.0.0.0 up
ifconfig tap0 0.0.0.0 up
ifconfig tap1 0.0.0.0 up
ifconfig tap2 0.0.0.0 up
ifconfig tap3 0.0.0.0 up
ifconfig tap4 0.0.0.0 up
ifconfig tap5 0.0.0.0 up

brctl addif br0 eth1
brctl addif br0 tap0
brctl addif br0 tap1
brctl addif br0 tap2
brctl addif br0 tap3
brctl addif br0 tap4
brctl addif br0 tap5

ifconfig br0 192.168.1.77 netmask 255.255.255.0 broadcast 192.168.1.255
route add default gw 192.168.1.254
