Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qBf9-0006UJ-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 11:27:47 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qBf2-0006UD-00
	for mtd@infradead.org; Thu, 19 Apr 2001 11:27:40 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Vipin Malik'" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Thu, 19 Apr 2001 12:26:59 +0200
Message-ID: <000801c0c8bb$44e56de0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3ADDF6C4.4FA823CD@daniel.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi again

By adding /dev/mtdblock1 to init/main.c I managed to make Linux recognize
my root FS on mtdblock1 :-)

Now I am having some other problems :-(
First it takes about 1 min 30 sec to mount my root FS. Is that expected? I
was hoping for a much shorter
mount time, 10-20 sec
The root partition is 15 MB and df reports:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1           15104      6580      8524  44% /mnt/mtdblock1

After the root FS is mounted, linux gets stuck right after message:
"Freeing unused kernel memory: 48k init"

I think that the next step is to run /sbin/init but that never happens.


 Jocke

Below is my console log


PlanetCore Boot Loader v1.02
Copyright 2000 Embedded Planet.  All rights reserved.
DRAM available size = 16 MB
wvCV
DRAM OK
>ru  << thist loads and executes the kernel via tftp >>

loaded at:     00210000 0021C57C
relocated to:  00180000 0018C57C
board data at: 001801B8 001801D4
relocated to:  00200100 0020011C
zimage at:     0024E583 002C725B
avail ram:     002C8000 01000000

Linux/PPC load: root=/dev/mtdblock1 rw
Uncompressing Linux...done.
Now booting the kernel
Linux version 2.4.3-pre6 (root@jocke.lumentis.se) (gcc version 2.95.2
19991030 (2.
95.3 prerelease/franzo)) #79 Thu Apr 19 10:35:54 CEST 2001
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock1 rw
Decrementer Frequency = 180000000/60
Calibrating delay loop... 47.82 BogoMIPS
Memory: 14640k available (1004k kernel code, 376k data, 48k init, 0k
highmem)
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
CPM UART driver version 0.03
ttyS00 at 0x0280 is a SMC
ttyS01 at 0x0380 is a SMC
ttyS02 at 0x0100 is a SCC
ttyS03 at 0x0200 is a SCC
pty: 256 Unix98 ptys configured
block: queued sectors max/low 9648kB/3216kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: CPM ENET Version 0.2 on SCC1, 00:10:ec:00:26:1b
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.
loop: loaded (max 8 devices)
RPX Lite or CLLF flash device: 1000000 at ff000000
RPX: Found 4 x16 devices at 0x0 in 32-bit mode
 Amd/Fujitsu Extended Query Table v1.2 at 0x0040
number of CFI chips: 1
0: offset=0x0,size=0x8000,blocks=8
1: offset=0x40000,size=0x40000,blocks=63
mtd: Giving out device 0 to RPX App 0xff000000
mtd: Giving out device 1 to RPX User space1,
mtd: Giving out device 2 to RPX CLLF boot firmware
mtd: Giving out device 3 to RPX  User Space2, Empty
mtd: Giving out device 4 to RPX  Diag & Utils
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.1.38, my address is 192.168.1.150
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "RPX User space1" at 0x400, size 0x400
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 48k init

<< here I power cycle the board >>

A
 PlanetCore Boot Loader v1.02
Copyright 2000 Embedded Planet.  All rights reserved.
DRAM available size = 16 MB




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
