Received: from jello277.jellocom.de ([217.17.194.152])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5S6g-0000UO-Eu
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 16:16:54 +0000
Received: from goepel.com (goepel.jetzweb.de [217.17.194.210])
	by jello277.jellocom.de (8.12.11/8.12.9) with ESMTP id i2MGGi63007655
	for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2004 17:16:44 +0100
Received: from goepel.com (goepel109.goepel [172.16.1.109])
	by goepel.com (8.9.3/8.9.3) with ESMTP id RAA07049
	for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2004 17:16:43 +0100
Message-ID: <405F11BB.1090208@goepel.com>
Date: Mon, 22 Mar 2004 17:18:03 +0100
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello...

ive already posted this on arm-general, so please dont flame on me.

i've got a PXA263 board running 2.4.21-rmk1-pxa1 from U-Boot 1.0.2. i
use a JFFS2 rootfs. ive tried an image from the web (for wepep250) --
and it works without problems.

but i can't get "selfmade" images to run.

here is what ive done:

on my development system:

i took the working image from the web:
"dd if=working_img_from_web.jffs2 of=/dev/mtdblock0"

then i mount this:
"mount -t jffs2 /dev/mtdblock0 /mnt/mtd"

and copied everything out
"cp -R /mnt/mtd/* /tmp/content"

then i tried to recreate a jffs2 image from this (unchanged!)
"mkfs.jffs2 -o /tmp/test.jffs2 -r /tmp/content -e 256 -p"

after this i flashed this image with u-boot exactly the same way as the
working image.

then when trying to boot i get the following:


Starting kernel ...

Linux version 2.4.21-rmk1-pxa1-goepel1 (mic@palme) (gcc version 3.2.1)
#1 Don Mdr 18 17:42:30 CET 2004
CPU: XScale-PXA255 revision 6
Machine: Goepel electronic PXA263 ECU board
Ignoring unrecognised tag 0x00000000
Memory clock: 99.53MHz (*27)
Run Mode clock: 398.13MHz (*4)
Turbo Mode clock: 398.13MHz (*1.0, inactive)
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock2 mem=64m console=ttyS00,115200n8
Calibrating delay loop... 397.31 BogoMIPS
Memory: 64MB = 64MB total
Memory: 63496KB available (1003K code, 237K data, 52K init)
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at 0x0000 (irq = 15) is a PXA UART
ttyS01 at 0x0000 (irq = 14) is a PXA UART
ttyS02 at 0x0000 (irq = 13) is a PXA UART
Probing PXA263 internal flash at physical address 0x00000000 (32-bit
buswidth)
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
Using static partition definition
Creating 3 MTD partitions on "PXA263 internal flash":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00200000 : "Kernel"
0x00200000-0x02000000 : "Filesystem"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.97 (double precision)
VFS: Mounted root (jffs2 filesystem).
Mounted devfs on /dev
Freeing init memory: 52K
pc : [<00000034>]    lr : [<4006678c>]    Not tainted
sp : bffff8c0  ip : 4001f000  fp : bffffec4
r10: 40140284  r9 : bffffed0  r8 : 4013e89c
r7 : 0003db44  r6 : 0003db44  r5 : 0003db44  r4 : 00000000
r3 : 4013e89c  r2 : 00000000  r1 : 0003db44  r0 : 4013e89c
Flags: nZCv  IRQs on  FIQs on  Mode USER_32  Segment user
Control: 397F  Table: A000C000  DAC: 00000015
[again and again...]


ive tried several different mkfs.jffs2 binaries (and also a self- build
from mtd-cvs) from the web without success. i think this tools
(respective my handling of this tool) is the problem cause the content
of the working and the nonworking image is the same???

it would be very nice if somebody advice me what im doing wrong...

thanks in advance Michael Palme.
