Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubi0G-0001qZ-Tu
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 01:56:42 +0000
Received: by mail-la0-f46.google.com with SMTP id fk20so5634184lab.19
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 18:56:15 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 12 May 2013 21:56:15 -0400
Message-ID: <CA+mubHpPN1C662Hpf1x9Xt9gMU6yDwFph6fM0GxnGTGEc2NzOA@mail.gmail.com>
Subject: Why UBIFS mounts read only?
From: harsh poshtiwala <hiharsh@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I am trying to boot UBIFS based rootfs on NAND flash.
Upon mounting, I found the rootfs is mounted readonly without any messages.=
.
My kernel command line parameters are as below.


setenv bootargs console=3DttyO2,115200n8 rootfstype=3Dubifs rw
ubi.mtd=3D10,2048  root=3Dubi0:rootfs; setenv nandargs setenv bootargs
console=3DttyO2,115200n8 rootfstype=3Dubifs rw ubi.mtd=3D10,2048
root=3Dubi0:rootfs;
saveenv;


Here is the fstab entry

proc                 /proc                proc       defaults             0=
  0
/dev/mtdblock12      /mnt/readerconfig    jffs2      rw,exec,noatime      0=
  0
/dev/mtdblock15      /mnt/data            jffs2      rw,exec,noatime      0=
  0
tmpfs                /var                 tmpfs      defaults             0=
  0
tmpfs                /tmp                 tmpfs      defaults             0=
  0
tmpfs                /media/ram           tmpfs      defaults             0=
  0
sysfs                /sys                 sysfs      nosuid,noexec,nodev  0=
  0
# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto =
0  0
usbfs                /proc/bus/usb        usbfs      defaults              =
0  0
none                 /dev/pts             devpts     defaults              =
0  0


Here is the inittab

::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mount -a
::sysinit:/etc/init.d/rcS
::respawn:/sbin/getty 115200 ttyO2
# Stuff to do when restarting the init process
::restart:/sbin/init
# Stuff to do before rebooting
::shutdown:/bin/cp /var/log/syslog /mnt/readerconfig/LOGGER.DB
::ctrlaltdel:/sbin/reboot
::shutdown:/bin/umount -a -r
~

Also, I flashed image after erasing the partion followed by ubiformat.

Here is the complete boot log, any help would be appreciated.


NAND read: device 0 offset 0x700000, size 0x500000
 5242880 bytes read: OK
mot_setbootargs: console=3DttyO2,115200n8 rootfstype=3Dubifs rw
ubi.mtd=3D10,2048 root=3Dubi0:rootfs mothw=3D0 ubootver=3D91.1.1
eth=3D00:15:70:cd:3a:a2
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.32.8.ti-omap3-am3517-e
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1986756 Bytes =3D 1.9 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Thredbo: Starting kernel ...

Uncompressing Linux........................................................=
...........................................................................
done, booting the kernel.

Thredbo kernel version: 1.1.3

Linux version 2.6.32.8.ti-omap3-am3517-evm (mvdev@MVista) (gcc version
4.4.1 (MontaVista Linux Sourcery G++ 4.4-312) ) #69 PREEMPT Thu May 9
13:49:58 EDT 2013
CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=3D10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3517/AM3517 EVM
Memory policy: ECC disabled, Data cache writeback
AM3505 ES3.1 (l2cache iva neon isp )
SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x100000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Thredbo: Kernel command line: console=3DttyO2,115200n8 rootfstype=3Dubifs
rw ubi.mtd=3D10,2048 root=3Dubi0:rootfs mothw=3D0 ubootver=3D91.1.1
eth=3D00:15:70:cd:3a:a2
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 256MB =3D 256MB total
Memory: 255488KB available (3692K code, 335K data, 140K init, 0K highmem)
Hierarchical RCU implementation.
NR_IRQS:368
Clocking rate (Crystal/Core/MPU): 26.0/332/600 MHz
GPMC revision 5.0
IRQ: Found an INTC at 0xfa200000 (revision 4.0) with 96 interrupts
Total of 96 interrupts on 1 active controller
OMAP GPIO hardware version 2.5
OMAP clockevent source: GPTIMER1 at 32768 Hz
Console: colour dummy device 80x30
Calibrating delay loop... 597.64 BogoMIPS (lpj=3D2334720)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
saved_command_line=3Dconsole=3DttyO2,115200n8 rootfstype=3Dubifs rw
ubi.mtd=3D10,2048 root=3Dubi0:rootfs mothw=3D0 ubootver=3D91.1.1
eth=3D00:15:70:cd:3a:a2
uboot ver=3D0x005b0101
Thredbo hardware detected, ID=3D0
devtmpfs: initialized
NET: Registered protocol family 16
omap_serial_init_port: port 0 dma_enabled 1
omap_serial_init_port: port 1 dma_enabled 1
omap_serial_init_port: port 2 dma_enabled 1
Display initialized successfully
OMAP DMA hardware revision 4.0
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
i2c_omap i2c_omap.1: bus 1 rev3.12 at 400 kHz
Bluetooth: Core ver 2.15
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Switching to clocksource 32k_counter
musb_hdrc: version 6.0, cppi4.1-dma, host, debug=3D0
AM3517 OTG revision 4ea41001, PHY b0036a2, control 00
musb_hdrc: USB Host mode controller at d0810000 using DMA, IRQ 71
musb_hdrc musb_hdrc: MUSB HDRC host driver
musb_hdrc musb_hdrc: new USB bus registered, assigned bus number 1
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: MUSB HDRC host driver
usb usb1: Manufacturer: Linux 2.6.32.8.ti-omap3-am3517-evm musb-hcd
usb usb1: SerialNumber: musb_hdrc
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
LTTng will clear ccnt top bit every 229 jiffies.
AM3505  Linux PSP version 03.00.00.05 (AM3517EVM)
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) (SUMMARY)  =A9 2001-2006 Red Hat, Inc.
yaffs May  9 2013 13:44:34 Installing.
msgmni has been set to 499
alg: No test for cipher_null (cipher_null-generic)
alg: No test for ecb(cipher_null) (ecb-cipher_null)
alg: No test for digest_null (digest_null-generic)
alg: No test for compress_null (compress_null-generic)
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
motdio_init_module
thredboio: total 46 dios
omap-hsuart.0: ttyO0 at MMIO 0x4806a000 (irq =3D 72) is a OMAP UART0
omap-hsuart.1: ttyO1 at MMIO 0x4806c000 (irq =3D 73) is a OMAP UART1
omap-hsuart.2: ttyO2 at MMIO 0x49020000 (irq =3D 74) is a OMAP UART2
console [ttyO2] enabled
loop: module loaded
omap2-nand driver initializing
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xb3 (Micron NAND 1GiB 1,8V 16=
-bit)
Creating 16 MTD partitions on "omap2-nand.0":
0x000000000000-0x000000020000 : "xloader1"
0x000000020000-0x000000040000 : "xloader2"
0x000000040000-0x000000080000 : "reserved"
0x000000080000-0x000000100000 : "uboot1"
0x000000100000-0x000000180000 : "uboot2"
0x000000180000-0x0000001a0000 : "bootdata1"
0x0000001a0000-0x0000001c0000 : "bootdata2"
0x0000001c0000-0x000000200000 : "reserved"
0x000000200000-0x000000700000 : "linux kernel1"
0x000000700000-0x000000c00000 : "linux kernel2"
0x000000c00000-0x000019c00000 : "rootfs_1"
0x000019c00000-0x000032c00000 : "rootfs_2"
0x000032c00000-0x000033000000 : "readerconfig"
0x000033000000-0x000037000000 : "platform1"
0x000037000000-0x00003b000000 : "platform2"
0x00003b000000-0x000040000000 : "data"
UBI: attaching mtd10 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd10 to ubi0
UBI: MTD device name:            "rootfs_1"
UBI: MTD device size:            400 MiB
UBI: number of good PEBs:        3200
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 3200
UBI: number of PEBs reserved for bad PEB handling: 32
UBI: max/mean erase counter: 1/0
UBI: image sequence number: 0
UBI: background thread "ubi_bgt0d" started, PID 341
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 2
ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: OMAP-EHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.32.8.ti-omap3-am3517-evm ehci_hcd
usb usb2: SerialNumber: ehci-omap.0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbtest
udc: OMAP UDC driver, version: 4 October 2004 (iso) (dma)
#ds1339_probe: Thredbo ds1339 driver
ds1339_probe ds1339_get_datetime success
rtc-ds1339 1-0068: rtc core: registered rtc-ds1339 as rtc0
i2c /dev entries driver
OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
Bluetooth: Generic Bluetooth USB driver ver 0.6
usbcore: registered new interface driver btusb
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
IPv4 over IPv4 tunneling driver
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
NET: Registered protocol family 15
Bluetooth: L2CAP ver 2.14
Bluetooth: L2CAP socket layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
Power Management for TI OMAP3.
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 1
Valid mac: 00:15:70:cd:3a:a2
davinci_emac_probe: using saved MAC addr: 00:15:70:cd:3a:a2
emac-mii: probed
rtc-ds1339 1-0068: rtc_hctosys: setting system clock to 2013-05-11
03:29:12 UTC (1368242952)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   400355328 bytes (390972 KiB, 381 MiB, 3153 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:14.
devtmpfs: mounted
Freeing init memory: 140K
init started: BusyBox v1.13.2 (2013-01-09 12:22:37 IST)
can't open /dev/proc: No such file or directory
can't open /dev/rwmo: No such file or directory
can't open /dev/dpts: No such file or directory
can't open /dev/moun: No such file or directory
starting pid 390, tty '': '/etc/init.d/rcS'
hostname: permission denied. (are you root?)
ifup: interface eth0 already configured
Starting syslogd/klogd: ifup: interface lo already configured
starting pid 402, tty '': '/sbin/getty 115200 ttyO2'
Executing thredbo startup script...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
done
Starting OpenBSD Secure Shell server: sshd
ERROR: Failed to open /dev/mtdblock5 in r+ mode
.Could not load host key: /etc/ssh/ssh_host_rsa_key
Could not load host key: /etc/ssh/ssh_host_dsa_key
Disabling protocol version 2. Could not load host key
sshd: no hostkeys available -- exiting.
..++++++
...................++++++
Segmentation fault
chmod: /platform/bin/*: No such file or directory
chmod: /platform/bin/mfgreset.elf: No such file or directory
./InitThredboScript.sh: line 20: /platform/bin/mfgreset.elf: not found
chmod: /platform/bin/mfgreset.elf: No such file or directory
./InitThredboScript.sh: line 24: /readerconfig/networkscript.sh: not found
/usr/local/avahi/sbin/avahi-autoipd: error while loading shared
libraries: libdaemon.so.0: cannot open shared object file: No such
file or directory
./InitThredboScript.sh: line 32: /platform/bin/snmpextagent.elf: not found
AH00526: Syntax error on line 220 of /usr/local/apache2/conf/httpd.conf:
DocumentRoot must be a directory
AH00526: Syntax error on line 220 of /usr/local/apache2/conf/httpd.conf:
DocumentRoot must be a directory
./InitThredboScript.sh: line 43: /platform/bin/rmserver.elf: not found
./InitThredboScript.sh: line 41: /platform/bin/llrpserver.elf: not found
pfkey_open: Operation not permitted
./InitThredboScript.sh: line 56: /platform/bin/RDMPAgent: not found
ifconfig: SIOCSIFADDR: Permission denied
Starting applications....
racoon: must be root to invoke this program.
chmod: /apps/autostart.sh: No such file or directory
su: can't set groups: Operation not permitted
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
^Ccat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory

cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory

cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
process '/sbin/getty 115200 ttyO2' (pid 402) exited. Scheduling for restart=
.
starting pid 490, tty '': '/sbin/getty 115200 ttyO2'
ecat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
boot
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
ifconfig: /proc/net/dev: No such file or directory
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
....

--
Thanks & Regards
Harsh
