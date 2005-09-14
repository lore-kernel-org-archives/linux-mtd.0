Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFXYJ-0006Rm-14
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 09:44:07 -0400
Message-ID: <4328291E.9030002@mw-itcon.de>
Date: Wed, 14 Sep 2005 15:43:58 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de> <432817FF.10307@yandex.ru>
In-Reply-To: <432817FF.10307@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Peter Menzebach wrote:
...
>> I loose files, which I write on a jffs2 filesystem.
> 
> Do you have sumary enabled ? If yes, try to disable it.
It's not enabled.
> 
...
>> [JFFS2 DBG] (111) jffs2_add_full_dnode_to_inode: adding node 0x00-0x04 
> 
> Why I don't see messages from scan.c? Strange.
My fault, new log attached

...
>> PM: dataflash_write: 8574720 .. 8583168
> 
> [snip]
> 
>> PM: dataflash_write: 8574720 .. 8583168
> 
> two nodes are written to the same place ? That's odd...

Yes, that's what I thought, too.

new log...

[42949436.200000] jffs2_get_sb(): dev_name "/dev/mtdblock/2"
[42949436.200000] jffs2_get_sb(): path_lookup() returned 0, inode c0fcde94
[42949436.200000] jffs2_get_sb_mtd(): New superblock for device 2 ("etcfs")
[42949436.200000] JFFS2 write-buffering enabled (8448)
[42949436.200000] Allocating readbuf of 4096 bytes
[42949436.200000] jffs2_scan_eraseblock(): Scanning block at 0x0
[42949436.200000] Block at 0x00000000 is empty (erased)
[42949436.200000] jffs2_scan_eraseblock(): Scanning block at 0x2100
[42949436.210000] Block at 0x00002100 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0x4200
[42949436.210000] Block at 0x00004200 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0x6300
[42949436.210000] Block at 0x00006300 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0x8400
[42949436.210000] Block at 0x00008400 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0xa500
[42949436.210000] Block at 0x0000a500 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0xc600
[42949436.210000] Block at 0x0000c600 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0xe700
[42949436.210000] Block at 0x0000e700 is empty (erased)
[42949436.210000] jffs2_scan_eraseblock(): Scanning block at 0x10800
[42949436.220000] Block at 0x00010800 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x12900
[42949436.220000] Block at 0x00012900 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x14a00
[42949436.220000] Block at 0x00014a00 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x16b00
[42949436.220000] Block at 0x00016b00 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x18c00
[42949436.220000] Block at 0x00018c00 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x1ad00
[42949436.220000] Block at 0x0001ad00 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x1ce00
[42949436.220000] Block at 0x0001ce00 is empty (erased)
[42949436.220000] jffs2_scan_eraseblock(): Scanning block at 0x1ef00
[42949436.220000] Block at 0x0001ef00 is empty (erased)
[42949436.220000] Scanned flash completely
[42949436.220000] [JFFS2 DBG] (102) __jffs2_dbg_dump_block_lists_nolock: 
dump JFFS2 blocks lists:
[42949436.230000] flash_size: 0x021000
[42949436.230000] used_size: 0x000000
[42949436.230000] dirty_size: 0x000000
[42949436.230000] wasted_size: 0x000000
[42949436.230000] unchecked_size: 0x000000
[42949436.230000] free_size: 0x021000
[42949436.230000] erasing_size: 0x000000
[42949436.230000] bad_size: 0x000000
[42949436.230000] sector_size: 0x002100
[42949436.230000] jffs2_reserved_blocks size: 0x000000
[42949436.230000] nextblock: NULL
[42949436.230000] gcblock: NULL
[42949436.230000] clean_list: empty
[42949436.230000] very_dirty_list: empty
[42949436.230000] dirty_list: empty
[42949436.230000] erasable_list: empty
[42949436.230000] erasing_list: empty
[42949436.230000] erase_pending_list: empty
[42949436.230000] erasable_pending_wbuf_list: empty
[42949436.230000] bad_list: empty
[42949436.230000] bad_used_list: empty
[42949436.230000] Pass 1 complete
[42949436.230000] Pass 2 starting
[42949436.230000] Pass 2a starting
[42949436.230000] Pass 2 complete
[42949436.230000] Pass 3 complete
[42949436.230000] [JFFS2 DBG] (102) __jffs2_dbg_dump_block_lists_nolock: 
dump JFFS2 blocks lists:
[42949436.230000] flash_size: 0x021000
[42949436.230000] used_size: 0x000000
[42949436.230000] dirty_size: 0x000000
[42949436.230000] wasted_size: 0x000000
[42949436.230000] unchecked_size: 0x000000
[42949436.230000] free_size: 0x021000
[42949436.230000] erasing_size: 0x000000
[42949436.230000] bad_size: 0x000000
[42949436.230000] sector_size: 0x002100
[42949436.230000] jffs2_reserved_blocks size: 0x000000
[42949436.230000] nextblock: NULL
[42949436.230000] gcblock: NULL
[42949436.230000] clean_list: empty
[42949436.230000] very_dirty_list: empty
[42949436.230000] dirty_list: empty
[42949436.230000] erasable_list: empty
[42949436.230000] erasing_list: empty
[42949436.230000] erase_pending_list: empty
[42949436.230000] erasable_pending_wbuf_list: empty
[42949436.230000] bad_list: empty
[42949436.230000] bad_used_list: empty
[42949436.230000] Not rotating empty clean_list
[42949436.230000] Not rotating empty very_dirty_list
[42949436.230000] Not rotating empty dirty_list
[42949436.230000] Not rotating empty erasable_list
[42949436.230000] Not rotating empty erase_pending_list
[42949436.230000] Rotating free_list by 7
[42949436.230000] Erase block at front of free_list is at 0000e700
[42949436.230000] JFFS2 trigger levels (size 132 KiB, block size 8 KiB, 
16 blocks)
[42949436.230000] Blocks required to allow deletion:    2 (16 KiB)
[42949436.230000] Blocks required to allow writes:      3 (24 KiB)
[42949436.230000] Blocks required to quiesce GC thread: 4 (33 KiB)
[42949436.230000] Blocks required to allow GC merges:   3 (24 KiB)
[42949436.230000] Blocks required to GC bad blocks:     0 (0 KiB)
[42949436.230000] Amount of dirty space required to GC: 9799 bytes
[42949436.230000] jffs2_do_fill_super(): Getting root inode
[42949436.230000] jffs2_read_inode(): inode->i_ino == 1
[42949436.230000] [JFFS2 DBG] (102) jffs2_do_read_inode: read inode #1
[42949436.230000] [JFFS2 DBG] (102) jffs2_do_read_inode: creating 
inocache for root inode
[42949436.230000] [JFFS2 DBG] (102) jffs2_add_ino_cache: add c0ebc3c4 
(ino #1)
[42949436.230000] [JFFS2 DBG] (102) jffs2_do_read_inode_internal: ino #1 
nlink is 1
[42949436.230000] [JFFS2 DBG] (102) jffs2_get_inode_nodes: ino #1
[42949436.230000] [JFFS2 DBG] (102) jffs2_get_inode_nodes: nodes of 
inode #1 were read, the highest version is 0, latest_mctime 3221420412, 
mctime_ver 0.
[42949436.230000] jffs2_read_inode() returning
[42949436.230000] jffs2_do_fill_super(): d_alloc_root()
[42949436.230000] JFFS2: Garbage collect thread is pid 103
[42949436.230000] jffs2_thread_should_wake(): nr_free_blocks 16, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949436.230000] jffs2_garbage_collect_thread sleeping...

[root@armbox /root]$echo aaa > /conf/aaa
[root@armbox /root]$d[42949498.310000] jffs2: No clean, dirty _or_ 
erasable blocks to GC from! Where are they all?
[42949498.310000] jffs2: Couldn't find erase block to garbage collect!
[42949498.320000] PM: dataflash_write: 1022208 .. 1030656
mesg -c
[42949495.620000] jffs2_lookup()
[42949495.620000] jffs2_create()
[42949495.620000] jffs2_new_inode(): dir_i 1, mode 0x81a4
[42949495.620000] [JFFS2 DBG] (94) jffs2_add_ino_cache: add c0ebc3dc 
(ino #2)
[42949495.620000] jffs2_do_new_inode(): Assigned ino# 2
[42949495.620000] jffs2_reserve_space(): Requested 0x44 bytes
[42949495.620000] jffs2_reserve_space(): alloc sem got
[42949495.620000] jffs2_find_nextblock(): new nextblock = 0x0000e700
[42949495.620000] jffs2_do_reserve_space(): Giving 0x2100 bytes at 0xe700
[42949495.620000] jffs2_do_create(): reserved 0x2100 bytes
[42949495.620000] jffs2_add_physical_node_ref(): Node at 0xe700(2), size 
0x44
[42949495.620000] jffs2_write_dnode wrote node at 0x0000e700(2) with 
dsize 0x0, csize 0x0, node_crc 0xbb60398c, data_crc 0x00000000, totlen 
0x00000044
[42949495.620000] jffs2_do_create created file with mode 0x81a4
[42949495.620000] jffs2_complete_reservation()
[42949495.620000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949495.620000] jffs2_reserve_space(): Requested 0x2c bytes
[42949495.620000] jffs2_reserve_space(): alloc sem got
[42949495.620000] jffs2_do_reserve_space(): Giving 0x20bc bytes at 0xe744
[42949495.620000] jffs2_write_dirent(ino #1, name at *0xc1dcb970 
"aaa"->ino #2, name_crc 0x0f46aa3f)
[42949495.620000] jffs2_add_physical_node_ref(): Node at 0xe744(2), size 
0x2c
[42949495.620000] [JFFS2 DBG] (94) jffs2_add_fd_to_list: add dirent 
"aaa", ino #2
[42949495.620000] jffs2_complete_reservation()
[42949495.620000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949495.620000] jffs2_create: Created ino #2 with mode 100644, nlink 
1(1). nrpages 0
[42949495.640000] jffs2_prepare_write()
[42949495.640000] jffs2_read_inode_range: ino #2, range 
0x00000000-0x00001000
[42949495.640000] Filling non-frag hole from 0-4096
[42949495.640000] end prepare_write(). pg->flags 209
[42949495.640000] jffs2_commit_write(): ino #2, page at 0x0, range 0-4, 
flags 209
[42949495.640000] jffs2_write_inode_range(): Ino #2, ofs 0x0, len 0x4
[42949495.640000] jffs2_reserve_space(): Requested 0xc4 bytes
[42949495.640000] jffs2_reserve_space(): alloc sem got
[42949495.640000] jffs2_do_reserve_space(): Giving 0x2090 bytes at 0xe770
[42949495.640000] jffs2_add_physical_node_ref(): Node at 0xe770(2), size 
0x48
[42949495.640000] jffs2_write_dnode wrote node at 0x0000e770(2) with 
dsize 0x4, csize 0x4, node_crc 0x33de5e85, data_crc 0x56bc8289, totlen 
0x00000048
[42949495.640000] [JFFS2 DBG] (105) jffs2_add_full_dnode_to_inode: 
adding node 0x00-0x04 @0x0000e770 on flash, newfrag *c0eac3b8
[42949495.640000] Obsoleting node at 0x0000e700 of len 0x44: <7>Wasting
[42949495.640000] jffs2_complete_reservation()
[42949495.640000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949495.640000] increasing writtenlen by 4
[42949495.640000] jffs2_commit_write() returning 4
[42949498.310000] jffs2_write_super()
[42949498.310000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949498.310000] jffs2_erase_pending_blocks completed
[42949498.310000] jffs2_flush_wbuf_gc() called for ino #0...
[42949498.310000] jffs2_flush_wbuf_gc() calls gc pass
[42949498.310000] jffs2: No clean, dirty _or_ erasable blocks to GC 
from! Where are they all?
[42949498.310000] jffs2: Couldn't find erase block to garbage collect!
[42949498.320000] PM: dataflash_write: 1022208 .. 1030656
[42949498.460000] jffs2_flush_wbuf_gc() ends...

[root@armbox /root]$echo aaa > /conf/aaa
[root@armbox /root]$[42949518.460000] jffs2: No clean, dirty _or_ 
erasable blocks to GC from! Where are they all?
[42949518.460000] jffs2: Couldn't find erase block to garbage collect!
[42949518.470000] PM: dataflash_write: 1022208 .. 1030656

[root@armbox /root]$dmesg -c
[42949515.170000] jffs2_setattr(): ino #2
[42949515.170000] jffs2_reserve_space(): Requested 0x44 bytes
[42949515.170000] jffs2_reserve_space(): alloc sem got
[42949515.170000] jffs2_do_reserve_space(): Giving 0x2048 bytes at 0xe7b8
[42949515.170000] jffs2_add_physical_node_ref(): Node at 0xe7b8(2), size 
0x44
[42949515.170000] jffs2_write_dnode wrote node at 0x0000e7b8(2) with 
dsize 0x0, csize 0x0, node_crc 0x247c3272, data_crc 0x00000000, totlen 
0x00000044
[42949515.170000] [JFFS2 DBG] (94) jffs2_truncate_fragtree: truncating 
fragtree to 0x00000000 bytes
[42949515.170000] Obsoleting node at 0x0000e770 of len 0x48: <7>Wasting
[42949515.170000] jffs2_complete_reservation()
[42949515.170000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949515.180000] jffs2_prepare_write()
[42949515.180000] jffs2_read_inode_range: ino #2, range 
0x00000000-0x00001000
[42949515.190000] Filling non-frag hole from 0-4096
[42949515.190000] end prepare_write(). pg->flags 209
[42949515.190000] jffs2_commit_write(): ino #2, page at 0x0, range 0-4, 
flags 209
[42949515.190000] jffs2_write_inode_range(): Ino #2, ofs 0x0, len 0x4
[42949515.190000] jffs2_reserve_space(): Requested 0xc4 bytes
[42949515.190000] jffs2_reserve_space(): alloc sem got
[42949515.190000] jffs2_do_reserve_space(): Giving 0x2004 bytes at 0xe7fc
[42949515.190000] jffs2_add_physical_node_ref(): Node at 0xe7fc(2), size 
0x48
[42949515.190000] jffs2_write_dnode wrote node at 0x0000e7fc(2) with 
dsize 0x4, csize 0x4, node_crc 0x8f17e80f, data_crc 0x56bc8289, totlen 
0x00000048
[42949515.190000] [JFFS2 DBG] (107) jffs2_add_full_dnode_to_inode: 
adding node 0x00-0x04 @0x0000e7fc on flash, newfrag *c0eac3b8
[42949515.190000] Obsoleting node at 0x0000e7b8 of len 0x44: <7>Wasting
[42949515.190000] jffs2_complete_reservation()
[42949515.190000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949515.190000] increasing writtenlen by 4
[42949515.190000] jffs2_commit_write() returning 4
[42949518.460000] jffs2_write_super()
[42949518.460000] jffs2_thread_should_wake(): nr_free_blocks 15, 
nr_erasing_blocks 0, dirty_size 0x0: no
[42949518.460000] jffs2_erase_pending_blocks completed
[42949518.460000] jffs2_flush_wbuf_gc() called for ino #0...
[42949518.460000] jffs2_flush_wbuf_gc() calls gc pass
[42949518.460000] jffs2: No clean, dirty _or_ erasable blocks to GC 
from! Where are they all?
[42949518.460000] jffs2: Couldn't find erase block to garbage collect!
[42949518.470000] PM: dataflash_write: 1022208 .. 1030656
[42949518.610000] jffs2_flush_wbuf_gc() ends...


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
