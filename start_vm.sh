#!/bin/bash
echo 1 > /sys/bus/pci/devices/0000\:00\:01.0/remove && echo 1 > /sys/bus/pci/rescan
virsh start win10-2

