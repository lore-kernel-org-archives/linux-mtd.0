Received: from epost.aspira.to
	([62.13.47.101] helo=onebill.twinspot.net ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187WBh-0004wp-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 07:25:49 +0000
Received: from p238.linnet.nu ([62.13.47.238] helo=[10.1.15.105])
	by onebill.twinspot.net with esmtp for <linux-mtd@lists.infradead.org>
	id 187Wew-0000GJ-00; Fri, 01 Nov 2002 08:56:02 +0100
Subject: MTD devices at the wrong place
From: Anders Olsson <Anders.Olsson@matchpointds.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Nov 2002 08:58:17 +0100
Message-Id: <1036137508.26545.46.camel@Europa.matchpointds>
Mime-Version: 1.0
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

I'm using Linux 2.4.19-rmk4 with mtd from CVS on a 7312 (Cogent board).
I have written a JFFS2 image in the flash and tried to mount it. When
this didn't work I thought that just writing somthing to the
corresponding mtd character device could be a sensible test to do. But
that only destroyed my bootloader (ARMBoot) on address 0.

Next atempt, I reinstalled the bootloader and erased the entire flash.
Loaded linux and wrote to the mtd4 character device. Then I dumped the
entire flash with my MultiICE to see where my written file was.
The file had been written at the start of the flash memory 0x00000000
and not at 0x00240000 where I thought it would be. Whats wrong here?

Starting kernel ...

cleanup_before_linux(bd);
flush_all_caches()
going to execute: theKernel(0, 83 );
Linux version 2.4.19-rmk4 (Anders@Europa) (gcc version 2.95.3 20010315
(release)) #12 Thu Oct 31 15:41:23 CET 2002
CPU: ARM ARM720T revision 2
Machine: Cirrus Logic EDB7312 (EP7312 evaluation board)
Ignoring unrecognised tag 0x00000000
Security risk: creating user accessible mapping for 0x30000000 at
0xfd000000
Security risk: creating user accessible mapping for 0x20000000 at
0xfc000000
Security risk: creating user accessible mapping for 0x00000000 at
0xfb000000
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: mem=0x01000000@0xc0000000 root=/dev/ram
init=/linuxrc rw
Calibrating delay loop... 36.76 BogoMIPS
Memory: 16MB = 16MB total
Memory: 13952KB available (1109K code, 202K data, 52K init)
Dentry cache hash table entries: 2048 (order: 2, 16384 bytes)
Inode cache hash table entries: 1024 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
ttyAM0 at I/O 0x100 (irq = 12) is a CLPS711x
ttyAM1 at I/O 0x1100 (irq = 28) is a CLPS711x
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Cirrus Logic CS8900A driver for Linux (V0.02)
eth0: No default I/O base address defined. Use io=... or
eth0: define CIRRUS_DEFAULT_IO for your platform

physmap flash device: 1000000 at 0
Using buffer write method
mtd: Giving out device 0 to Physically mapped flash

##Is this /dev/mtd0?

EDB7312-NOR:0x01000000 at 0x00000000
Using buffer write method
mtd: Giving out device 1 to NOR flash on EDB7312

##And this /dev/mtd1?

EDB7312-NOR:using static partition definition


##What does this mean? 

Creating 3 MTD partitions on "NOR flash on EDB7312":
0x00000000-0x00040000 : "ARMboot"
mtd: Giving out device 2 to ARMboot
0x00040000-0x00240000 : "Kernel"
mtd: Giving out device 3 to Kernel
0x00240000-0x01000000 : "Jffs2"
mtd: Giving out device 4 to Jffs2

##Is this /dev/mtd4??
##or
##Do I have to create /dev/mtd1/0, /dev/mtd1/1, /dev/mtd1/2 to access
the jffs2 partition on the NOR device?


NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 850K
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 52K


##I guess it's ok to just create one device? or do I have to create them
all? Or a directory structure under /dev/mtd0 and /dev/mtd1
mknod /dev/mtd4 c 90 4

##then I dd this file to /dev/mtd4
cat /linuxrc
#!/bin/sh
export LD_LIBRARY_PATH=/lib
mount -t proc proc /proc
echo
echo '### Initial RAM disk starting interactive shell ###'
/bin/sh -i </dev/console >/dev/console 2>/dev/console
exit 0

dd if=linuxrc of=/dev/mtd4
MTD_open
MTD_write
0+1 records in
0+1 reMTD_close
cords out
##When I look in the flash dump it's at addess 0 instead of 0x00240000!
Whats erong with the MTD? Or most likely me...

Any ideas or pointers highly appreciated 

Kind regards Anders Olsson
