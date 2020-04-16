#!/usr/bin/env bash

virt-install --name=deb902 --vcpus=1  --memory=1024  --cdrom=/home/whitemage/debian-9.8.0-amd64-netinst.iso --disk /mnt/vms/vms00-VMsVol00/vm02 --os-variant=debian8 --livecd 
