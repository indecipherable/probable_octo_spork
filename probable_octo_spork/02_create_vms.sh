#!/usr/bin/env bash

is_daemon_active=$(systemctl status libvirtd | grep active | awk '{ print $2 }')
echo "DEBUG: is_daemon_active: $is_daemon_active"
if [ $is_daemon_active = "inactive" ]; then
  echo "DEBUG: is_daemon_active: $is_daemon_active"
  sudo systemctl start libvirtd
  if [ $? = "0" ]; then
    echo "DEBUG: daemon started"
  fi
fi
echo

cd /mnt/vms
these_vms=$(find /mnt -size +1G)
for i in $these_vms; do
  this_vm=$(echo "${i##*/}")
  this_vm_exists=$(virsh list --all | grep $this_vm -c)
  #echo $i $this_vm
  if [ $this_vm_exists = 0 ]; then
    echo "DEBUG: doing virt-install $this_vm"
    #echo virt-install --name=$this_vm --vcpus=1 --memory=1536 --disk $i --os-variant=generic
    virt-install --name=$this_vm --vcpus=1 --memory=1536 --disk $i --os-variant=generic --import
  else
    echo "DEBUG: $i exists; skipping"
  fi
  echo
done
