From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Wed, 12 Mar 2003 00:52:10 +0900
Subject: Memory leak
References: <000e01c2e65b$71ca7020$210486da@ybb> <200303092010.44211.tglx@linutronix.de> <000f01c2e691$1a319a60$210486da@ybb> <200303101553.09156.tglx@linutronix.de> <1047305682.23941.44.camel@passion.cambridge.redhat.com> <002601c2e71c$7abe7d40$210486da@ybb> <1047312153.23941.157.camel@passion.cambridge.redhat.com> <004901c2e721$d30125c0$210486da@ybb> <1047315863.23941.161.camel@passion.cambridge.redhat.com>
Message-ID: <000601c2e7e6$2d0e4740$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> Aha, that's good. You're saying they _do_ return an error?

They actually stall in BUG() dumping unfreed addresses.
 
> Please compile with CONFIG_JFFS2_FS_DEBUG=1 and capture all the messages
> over a serial console. Add a printk to the allocation and free routines
> for both the full_dnode and node_frag structures to print the address
> which is allocated/freed. Then we can compare and find where structures
> are allocated but not freed.

I attached message at the end.
I added "##m" for my original line.
No dnode resoure (ino #2) is freed during unmount.
 
> What exactly do you need to do to trigger this? Is it something special
> about the particular file system image on your device?

I think that dnode resouce need not be aquired during mount for upper fs layer.
It just wastes resource. 
This is not in the message, but if you read a file written before mount, 
dnode resource is newly aquired aside from that of aquired during mount(This could be dangerous).
Dnode resource aquired during read operation is freed when unmounting.

And if you write a file and unmount, no memory leak occur for the file.

Gc may need the dnode resouce when mounting, so in that case, some solution should be considered.

BR.

# cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  58232832 40869888 17362944        0   249856 36564992
Swap:        0        0        0
MemTotal:        56868 kB
MemFree:         16956 kB
MemShared:           0 kB
Buffers:           244 kB
Cached:          35708 kB
SwapCached:          0 kB
Active:           1684 kB
Inactive:        35020 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:        56868 kB
LowFree:         16956 kB
SwapTotal:           0 kB
SwapFree:            0 kB
# 
# mount -t jffs2 /dev/mtdblock1 /mnt/nand1
jffs2: read_super for device 1f:01
jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) instead
Allocating readbuf of 32768 bytes
jffs2_scan_eraseblock(): Scanning block at 0x0
jffs2_scan_eraseblock(): Scanning block at 0x8000
jffs2_scan_eraseblock(): Scanning block at 0x10000
jffs2_scan_eraseblock(): Scanning block at 0x18000
jffs2_scan_eraseblock(): Scanning block at 0x20000
jffs2_scan_eraseblock(): Scanning block at 0x28000
jffs2_scan_inode_node(): Node at 0x00028000
Allocated inocache at 81ec8278
Node is ino #2, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00028044
Allocated inocache at 81ec8260
jffs2_add_fd_to_list( 83e92600, 81ec8260 (->00000000))
jffs2_scan_inode_node(): Node at 0x00028070
Node is ino #2, version 2. Range 0x0-0x1000
Fewer than %zd bytes (node header) left to end of buf. Reading 0xc at 0x000078a0
jffs2_scan_inode_node(): Node at 0x00028760
Node is ino #2, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x00028e48
Node is ino #2, version 4. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x000293dc
Node is ino #2, version 5. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x00029a54
Node is ino #2, version 6. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x0002a1bc
Node is ino #2, version 7. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x0002a984
Node is ino #2, version 8. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0002b0fc
Node is ino #2, version 9. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x0002b7d8
Node is ino #2, version 10. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0002bdfc
Node is ino #2, version 11. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0002c4e4
Node is ino #2, version 12. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x0002ca18
Node is ino #2, version 13. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x0002d310
Node is ino #2, version 14. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0002dc18
Node is ino #2, version 15. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0002e344
Node is ino #2, version 16. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x0002eba0
Node is ino #2, version 17. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x0002f3e0
Node is ino #2, version 18. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x0002f7dc
Node is ino #2, version 19. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x0002fbf8
Node is ino #2, version 20. Range 0x12000-0x124a8
Block at 0x00028000: free 0x00000000, dirty 0x000001b0, unchecked 0x00007e24, used 0x0000002c
jffs2_scan_eraseblock(): Scanning block at 0x30000
Scanned flash completely
jffs2_dump_block_lists:
flash_size: 0003aa00
used_size: 0000002c
dirty_size: 000001b0
wasted_size: 00000000
unchecked_size: 00007e24
free_size: 00032a00
erasing_size: 00000000
bad_size: 00000000
sector_size: 00008000
jffs2_reserved_blocks size: 00028000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: 00028000 (used 0000002c, dirty 000001b0, wasted 00000000, unchecked 00007e24, free 00000000)
Contains 1 blocks with total dirty size 432, average dirty size: 432
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 00030000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00020000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00018000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00010000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00008000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00000000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
bad_list: empty
bad_used_list: empty
Pass 1: ino #1
jffs2_build_inode building inode #1
Increased nlink for child "sed" (ino #2)
Pass 1: ino #2
jffs2_build_inode building inode #2
Pass 1 complete
jffs2_dump_block_lists:
flash_size: 0003aa00
used_size: 0000002c
dirty_size: 000001b0
wasted_size: 00000000
unchecked_size: 00007e24
free_size: 00032a00
erasing_size: 00000000
bad_size: 00000000
sector_size: 00008000
jffs2_reserved_blocks size: 00028000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: 00028000 (used 0000002c, dirty 000001b0, wasted 00000000, unchecked 00007e24, free 00000000)
Contains 1 blocks with total dirty size 432, average dirty size: 432
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 00030000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00020000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00018000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00010000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00008000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00000000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
bad_list: empty
bad_used_list: empty
Pass 2 (re)starting
Pass 2: ino #1, nlink 1, ic 81ec8260, nodes 81ed7470
Pass 2: ino #2, nlink 1, ic 81ec8278, nodes 81ed7340
jffs2_dump_block_lists:
flash_size: 0003aa00
used_size: 0000002c
dirty_size: 000001b0
wasted_size: 00000000
unchecked_size: 00007e24
free_size: 00032a00
erasing_size: 00000000
bad_size: 00000000
sector_size: 00008000
jffs2_reserved_blocks size: 00028000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: 00028000 (used 0000002c, dirty 000001b0, wasted 00000000, unchecked 00007e24, free 00000000)
Contains 1 blocks with total dirty size 432, average dirty size: 432
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 00030000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00020000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00018000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00010000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00008000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00000000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
bad_list: empty
bad_used_list: empty
Pass 2 complete
Pass 3: ino #1, ic 81ec8260, nodes 81ed7470
Pass 3: ino #2, ic 81ec8278, nodes 81ed7340
Pass 3 complete
jffs2_dump_block_lists:
flash_size: 0003aa00
used_size: 0000002c
dirty_size: 000001b0
wasted_size: 00000000
unchecked_size: 00007e24
free_size: 00032a00
erasing_size: 00000000
bad_size: 00000000
sector_size: 00008000
jffs2_reserved_blocks size: 00028000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: 00028000 (used 0000002c, dirty 000001b0, wasted 00000000, unchecked 00007e24, free 00000000)
Contains 1 blocks with total dirty size 432, average dirty size: 432
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 00030000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00020000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00018000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00010000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00008000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
free_list: 00000000 (used 00000000, dirty 00000000, wasted 00000000, unchecked 00000000, free 00008000)
bad_list: empty
bad_used_list: empty
Not rotating empty clean_list
Not rotating empty very_dirty_list
Rotating dirty_list by 0
Erase block at front of dirty_list is at 00028000
Not rotating empty erasable_list
Not rotating empty erase_pending_list
Rotating free_list by 1
Erase block at front of free_list is at 00018000
jffs2_do_fill_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
jffs2_do_read_inode_internal(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
Node at 00028044 (2) is a dirent node
Adding fd "sed", ino #2
jffs2_add_fd_to_list( 83e92600, 81ec7bdc (->00000000))
jffs2_read_inode() returning
jffs2_do_fill_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 207
thread_should_wake(): unchecked_size 32292, checked_ino #0
jffs2_garbage_collect_thread(): pass
Skipping ino #1 already checked
jffs2_garbage_collect_pass() triggering inode scan of ino#2
jffs2_do_read_inode_internal(): ino #2 nlink is 1
jffs2_get_inode_nodes(): ino #2
# Node at 0002fbf8 (0) is a data node
version 20, highest_version now 20
Marking node at 0x0002fbf8 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63b0 
dnode @0002fbf8: ver 20, offset 12000, dsize 04a8
Node at 0002f7dc (0) is a data node
version 19, highest_version now 20
Marking node at 0x0002f7dc REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63f0 
dnode @0002f7dc: ver 19, offset 11000, dsize 1000
Node at 0002f3e0 (0) is a data node
version 18, highest_version now 20
Marking node at 0x0002f3e0 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6410 
dnode @0002f3e0: ver 18, offset 10000, dsize 1000
Node at 0002eba0 (0) is a data node
version 17, highest_version now 20
Marking node at 0x0002eba0 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6430 
dnode @0002eba0: ver 17, offset f000, dsize 1000
Node at 0002e344 (0) is a data node
version 16, highest_version now 20
Marking node at 0x0002e344 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6450 
dnode @0002e344: ver 16, offset e000, dsize 1000
Node at 0002dc18 (0) is a data node
version 15, highest_version now 20
Marking node at 0x0002dc18 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6460 
dnode @0002dc18: ver 15, offset d000, dsize 1000
Node at 0002d310 (0) is a data node
version 14, highest_version now 20
Marking node at 0x0002d310 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6440 
dnode @0002d310: ver 14, offset c000, dsize 1000
Node at 0002ca18 (0) is a data node
version 13, highest_version now 20
Marking node at 0x0002ca18 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6420 
dnode @0002ca18: ver 13, offset b000, dsize 1000
Node at 0002c4e4 (0) is a data node
version 12, highest_version now 20
Marking node at 0x0002c4e4 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6400 
dnode @0002c4e4: ver 12, offset a000, dsize 1000
Node at 0002bdfc (0) is a data node
version 11, highest_version now 20
Marking node at 0x0002bdfc REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63d0 
dnode @0002bdfc: ver 11, offset 9000, dsize 1000
Node at 0002b7d8 (0) is a data node
version 10, highest_version now 20
Marking node at 0x0002b7d8 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63e0 
dnode @0002b7d8: ver 10, offset 8000, dsize 1000
Node at 0002b0fc (0) is a data node
version 9, highest_version now 20
Marking node at 0x0002b0fc REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63c0 
dnode @0002b0fc: ver 9, offset 7000, dsize 1000
Node at 0002a984 (0) is a data node
version 8, highest_version now 20
Marking node at 0x0002a984 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6370 
dnode @0002a984: ver 8, offset 6000, dsize 1000
Node at 0002a1bc (0) is a data node
version 7, highest_version now 20
Marking node at 0x0002a1bc REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6390 
dnode @0002a1bc: ver 7, offset 5000, dsize 1000
Node at 00029a54 (0) is a data node
version 6, highest_version now 20
Marking node at 0x00029a54 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed63a0 
dnode @00029a54: ver 6, offset 4000, dsize 1000
Node at 000293dc (0) is a data node
version 5, highest_version now 20
Marking node at 0x000293dc REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6380 
dnode @000293dc: ver 5, offset 3000, dsize 1000
Node at 00028e48 (0) is a data node
version 4, highest_version now 20
Marking node at 0x00028e48 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6340 
dnode @00028e48: ver 4, offset 2000, dsize 1000
Node at 00028760 (0) is a data node
version 3, highest_version now 20
Marking node at 0x00028760 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6360 
dnode @00028760: ver 3, offset 1000, dsize 1000
Node at 00028070 (0) is a data node
version 2, highest_version now 20
Marking node at 0x00028070 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6350 
dnode @00028070: ver 2, offset 0000, dsize 1000
Node at 00028000 (0) is a data node
version 1, highest_version now 20
Marking node at 0x00028000 REF_PRISTINE
##m jffs2_alloc_full_dnode at 0x81ed6470 
dnode @00028000: ver 1, offset 0000, dsize 0000
metadata @00028000: ver 1
Obsoleting old metadata at 0x00028000
Obsoleting node at 0x00028000 of len 44: Dirtying
Eraseblock at 0x00028000 not moved anywhere. (free 0x00000000, dirty 0x000001f4, used 0x00007e0c)
##m jffs2_free_full_dnode at 0x81ed6470 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6350)
##m jffs2_alloc_node_frag at 0x81ebf2e4 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6360)
##m jffs2_alloc_node_frag at 0x81ebf354 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6340)
##m jffs2_alloc_node_frag at 0x81ebf38c 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6380)
##m jffs2_alloc_node_frag at 0x81ebf3c4 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63a0)
##m jffs2_alloc_node_frag at 0x81ebf3fc 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6390)
##m jffs2_alloc_node_frag at 0x81ebf418 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6370)
##m jffs2_alloc_node_frag at 0x81ebf3e0 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63c0)
##m jffs2_alloc_node_frag at 0x81ebf3a8 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63e0)
##m jffs2_alloc_node_frag at 0x81ebf370 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63d0)
##m jffs2_alloc_node_frag at 0x81ebf31c 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6400)
##m jffs2_alloc_node_frag at 0x81ebf338 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6420)
##m jffs2_alloc_node_frag at 0x81ebf300 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6440)
##m jffs2_alloc_node_frag at 0x81ebf274 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6460)
##m jffs2_alloc_node_frag at 0x81ebf2ac 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6450)
##m jffs2_alloc_node_frag at 0x81ebf2c8 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6430)
##m jffs2_alloc_node_frag at 0x81ebf290 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed6410)
##m jffs2_alloc_node_frag at 0x81ebf23c 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63f0)
##m jffs2_alloc_node_frag at 0x81ebf258 
jffs2_add_full_dnode_to_inode(ino #2, f 80b6ff60, fn 81ed63b0)
##m jffs2_alloc_node_frag at 0x81ebf220 
Truncating fraglist to 0x000124a8 bytes
Truncating frag 0x00012000-0x000124a8
thread_should_wake(): nr_free_blocks 6, nr_erasing_blocks 0, dirty_size 0x1f4: no
jffs2_garbage_collect_thread sleeping...

# 
# umount /dev/mtdblock1
jffs2_clear_inode(): ino #1 mode 40755
jffs2: Killing GC task 207
jffs2_garbage_collect_thread(): SIGKILL received.
Freeing inocache at 81ec8260
Freeing inocache at 81ec8278
jffs2_put_super returning
# 
# cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  58232832 40878080 17354752        0   249856 36564992
Swap:        0        0        0
MemTotal:        56868 kB
MemFree:         16948 kB
MemShared:           0 kB
Buffers:           244 kB
Cached:          35708 kB
SwapCached:          0 kB
Active:           1684 kB
Inactive:        35020 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:        56868 kB
LowFree:         16948 kB
SwapTotal:           0 kB
SwapFree:            0 kB
# 
# 
#
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
