Received: from imap.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UToF-0004m2-QB
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2003 17:04:47 +0100
Date: Mon, 23 Jun 2003 18:02:45 +0200
To: linux-mtd@lists.infradead.org
Message-ID: <20030623160245.GA25579@timberwolf.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
From: kleine-budde@gmx.de (Marc Kleine-Budde)
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
Subject: DNP mounting issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I'm using linux-2.4.21 together with mtd from 'Mon Jun 23 17:45:34 CEST 2003'
The hardware is SSV's DNP-486 (=2 MB flash).

When booting the jffs2 filesystem on the mtd cannot be mounted,
surprisingly it works with an unpatched linux-2.4.21 out of the box.

I've attached the bootingmessages from both kernels....


hope someone can help
	Marc
-- 
#!/bin/sh
set - `type $0` 'tr "[a-zA-Z]" "[n-za-mN-ZA-M]"';while [ "$2" != "" ];do \
shift;done; echo 'frq -a -rc '`echo "$0"| $1 `'>$UBZR/.`rpub signature|'`\
echo $1|$1`'`;rpub "Jr ner fvtangher bs obet. Erfvfgnapr vf shgvyr!"'|$1|sh

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dnp-fail.log"

Linux version 2.4.21 (frogger@vulture) (gcc version 3.2.3) #6 Mon Jun 23 14:39:35 CEST 2003
BIOS-provided physical RAM map:
 BIOS-88: 0000000000000000 - 000000000009f000 (usable)
 BIOS-88: 0000000000100000 - 0000000000800000 (usable)
8MB LOWMEM available.
On node 0 totalpages: 2048
zone(0): 2048 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: auto BOOT_IMAGE=kangaroo ro console=ttyS0,115200 root=/dev/mtdblock1
Initializing CPU#0
Calibrating delay loop... 16.48 BogoMIPS
Memory: 6224k/8192k available (1040k kernel code, 1580k reserved, 207k data, 60k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry cache hash table entries: 1024 (order: 1, 8192 bytes)
Inode cache hash table entries: 512 (order: 0, 4096 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
CPU: AMD 02/0a stepping 04
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis Communications AB.
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
cs89x0:cs89x0_probe(0x0)
PP_addr=0x3000
cs89x0.c: v2.4.3-pre1 Russell Nelson <nelson@crynwr.com>, Andrew Morton <andrewm@uow.edu.au>
eth0: cs8900 rev J found at 0x300 [Cirrus EEPROM] 
cs89x0 media RJ-45, IRQ 5, programmed I/O, MAC 02:80:ad:20:38:68
cs89x0_probe1() successful
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
$Id: ftl.c,v 1.50 2003/05/21 10:49:47 dwmw2 Exp $
MTD Sharp chip driver <ds@lineo.com>
DIL/Net DNPC flash: 0x200000 at 0x2000000
FLASH virtual address: 0xc1070000
Search for id:(89 aa) interleave(1) type(1)
MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
MTD jedec_match(): check unlock addrs 0x0555 0x02aa
MTD jedec_match(): check ID's disappear when not in ID mode
MTD jedec_match(): return to ID mode
MTD jedec_probe_chip(): matched device 0x89,0xaa unlock_addrs: 0x0555 0x02aa
Found: Intel I28F016S3
DNP Flash Bank: Found 1 x8 devices at 0x0 in 8-bit mode
Using word write method
Creating 4 MTD partitions on "DNP Flash Bank":
0x00000000-0x000f0000 : "DNP boot"
0x000f0000-0x00100000 : "DNP system BIOS"
0x00100000-0x001f0000 : "DNP file system"
0x001f0000-0x00200000 : "DNP system BIOS entry"
Concatenating MTD devices:
(0): "DNP boot"
(1): "DNP file system"
(2): "DNP system BIOS"
(3): "DNP system BIOS entry"
into device "(A)DNP Flash Concatenated"
Creating 3 MTD partitions on "(A)DNP Flash Concatenated":
0x00000000-0x000c0000 : "DNP boot block"
mtd: Giving out device 0 to DNP boot block
0x000c0000-0x001e0000 : "DNP file system space"
mtd: Giving out device 1 to DNP file system space
0x001e0000-0x00200000 : "DNP system BIOS + BIOS Entry"
mtd: Giving out device 2 to DNP system BIOS + BIOS Entry
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 1024)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtd->read(0x400 bytes from 0x0) returned -22
mtdblock_release
ok
Kernel panic: VFS: Unable to mount root fs on 1f:01
 

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dnp-success.log"

Linux version 2.4.21-orig (frogger@vulture) (gcc version 3.2.3) #3 Mon Jun 23 17:02:35 CEST 2003
BIOS-provided physical RAM map:
 BIOS-88: 0000000000000000 - 000000000009f000 (usable)
 BIOS-88: 0000000000100000 - 0000000000800000 (usable)
8MB LOWMEM available.
On node 0 totalpages: 2048
zone(0): 2048 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: auto BOOT_IMAGE=kangaroo console=ttyS0,115200 root=/dev/mtdblock1
Initializing CPU#0
Calibrating delay loop... 16.48 BogoMIPS
Memory: 6260k/8192k available (1024k kernel code, 1544k reserved, 183k data, 60k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry cache hash table entries: 1024 (order: 1, 8192 bytes)
Inode cache hash table entries: 512 (order: 0, 4096 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
CPU: AMD 02/0a stepping 04
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications AB.
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
cs89x0:cs89x0_probe(0x0)
PP_addr=0x3042
eth0: incorrect signature 0x156f
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
PP_addr=0xffff
eth0: incorrect signature 0xffff
cs89x0: no cs8900 or cs8920 detected.  Be sure to disable PnP with SETUP
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
MTD Sharp chip driver <ds@lineo.com>
DIL/Net DNPC flash: 0x200000 at 0x2000000
FLASH virtual address: 0xc1070000
Search for id:(89 aa) interleave(1) type(1)
Found: Intel I28F016S3
DNP Flash Bank: Found 1 x8 devices at 0x0 in 8-bit mode
Using word write method
Creating 4 MTD partitions on "DNP Flash Bank":
0x00000000-0x000f0000 : "DNP boot"
0x000f0000-0x00100000 : "DNP system BIOS"
0x00100000-0x001f0000 : "DNP file system"
0x001f0000-0x00200000 : "DNP system BIOS entry"
Concatenating MTD devices:
(0): "DNP boot"
(1): "DNP file system"
(2): "DNP system BIOS"
(3): "DNP system BIOS entry"
into device "(A)DNP Flash Concatenated"
Creating 3 MTD partitions on "(A)DNP Flash Concatenated":
0x00000000-0x000c0000 : "DNP boot block"
mtd: Giving out device 0 to DNP boot block
0x000c0000-0x001e0000 : "DNP file system space"
mtd: Giving out device 1 to DNP file system space
0x001e0000-0x00200000 : "DNP system BIOS + BIOS Entry"
mtd: Giving out device 2 to DNP system BIOS + BIOS Entry
$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 1024)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7978: 0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e797c: 0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7980: 0x5154 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7984: 0x86ab instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7988: 0xc860 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e798c: 0xe416 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7990: 0xf9ad instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7994: 0x6aac instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e7998: 0x8197 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e799c: 0x18a1 instead
Further such events for this erase block will not be printed
jffs2_scan_inode_node(): Data CRC failed on node at 0x000e7ae4: Read 0x1d5aaa1a, calculated 0x01fa69e1
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 60k freed
init started:  BusyBox v0.61.pre (2003.06.22-22:10+0000) multi-call binary
init started:  BusyBox v0.61.pre (2003.06.22-22:10+0000) multi-call binary
Starting pid 9, console /dev/tts/0: '/etc/init.d/rcS'
starting the system...
mounted proc & tmp
modules loaded
Thu Apr 17 14:30:00 UTC 2003
executing /etc/startup
Starting pid 20, console /dev/tts/0: '/sbin/getty'

--PNTmBPCT7hxwcZjr--
