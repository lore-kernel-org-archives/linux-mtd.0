Received: from automatix.objectxp.com ([62.2.156.210])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTeH1-00079X-CI
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 09:21:17 -0400
Message-ID: <45FFDFC3.1060704@objectxp.com>
Date: Tue, 20 Mar 2007 14:21:07 +0100
From: Michel Marti <mma@objectxp.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2: Filesystem corruption after umount/mount
References: <etoj9s$b84$1@sea.gmane.org>
	<625fc13d0703200531i359508a9jbe1a32524da5d6d1@mail.gmail.com>
In-Reply-To: <625fc13d0703200531i359508a9jbe1a32524da5d6d1@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

on 03/20/2007 01:31 PM Josh Boyer said the following:
> Do you have any output from the kernel after doing the
> mount/unmount/ls operations?  dmesg after those would perhaps be more
> interesting.
I now turned on CONFIG_JFFS2_FS_DEBUG=1. Below is the log for the case
where the filesystem contains the two files "printf" and "printenv".

I did:

# mount -t jffs2 /dev/mtdblock3 /mnt
# ls -l /mnt
# umount /mnt

Jan  1 00:01:24 192 user.debug kernel: jffs2_get_sb(): dev_name "/dev/mtdblock3"
Jan  1 00:01:24 192 user.debug kernel: jffs2_get_sb(): path_lookup() returned 0, inode c02be1b8
Jan  1 00:01:24 192 user.debug kernel: jffs2_get_sb_mtd(): New superblock for device 3 ("C")
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: build FS data structures
Jan  1 00:01:24 192 user.debug kernel: Allocating readbuf of 4096 bytes
Jan  1 00:01:24 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0x0
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_scan_eraseblock: no summary found in jeb 0x00000000. Apply original scan.
Jan  1 00:01:24 192 user.debug kernel: CLEANMARKER node found at 0x00000000
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: Last node at c03dde20 is (fffffffe,00000000)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: New ref is c03dde20 (fffffffe becomes 00000003,00000000) len 0xc
Jan  1 00:01:24 192 user.debug kernel: jffs2_scan_dirent_node(): Node at 0x0000000c
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_ino_cache: add c03de3c8 (ino #1)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: Last node at c03dde20 is (00000003,00000000)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: New ref is c03dde2c (fffffffe becomes 0000000e,00000000) len 0x30
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_fd_to_list: add dirent "printenv", ino #2
Jan  1 00:01:24 192 user.debug kernel: jffs2_scan_inode_node(): Node at 0x0000003c
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_ino_cache: add c03de3b0 (ino #2)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: Last node at c03dde2c is (0000000e,c03de3c8)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: New ref is c03dde38 (fffffffe becomes 0000003c,00000000) len 0x44
Jan  1 00:01:24 192 user.debug kernel: Node is ino #2, version 1. Range 0x0-0x0
Jan  1 00:01:24 192 user.debug kernel: jffs2_scan_dirent_node(): Node at 0x00000080
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: Last node at c03dde38 is (0000003c,c03de3b0)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: New ref is c03dde44 (fffffffe becomes 00000082,00000000) len 0x30
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_fd_to_list: add dirent "printf", ino #3
Jan  1 00:01:24 192 user.debug kernel: jffs2_scan_inode_node(): Node at 0x000000b0
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_ino_cache: add c03de398 (ino #3)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: Last node at c03dde44 is (00000082,c03dde2c)
Jan  1 00:01:24 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_link_node_ref: New ref is c03dde50 (fffffffe becomes 000000b0,00000000) len 0x44
Jan  1 00:01:24 192 user.debug kernel: Node is ino #3, version 1. Range 0x0-0x0
Jan  1 00:01:24 192 user.debug kernel: Found empty flash at 0x000000f8
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00000400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00000400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00001400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00001400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00002400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00002400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00003400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00003400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00004400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00004400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00005400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00005400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00006400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00006400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00007400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00007400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00008400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00008400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x00009400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x00009400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x0000a400
Jan  1 00:01:24 192 user.debug kernel: Reading another 0x1000 at 0x0000a400
Jan  1 00:01:24 192 user.debug kernel: Empty flash to end of buffer at 0x0000b400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0000b400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0000c400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0000c400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0000d400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0000d400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0000e400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0000e400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0000f400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0000f400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00010400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00010400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00011400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00011400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00012400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00012400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00013400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00013400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00014400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00014400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00015400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00015400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00016400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00016400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00017400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00017400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00018400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00018400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00019400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x00019400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0001a400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0001a400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0001b400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0001b400
Jan  1 00:01:25 192 user.debug kernel: buffer at 0x0001c400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0001c400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0001d400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0001d400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0001e400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0x1000 at 0x0001e400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x0001f400
Jan  1 00:01:25 192 user.debug kernel: Reading another 0xc00 at 0x0001f400
Jan  1 00:01:25 192 user.debug kernel: Empty flash to end of buffer at 0x00020000
Jan  1 00:01:25 192 user.debug kernel: Empty flash at 000000f4 runs to end of block. Treating as free_space
Jan  1 00:01:26 192 user.debug kernel: Block at 0x00000000: free 0x0001ff0c, dirty 0x00000000, unchecked 0x00000088, used 0x0000006c, wasted 0x00000000
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_medium(): new nextblock = 0x00000000
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0x20000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x00020000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0x40000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x00040000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0x60000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x00060000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0x80000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x00080000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0xa0000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x000a0000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0xc0000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x000c0000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: jffs2_scan_eraseblock(): Scanning block at 0xe0000
Jan  1 00:01:26 192 user.debug kernel: Block at 0x000e0000 is empty (erased)
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: scanned flash completely
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] dump JFFS2 blocks lists:
Jan  1 00:01:26 192 user.debug kernel: flash_size: 0x100000
Jan  1 00:01:26 192 user.debug kernel: used_size: 0x00006c
Jan  1 00:01:26 192 user.debug kernel: dirty_size: 0x000000
Jan  1 00:01:26 192 user.debug kernel: wasted_size: 0x000000
Jan  1 00:01:26 192 user.debug kernel: unchecked_size: 0x000088
Jan  1 00:01:26 192 user.debug kernel: free_size: 0x0fff0c
Jan  1 00:01:26 192 user.debug kernel: erasing_size: 0x000000
Jan  1 00:01:26 192 user.debug kernel: bad_size: 0x000000
Jan  1 00:01:26 192 user.debug kernel: sector_size: 0x020000
Jan  1 00:01:26 192 user.debug kernel: jffs2_reserved_blocks size: 0x000000
Jan  1 00:01:26 192 user.debug kernel: nextblock: 0x000000 (used 0x00006c, dirty 0x000000, wasted 0x000000, unchecked 0x000088, free 0x01ff0c)
Jan  1 00:01:26 192 user.debug kernel: gcblock: NULL
Jan  1 00:01:26 192 user.debug kernel: clean_list: empty
Jan  1 00:01:26 192 user.debug kernel: very_dirty_list: empty
Jan  1 00:01:26 192 user.debug kernel: dirty_list: empty
Jan  1 00:01:26 192 user.debug kernel: erasable_list: empty
Jan  1 00:01:26 192 user.debug kernel: erasing_list: empty
Jan  1 00:01:26 192 user.debug kernel: erasable_pending_wbuf_list: empty
Jan  1 00:01:26 192 user.debug kernel: free_list: empty
Jan  1 00:01:26 192 user.debug kernel: bad_list: empty
Jan  1 00:01:26 192 user.debug kernel: bad_used_list: empty
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: pass 1 starting
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_inode_pass1: building directory inode #1
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_inode_pass1: increased nlink for child "printf" (ino #3)
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_inode_pass1: increased nlink for child "printenv" (ino #2)
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: pass 1 complete
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: pass 2 starting
Jan  1 00:01:26 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: pass 2a starting
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: pass 2a complete
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: freeing temporary data structures
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_build_filesystem: FS build complete
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: JFFS2 trigger levels (size 1024 KiB, block size 128 KiB, 8 blocks)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Blocks required to allow deletion:    2 (256 KiB)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Blocks required to allow writes:      3 (384 KiB)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Blocks required to quiesce GC thread: 4 (512 KiB)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Blocks required to allow GC merges:   3 (384 KiB)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Blocks required to GC bad blocks:     0 (0 KiB)
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_calc_trigger_levels: Amount of dirty space required to GC: 141557 bytes
Jan  1 00:01:27 192 user.debug kernel: jffs2_do_fill_super(): Getting root inode
Jan  1 00:01:27 192 user.debug kernel: jffs2_read_inode(): inode->i_ino == 1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_do_read_inode: read inode #1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_do_read_inode_internal: ino #1 nlink is 1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_get_inode_nodes: ino #1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_get_inode_nodes: read 40 bytes at 0x000080(2).
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_fd_to_list: add dirent "printf", ino #3
Jan  1 00:01:27 1
92 user.debug kernel: [JFFS2 DBG] (734) jffs2_get_inode_nodes: read 40 bytes at 0x00000c(2).
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_add_fd_to_list: add dirent "prin", ino #2
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (734) jffs2_get_inode_nodes: nodes of inode #1 were read, the highest version is 1, latest_mctime 117439.
Jan  1 00:01:27 192 user.debug kernel: eturning
Jan  1 00:01:27 192 user.debug kernel: jffs2_do_fill_super(): d_alloc_root()
Jan  1 00:01:27 192 user.debug kernel: JFFS2: Garbage collect thread is pid 735
Jan  1 00:01:27 192 user.debug kernel: jffs2_thread_should_wake(): unchecked_size 136, checked_ino #0
Jan  1 00:01:27 192 user.debug kernel: jffs2_garbage_collect_thread(): pass
Jan  1 00:01:27 192 user.debug kernel: Skipping ino #1 already checked
Jan  1 00:01:27 192 user.debug kernel: jffs2_garbage_collect_pass() triggering inode scan of ino#2
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_do_read_inode_internal: ino #2 nlink is 1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: ino #2
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: read 40 bytes at 0x00003c(0).
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) read_more: read more 28 bytes
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) read_dnode: the node has no data.
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) read_dnode: dnode @0000003c: ver 1, offset 0x00, dsize 0x00, csize 0x00
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: nodes of inode #2 were read, the highest version is 1, latest_mctime 429496.
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_do_read_inode_internal: consider node ver 1, phys offset 0x00003c(3), range 0-0.
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_truncate_fragtree: truncating fragtree to 0x00000000 bytes
Jan  1 00:01:27 192 user.debug kernel: jffs2_thread_should_wake(): unchecked_size 68, checked_ino #3
Jan  1 00:01:27 192 user.debug kernel: jffs2_garbage_collect_thread(): pass
Jan  1 00:01:27 192 user.debug kernel: jffs2_garbage_collect_pass() triggering inode scan of ino#3
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_do_read_inode_internal: ino #3 nlink is 1
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: ino #3
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: read 40 bytes at 0x0000b0(0).
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) read_more: read more 28 bytes
Jan  1 00:01:27 192 user.debug kernel: [JFFS2 DBG] (735) read_dnode: the node has no data.
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (735) read_dnode: dnode @000000b0: ver 1, offset 0x00, dsize 0x00, csize 0x00
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_get_inode_nodes: nodes of inode #3 were read, the highest version is 1, latest_mctime 429496.
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_do_read_inode_internal: consider node ver 1, phys offset 0x0000b0(3), range 0-0.
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (735) jffs2_truncate_fragtree: truncating fragtree to 0x00000000 bytes
Jan  1 00:01:28 192 user.debug kernel: jffs2_thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 7, dirty_size 0x0: no
Jan  1 00:01:28 192 user.debug kernel: jffs2_garbage_collect_thread sleeping...
Jan  1 00:01:28 192 user.debug kernel: jffs2_write_super()
Jan  1 00:01:28 192 user.debug kernel: jffs2_thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 7, dirty_size 0x0: no
Jan  1 00:01:28 192 user.debug kernel: Starting erase of pending block 0x00060000
Jan  1 00:01:28 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x00060000
Jan  1 00:01:28 192 user.debug kernel: jffs2_erase_block(): erase block 0x060000 (range 0x060000-0x080000)
Jan  1 00:01:28 192 user.debug kernel: Erase completed successfully at 0x00060000
Jan  1 00:01:28 192 user.debug kernel: Verifying erase at 0x00060000
Jan  1 00:01:28 192 user.debug kernel: Writing erased marker to block at 0x00060000
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03ddd24 is (fffffffe,00000000)
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03ddd24 (fffffffe becomes 00060003,00000000) len 0xc
Jan  1 00:01:28 192 user.debug kernel: Starting erase of pending block 0x00040000
Jan  1 00:01:28 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x00040000
Jan  1 00:01:28 192 user.debug kernel: jffs2_erase_block(): erase block 0x040000 (range 0x040000-0x060000)
Jan  1 00:01:28 192 user.debug kernel: jffs2_readdir() for dir_i #1
Jan  1 00:01:28 192 user.debug kernel: Dirent 0: ".", ino #1
Jan  1 00:01:28 192 user.debug kernel: Dirent 1: "..", ino #1
Jan  1 00:01:28 192 user.debug kernel: jffs2_lookup()
Jan  1 00:01:28 192 user.debug kernel: jffs2_read_inode(): inode->i_ino == 3
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_do_read_inode: read inode #3
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_do_read_inode_internal: ino #3 nlink is 1
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_get_inode_nodes: ino #3
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_get_inode_nodes: read 40 bytes at 0x0000b0(3).
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) read_more: read more 28 bytes
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) read_dnode: dnode @000000b0: ver 1, offset 0x00, dsize 0x00, csize 0x00
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_get_inode_nodes: nodes of inode #3 were read, the highest version is 1, latest_mctime 429496.
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_do_read_inode_internal: consider node ver 1, phys offset 0x0000b0(3), range 0-0.
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (736) jffs2_truncate_fragtree: truncating fragtree to 0x00000000 bytes
Jan  1 00:01:28 192 user.debug kernel: jffs2_read_inode() returning
Jan  1 00:01:28 192 user.debug kernel: jffs2_lookup()
Jan  1 00:01:28 192 user.debug kernel: jffs2_readdir() for dir_i #1
Jan  1 00:01:28 192 user.debug kernel: Erase completed successfully at 0x00040000
Jan  1 00:01:28 192 user.debug kernel: Verifying erase at 0x00040000
Jan  1 00:01:28 192 user.debug kernel: Writing erased marker to block at 0x00040000
Jan  1 00:01:28 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03ddc28 is (fffffffe,00000000)
Jan  1 00:01:28 192 user.debug kernel: n 0xc
Jan  1 00:01:28 192 user.debug kernel: Starting erase of pending block 0x00020000
Jan  1 00:01:28 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x00020000
Jan  1 00:01:28 192 user.debug kernel: jffs2_erase_block(): erase block 0x020000 (range 0x020000-0x040000)
Jan  1 00:01:28 192 user.debug kernel: Erase completed successfully at 0x00020000
Jan  1 00:01:28 192 user.debug kernel: Verifying erase at 0x00020000
Jan  1 00:01:28 192 user.debug kernel: Writing erased marker to block at 0x00020000
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03ddb2c is (fffffffe,00000000)
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03ddb2c (fffffffe becomes 00020003,00000000) len 0xc
Jan  1 00:01:29 192 user.debug kernel: Starting erase of pending block 0x000e0000
Jan  1 00:01:29 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x000e0000
Jan  1 00:01:29 192 user.debug kernel: jffs2_erase_block(): erase block 0x0e0000 (range 0x0e0000-0x100000)
Jan  1 00:01:29 192 user.debug kernel: Erase completed successfully at 0x000e0000
Jan  1 00:01:29 192 user.debug kernel: Verifying erase at 0x000e0000
Jan  1 00:01:29 192 user.debug kernel: Writing erased marker to block at 0x000e0000
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03dda30 is (fffffffe,00000000)
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03dda30 (fffffffe becomes 000e0003,00000000) len 0xc
Jan  1 00:01:29 192 user.debug kernel: Starting erase of pending block 0x000c0000
Jan  1 00:01:29 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x000c0000
Jan  1 00:01:29 192 user.debug kernel: jffs2_erase_block(): erase block 0x0c0000 (range 0x0c0000-0x0e0000)
Jan  1 00:01:29 192 user.debug kernel: Erase completed successfully at 0x000c0000
Jan  1 00:01:29 192 user.debug kernel: Verifying erase at 0x000c0000
Jan  1 00:01:29 192 user.debug kernel: Writing erased marker to block at 0x000c0000
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03dd934 is (fffffffe,00000000)
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03dd934 (fffffffe becomes 000c0003,00000000) len 0xc
Jan  1 00:01:29 192 user.debug kernel: Starting erase of pending block 0x000a0000
Jan  1 00:01:29 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x000a0000
Jan  1 00:01:29 192 user.debug kernel: jffs2_erase_block(): erase block 0x0a0000 (range 0x0a0000-0x0c0000)
Jan  1 00:01:29 192 user.debug kernel: Erase completed successfully at 0x000a0000
Jan  1 00:01:29 192 user.debug kernel: Verifying erase at 0x000a0000
Jan  1 00:01:29 192 user.debug kernel: Writing erased marker to block at 0x000a0000
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03dd838 is (fffffffe,00000000)
Jan  1 00:01:29 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03dd838 (fffffffe becomes 000a0003,00000000) len 0xc
Jan  1 00:01:29 192 user.debug kernel: Starting erase of pending block 0x00080000
Jan  1 00:01:29 192 user.debug kernel: Freeing all node refs for eraseblock offset 0x00080000
Jan  1 00:01:29 192 user.debug kernel: jffs2_erase_block(): erase block 0x080000 (range 0x080000-0x0a0000)
Jan  1 00:01:30 192 user.debug kernel: Erase completed successfully at 0x00080000
Jan  1 00:01:30 192 user.debug kernel: Verifying erase at 0x00080000
Jan  1 00:01:30 192 user.debug kernel: Writing erased marker to block at 0x00080000
Jan  1 00:01:30 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: Last node at c03dd73c is (fffffffe,00000000)
Jan  1 00:01:30 192 user.debug kernel: [JFFS2 DBG] (67) jffs2_link_node_ref: New ref is c03dd73c (fffffffe becomes 00080003,00000000) len 0xc
Jan  1 00:01:30 192 user.debug kernel: jffs2_erase_pending_blocks completed
Jan  1 00:01:30 192 user.debug kernel: jffs2_flush_wbuf_gc() called for ino #0...
Jan  1 00:01:33 192 user.debug kernel: jffs2: Killing GC task 735
Jan  1 00:01:33 192 user.debug kernel: jffs2_garbage_collect_thread(): SIGKILL received.
Jan  1 00:01:33 192 user.debug kernel: jffs2_write_super()
Jan  1 00:01:33 192 user.debug kernel: jffs2_erase_pending_blocks completed
Jan  1 00:01:33 192 user.debug kernel: jffs2_flush_wbuf_gc() called for ino #0...
Jan  1 00:01:33 192 user.debug kernel: jffs2_clear_inode(): ino #1 mode 40755
Jan  1 00:01:33 192 user.debug kernel: jffs2_clear_inode(): ino #3 mode 100644
Jan  1 00:01:33 192 user.debug kernel: jffs2_put_super returning
