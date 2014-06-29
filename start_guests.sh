#!/bin/sh

#kernel="zImage.merge1000ns"
kernel="zImage"

for vmid in 0 1 2 3 4 5
do
    qemu-system-arm -enable-kvm -serial stdio -kernel $kernel -m 512 -M vexpress-a15 -cpu cortex-a15 -drive file=large.img,id=virtio-blk,if=none -device virtio-blk,drive=virtio-blk,transport=virtio-mmio.0 -device virtio-net,transport=virtio-mmio.1,netdev=net$vmid,mac="52:54:00:12:34:5$vmid" -netdev type=tap,id=net$vmid,script=no,downscript=no,ifname="tap$vmid" -append "earlyprintk=ttyAMA0 console=ttyAMA0 mem=512M virtio_mmio.device=1M@0x4e000000:74:0 virtio_mmio.device=1M@0x4e100000:75:1 root=/dev/vda rw ip=dhcp --no-log" &
done;
