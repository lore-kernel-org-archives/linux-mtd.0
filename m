Received: from [207.164.182.16] (helo=cbnsitar.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PSZ2-00060w-03
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 20:44:20 +0100
Received: (from root@localhost)h59JirC30265
	for linux-mtd@lists.infradead.org; Mon, 9 Jun 2003 15:44:53 -0400
Received: from vdoukhan (porcuswine.cbnco.com [207.164.182.8])
	ESMTP id h59Jip030257
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jun 2003 15:44:51 -0400
Date: Mon, 09 Jun 2003 15:45:24 -0400
To: linux-mtd@lists.infradead.org
From: Vladimir Doukhanine <vdoukhan@cbnco.com>
MIME-Version: 1.0
Message-ID: <oprqimhyy07bj7b7@cbnsitar.cbnco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: Problem mounting root jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Just upgraded kernel 2.4.20 and MTD from cvs and I'm experiencing some 
weird delay 1-2 minutes when kernel initially mounts jffs2.
I’d appreciate if someone can give me an idea what could be wrong.

Thanks,
Vlad


Loading done.
Uncompressing Linux... Ok, booting the kernel.
Linux version 2.4.20-sh (root@ex-max.ott.wann.com) (gcc version 3.2.3) #34 
Mon 3
On node 0 totalpages: 11263
zone(0): 11263 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: mem=45052K sh_mv=CM2500 console=ttySC1,115200
Setting GDB trap vector to 0x80000100
CPU clock: 240.03MHz
Bus clock: 40.00MHz
Module clock: 40.00MHz
Interval =Linux version 2.4.20-sh (root@ex-max.ott.wann.com) (gcc version 
3.2.33
Linux version 2.4.20-sh (root@ex-max.ott.wann.com) (gcc version 3.2.3) #34 
Mon 3
On node 0 totalpages: 11263
On node 0 totalpages: 11263
zone(0): 11263 pages.
zone(0): 11263 pages.
zone(1): 0 pages.
zone(1): 0 pages.
zone(2): 0 pages.
zone(2): 0 pages.
Kernel command line: mem=45052K sh_mv=CM2500 console=ttySC1,115200
Kernel command line: mem=45052K sh_mv=CM2500 console=ttySC1,115200
Setting GDB trap vector to 0x80000100
Setting GDB trap vector to 0x80000100
CPU clock: 240.03MHz
CPU clock: 240.03MHz
Bus clock: 40.00MHz
Bus clock: 40.00MHz
Module clock: 40.00MHz
Module clock: 40.00MHz
Interval = 100014
Interval = 100014
Calibrating delay loop... 239.20 BogoMIPS
Memory: 43344k/45052k available (1005k kernel code, 1708k reserved, 28k 
data, 3)
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
CPU: SH7750/SH7751
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications 
AB.
SuperH SCI(F) driver initialized
ttySC0 at 0xffe00000 is a SCI
ttySC1 at 0xffe80000 is a SCIF
Real Time Clock Driver v1.10e
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
physmap flash device: 800000 at a0000000
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Using physmap partition definition
Creating 5 MTD partitions on "Physically mapped flash":
0x00000000-0x00800000 : "29LV641DL flash"
mtd: Giving out device 0 to 29LV641DL flash
0x00000000-0x00010000 : "bootloader"
mtd: Giving out device 1 to bootloader
0x00010000-0x000d0000 : "zImage#1"
mtd: Giving out device 2 to zImage#1
0x000d0000-0x00190000 : "zImage#2"
mtd: Giving out device 3 to zImage#2
0x00190000-0x00800000 : "root FS"
mtd: Giving out device 4 to root FS
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "root FS" at 0x400, size 0x200
mtdblock: read on "root FS" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
1-2 minuts pause (about 10 minuts pause with mtd debug printf enabled)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 32k freed
