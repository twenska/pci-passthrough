Passthrough for Win10 Guest in Manjaro Linux QEMU/KVM.

Hardware:

CPU: Intel(R) Core(TM) i7-9700K CPU
Motherboard: ASRock Z390 Pro4
GPU: NVIDIA Geforce GTX 660
RAM: 16GB DDR4

Configuration:
Kernel: 5.4.17-1-MANJARO (no custom patches)
Using libvirt/QEMU: libvirt 5.10.0-2/qemu  4.2.0-1

For the most part I followed the ArchLinux Wiki guide on the topic. (https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF)
Some difficulties I had:
	- No UEFI support on GPU. Needed to manually flash a vBIOS
	- Some problems with getting Looking Glass to run stable. Dumped it and moved to hardware based solution (KVM Switch) + Pulse Audio to get sound from guest to host
	- Blue Screens at VM start (VIDEO TDR Failure). loibvirt logs showed "vfio_region_write device or resource busy"
	  Need to Reset PCI Root Port and rescan (https://www.linuxquestions.org/questions/linux-kernel-70/kernel-fails-to-assign-memory-to-pcie-device-4175487043/)
	  Used a script to do the reset and start the VM

No problems with Pulse Audio sound. Performance is pretty ok, even if I only use CPU pinning. I only need the Windows to run League, so maybe I will need to do some more tuning in the future.

