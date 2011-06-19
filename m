Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYK6B-000420-3E
	for linux-mtd@lists.infradead.org; Sun, 19 Jun 2011 15:39:44 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QYK67-0002o9-Rg
	for linux-mtd@lists.infradead.org; Sun, 19 Jun 2011 17:39:39 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2011 17:39:39 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2011 17:39:39 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Claiming back space from NAND?
Date: Sun, 19 Jun 2011 17:39:27 +0200
Message-ID: <lv5sv610ivu2a8de8nmdl652jsvv5p1s0r@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

	After booting up a new kernel with the root filesystem on the second
partition in the NAND, I notice that the 248MiB partition is down to
only 225MiB.

I understand that Ubifs uses some space for journaling, but does it
really need that much space? Is it possible to reclaim some space?

Here's some information:
============= dmesg
Found mtd parition at 0x0020a000, (len=0x800000), moving to 0x03700000
...
uclinux[mtd]: RAM probe address=0x3700000 size=0x800000
Creating 1 MTD partitions on "RAM":
0x000000000000-0x000000800000 : "ROMfs"
mtd: Giving out device 0 to ROMfs
Generic platform RAM MTD, (c) 2004 Simtec Electronics
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit)
Scanning device for bad blocks
INFO: RCU detected CPU 0 stall (t=2500 jiffies)
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Creating 2 MTD partitions on "My_great_flash_memory":
0x000000000000-0x000000800000 : "kernel_nand"
mtd: Giving out device 1 to kernel_nand
0x000000800000-0x000010000000 : "filesystem_nand"
mtd: Giving out device 2 to filesystem_nand
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "filesystem_nand"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1984
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1984
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 19/14
UBI: image sequence number: 393609284
mtd: Giving out device 3 to rootfs
============= /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00001000 "ROMfs"
mtd1: 00800000 00020000 "kernel_nand"
mtd2: 0f800000 00020000 "filesystem_nand"
mtd3: 0f14b800 0001f800 "rootfs"
============= df -h
Filesystem                Size      Used Available Use% Mounted on
ubi0:rootfs             225.0M      3.2M    221.8M   1% /
=============

Thank you.
