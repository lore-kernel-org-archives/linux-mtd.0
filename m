From: eric.dejonc@thales-e-transactions.com (Eric DEJONC)
Date: Thu, 27 Mar 2003 15:00:19 +0100
Subject: Unable to handle kernel paging request at virtual address 80000013
Message-ID: <3E8303F3.980B0F02@thales-e-transactions.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
I prefer to say first that I'm a newbie...
I'm working on a 2.5.6.2 linux kernel that run on a trizeps board from
keith&koep( SA1110, 32 Mo SDRAM, 16 Mo flash). I use
blob to boot linux. So my flash is filled like this (sa1100-flash.c):
------------------00000000
Blob/kernel
------------------00200000
Ramdisk
------------------00600000
Freespace
------------------01000000

I tried many configuration on my kernel but I always get the same error
I configured my kernel as follow:
Memory Technology device->
    <x>Memory Technology Device support
    <x>MTD support
    <x>ARM Firmware Suite Partion parsing
    <x>Direct char device access to MTD        --->to have /dev/mtd2
working
    <x>Caching block device access to MTD   --->to have /dev/mtdblock2
working
    RAM/ROM/Flash chip driver
        <x> I selected all
    Mapping drivers for chip access
        <x>CFI Flash device in physical memory
        (800000)Physical address of flash mapping --->what is that,
where could I get this info? If I use 0, I break my ramdisk each
time I try to erase mtd2
        (1000000)Physical length---> (16Mo)
        (2)Bus width---> (16 bit flash)
        <x>CFI flash device mapped on SA11x0

when linux boot:

Arm-Linux version 2.5.6-rmk1
(compiled with gcc version 2.95.2 19991024 (release))
#48 jeu mar 27 11:28:24 EST 2003
Processor: Intel StrongARM-1110 revision 8
Machine: TRIZEPS
16Mo Flash - Bank 0 - start: 0xc0000000
Security risk: creating user accessible mapping for 0x00000000 at
0xe8000000
Security risk: creating user accessible mapping for 0x30000000 at
0xf0000000
Security risk: creating user accessible mapping for 0x38000000 at
0xf2000000
On node 0 totalpages: 8192
zone(0): 8192 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=ttySA0,115200 root=/dev/ram load_ramdisk=1
mem=32M
Warning: uninitialized Real Time Clock
Console: colour dummy device 80x30
Calibrating delay loop... 127.38 BogoMIPS
Memory: 32MB = 32MB total
Memory: 22336KB available (1467K code, 301K data, 72K init)
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
BIO: pool of 256 setup, 14Kb (56 bytes/bio)
biovec: init pool 0, 1 entries, 12 bytes
biovec: init pool 1, 4 entries, 48 bytes
biovec: init pool 2, 16 entries, 192 bytes
biovec: init pool 3, 64 entries, 768 bytes
biovec: init pool 4, 128 entries, 1536 bytes
biovec: init pool 5, 256 entries, 3072 bytes
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
Allocated 401728 bytes for deflate workspace
Allocated 46912 bytes for inflate workspace
ttySA0 at MEM 0x80050000 (irq = 17) is a SA1100
ttySA1 at MEM 0x80010000 (irq = 15) is a SA1100
ttySA2 at MEM 0x80030000 (irq = 16) is a SA1100
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS01 at 0xf0180000 (irq = 38) is a 16450
Real Time Clock Driver v1.11
SA1100 Real Time Clock driver v1.00
SA1100 Watchdog Timer: timer margin 60 sec
block: 64 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
loop: loaded (max 8 devices)
PPP generic driver version 2.4.1
physmap flash device: 1000000 at 800000
mtd: Giving out device 0 to Physically mapped flash
SA1100 flash: probing 16-bit flash bus
No RedBoot partition table detected in SA1100 flash
Using static partition definition
Creating 3 MTD partitions on "SA1100 flash":
0x00000000-0x00200000 : "Bootloader & the kernel"
mtd: Giving out device 1 to Bootloader & the kernel
0x00200000-0x00600000 : "Data"
mtd: Giving out device 2 to Data
0x00600000-0x01000000 : "User flash"
mtd: Giving out device 3 to User flash
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 682)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 8192K
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem).
serial console detected.  Disabling virtual terminals.
init started:  BusyBox v0.60.3 (2002.07.22-17:48+0000) multi-call binary

BusyBox v0.60.3 (2002.07.22-17:48+0000) Built for Trizeps
/ #

then:
mknod /dev/mtd2 c 90 4
mknod /dev/mtdb2 b 31 2
erase /dev/mtd2 0 200
cp ./disk.jffs2 /dev/mtd2
mount -t jffs2 /dev/mtdb2 /mnt

ls /mnt --->it's working: it prints all that I have in the disk
disk.jffs2

then, if I try to copy anything to /mnt, I get the following error:
Unable to handle kernel paging request at virtual address 80000013
pgd = c1620000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: c1623003
CPU: 0
pc : [<c0095ab4>]    lr : [<80000093>]    Not tainted
sp : c0be3e9c  ip : 80000013  fp : c0be3eec
r10: c0b6b07c  r9 : c1f5392c  r8 : c0b6b21c
r7 : c0b9a340  r6 : 00000000  r5 : c0b9b100  r4 : c0be3eb8
r3 : 00000044  r2 : 003c0050  r1 : 0001ffb0  r0 : 00000000
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: C162317F  Table: C162317F  DAC: 00000015
Process lash (pid: 41, stackpage=c1609360)
Stack: (0xc0be3e8c to 0xc0be4000)
3e80:                            80000093 c0095ab4 80000093 ffffffff
003c000c
3ea0: c0be3eb8 c0be3ebc c0be3ec0 00000007 c0b6b1e0 c0be15e0 00000044
0001ffb0
3ec0: 003c0050 000001a4 c0b6b07c 00000000 c0be15e0 c0be3f60 c0be2000
00000242
3ee0: c0be3f0c c0be3ef0 c006e864 c00958a4 c0be15e0 c0be1560 000001b6
c1f50000
3f00: c0be3f5c c0be3f10 c006ea38 c006e7dc c0042b58 c0be3f20 c0024e80
c0be3f68
3f20: 00000000 00000000 00000002 000001b6 c0be15e0 00000241 00000003
000001b6
3f40: c1f50000 c001d824 c0be2000 00000241 c0be3f8c c0be3f60 c005c778
c006e898
3f60: c0be1560 c02323a0 c1f50005 00000007 329f54fd 00000010 00000000
00000241
3f80: c0be3fac c0be3f90 c005cb88 c005c750 02066eb8 bffffe34 02066e48
00000005
3fa0: 00000000 c0be3fb0 c001d6a0 c005cb50 02066eb8 c0025660 02066e72
00000241
3fc0: 000001b6 00000001 02066eb8 bffffe34 02066e48 00000000 00000000
bffffe24
3fe0: 00000241 bffffee8 400ae1a0 bffffdc4 02021650 400ae1a4 20000010
02066e72
Backtrace: frame pointer underflow
Function entered at [<c0095898>] from [<c006e864>]
Function entered at [<c006e7d0>] from [<c006ea38>]
 r7 = C1F50000  r6 = 000001B6  r5 = C0BE1560  r4 = C0BE15E0
Function entered at [<c006e88c>] from [<c005c778>]
Function entered at [<c005c744>] from [<c005cb88>]
 r4 = 00000241
Function entered at [<c005cb44>] from [<c001d6a0>]
 r7 = 00000005  r6 = 02066E48  r5 = BFFFFE34  r4 = 02066EB8
Code: e50b1030 e10fc000 e38ce080 e121f00e (e59ce000)


Have I forgotten to configure something? I tried many configuration, but
I always get the same error! Could somebody help me?

Best regards,
Eric
