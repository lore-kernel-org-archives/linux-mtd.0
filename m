Received: from gwise1.sanmina-sci.com ([143.116.116.229])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AyY9a-0002px-6p
	for linux-mtd@lists.infradead.org; Wed, 03 Mar 2004 15:19:22 +0000
Message-Id: <s045a303.087@gwise1.sanmina-sci.com>
Date: Wed, 03 Mar 2004 09:18:45 -0600
From: "Flint Cowden" <Flint.Cowden@sanmina-sci.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: Where is the jffs2 partition?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm a complete beginner. I have attempted to put a jffs2 partition on an
Embedded Planet MPC8245-based board. This board has the system, a
RAMdisk, etc. on 16M of flash I'm not interested in. It has an extra 64M
of flash implemented from the bus's viewpoint as a single 16Mx32 device.
I am trying to implement a jffs2 filing system partition on this 64M
device. I created (in physmap.c) a single partition filling the entire
device.

>From the following boot code and and attempt to locate the partition, I
believe that my AMD flash device is being located, sized correctly
(after some effort), and has a partition assigned to it. Now, how do I
access, mount, or use this flash memory? Any clue would be appreciated.

Flint

Here is what the boot process tells me:


Scanning bus 00
Found 00:00 [1057/0006] 000600 00
Found 00:c0 [8086/1209] 000200 00
Fixups for bus 00
Bus scan for 00 returning with max=00
PCI: Cannot allocate resource region 1 of device 00:00.0
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
pty: 256 Unix98 ptys configured                                        
  
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI e
ttyS00 at 0xfdfcf500 (irq = 5) is a ST16650
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Intel(R) PRO/100 Network Driver - version 2.3.18-k1
Copyright (c) 2003 Intel Corporation

e100: eth0: Intel(R) PRO/100 Network Connection
  Hardware receive checksums enabled

physmap flash device: 4000000 at 74000000
 Amd/Fujitsu Extended Query Table v1.3 at 0x0040
Number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
Using physmap partition definition
Creating 1 MTD partitions on "Physically mapped flash":
0x00000000-0x04000000 : "my_jffs2"
mtd: Giving out device 1 to my_jffs2
mtd: Giving out device 2 to mtdram test device
$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ram_read(pos:0, len:68)
ram_read(pos:131072, len:68)
ram_read(pos:262144, len:68)
ram_read(pos:393216, len:68)
ram_read(pos:524288, len:68)
ram_read(pos:655360, len:68)
ram_read(pos:786432, len:68)
ram_read(pos:917504, len:68)
ftl_cs: FTL header not found.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 1456k freed
VFS: Mounted root (ext2 filesystem).




BusyBox v0.60.1 (2002.10.24-04:52+0000) Built-in shell (msh)
Enter 'help' for a list of built-in commands.

# cat /dev/proc
dev:    size   erasesize  name
mtd0: 04000000 00010000 "Physically mapped flash"
mtd1: 04000000 00010000 "my_jffs2"
mtd2: 00400000 00020000 "mtdram test device"



# mount -t jffs2 /dev/mtdblock /mnt
mount: Mounting /dev/mtdblock on /mnt failed: No such file or
directory
# mkdir /mnt
# mount -t jffs2 /dev/mtdblock /mnt
mount: Mounting /dev/mtdblock on /mnt failed: Block device required
#
#
