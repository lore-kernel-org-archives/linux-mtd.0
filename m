Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9HEd-0005gw-Lq
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 05:56:40 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9E4tag16806
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 17:55:36 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9E4tZI16800
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 17:55:35 +1300
Received: from tait.co.nz ([172.25.107.194])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HMQ00K8NDOLUI@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Tue, 14 Oct 2003 17:55:33 +1300 (NZDT)
Date: Tue, 14 Oct 2003 17:53:33 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F8B814D.3050408@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Mount of jffs2 partition fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

I'm using mtd-snapshot-20031013, kernel 2.4.21 cross compiled from x86 
to ppc MPC8xx cpu. Mount (and other tools) are busybox-1.00pre3. The 
flash device is a M28W320CB from STMicroelectronics.

I'm hitting a problem at mount time of a jffs2 partition which is 
probably down to a configuration error but I've not been able to 
identify it (so far!!)

I've loaded a very small jffs2 image, created on the host, into flash 
and despite the errors (below) I'm able to read the contents of that 
filesystem.

First attempt...
================
/ # mount -t jffs2 /dev/mtdblock1 /mnt
/ # Erase at 0x000d0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000c0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000b0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000a0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00090000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00080000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00070000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00060000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00050000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00040000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00030000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00020000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00010000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000f0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000e0000 failed immediately: -EROFS. Is the sector locked?
================

Second attempt, having unlocked the flash in the bootloader (although 
I'd have thought mtd would do it!!)
================
/ # mount -t jffs2 /dev/mtdblock1 /mnt
/ # Write clean marker to block at 0x000d0000 failed: -30
Write clean marker to block at 0x000c0000 failed: -30
Write clean marker to block at 0x000b0000 failed: -30
Write clean marker to block at 0x000a0000 failed: -30
Write clean marker to block at 0x00090000 failed: -30
Write clean marker to block at 0x00080000 failed: -30
Write clean marker to block at 0x00070000 failed: -30
Write clean marker to block at 0x00060000 failed: -30
Write clean marker to block at 0x00050000 failed: -30
Write clean marker to block at 0x00040000 failed: -30
Write clean marker to block at 0x00030000 failed: -30
Write clean marker to block at 0x00020000 failed: -30
Write clean marker to block at 0x00010000 failed: -30
Write clean marker to block at 0x000f0000 failed: -30
Write clean marker to block at 0x000e0000 failed: -30
================

The relevant kernel config is as follows:
================
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=40000000
CONFIG_MTD_PHYSMAP_LEN=400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
================

The partitions reported by the proc filesystem are:
================
/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00010000 "initrd"
mtd1: 00100000 00010000 "disk"
mtd2: 00100000 00010000 "kernel2"
mtd3: 00040000 00010000 "u-boot"
mtd4: 000c0000 00010000 "kernel"
================

and dmesg reports as follows:
no idea why its trying to load the cmdlinepart & redboot modules as they 
are not defined!!
================
physmap flash device: 400000 at 40000000
Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
  Intel/Sharp Extended Query Table at 0x0035
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x2000,blocks=8
1: offset=0x10000,size=0x10000,blocks=63
Using buffer write method
kmod: failed to exec /sbin/modprobe -s -k cmdlinepart, errno = 2
cmdlinepart partition parsing not available
kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno = 2
RedBoot partition parsing not available
Using physmap partition definition
Creating 5 MTD partitions on "Physically mapped flash":
0x00000000-0x00100000 : "initrd"
0x00100000-0x00200000 : "disk"
0x00200000-0x00300000 : "kernel2"
0x00300000-0x00340000 : "u-boot"
0x00340000-0x00400000 : "kernel"
================

after the mount, dmesg reports
================
/ # mount -t jffs2 /dev/mtdblock1 /mnt && dmesg
erase_pending_list: 000b0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000a0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00090000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00080000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00070000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00060000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00050000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00040000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00030000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00020000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00010000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erasable_pending_wbuf_list: empty
free_list: empty
bad_list: empty
bad_used_list: empty
Pass 2 (re)starting
Pass 2: ino #1, nlink 1, ic c066f260, nodes c0670360
Pass 2: ino #2, nlink 1, ic c066f278, nodes c0670370
jffs2_dump_block_lists:
flash_size: 00100000
used_size: 00000040
dirty_size: 00000000
wasted_size: 00000000
unchecked_size: 000001f8
free_size: 000ffdc8
erasing_size: 00000000
bad_size: 00000000
sector_size: 00010000
jffs2_reserved_blocks size: 00000000
nextblock: 00000000 (used 00000040, dirty 00000000, wasted 00000000, 
unchecked 000001f8, free 0000fdc8)
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: empty
erasable_list: empty
erasing_list: empty
erase_pending_list: 000f0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000e0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000d0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000c0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000b0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000a0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00090000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00080000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00070000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00060000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00050000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00040000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00030000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00020000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00010000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erasable_pending_wbuf_list: empty
free_list: empty
bad_list: empty
bad_used_list: empty
Pass 2 complete
Pass 3: ino #1, ic c066f260, nodes c0670360
Pass 3: ino #2, ic c066f278, nodes c0670370
Pass 3 complete
jffs2_dump_block_lists:
flash_size: 00100000
used_size: 00000040
dirty_size: 00000000
wasted_size: 00000000
unchecked_size: 000001f8
free_size: 000ffdc8
erasing_size: 00000000
bad_size: 00000000
sector_size: 00010000
jffs2_reserved_blocks size: 00000000
nextblock: 00000000 (used 00000040, dirty 00000000, wasted 00000000, 
unchecked 000001f8, free 0000fdc8)
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: empty
erasable_list: empty
erasing_list: empty
erase_pending_list: 000f0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000e0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000d0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000c0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000b0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 000a0000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00090000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00080000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00070000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00060000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00050000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00040000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00030000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00020000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erase_pending_list: 00010000 (used 00000000, dirty 00000000, wasted 
00000000, unchecked 00000000, free 00010000)
erasable_pending_wbuf_list: empty
free_list: empty
bad_list: empty
bad_used_list: empty
Not rotating empty clean_list
Not rotating empty very_dirty_list
Not rotating empty dirty_list
Not rotating empty erasable_list
Rotating erase_pending_list by 1
Erase block at front of erase_pending_list is at 000d0000
Not rotating empty free_list
JFFS2 trigger levels (size 1024 KiB, block size 64 KiB, 16 blocks)
Blocks required to allow deletion:    2 (128 KiB)
Blocks required to allow writes:      3 (192 KiB)
Blocks required to quiesce GC thread: 4 (256 KiB)
Blocks required to allow GC merges:   3 (192 KiB)
Blocks required to GC bad blocks:     0 (0 KiB)
Amount of dirty space required to GC: 76021 bytes
jffs2_do_fill_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
jffs2_do_read_inode(): getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found c0676260 for ino 1
jffs2_do_read_inode(): Got inocache at c0676260
jffs2_do_read_inode_internal(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
Node at 0000000c (2) is a dirent node
Adding fd "initrd.mk", ino #2
jffs2_add_fd_to_list( c01be7d0, c068bc0c (->00000000))
Dirent "initrd.mk" (hash 0x4028c47a, ino #2
jffs2_read_inode() returning
jffs2_do_fill_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 38
thread_should_wake(): unchecked_size 504, checked_ino #0
jffs2_garbage_collect_thread(): pass
jffs2_get_ino_cache(): ino 0
jffs2_get_ino_cache found 00000000 for ino 0
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found c0676260 for ino 1
Skipping ino #1 already checked
jffs2_get_ino_cache(): ino 2
jffs2_get_ino_cache found c0676278 for ino 2
jffs2_garbage_collect_pass() triggering inode scan of ino#2
jffs2_do_read_inode_internal(): ino #2 nlink is 1
jffs2_get_inode_nodes(): ino #2
Node at 00000040 (0) is a data node
version 1, highest_version now 1
Marking node at 0x00000040 REF_PRISTINE
dnode @00000040: ver 1, offset 0000, dsize 03e0
jffs2_add_full_dnode_to_inode(ino #2, f c01be810, fn c0680350)
adding node 0000-03e0 @0x00000040 on flash, newfrag *c0703210
jffs2_lookup_node_frag(c01be820, 0)
Returning NULL, empty fragtree
j_a_f_d_t_f: Lookup gave no frag
Adding new frag (c0703210) at root of tree
frag 0000-03e0: 0x00000040(2) on flash (*c0703210). left (00000000), 
right (00000000), parent (00000000)
jffs2_lookup_node_frag(c01be820, 992)
Considering frag 0-992 (c0703210). left 00000000, right 00000000
Going right from frag 0-992, before the region we care about
No match. Returning frag 0,992, closest previous
Truncating fraglist to 0x000003e0 bytes
Truncating frag 0x00000000-0x000003e0
jffs2_kill_fragtree: frag at 0x0-0x3e0: node c0680350, frags 1--
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 15, dirty_size 
0x0: no
jffs2_garbage_collect_thread sleeping...
jffs2_write_super()
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 15, dirty_size 
0x0: no
Starting erase of pending block 0x000d0000
Freeing all node refs for eraseblock offset 0x000d0000
Erase completed successfully at 0x000d0000
Verifying erase at 0x000d0000
Writing erased marker to block at 0x000d0000
Write clean marker to block at 0x000d0000 failed: -30
Starting erase of pending block 0x000c0000
Freeing all node refs for eraseblock offset 0x000c0000
Erase completed successfully at 0x000c0000
Verifying erase at 0x000c0000
Writing erased marker to block at 0x000c0000
Write clean marker to block at 0x000c0000 failed: -30
Starting erase of pending block 0x000b0000
Freeing all node refs for eraseblock offset 0x000b0000
Erase completed successfully at 0x000b0000
Verifying erase at 0x000b0000
Writing erased marker to block at 0x000b0000
Write clean marker to block at 0x000b0000 failed: -30
....
================
the write failures repeat over time for the whole 1Mb of the partition.


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
