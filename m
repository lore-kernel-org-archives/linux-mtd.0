Received: from mxout3.netvision.net.il ([194.90.9.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189OA2-0002cU-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 11:15:51 +0000
Received: from david2.lan ([212.143.44.83]) by mxout3.netvision.net.il
 (iPlanet Messaging Server 5.2 HotFix 0.8 (built Jul 12 2002))
 with ESMTPA id <0H5500184KO3XL@mxout3.netvision.net.il> for
 linux-mtd@lists.infradead.org; Wed, 06 Nov 2002 13:45:39 +0200 (IST)
Date: Wed, 06 Nov 2002 13:48:23 +0200
From: "David @ Netvision" <itamar13@netvision.net.il>
Subject: jffs2 root file system erased during boot
To: linux-mtd@lists.infradead.org
Message-id: <1036583304.25851.15.camel@david2.lan>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi All,

 I am trying to bring up arm linux-2.5.30-rmk1-pxa1.
 I Mapped jffs2 root file system (bootstrap.jffs2 Downloaded from
familiar project) as mtdblock2 and defined that
  this is the root file system.
 The boot fails because the kernel can't find init, and the kernel
erasing the entire file system.


 Any idea what may cause this?


 The console output is bellow.

/*******************************************************************************\

Linux version 2.5.30-rmk1-pxa1 (root@TESTLIN) (gcc version 3.2) #40 Mon
Sep 30 13:27:50 IDT 2002
CPU: Intel XScale-PXA250 revision 3
CPU: D undefined 5 cache
CPU: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Machine: Intel DBPXA250 Development Platform
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=ttyS0,38400n8 root=/dev/mtdblock2
Calibrating delay loop... 99.12 BogoMIPS
Memory: 16MB = 16MB total
Memory: 14596KB available (1317K code, 218K data, 56K init)
Security Scaffold v1.0.0 initialized
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
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
Journalled Block Device driver loaded
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc.
Capability LSM initialized
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing disabled
ttyS0 at  (irq = 14) is a PXA
pty: 256 Unix98 ptys configured
block: 32 slots per queue, batch=8
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
Probing Lubbock flash at physical address 0x00000000
Using static partition definition
Creating 4 MTD partitions on "Lubbock flash":
0x00000000-0x00100000 : "ArmBoot"
mtd: Giving out device 0 to ArmBoot
0x00100000-0x00200000 : "Kernel Image"
mtd: Giving out device 1 to Kernel Image
0x00200000-0x01000000 : "Root Filesystem"
mtd: Giving out device 2 to Root Filesystem
0x01000000-0x01200000 : "Other Filesystem"
mtd: Giving out device 3 to Other Filesystem
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "Root Filesystem" at 0x400, size 0x400
mtdblock_release
ok
mtdblock_open
ok
mtdblock: read on "Root Filesystem" at 0x400, size 0x400
mtdblock_release
ok
mtdblock_open
ok
VFS: Mounted root (jffs filesystem) readonly.
Freeing init memory: 56K
Warning: unable to open an initial console.
Kernel panic: No init found.  Try passing init= option to kernel.


/**********************************************************************\


Thanks,

David
