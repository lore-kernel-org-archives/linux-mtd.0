Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JVm5-0007LY-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 09:24:58 +0000
Received: from localhost (saturn@localhost)
	by structure.biochem.nchu.edu.tw (8.11.6/8.11.6) with ESMTP id gB3M9rs05037
	for <linux-mtd@lists.infradead.org>; Wed, 4 Dec 2002 06:09:53 +0800
Date: Wed, 4 Dec 2002 06:09:53 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: Write error on the nand flash !
Message-ID: <Pine.LNX.4.44.0212040542320.4326-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,
If I copy the larger file to nand flash, the system will tell me some 
wrong ? These is my error log..
After mount partition, it printed.
---------
/root> mount -t jffs2 /dev/mtdblock/6 /home
mtdblock_open
ok
jffs2: read_super for device 1f:06
erasesize is 8192 bytes
sector_size is 8192 bytes
c->wbuf_pagesize(mtd->oobblock) is 512 bytes
Allocating readbuf of 8192 bytes
jffs2_scan_eraseblock(): Scanning block at 0x0
(nand_cleanmarker)offset is 0x0
(nand_cleanmarker)oob_size is 16 byte
(nand_cleanmarker) sector_size is 8192 bytes
(nand_cleanmarker) erasesize is 8192 bytes
nand_read_oob: from = 0x00000000, len = 32
jffs2_check_nand_cleanmarker(): Bad block at 00000000
jffs_check_nand_cleanmarker returned 2
JFFS2: Block at 0x00000000 is bad
jffs2_scan_eraseblock(): Scanning block at 0x2000
(nand_cleanmarker)offset is 0x2000
(nand_cleanmarker)oob_size is 16 byte
(nand_cleanmarker) sector_size is 8192 bytes
(nand_cleanmarker) erasesize is 8192 bytes
nand_read_oob: from = 0x00002000, len = 32
jffs_check_nand_cleanmarker returned 0
nand_read_ecc: from = 0x00002000, len = 1024
Read 0x400 bytes from 0x00002000 into buf
000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
nand_read_oob: from = 0x00002000, len = 64
jffs2_check_oob_empty returned 0
jffs2_scan_eraseblock(): Scanning block at 0x4000
(nand_cleanmarker)offset is 0x4000
(nand_cleanmarker)oob_size is 16 byte
(nand_cleanmarker) sector_size is 8192 bytes
(nand_cleanmarker) erasesize is 8192 bytes
nand_read_oob: from = 0x00004000, len = 32
jffs_check_nand_cleanmarker returned 0
nand_read_ecc: from = 0x00004000, len = 1024
Read 0x400 bytes from 0x00004000 into buf
000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
nand_read_oob: from = 0x00004000, len = 64
jffs2_check_oob_empty returned 0
jffs2_scan_eraseblock(): Scanning block at 0x6000
(nand_cleanmarker)offset is 0x6000
(nand_cleanmarker)oob_size is 16 byte
(nand_cleanmarker) sector_size is 8192 bytes
(nand_cleanmarker) erasesize is 8192 bytes
nand_read_oob: from = 0x00006000, len = 32
jffs_check_nand_cleanmarker returned 0
nand_read_ecc: from = 0x00006000, len = 1024
Read 0x400 bytes from 0x00006000 into buf
000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
nand_read_oob: from = 0x00006000, len = 64
jffs2_check_oob_empty returned 0
jffs2_scan_eraseblock(): Scanning block at 0x8000
(nand_cleanmarker)offset is 0x8000
(nand_cleanmarker)oob_size is 16 byte
(nand_cleanmarker) sector_size is 8192 bytes
(nand_cleanmarker) erasesize is 8192 bytes
nand_read_oob: from = 0x00008000, len = 32
jffs_check_nand_cleanmarker returned 0
nand_read_ecc: from = 0x00008000, len = 1024
Read 0x400 bytes from 0x00008000 into buf
000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

snip-----------------------------------

free_list: 00004000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 00002000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
bad_list: 00000000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
bad_used_list: empty
Not rotating empty clean_list
Not rotating empty very_dirty_list
Not rotating empty dirty_list
Not rotating empty erasable_list
Not rotating empty erase_pending_list
Rotating free_list by 0
Erase block at front of free_list is at 001fc000
jffs2_do_fill_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
jffs2_do_read_inode(): getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_do_read_inode(): Got inocache at 00000000
Allocated inocache at c0e2b260
jffs2_do_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add c0e2b260 (ino #1)
jffs2_do_read_inode(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
jffs2_read_inode() returning
jffs2_do_fill_super(): d_alloc_root()
thread_should_wake(): nr_free_blocks 255, nr_erasing_blocks 0, dirty_size 
0x0: no
jffs2_garbage_collect_thread sleeping...
JFFS2: Garbage collect thread is pid 51

================================================
After executed df, it printed.
===============================================
/root> df
Filesystem           1k-blocks      Used Available Use% Mounted on
jffs2_dump_block_lists:
flash_size: 00200000
used_size: 00000000
dirty_size: 00000000
wasted_size: 00000000
unchecked_size: 00000000
free_size: 001fe000
erasing_size: 00000000
bad_size: 00002000
sector_size: 00002000
jffs2_reserved_blocks size: 0000a000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: empty
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 001fc000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 001fa000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 001f8000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 001f6000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 001f4000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)
free_list: 001f2000 (used 00000000, dirty 00000000, wasted 00000000, 
unchecked 00000000, free 00002000)

snip------------------------------


=====================================
After executed cp, it printed.
=====================================
/root>ls -al /etc/fstab
mtdblock: read on "root_fs" at 0xfe000, size 0x1000
mtdblock: read on "root_fs" at 0xff000, size 0x1000
-rwxr--r--   1 root     root          211 Jan  1 00:00 /etc/fstab
/root>cp /etc/fstab /home
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 1, mode 0x81e4
Allocated inocache at c0e2b278
jffs2_do_new_inode(): Assigned ino# 2
jffs2_add_ino_cache: Add c0e2b278 (ino #2)
blocksneeded is 5 blocks
minsize is 68 bytes
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
(nodemgmt)offset is 0x1fc000
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x1fc000
jffs2_do_create(): reserved 0x2000 bytes
datalen is 0
flash_ofs is 1fc000
nand_read_ecc: from = 0x001fc000, len = 16
datalen is 0
flash_ofs is 1fc000
cnt is 1
jffs2_flash_writev: mod wbuf_timer
retlen is 44
jffs2_add_physical_node_ref(): Node at 0x1fc000, size 0x44
jffs2_write_dnode wrote node at 0x001fc000 with dsize 0x0, csize 0x0, 
node_crc 0xc23ec532, data_crc 0x00000000, 
totlen 0x00000044
jffs2_do_create created file with mode 0x81e4
jffs2_write_dirent(ino #1, name at *0xc0b0991c "fstab"->ino #2, name_crc 
0xe35a1781)
nand_read_ecc: from = 0x001fc044, len = 16
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x1fc044, size 0x30
jffs2_add_fd_to_list( c01cacc0, c0b08cc0 (->00000000))
Dirent "fstab" (hash 0x117ee576, ino #2
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 254, nr_erasing_blocks 0, dirty_size 
0x0: no
jffs2_create: Created ino #2 with mode 100744, nlink 1(1). nrpages 0
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #2, page at offset 0x0
jffs2_read_inode_range: ino #2, range 0x00000000-0x00001000
jffs2_lookup_node_frag(c0aeb738, 0)
Returning NULL, empty fragtree
jffs2_read_inode_range: offset 0, end 4096
Filling non-frag hole from 0-4096
readpage finished
end prepare_write(). pg->flags 2049
jffs2_commit_write(): ino #2, page at 0x0, range 0-211, flags 2049
jffs2_write_inode_range(): Ino #2, ofs 0x0, len 0xd3
jffs2_commit_write() loop: 0xd3 to write to 0x0
blocksneeded is 5 blocks
minsize is 196 bytes
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
(nodemgmt)offset is 0x1fc000
jffs2_do_reserve_space(): Giving 0x1f8c bytes at 0x1fc074
calling deflate with avail_in 199, avail_out 199
deflate returned with avail_in 0, avail_out 74, total_in 199, total_out 
125
calling deflate with avail_in 12, avail_out 74
deflate returned with avail_in 0, avail_out 64, total_in 211, total_out 
135
zlib compressed 211 bytes into 142
datalen is 8e
flash_ofs is 1fc074
nand_read_ecc: from = 0x001fc074, len = 16
datalen is 8e
flash_ofs is 1fc074
cnt is 2
jffs2_flash_writev: mod wbuf_timer
retlen is d2
jffs2_add_physical_node_ref(): Node at 0x1fc074, size 0xd4
jffs2_write_dnode wrote node at 0x001fc074 with dsize 0xd3, csize 0x8e, 
node_crc 0xd3a1b5f3, data_crc 0x38c7ea68
, totlen 0x000000d2
jffs2_add_full_dnode_to_inode(ino #2, f c0aeb720, fn c0ad6350)
adding node 0000-00d3 @0x001fc074 on flash, newfrag *c0ae2220
jffs2_lookup_node_frag(c0aeb738, 0)
Returning NULL, empty fragtree
j_a_f_d_t_f: Lookup gave no frag
Adding new frag (c0ae2220) at root of tree
frag 0000-00d3: 0x001fc074(3) on flash (*c0ae2220). left (00000000), right 
(00000000), parent (00000000)
metadata at 0x001fc000
Obsoleting node at 0x001fc000 of len 44: Wasting
Not moving nextblock 0x001fc000 to dirty/erase_pending list
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 254, nr_erasing_blocks 0, dirty_size 
0x0: no
increasing writtenlen by 211
jffs2_commit_write() returning 211
/root>jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
nand_write_ecc: to = 0x001fc000, len = 512
nand_write_page: Failed write verify, page 0x00000fe0 
<2>jffs2_flush_wbuf(): Write failed with -5

=================================
then ls copied file(fstab)
=================================
/root>ls -al /home/fstab
-rwxr--r--   1 root     root          211 Jan  1 00:35 /home/fstab
/root>

================================
Yes, I got it. It was copied.
Next test, I will copy a larger file.
===============================
/root> ls -al /bin/erase
-rwxr-xr-x   1 root     root        13530 Jan  1 00:00 /bin/erase
/root>cp /bin/erase /home
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 1, mode 0x81ed
Allocated inocache at c0e2b290
jffs2_do_new_inode(): Assigned ino# 3
jffs2_add_ino_cache: Add c0e2b290 (ino #3)
blocksneeded is 5 blocks
minsize is 68 bytes
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
(nodemgmt)offset is 0x1fc000
jffs2_do_reserve_space(): Giving 0x1eb8 bytes at 0x1fc148
jffs2_do_create(): reserved 0x1eb8 bytes
datalen is 0
flash_ofs is 1fc148
nand_read_ecc: from = 0x001fc148, len = 16
ARGH. About to write node to 0x001fc148 on flash, but there are data 
already there:
0x001fc148: 85 19 04 20 b8 00 00 00 c4 59 0b 6b ff ff ff ff
datalen is 0
flash_ofs is 1fc148
cnt is 1
jffs2_flash_writev: mod wbuf_timer
retlen is 44
jffs2_add_physical_node_ref(): Node at 0x1fc148, size 0x44
jffs2_write_dnode wrote node at 0x001fc148 with dsize 0x0, csize 0x0, 
node_crc 0x8717fff9, data_crc 0x00000000, 
totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #1, name at *0xc0b0999c "erase"->ino #3, name_crc 
0xe03b8edf)
nand_read_ecc: from = 0x001fc18c, len = 16
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x1fc18c, size 0x30
jffs2_add_fd_to_list( c01cace0, c0b08cc0 (->c01cacc0))
Dirent "erase" (hash 0x114e599c, ino #3
Dirent "fstab" (hash 0x117ee576, ino #2
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 254, nr_erasing_blocks 0, dirty_size 
0x0: no
jffs2_create: Created ino #3 with mode 100755, nlink 1(1). nrpages 0
mtdblock: read on "root_fs" at 0x163000, size 0x1000
mtdblock: read on "root_fs" at 0x164000, size 0x1000
jffs2_prepare_write()
end prepare_write(). pg->flags 41
jffs2_commit_write(): ino #3, page at 0x0, range 0-4096, flags 2041
jffs2_write_inode_range(): Ino #3, ofs 0x0, len 0x1000
jffs2_commit_write() loop: 0x1000 to write to 0x0
blocksneeded is 5 blocks
minsize is 196 bytes
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
(nodemgmt)offset is 0x1fc000
jffs2_do_reserve_space(): Giving 0x1e44 bytes at 0x1fc1bc
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1922, total_in 4084, total_out 
2162
calling deflate with avail_in 12, avail_out 1922
deflate returned with avail_in 0, avail_out 1913, total_in 4096, total_out 
2171
zlib compressed 4096 bytes into 2177
datalen is 881
flash_ofs is 1fc1bc
nand_read_ecc: from = 0x001fc1bc, len = 16
datalen is 881
flash_ofs is 1fc1bc
cnt is 2
nand_write_ecc: to = 0x001fc000, len = 512
nand_write_page: Failed write verify, page 0x00000fe0 
<2>jffs2_flush_wbuf(): Write failed with -5
jffs2_flush_wbuf() called from jffs2_flash_writev() failed -5
retlen is 0
Write of 2245 bytes at 0x001fc1bc failed. returned -5, retlen 0
Not marking the space at 0x001fc1bc as dirty because the flash driver 
returned retlen zero
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 254, nr_erasing_blocks 0, dirty_size 
0x0: no
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write() returning -5
cp: /home/erase: Input/output error

====================================================
After copying, I list it. Nothing copied.
=====================================================

/root>ls -al /home/erase
-rwxr-xr-x   1 root     root            0 Jan  1 00:39 /home/erase
/root>

====================================================
After unmount /home, system printed.
=================================================
/root>umount /home
jffs2_clear_inode(): ino #2 mode 100744
jffs2_kill_fragtree: frag at 0x0-0xd3: node c0ad6350, frags 1--
jffs2_cl 56
jffs2_garbage_collect_thread(): SIGKILL received.
nand_write_ecc: to = 0x001fc000, len = 512
nand_write_page: Failed write verify, page 0x00000fe0 
<2>jffs2_flush_wbuf(): Write failed with -5
jffs2_free_ino_caches: Freeing ino #1 at c0e2b260
Freeing inocache at c0e2b260
jffs2_free_ino_caches: Freeing ino #2 at c0e2b278
Freeing inocache at c0e2b278
jffs2_free_ino_caches: Freeing ino #3 at c0e2b290
Freeing inocache at c0e2b290
nand_sync: called
jffs2_put_super returning
mtdblock_release
nand_sync: called
ok
/root>

------------------------------------------------------
That's all. Can somebody tell me what's happened ?
How do I fix it ?

regards,

Brian
