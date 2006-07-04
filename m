Received: from lilzmailso01.liwest.at ([212.33.55.23])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fxmgu-0003FI-4X
	for linux-mtd@lists.infradead.org; Tue, 04 Jul 2006 11:20:24 -0400
Received: from cm49-137.liwest.at ([212.33.49.137] helo=soft.uni-linz.ac.at)
	by lilzmailso01.liwest.at with esmtp (Exim 4.44) id 1Fxmgk-0002nW-44
	for linux-mtd@lists.infradead.org; Tue, 04 Jul 2006 17:19:46 +0200
Message-ID: <44AA8646.4060306@soft.uni-linz.ac.at>
Date: Tue, 04 Jul 2006 17:16:22 +0200
From: Simon Vogl <vogl@soft.uni-linz.ac.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: pxa271 p30 troubles
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I have troubles with a pxa271 module that has an on-chip internal flash 
chip.
I can read teh flash in principle, via u-boot, and my kernel (2.6.17.1) 
reads
_mostly_ the right data, but at some point when mounting the root 
filesystem,
jffs2 runs havoc because the data is corrupted:

[42949373.460000] Creating 5 MTD partitions on "PXA 270 flash":
[42949373.470000] 0x00000000-0x00040000 : "Bootloader"
[42949373.470000] mtd: Giving out device 0 to Bootloader
[42949373.480000] 0x00040000-0x00080000 : "Environment"
[42949373.490000] mtd: Giving out device 1 to Environment
[42949373.490000] 0x00080000-0x00200000 : "Kernel"
[42949373.500000] mtd: Giving out device 2 to Kernel
[42949373.500000] 0x00200000-0x00500000 : "initrd"
[42949373.500000] mtd: Giving out device 3 to initrd
[42949373.510000] 0x00500000-0x02000000 : "jffs"
[42949373.510000] mtd: Giving out device 4 to jffs
[42949373.520000] added %ret partitions
[42949373.520000] jffs2_get_sb(): dev_name "/dev/root"
[42949373.530000] jffs2_get_sb(): path_lookup() returned 0, inode c02294b4
[42949373.530000] jffs2_get_sb_mtd(): New superblock for device 4 ("jffs")
[42949373.540000] [JFFS2 DBG] (1) jffs2_build_filesystem: build FS data 
structures
[42949373.550000] jffs2_scan_eraseblock(): Scanning block at 0x0
[42949373.550000] [JFFS2 DBG] (1) jffs2_scan_eraseblock: no summary 
found in jeb 0x00000000. Apply original scan.
[42949373.560000] Unknown but compatible feature node (0x2005) found at 
offset 0x00000000
[42949373.570000] jffs2_scan_dirent_node(): Node at 0x00000018
[42949373.580000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c02313c8 (ino #1)
[42949373.580000] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"bin", ino #2
[42949373.590000] jffs2_scan_inode_node(): Node at 0x00000044
[42949373.600000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c02313b0 (ino #2)
[42949373.600000] Node is ino #2, version 1. Range 0x0-0x0
[42949373.610000] jffs2_scan_dirent_node(): Node at 0x00000088
[42949373.620000] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"boot", ino #3
[42949373.620000] jffs2_scan_inode_node(): Node at 0x000000b4
[42949373.630000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c0231398 (ino #3)
[42949373.630000] Node is ino #3, version 1. Range 0x0-0x0
[42949373.640000] jffs2_scan_dirent_node(): Node at 0x000000f8
[42949373.650000] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"dev", ino #4
[42949373.650000] jffs2_scan_inode_node(): Node at 0x00000124
[42949373.660000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c0231380 (ino #4)
[42949373.660000] Node is ino #4, version 1. Range 0x0-0x0
[42949373.670000] jffs2_scan_dirent_node(): Node at 0x00000168
...... [which seems to be okay, but then:]
[42949374.060000] Node is ino #17, version 1. Range 0x0-0xe
[42949374.070000] jffs2_scan_dirent_node(): Node at 0x00000744
[42949374.070000] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"ash", ino #18
[42949374.080000] jffs2_scan_inode_node(): Node at 0x00000770
[42949374.080000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c0231950 (ino 
#18)
[42949374.090000] Node is ino #18, version 1. Range 0x0-0x7
[42949374.100000] jffs2_scan_dirent_node(): Node at 0x000007bc
[42949374.100000] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"busybox", ino #19
[42949374.110000] jffs2_scan_inode_node(): Node at 0x000007ec
[42949374.110000] [JFFS2 DBG] (1) jffs2_add_ino_cache: add c0231938 (ino 
#19)
[42949374.120000] Node is ino #19, version 1. Range 0x0-0x1000
[42949374.130000] jffs2_scan_inode_node(): Node at 0x00000c80
[42949374.130000] Node is ino #19, version 2. Range 0x1000-0x2000
[42949374.140000] jffs2_scan_inode_node(): Node at 0x000013a0
[42949374.140000] Node is ino #19, version 3. Range 0x2000-0x3000
[42949374.150000] jffs2_scan_inode_node(): Node at 0x00001c28
[42949374.150000] Node is ino #19, version 4. Range 0x3000-0x4000
[42949374.160000] jffs2_scan_inode_node(): Node at 0x000023b4
[42949374.170000] Node is ino #19, version 5. Range 0x4000-0x5000
[42949374.170000] jffs2_scan_inode_node(): Node at 0x00002718
[42949374.180000] Node is ino #19, version 6. Range 0x5000-0x6000
[42949374.180000] jffs2_scan_inode_node(): Node at 0x000031d8
[42949374.190000] Node is ino #19, version 7. Range 0x6000-0x7000
[42949374.190000] jffs2_scan_inode_node(): Node at 0x00003d88
[42949374.200000] Node is ino #19, version 8. Range 0x7000-0x8000
[42949374.210000] jffs2_scan_inode_node(): Node at 0x00004924
[42949374.210000] Node is ino #19, version 9. Range 0x8000-0x9000
[42949374.220000] jffs2_scan_inode_node(): Node at 0x0000543c
[42949374.220000] Node is ino #19, version 10. Range 0x9000-0xa000
[42949374.230000] jffs2_scan_inode_node(): Node at 0x00005f78
[42949374.230000] Node is ino #19, version 11. Range 0xa000-0xb000
[42949374.240000] jffs2_scan_inode_node(): Node at 0x00006b48
[42949374.240000] Node is ino #19, version 12. Range 0xb000-0xc000
.... running up to version >150, then it recovers on one of the next 
sectors,
but the behavior repeats until finished, whereupon the kernel can't find
/sbin/init and panics.
Anyone had a similar experience?
Could it be a hardware/timing issue? [the driver works on our second
board, which is a PXA270 with external p30 flash, the only difference is 
that
the pxa271 uses a 16bit memory interface, and I use a really slooooow timing
for bus access].

Simon
