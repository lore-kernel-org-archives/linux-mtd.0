Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHwUg-0005OC-OS
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 12:18:26 +0000
Received: by pbcun4 with SMTP id un4so1274068pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2012 05:17:48 -0700 (PDT)
Message-ID: <4F85764C.7070408@gmail.com>
Date: Wed, 11 Apr 2012 20:17:16 +0800
From: Mark <xiaoming1981.zhang@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS mount failure upon power off
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are doing fs stability tests and experience an issue in case of power
cut. I have enabled UBIFS debugging, all logs and info listed below. I
get about 5%~10% possibilities to reproduce it. Any suggestion?

Thank you very much.



# uname -a
UBIFS DBG (pid 743): ubifs_lookup: 'uname' in dir ino 152
UBIFS DBG (pid 743): ubifs_lookup_level0: search key (152, direntry,
0x13b7366d)
UBIFS DBG (pid 743): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 743): ubifs_lookup: not found
Linux (none) 2.6.31-3.3 #10 SMP Wed Apr 11 09:18:13 CST 2012 mips GNU/Linux


# ls -l /usr/local/platform/f2
-rw-rw-r--    1 506      506        1048576 Apr 11  2012
/usr/local/hplatform/f2

# xxd f2
0000000: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000010: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000020: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000030: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
......


# mount
rootfs on / type rootfs (rw)
...
ubi12:platform on /usr/local/platform type ubifs (rw,relatime)
ubi13_0 on /usr/local/appdata type ubifs (rw,sync,relatime)
ubi14_0 on /usr/local/.appmid type ubifs (rw,relatime)


# echo 7 > /proc/sys/kernel/printk
# while :; do cp -a /usr/local/platform/f2 /usr/local/appdata/ && sync; done
UBIFS DBG (pid 757): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 112:4096, direntry node,
length 59, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 112:4096, direntry node, length 59
UBIFS DBG (pid 757): ubifs_iget: inode 223
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:71424, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:71424, level 2, 8 branch
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:69504, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:69504, level 1, 8 branch
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:69120, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:69120, level 0, 8 branch
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 112:6144, inode node,
length 160, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 112:6144, inode node, length 160
UBIFS DBG (pid 757): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 757): ubifs_iget: inode 79
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, inode)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 14:45056, inode node,
length 160, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 14:45056, inode node, length 160
UBIFS DBG (pid 757): ubifs_unlink: dent 'f2' from ino 79 (nlink 1) in
dir ino 1
UBIFS DBG (pid 757): ubifs_jnl_update: ino 79, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 757): ubifs_add_orphan: ino 79
UBIFS DBG (pid 757): write_head: jhead 1, LEB 14:51200, len 384
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 14:51200
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free 75392, dirty 50880,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
50880, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 14:51200, 384 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75392, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free 73728, dirty 52544,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75392, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_tnc_remove_nm: f2, key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85712, flags 48
UBIFS DBG (pid 757): ubifs_change_lp: LEB 12, free -2147483647, dirty
85840, flags 48
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85712, flags 48
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 1
UBIFS DBG (pid 757): ubifs_tnc_remove_nm: rc returned 1, znode 85950180, n 1
UBIFS DBG (pid 757): tnc_delete: deleting (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126752, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 13, free -2147483647, dirty
126811, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126752, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52544, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free -2147483647, dirty
52603, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52544, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 14:51264, len 160, key (79, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (79, inode)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85840, flags 48
UBIFS DBG (pid 757): ubifs_change_lp: LEB 12, free -2147483647, dirty
86028, flags 48
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85840, flags 48
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free -2147483647, dirty
52768, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52608, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 14:51424, len 160, key (1, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126816, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 13, free -2147483647, dirty
126976, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126816, flags 1
UBIFS DBG (pid 757): ubifs_delete_inode: inode 79, mode 0x81a4
UBIFS DBG (pid 757): ubifs_tnc_remove_ino: ino 79
UBIFS DBG (pid 757): ubifs_tnc_next_ent: (lowest) (79, xentry, 0x000000)
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, xentry, 0x000000)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 0, lvl 0, n 5
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, inode)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121408, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121500, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121408, flags 1
UBIFS DBG (pid 757): ubifs_tnc_remove_range: removing (79, data, 0)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121504, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121596, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121504, flags 1
UBIFS DBG (pid 757): ubifs_tnc_remove_range: removing (79, data, 1)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121600, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121692, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121600, flags 1
UBIFS DBG (pid 757): u6:83968, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:83968
UBIFookup_dirty: LEB: ubifs_change_lp: LEB 16, free 42848, dirty 83808,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 43008, dirty
83808, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 16:83968, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 42848, dirty
83808, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free 40960, dirty 85696,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 42848, dirty
83808, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 16:83968, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85696, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free -2147483647, dirty
85856, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85696, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 76, len 4096, key
(80, data, 76)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 19:100352, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 19:100352
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26624, dirty
95648, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 19, free 26528, dirty 95648,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26624, dirty
95648, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 19:100352, len 92, key (80, data, 76)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 76)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 757): tnc_insert: splitting level 0, key (80, data, 76)
UBIFS DBG (pid 757): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 757): tnc_insert: inserting at 0 level 0, key (80, data, 76)
UBIFS DBG (pid 757): tnc_insert: inserted at 5 level 1, key (80, data, 76)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 19:100352, 96 bytes,
jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 19, free 24576, dirty 97600,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 77, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 77)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:81120, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:81120, data node, length 92
UBIFS DBG (pid 757): ubifs_write_end: ino 80, pos 315392, pg 77, len
4096, copied 4096, i_size 315392
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 77, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 16:86016, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:86016
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85856, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free 40800, dirty 85856,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85856, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 16:86016, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, fred: jhead 1, LEB
22:4096, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:4096
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 122720, dirty 3936,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 22:4096, 160 bytes, jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 120832, dirty 5824,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 22:4096, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free -2147483647, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 161, len 4096,
key (80, data, 161)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 24:20480, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:20480
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 24, free 106400, dirty 19520,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 24:20480, len 92, key (80, data, 161)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 161)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 757): tnc_insert: inserted at 5 level 0, key (80, data, 161)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 24:20480, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106400, dirty
19520, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 24, free 104448, dirty 21472,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106400, dirty
19520, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 162, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 162)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:89280, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:89280, data node, length 92
UBIFS DBG (pid 757): ubifs_write_end: ino 80, pos 663552, pg 162, len
4096, copied 4096, i_size 663552
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 162, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 22:6144, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:6144
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 120672, dirty 5984,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 22:6144, 160 bytes, jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120672, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 118784, dirty 769536,
dirty 54656, flEB 21, free 69632, dirtynew_wbuf_timer_nou0_dirty: search
 found 0, lvl 0, n 4
UBIFS DBG (pid 757): tnc_insert: inserted at 5 le, 241)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 21:57344, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 67584, dirty 56608,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 242, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 242)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:96960, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:96960, data node, leDBG
(pid 757): ubifs_write_end96, i_size 991232
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 242, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 15:43008, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:43008
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 15:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 15:43008, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 242, len 4096,
key (80, data, 242)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 21:59392, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:59392
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 67488, dirty 56608,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 21:59392, len 92, key (80, data, 242)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 242)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 757): tnc_insert: inserted at 6 level 0, key (80, data, 242)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 21:59392, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 65536, dirty 58560,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 243, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 243)
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:76032, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:76032, level d 759):
ubifs_wbuf_sync_nolock: LEB 23:92160, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 34720, dirty
87840, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 32768, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 34720, dirty
87840, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 266240, pg 65, len
4096, copied 4096, i_size 266240
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 65, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 22:88064, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:88064
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38912, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 38752, dirty 87904,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38912, dirty
87904, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 22:88064, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38752, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 36864, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38752, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 22:88064, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free -2147483647, dirty
89952, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 65, len 4096, key
(81, data, 65)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 23:94208, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 23:94208
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 32672, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 23:94208, len 92, key (81, data, 65)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 65)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 759): tnc_insert: inserted at 5 level 0, key (81, data, 65)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 23:94208, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 30720, dirty 91744,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 270336, pg 66, len
4096, copied 4096, i_size 270336
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 66, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 22:90112, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:90112
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89952, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 36704, dirty 89952,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89952, flags (pid 759): ubnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 13:55296, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:55296
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 71680, dirty
55136, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 71520, dirty 55136,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 71680, dirty
55136, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wlock: LEB 13:55296, 160 byrty: LEB 13, free
715759): ubifs_change_lp: LEB 13,pid 759): ubifs_lpt_lookup_dirty: LEB
13, free 71520, dirty 55136, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 13:55296, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57024, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free -2147483647, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57024, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 173, len 4096,
key (81, data, 173)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 10:61440, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:61440
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65536, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 10, free 65440, dirty 58560,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65536, dirty
58560, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 10:61440, len 92, key (81, data, 173)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 173)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 759): tnc_insert: inserted at 1 level 0, key (81, data, 173)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 10:61440, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65440, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 10, free 63488, dirty 60512,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65440, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 712704, pg 174, len
4096, copied 4096, i_size 712704
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 174, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 13:57344, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:57344
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 69472, dirty 57184,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57184, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 13:57344, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69472, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 67584, dirty 59072,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69472, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 13:57344, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 67584, dirty
59072, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free ck: 160 bytes (inode
node) to jhead 1 wbuf at LEB 20:96256
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30720, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 30560, dirty 96096,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30720, dirty
96096, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 20:96256, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30560, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 28672, dirty 97984,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30560, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 20:96256, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
97984, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free -2147483647, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
97984, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 255, len 4096,
key (81, data, 255)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 24:102400, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:102400
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24576, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 24, free 24480, dirty 97600,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24576, dirty
97600, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 24:102400, len 92, key (81, data, 255)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 255)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 759): tnc_insert: inserted at 3 level 0, key (81, data, 255)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 24:102400, 96 bytes,
jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24480, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 24, free 22528, dirty 99552,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24480, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_setattr: ino 81, mode 0x81a4, ia_valid 0x101f0
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 20:98304, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:98304
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 28512, dirty 98144,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
98144, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 20:98304, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28512, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 26624, dirty 100032,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28512, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 20:98304, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 26624, dirty
100032, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free -2147483647, dirty
100192, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, f):
lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free -2147483647, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 87, len 4096, key
(82, data, 87)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 16:28672, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:28672
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98304, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 98208, dirty 27328,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98304, dirty
27328, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 16:28672, len 92, key (82, data, 87)
UBIFS DBG (pid 763): l key (82, data, 87)
UBIFS IFS DBG (pid 763): tnc_insert: inse DBG (pid 763):
ubifs_wbuf_sync_nolock: LEB 16:28672, 96 bytes, jhead 2
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98208, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 96256, dirty 29280,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98208, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_write_end: ino 82, pos 360448, pg 88, len
4096, copied 4096, i_size 360448
UBIFS DBG (pid 763): ubifs_dirty_inode: inode 82
UBIFS DBG (pid 763): ubifs_writepage: ino 82, pg 88, pg flags 0xb0d
UBIFS DBG (pid 763): ubifs_write_inode: inode 82, mode 0x81a4, nlink 1
UBIFS DBG (pid 763): ubifs_jnl_write_inode: ino 82, nlink 1
UBIFS DBG (pid 763): write_head: jhead 1, LEB 10:34816, len 160
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:34816
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free 92000, dirty 34656,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34656, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_wbuf_sync_nolock: LEB 10:34816, 160 bytes,
jhead 1
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92000, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free 90112, dirty 36544,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92000, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_tnc_add: 10:34816, len 160, key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
36544, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free -2147483647, dirty
36704, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
36544, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 88, len 4096, key
(82, data, 88)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 16:30720, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:30720
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 96160, dirty 29280,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 16:30720, len 92, key (82, data, 88)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82,
data, 88)
UBIFS DBG (pid 763): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 763): tnc_insert: inserted at 4 level 0, key (82, data, 88)
UBIFS DBG (pid 763): ubifs_wbuf_sync_ino 82, nlink 1
UBIFFS DBG (pid t LEB 23:124928
24768, flags 16
UBIFS DBGflags 16
UBIFS DBG (pid 763): ubifs_lpt_loodirty 124768, flags 16
Ur jhead 1, 3000-5000 m_sync_nolock: LEB 23:124928, 1pt_lookup_dirty:
LEB 23, free 1888, dirty 124768, flags 16
UBIFS DBG (pid 3): ubifs_change_lp: LEB 23, free 0, dirty 126656, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 1888, dirty
124768, flags 16
UBIFS DBG (pid 763): ubifs_tnc_add: 23:124928, len 160, key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 23, free -2147483647, dirty
126816, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126656, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 194, len 4096,
key (82, data, 194)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 21:120832, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:120832
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6144, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 21, free 6048, dirty 115168,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6144, dirty
115168, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 21:120832, len 92, key (82, data, 194)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82,
data, 194)
UBIFS DBG (pid 763): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 763): tnc_insert: inserted at 6 level 0, key (82, data, 194)
UBIFS DBG (pid 763): ubifs_wbuf_sync_nolock: LEB 21:120832, 96 bytes,
jhead 2
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6048, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 21, free 4096, dirty 117120,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6048, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_write_end: ino 82, pos 798720, pg 195, len
4096, copied 4096, i_size 798720
UBIFS DBG (pid 763): ubifs_dirty_inode: inode 82
UBIFS DBG (pid 763): ubifs_writepage: ino 82, pg 195, pg flags 0xb0d
UBIFS DBG (pid 763): ubifs_write_inode: inode 82, mode 0x81a4, nlink 1
UBIFS DBG (pid 763): ubifs_jnl_write_inode: ino 82, nlink 1
UBIFS DBG (pid 763): ubifs_find_free_space: min_space 160
UBIFS DBG (pid 763): reserve_space: no free space  jhead 1, run GC
UBIFS DBG (pid 763): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 763): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 763): ubifs_find_dirty_leb: found LEB 15, free 0, dirty
126976, flags 0x5
UBIFS DBG (pid 763): ubifs_change_lp: LEB 15, free -2147483647, dirty
-2147483647, flags 21
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 5
UBIFS DBG (pid 763): ubifs_garbage_collect: found LEB 15: free 0, dirty
126976, sum 126976 (min. space 2048)
UBIFS DBG (pid 763): ubifs_garbage_collect: LEB 15 is free, return it
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 15, free 126976, dirty 0, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 16
UBIFS DBG (pid 763): reserve_space: got LEB 15 for jhead 1
UBIFS DBG (pid 763): ubifs_add_bud_to_log: write ref LEB 5:14336
UBIFS DBG (pid 763): ubifs_write_node: LEB 5:14336, reference node,
length 64 (aligned 2048)
UBIFS DBG (pid 763): ubifs_add_bud: LEB 15:0, jhead 1, bud_bytes 1048576
UBIFS DBG (pid 763): ubifs_wbuf_seek_nolock: LEB 15:0, jhead 1
UBIFS DBG (pid 763): write_head: jhead 1, LEB 15:0, len 160
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:0
UBIFS DBG (pid 763): ubifs_lpt_lookupup_dirty: LEB 13, free 6144, dirty
120640, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 13, free -2147483647, dirty
120732, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120640, flags 16
UBIFS DBG (pid 765): ubifs_tnc_remove_range: removing (82, data, 255)
UBIFS DBG (pid 765): tnc_delete: deleting (82, data, 252)
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120736, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 13, free -2147483647, dirty
120828, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120736, flags 16
UBIFS DBG (pid 765): ubifs_lookup_level0: search key (82, inode)
UBIFS DBG (pid 765): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 765): ubifs_delete_orphan: inum 82
UBIFS DBG (pid 765): ubifs_create: dent 'f2', mode 0x81a4 in dir ino 1
UBIFS DBG (pid 765): ubifs_jnl_update: ino 83, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 14:6144, len 384
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 14:6144
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 120448, dirty 5984,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 14:6144, 384 bytes, jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120448, dirty
5984, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 118784, dirty 7648,
flags 16
UBIFS DBG (pid 765): ubif_lpt_lookup_dirty: LEB 14, fred 765):
ubifs_tnc_add_nm: LEB 14:6144, name 'f2', key (1, direntry, 0x0328b7)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 765): tnc_insert: inserted at 1 level 0, key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 765): ubifs_tnc_add: 14:6208, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 765): tnc_insert: inserted at 3 level 0, key (83, inode)
UBIFS DBG (pid 765): ubifs_tnc_add: 14:6368, len 160, key (1, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7648, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free -2147483647, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7648, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 0, pg 0, len 4096,
copied 4096, i_size 0
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 0, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 14:8192, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 14:8192
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 118624, dirty 7808,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 14:8192, 160 bytes, jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118624, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 116736, dirty 9696,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, fr>UBIFS DBG (pid
765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106176, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free -2147483647, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106176, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 109, len 4096,
key (83, data, 109)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 15:90112, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:90112
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36864, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 36768, dirty 85888,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36864, dirty
85888, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 15:90112, len 92, key (83, data, 109)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83,
data, 109)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 765): tnc_insert: inserted at 1 level 0, key (83, data, 109)
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 15:90112, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36768, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 34816, dirty 87840,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36768, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 450560, pg 110, len
4096, copied 4096, i_size 450560
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 110, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 19:106496, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 19:106496
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free 20320, dirty 106336,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 19:106496, 160 bytes,
jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free 18432, dirty 108224,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_tnc_add: 19:106496, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free -2147483647, dirty
108384, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 110, len 4096,
key (83, data, 110)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 15:92160, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:92160
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 34816, dirty
87840, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 34720, dirty 87840,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 34816, dirty
87840, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 15:92160, len 92, key (83, data, 110
LEB 21:55296, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 71584, dirty
52704, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 69632, dirty 54656,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 71584, dirty
52704, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 888832, pg 217, len
4096, copied 4096, i_size 888832
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 217, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 22:71680, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:71680
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 55136, dirty 71520,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 22:71680, 160 bytes,
jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 53248, dirty 73408,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_tnc_add: 22:71680, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free -2147483647, dirty
73568, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 217, len 4096,
key (83, data, 217)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 21:57344, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:57344
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69632, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 69536, dirty 54656,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69632, dirty
54656, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 21:57344, len 92, key (83, data, 217)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83,
data, 217)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 765): tnc_insert: inserted at 5 level 0, key (83, data, 217)
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 21:57344, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 67584, dirty 56608,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 892928, pg 218, len
4096, copied 4096, i_size 892928
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 218, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 22:73728, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:73728
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 53088, dirty 73568,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73568, flags 16
UBIFS DBG (pid  ubifs_lpt_lookup_dirty: LEB 18, free 49056, dirty 74656,
flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 139264, pg 34, len
4096, copied 4096, i_size 139264
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 34, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 16:104448, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:104448
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 22368, dirty 104064,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 16:104448, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 20480, dirty 105952,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_tnc_add: 16:104448, len 160, key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free -2147483647, dirty
106112, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 34, len 4096, key
(84, data, 34)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 18:79872, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:79872
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47104, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 18, free 47008, dirty 76608,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47104, dirty
76608, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 18:79872, len 92, key (84, data, 34)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 34)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 767): tnc_insert: inserted at 6 level 0, key (84, data, 34)
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 18:79872, 96 bytes, jhead 2
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47008, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 18, free 45056, dirty 78560,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47008, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 143360, pg 35, len
4096, copied 4096, i_size 143360
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 35, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 16:106496, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:106496
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
106112, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 20320, dirty 106112,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
106112, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 16:106496, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 203203
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65216, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free -2147483647, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65216, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 138, len 4096,
key (84, data, 138)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 24:38912, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:38912
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 87968, dirty 37088,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 24:38912, len 92, key (84, data, 138)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 138)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 767): tnc_insert: inserted at 6 level 0, key (84, data, 138)
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 24:38912, 96 bytes, jhead 2
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 86016, dirty 39040,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 569344, pg 139, len
4096, copied 4096, i_size 569344
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 139, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 20:65536, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:65536
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free 61280, dirty 65376,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65376, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 20:65536, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61280, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free 59392, dirty 67264,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61280, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_tnc_add: 20:65536, len 160, key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free -2147483647, dirty
67424, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 139, len 4096,
key (84, data, 139)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 24:40960, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:40960
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 86016, dirty
39040, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 85920, dirty 39040,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 86016, dirty
39040, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 24:40960, len 92, key (84, data, 139)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 139)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 6
UBIp_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free -2147483647, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 52, len 4096, key
(85, data, 52)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 20:6144, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 20:6144
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120832, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 120736, dirty 5856,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120832, dirty
5856, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 20:6144, len 92, key (85, data, 52)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 52)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 770): tnc_insert: splitting level 0, key (85, data, 52)
UBIFS DBG (pid 770): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 770): tnc_insert: inserting at 0 level 0, key (85, data, 52)
UBIFS DBG (pid 770): tnc_insert: inserted at 2 level 1, key (85, data, 52)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 20:6144, 96 bytes, jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120736, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 118784, dirty 7808,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120736, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 217088, pg 53, len
4096, copied 4096, i_size 217088
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 53, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 21:43008, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 21:43008
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 21:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 21:43008, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 53, len 4096, key
(85, data, 53)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 20:8192, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 20:8192
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 118688, dirty 7808,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
id 770): ubifs_lpt_lookup_dirty: LEB 14,  16
UBIFS D3000-5000 mil02400, len 92, key (85, data,evel0_dirty: slvl 0, n 4
UBIFS DBG (p7>UBIFS DBG (pBIFS DBG (pid 77IFS DBG (pid 770):
ubifs_change (pid 770): ubifs_lpt_lookup_dirty: LEUBIFS DBG (pid 770):
ubifs_write_end: ino 85, pos 663552, pg 162, len 4096, copied 4096,
i_size 663552
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 162, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 13:12288, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:12288
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114688, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 114528, dirty 12128,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114688, dirty
12128, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 13:12288, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114528, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 112640, dirty 14016,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114528, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 13:12288, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14016, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free -2147483647, dirty
14176, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14016, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 162, len 4096,
key (85, data, 162)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 14:104448, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 14:104448
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 14, free 22432, dirty 99552,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 14:104448, len 92, key (85, data, 162)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 162)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 770): tnc_insert: inserted at 6 level 0, key (85, data, 162)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 14:104448, 96 bytes,
jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 14, free 20480, dirty 101504,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 667648, pg 163, len
4096, copied 4096, i_size 667648
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 163, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 13:14336, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:14336
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14176, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 112480, dirty 14176,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14176, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhe7>UBIFS DBG
(pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 24:73728, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 24:73728
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 53088, dirty 73568,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 24:73728, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53088, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 51200, dirty 75456,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53088, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 24:73728, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75456, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free -2147483647, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75456, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 254, len 4096,
key (85, data, 254)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 10:38912, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:38912
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 10, free 87968, dirty 37088,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 10:38912, len 92, key (85, data, 254)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 254)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 770): tnc_insert: inserted at 2 level 0, key (85, data, 254)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 10:38912, 96 bytes, jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 10, free 86016, dirty 39040,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 1044480, pg 255, len
4096, copied 4096, i_size 1044480
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 255, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 24:75776, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 24:75776
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 51040, dirty 75616,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 24:75776, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 49152, dirty 77504,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 24:75776, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_leved 2
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 778): ubifs_change_lp: LEB 19, free 24576, dirty 97600,
flags 16
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 778): ubifs_write_end: ino 86, pos 372736, pg 91, len
4096, copied 4096, i_size 372736
UBIFS DBG (pid 778): ubifs_dirty_inode: inode 86
UBIFS DBG (pid 778): ubifs_writepage: ino 86, pg 91, pg flags 0xb0d
UBIFS DBG (pid 778): ubifs_write_inode: inode 86, mode 0x81a4, nlink 1
UBIFS DBG (pid 778): ubifs_jnl_write_inode: ino 86, nlink 1
UBIFS DBG (pid 778): write_head: jhead 1, LEB 13:20480, len 160
UBIFS DBG (pid 778): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:20480
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 13, free 106496, dirty
20320, flags 16
UBIFS DBG (pid 778): ubifs






=========================================  Power cut, and reboot
==============================================






...
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1173831185
UBI: background thread "ubi_bgt12d" started, PID 453
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 8/5
UBI: image sequence number: 405604914
UBI: background thread "ubi_bgt13d" started, PID 472
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1976325785
UBI: background thread "ubi_bgt14d" started, PID 479
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: f4f5fcf6 a83e3e6f 5e9fbf5e e6e83f80 b34e9dcf a8d9fa9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 773b0d4e fdbc5bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b b94d4319 dffafb6b fa1fe3db de84b3df fd78dada
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede786c 75f43cd0
fb7ae95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2bec0c 4c2b469e
3f67c7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 57dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 621ba2b0 7f7f15a7 da677f7c ff6e7fd8 7e0f3f8e 7c497bf2 b2bbe479
5a06bd30
0100: ed7ecc62 c789e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7d10dc67
0120: dd395ffa b7a5fc16 fd015759 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c664bda2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a b36fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc5c
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cbc
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 3f48fe83 6738ff10 55d66b77 2eb6ff53 a722ef79 76ab0d7b 5499fa5c
fcbefa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a64c>] ubi_io_read+0x8c/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: f4f5fcf6 a83e3e6f 5e9fbf5e e6e83f80 b34e9dcf a8d9fa9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 773b0d4e fdbc5bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b bd4d6319 dffafb6b fa1fe3db de84b3df fd78dada
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2f1 ff91ff1f f629fee9 8ede706c 75f63cd0
fb7ae95f
0080: 2dfe37df a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2fec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06da9e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab3
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc8fdfe f0c37a4e
f17befff
00e0: 621fa2b0 7f7f15a7 da677f7c ff6e7fd8 7e0fbf8e 7c497bf2 b2bbe479
5e06bd30
0100: ed7ecc62 c789e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7d10dc67
0120: dd395ffa b7a5fc16 fd01575d f7baf8ae 6285f7ad bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a5bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a b36fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc5c
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cbc
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff26 cf2dee8d b1402f18 b648bb25
465078a1
01e0: 3f48fe83 6738ff00 55d66b77 aeb6ff53 a726ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: b4f5fcf4 a83e3e6f 5e9fbf5e e6e83f80 a34e9dcf a8d9fb9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 771b0d4e fdb45bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b bd4d0319 dffafb6b fa1fe3d3 de84b3df fd78dade
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede706c 75f63cd0
fb7aa95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2bec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 221ba2b0 7f7f15a7 da677f7c ff6e7fd8 7e0fbf8e 7c497bf2 b2bbe479
5a06b930
0100: ed7ecc62 c389e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7c10dc67
0120: dd395ffa b7a5fc16 fd015659 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667df1f 7989ff9a bb6fcf78 fc8edab6 b7dfd770 7f69fdce
686bfc54
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cb4
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 3f48fe87 6738ff10 55d46b77 2eb6ff53 a722ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: b4f5fcf4 a83e3e6f 5e8fbf5e e6e03f80 a34e9dcf a8d9fa9d ff563684
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 771b0d4a fda45bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b b94d4319 dffafb6b fa1fe3d3 de84b3df fd78d2da
e1ab1f4f
0060: 6f7227dc b7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede786c 75f63cd0
fb7aa95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadef05 ff2bec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 221ba2b0 7f7f15a7 da677f7c ff6e77dc 7e0fbf8e 7c497bf2 b2bbe479
5a06b930
0100: ed7ecc62 d389e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7c10dc67
0120: dd395ffa b7a5fc16 fd015759 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a bb6fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc54
0180: c66e3c7d 2785ff1e af7ffe9c 7f9733f0 26b64140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bab 6f749b71
da357cb4
01c0: 3b4bdb8c 52e3e0fa b57affb4 d982ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 1f48ee83 6738ff10 55d46b77 2eb6ff53 a722ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
21:4096, read 2048 bytes
UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
LEB 18:0, error -5
mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output error
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 14, volume 0, name "app_mid"
UBIFS: file system size:   55615488 bytes (54312 KiB, 53 MiB, 438 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)


ubifs_debug_full.txt

# cp -a /usr/local/hmt/platform/f2 UBIFS DBG (pid 747): ubifs_readdir:
dir ino 1, f_pos 0x0
UBIFS DBG (pid 747): ubifs_tnc_next_ent: (lowest) (1, direntry, 0x000000)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x000000)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 747): ubifs_readdir: feed 'f1', ino 222, new f_pos 0x32807
UBIFS DBG (pid 747): ubifs_tnc_next_ent: f1 (1, direntry, 0x032807)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x032807)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 86868480, n 1
UBIFS DBG (pid 747): ubifs_readdir: feed 'f2', ino 223, new f_pos 0x328b7
UBIFS DBG (pid 747): ubifs_tnc_next_ent: f2 (1, direntry, 0x0328b7)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 86868480, n 2
UBIFS DBG (pid 747): ubifs_readdir: feed 'bin', ino 152, new f_pos 0x23605a
UBIFS DBG (pid 747): ubifs_tnc_next_ent: bin (1, direntry, 0x23605a)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x23605a)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 86868480, n 3
UBIFS DBG (pid 747): ubifs_readdir: feed 'dev', ino 220, new f_pos 0x23ee05
UBIFS DBG (pid 747): ubifs_tnc_next_ent: dev (1, direntry, 0x23ee05)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x23ee05)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 86868480, n 4
UBIFS DBG (pid 747): ubifs_readdir: feed 'lib', ino 65, new f_pos 0x2697fa
UBIFS DBG (pid 747): ubifs_tnc_next_ent: lib (1, direntry, 0x2697fa)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry, 0x2697fa)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 84d61d80, n 0
UBIFS DBG (pid 747): ubifs_readdir: feed 'version', ino 219, new f_pos
0x17b32ee9
UBIFS DBG (pid 747): ubifs_tnc_next_ent: version (1, direntry, 0x17b32ee9)
UBIFS DBG (pid 747): ubifs_lookup_level0: search key (1, direntry,
0x17b32ee9)
UBIFS DBG (pid 747): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 747): ubifs_tnc_next_ent: rc returned 1, znode 84d61d80, n 1
UBIFS DBG (pid 747): ubifs_readdir: dir ino 1, f_pos 0x2

# cp -a /usr/local/hmt/platform/f2 /usr/local/hmt/app
app/     appdata/
doneile :; do cp -a /usr/local/hmt/platform/f2 /usr/local/hmt/appdata/
&& sync;
UBIFS DBG (pid 1214): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 1214): ubifs_lookup_level0: search key (1, direntry,
0x0328b7)
UBIFS DBG (pid 1214): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 1214): ubifs_lookup: not found
UBIFS DBG (pid 1214): ubifs_create: dent 'f2', mode 0x81a4 in dir ino 1
UBIFS DBG (pid 1214): ubifs_jnl_update: ino 70, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 1214): write_head: jhead 1, LEB 10:34816, len 384
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 10:34816
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
33512, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free 91776, dirty 33512,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
33512, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 10:34816, 384 bytes,
jhead 1
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 91776, dirty
33512, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free 90112, dirty 35176,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 91776, dirty
33512, flags 16
UBIFS DBG (pid 1214): ubifs_tnc_add_nm: LEB 10:34816, name 'f2', key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 1214): tnc_insert: inserted at 1 level 0, key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 1214): ubifs_tnc_add: 10:34880, len 160, key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 6
UBIFS DBG (pid 1214): tnc_insert: inserted at 7 level 0, key (70, inode)
UBIFS DBG (pid 1214): ubifs_tnc_add: 10:35040, len 160, key (1, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
35176, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free -2147483647, dirty
35336, flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
35176, flags 16
UBIFS DBG (pid 1214): ubifs_write_end: ino 70, pos 0, pg 0, len 4096,
copied 4096, i_size 0
UBIFS DBG (pid 1214): ubifs_dirty_inode: inode 70
UBIFS DBG (pid 1214): ubifs_writepage: ino 70, pg 0, pg flags 0xb0d
UBIFS DBG (pid 1214): ubifs_write_inode: inode 70, mode 0x81a4, nlink 1
UBIFS DBG (pid 1214): ubifs_jnl_write_inode: ino 70, nlink 1
UBIFS DBG (pid 1214): write_head: jhead 1, LEB 10:36864, len 160
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:36864
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
35336, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free 89952, dirty 35336,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
35336, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 10:36864, 160 bytes,
jhead 1
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 89952, dirty
35336, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free 88064, dirty 37224,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 89952, dirty
35336, flags 16
UBIFS DBG (pid 1214): ubifs_tnc_add: 10:36864, len 160, key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 1, lvl 0, n 7
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37224, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 10, free -2147483647, dirty
37384, flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37224, flags 16
UBIFS DBG (pid 1214): ubifs_jnl_write_data: ino 70, blk 0, len 4096, key
(70, data, 0)
UBIFS DBG (pid 1214): write_node: jhead 2, LEB 13:24576, len 92
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 13:24576
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 13, free 102400, dirty
20280, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 13, free 102304, dirty 20280,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 13, free 102400, dirty
20280, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_tnc_add: 13:24576, len 92, key (70, data, 0)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70,
data, 0)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 1214): tnc_insert: splitting level 0, key (70, data, 0)
UBIFS DBG (pid 1214): tnc_insert: moving 4, keeping 4
UBIFS DBG (pid 1214): tnc_insert: inserting at 4 level 0, key (70, data, 0)
UBIFS DBG (pid 1214): tnc_insert: inserted at 3 level 1, key (69, data, 0)
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 13:24576, 96 bytes,
jhead 2
o 70, nlink 1
UBIFS DBG (pid 1214): write_head: jhead 1, LEB 14:116736, len 160
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 14:116736
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 10240, dirty
116576, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 14, free 10080, dirty 116576,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 10240, dirty
116576, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 14:116736, 160 bytes,
jhead 1
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 10080, dirty
116576, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 14, free 8192, dirty 118464,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 10080, dirty
116576, flags 16
UBIFS DBG (pid 1214): ubifs_tnc_add: 14:116736, len 160, key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8192, dirty
118464, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 14, free -2147483647, dirty
118624, flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8192, dirty
118464, flags 16
UBIFS DBG (pid 1214): ubifs_jnl_write_data: ino 70, blk 101, len 4096,
key (70, data, 101)
UBIFS DBG (pid 1214): write_node: jhead 2, LEB 17:104448, len 92
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 17:104448
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 17, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 17, free 22432, dirty 99552,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 17, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_tnc_add: 17:104448, len 92, key (70, data, 101)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70,
data, 101)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 1214): tnc_insert: inserted at 1 level 0, key (70, data, 101)
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 17:104448, 96 bytes,
jhead 2
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 17, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 17, free 20480, dirty 101504,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 17, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 1214): ubifs_write_end: ino 70, pos 417792, pg 102, len
4096, copied 4096, i_size 417792
UBIFS DBG (pid 1214): ubifs_dirty_inode: inode 70
UBIFS DBG (pid 1214): ubifs_writepage: ino 70, pg 102, pg flags 0xb0d
UBIFS DBG (pid 1214): ubifs_write_inode: inode 70, mode 0x81a4, nlink 1
UBIFS DBG (pid 1214): ubifs_jnl_write_inode: ino 70, nlink 1
UBIFS DBG (pid 1214): write_head: jhead 1, LEB 14:118784, len 160
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 14:118784
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8192, dirty
118624, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 14, free 8032, dirty 118624,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8192, dirty
118624, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 14:118784, 160 bytes,
jhead 1
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8032, dirty
118624, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 14, free 6144, dirty 120512,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 14, free 8032, dirty
118624, flags 16
UBIFS DBG (pid 1214): ubifs_tnc_add: 14:118784, len 160, key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70, inode)
UBIFS DBG (id 1214): ubifs_lpt_lookup_dirty: LEB 18, free 45056, dirty
81600, flags 16
UBIFS DBG (pid 1214): ubifs_jnl_write_data: ino 70, blk 207, len 4096,
key (70, data, 207)
UBIFS DBG (pid 1214): write_node: jhead 2, LEB 21:67584, len 92
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:67584
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 21, free 59296, dirty 64416,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_tnc_add: 21:67584, len 92, key (70, data, 207)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70,
data, 207)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 1214): tnc_insert: inserted at 3 level 0, key (70, data, 207)
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 21:67584, 96 bytes,
jhead 2
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 21, free 57344, dirty 66368,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 1214): ubifs_write_end: ino 70, pos 851968, pg 208, len
4096, copied 4096, i_size 851968
UBIFS DBG (pid 1214): ubifs_dirty_inode: inode 70
UBIFS DBG (pid 1214): ubifs_writepage: ino 70, pg 208, pg flags 0xb0d
UBIFS DBG (pid 1214): ubifs_write_inode: inode 70, mode 0x81a4, nlink 1
UBIFS DBG (pid 1214): ubifs_jnl_write_inode: ino 70, nlink 1
UBIFS DBG (pid 1214): write_head: jhead 1, LEB 18:81920, len 160
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 18:81920
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 45056, dirty
81760, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 18, free 44896, dirty 81760,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 45056, dirty
81760, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 18:81920, 160 bytes,
jhead 1
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 44896, dirty
81760, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 18, free 43008, dirty 83648,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 44896, dirty
81760, flags 16
UBIFS DBG (pid 1214): ubifs_tnc_add: 18:81920, len 160, key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70, inode)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 43008, dirty
83648, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 18, free -2147483647, dirty
83808, flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 18, free 43008, dirty
83648, flags 16
UBIFS DBG (pid 1214): ubifs_jnl_write_data: ino 70, blk 208, len 4096,
key (70, data, 208)
UBIFS DBG (pid 1214): write_node: jhead 2, LEB 21:69632, len 92
UBIFS DBG (pid 1214): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:69632
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 57344, dirty
66368, flags 16
UBIFS DBG (pid 1214): ubifs_change_lp: LEB 21, free 57248, dirty 66368,
flags 16
UBIFS DBG (pid 1214): ubifs_lpt_lookup_dirty: LEB 21, free 57344, dirty
66368, flags 16
UBIFS DBG (pid 1214): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1214): ubifs_tnc_add: 21:69632, len 92, key (70, data, 208)
UBIFS DBG (pid 1214): lookup_level0_dirty: search and dirty key (70,
data, 208)
UBIFS DBG (pid 1214): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 1214): tnc_insert: inserted at 4 level 0, key (70, data, 208)
UBIFS DBG (pid 1214): ubifs_wbuf_sync_nolock: LEB 21:69632, 96 bytes, jh
(pid 1216): ubifs_lpt_lookup_dirty: LEB 19, free 47008, dirty 78048,
flags 16
UBIFS DBG (pid 1216): ubifs_write_end: ino 71, pos 81920, pg 20, len
4096, copied 4096, i_size 81920
UBIFS DBG (pid 1216): ubifs_dirty_inode: inode 71
UBIFS DBG (pid 1216): ubifs_writepage: ino 71, pg 20, pg flags 0xb0d
UBIFS DBG (pid 1216): ubifs_write_inode: inode 71, mode 0x81a4, nlink 1
UBIFS DBG (pid 1216): ubifs_jnl_write_inode: ino 71, nlink 1
UBIFS DBG (pid 1216): write_head: jhead 1, LEB 20:104448, len 160
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:104448
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 20, free 22368, dirty 104064,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 20:104448, 160 bytes,
jhead 1
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 20, free 20480, dirty 105952,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 1216): ubifs_tnc_add: 20:104448, len 160, key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 20, free -2147483647, dirty
106112, flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 1216): ubifs_jnl_write_data: ino 71, blk 20, len 4096,
key (71, data, 20)
UBIFS DBG (pid 1216): write_node: jhead 2, LEB 19:81920, len 92
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 19:81920
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 19, free 45056, dirty
80000, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 19, free 44960, dirty 80000,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 19, free 45056, dirty
80000, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_tnc_add: 19:81920, len 92, key (71, data, 20)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71,
data, 20)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 1216): tnc_insert: splitting level 0, key (71, data, 20)
UBIFS DBG (pid 1216): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 1216): tnc_insert: inserting at 0 level 0, key (71, data, 20)
UBIFS DBG (pid 1216): tnc_insert: inserted at 6 level 1, key (71, data, 20)
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 19:81920, 96 bytes,
jhead 2
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 19, free 44960, dirty
80000, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 19, free 43008, dirty 81952,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 19, free 44960, dirty
80000, flags 16
UBIFS DBG (pid 1216): ubifs_write_end: ino 71, pos 86016, pg 21, len
4096, copied 4096, i_size 86016
UBIFS DBG (pid 1216): ubifs_dirty_inode: inode 71
UBIFS DBG (pid 1216): ubifs_writepage: ino 71, pg 21, pg flags 0xb0d
UBIFS DBG (pid 1216): ubifs_write_inode: inode 71, mode 0x81a4, nlink 1
UBIFS DBG (pid 1216): ubifs_jnl_write_inode: ino 71, nlink 1
UBIFS DBG (pid 1216): write_head: jhead 1, LEB 20:106496, len 160
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:106496
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 20480, dirty
106112, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 20, free 20320, dirty 106112,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 20, free 20und 1, lvl
0, n 3
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 14, free -2147483647, dirty
67424, flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 1216): ubifs_jnl_write_data: ino 71, blk 125, len 4096,
key (71, data, 125)
UBIFS DBG (pid 1216): write_node: jhead 2, LEB 22:43008, len 92
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 22:43008
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 83968, dirty
40992, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 22, free 83872, dirty 40992,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 83968, dirty
40992, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_tnc_add: 22:43008, len 92, key (71, data, 125)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71,
data, 125)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 1216): tnc_insert: inserted at 1 level 0, key (71, data, 125)
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 22:43008, 96 bytes,
jhead 2
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 83872, dirty
40992, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 22, free 81920, dirty 42944,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 83872, dirty
40992, flags 16
UBIFS DBG (pid 1216): ubifs_write_end: ino 71, pos 516096, pg 126, len
4096, copied 4096, i_size 516096
UBIFS DBG (pid 1216): ubifs_dirty_inode: inode 71
UBIFS DBG (pid 1216): ubifs_writepage: ino 71, pg 126, pg flags 0xb0d
UBIFS DBG (pid 1216): ubifs_write_inode: inode 71, mode 0x81a4, nlink 1
UBIFS DBG (pid 1216): ubifs_jnl_write_inode: ino 71, nlink 1
UBIFS DBG (pid 1216): write_head: jhead 1, LEB 14:67584, len 160
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 14:67584
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
67424, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 14, free 59232, dirty 67424,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
67424, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 14:67584, 160 bytes,
jhead 1
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59232, dirty
67424, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 14, free 57344, dirty 69312,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 59232, dirty
67424, flags 16
UBIFS DBG (pid 1216): ubifs_tnc_add: 14:67584, len 160, key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 57344, dirty
69312, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 14, free -2147483647, dirty
69472, flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 14, free 57344, dirty
69312, flags 16
UBIFS DBG (pid 1216): ubifs_jnl_write_data: ino 71, blk 126, len 4096,
key (71, data, 126)
UBIFS DBG (pid 1216): write_node: jhead 2, LEB 22:45056, len 92
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 22:45056
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
42944, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 22, free 81824, dirty 42944,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
42944, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_tnc_add: 22:45056, len 92, key (71, data, 126)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71,
data, 126)
UBIF 3000-5000 millis, jhead 1
UBIFS DBG (p4, flags 16
UBIFS DBG (pid 1216): ubifs_chy 28352, flags 16
UBIFS192, dirty 26464, fla 23:26624, len 160, key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98304, dirty
28352, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 23, free -2147483647, dirty
28512, flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98304, dirty
28352, flags 16
UBIFS DBG (pid 1216): ubifs_jnl_write_data: ino 71, blk 230, len 4096,
key (71, data, 230)
UBIFS DBG (pid 1216): write_node: jhead 2, LEB 21:4096, len 92
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:4096
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, free 122880, dirty
3904, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 21, free 122784, dirty 3904,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, free 122880, dirty
3904, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_tnc_add: 21:4096, len 92, key (71, data, 230)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71,
data, 230)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 1216): tnc_insert: inserted at 2 level 0, key (71, data, 230)
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 21:4096, 96 bytes, jhead 2
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, free 122784, dirty
3904, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 21, free 120832, dirty 5856,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, free 122784, dirty
3904, flags 16
UBIFS DBG (pid 1216): ubifs_write_end: ino 71, pos 946176, pg 231, len
4096, copied 4096, i_size 946176
UBIFS DBG (pid 1216): ubifs_dirty_inode: inode 71
UBIFS DBG (pid 1216): ubifs_writepage: ino 71, pg 231, pg flags 0xb0d
UBIFS DBG (pid 1216): ubifs_write_inode: inode 71, mode 0x81a4, nlink 1
UBIFS DBG (pid 1216): ubifs_jnl_write_inode: ino 71, nlink 1
UBIFS DBG (pid 1216): write_head: jhead 1, LEB 23:28672, len 160
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 23:28672
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98304, dirty
28512, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 23, free 98144, dirty 28512,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98304, dirty
28512, flags 16
UBIFS DBG (pid 1216): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1216): ubifs_wbuf_sync_nolock: LEB 23:28672, 160 bytes,
jhead 1
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98144, dirty
28512, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 23, free 96256, dirty 30400,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 98144, dirty
28512, flags 16
UBIFS DBG (pid 1216): ubifs_tnc_add: 23:28672, len 160, key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: search and dirty key (71, inode)
UBIFS DBG (pid 1216): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 96256, dirty
30400, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 23, free -2147483647, dirty
30560, flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 23, free 96256, dirty
30400, flags 16
UBIFS DBG (pid 1216): ubifs_jnl_write_data: ino 71, blk 231, len 4096,
key (71, data, 231)
UBIFS DBG (pid 1216): write_node: jhead 2, LEB 21:6144, len 92
UBIFS DBG (pid 1216): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:6144
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, free 120832, dirty
5856, flags 16
UBIFS DBG (pid 1216): ubifs_change_lp: LEB 21, free 120736, dirty 5856,
flags 16
UBIFS DBG (pid 1216): ubifs_lpt_lookup_dirty: LEB 21, fr647, dirty
69472, flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 57344, dirty
69312, flags 16
UBIFS DBG (pid 1218): ubifs_jnl_write_data: ino 72, blk 51, len 4096,
key (72, data, 51)
UBIFS DBG (pid 1218): write_node: jhead 2, LEB 15:34816, len 92
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:34816
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 92160, dirty
33184, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 15, free 92064, dirty 33184,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 92160, dirty
33184, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_tnc_add: 15:34816, len 92, key (72, data, 51)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72,
data, 51)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 6
UBIFS DBG (pid 1218): tnc_insert: inserted at 7 level 0, key (72, data, 51)
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 15:34816, 96 bytes,
jhead 2
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 92064, dirty
33184, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 15, free 90112, dirty 35136,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 92064, dirty
33184, flags 16
UBIFS DBG (pid 1218): ubifs_write_end: ino 72, pos 212992, pg 52, len
4096, copied 4096, i_size 212992
UBIFS DBG (pid 1218): ubifs_dirty_inode: inode 72
UBIFS DBG (pid 1218): ubifs_writepage: ino 72, pg 52, pg flags 0xb0d
UBIFS DBG (pid 1218): ubifs_write_inode: inode 72, mode 0x81a4, nlink 1
UBIFS DBG (pid 1218): ubifs_jnl_write_inode: ino 72, nlink 1
UBIFS DBG (pid 1218): write_head: jhead 1, LEB 17:69632, len 160
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 17:69632
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 57344, dirty
69472, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 17, free 57184, dirty 69472,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 57344, dirty
69472, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 17:69632, 160 bytes,
jhead 1
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 57184, dirty
69472, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 17, free 55296, dirty 71360,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 57184, dirty
69472, flags 16
UBIFS DBG (pid 1218): ubifs_tnc_add: 17:69632, len 160, key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 55296, dirty
71360, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 17, free -2147483647, dirty
71520, flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 17, free 55296, dirty
71360, flags 16
UBIFS DBG (pid 1218): ubifs_jnl_write_data: ino 72, blk 52, len 4096,
key (72, data, 52)
UBIFS DBG (pid 1218): write_node: jhead 2, LEB 15:36864, len 92
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:36864
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 90112, dirty
35136, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 15, free 90016, dirty 35136,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 15, free 90112, dirty
35136, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_tnc_add: 15:36864, len 92, key (72, data, 52)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72,
data, 52)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 1218): tnc_insert: splitting level 0, key (72, data, 52)
UBIFS DBG (pid 1218): tnc_insert: moving 0, ke
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 10240, dirty
111264, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 22, free 10144, dirty 111264,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 10240, dirty
111264, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_tnc_add: 22:116736, len 92, key (72, data, 153)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72,
data, 153)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 1218): tnc_insert: inserted at 5 level 0, key (72, data, 153)
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 22:116736, 96 bytes,
jhead 2
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 10144, dirty
111264, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 22, free 8192, dirty 113216,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 10144, dirty
111264, flags 16
UBIFS DBG (pid 1218): ubifs_write_end: ino 72, pos 630784, pg 154, len
4096, copied 4096, i_size 630784
UBIFS DBG (pid 1218): ubifs_dirty_inode: inode 72
UBIFS DBG (pid 1218): ubifs_writepage: ino 72, pg 154, pg flags 0xb0d
UBIFS DBG (pid 1218): ubifs_write_inode: inode 72, mode 0x81a4, nlink 1
UBIFS DBG (pid 1218): ubifs_jnl_write_inode: ino 72, nlink 1
UBIFS DBG (pid 1218): write_head: jhead 1, LEB 16:24576, len 160
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:24576
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 102400, dirty
24416, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 16, free 102240, dirty 24416,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 102400, dirty
24416, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 16:24576, 160 bytes,
jhead 1
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 102240, dirty
24416, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 16, free 100352, dirty 26304,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 102240, dirty
24416, flags 16
UBIFS DBG (pid 1218): ubifs_tnc_add: 16:24576, len 160, key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 100352, dirty
26304, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 16, free -2147483647, dirty
26464, flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 16, free 100352, dirty
26304, flags 16
UBIFS DBG (pid 1218): ubifs_jnl_write_data: ino 72, blk 154, len 4096,
key (72, data, 154)
UBIFS DBG (pid 1218): write_node: jhead 2, LEB 22:118784, len 92
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 22:118784
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 8192, dirty
113216, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 22, free 8096, dirty 113216,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 8192, dirty
113216, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_tnc_add: 22:118784, len 92, key (72, data, 154)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72,
data, 154)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 1218): tnc_insert: inserted at 6 level 0, key (72, data, 154)
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 22:118784, 96 bytes,
jhead 2
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 8096, dirty
113216, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 22, free 6144, dirty 115168,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 22, free 8096, dirty
113216, flags 16
UBIFS DBG (pid 1218): ubifs_write_end: ino 72d dirty key (72, data, 252)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 1218): tnc_insert: splitting level 0, key (72, data, 252)
UBIFS DBG (pid 1218): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 1218): tnc_insert: inserting at 0 level 0, key (72, data,
252)
UBIFS DBG (pid 1218): tnc_insert: inserted at 3 level 1, key (72, data, 252)
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 14:65536, 96 bytes,
jhead 2
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 61344, dirty
62464, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 14, free 59392, dirty 64416,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 61344, dirty
62464, flags 16
UBIFS DBG (pid 1218): ubifs_write_end: ino 72, pos 1036288, pg 253, len
4096, copied 4096, i_size 1036288
UBIFS DBG (pid 1218): ubifs_dirty_inode: inode 72
UBIFS DBG (pid 1218): ubifs_writepage: ino 72, pg 253, pg flags 0xb0d
UBIFS DBG (pid 1218): ubifs_write_inode: inode 72, mode 0x81a4, nlink 1
UBIFS DBG (pid 1218): ubifs_jnl_write_inode: ino 72, nlink 1
UBIFS DBG (pid 1218): write_head: jhead 1, LEB 20:100352, len 160
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:100352
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 26624, dirty
100192, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 20, free 26464, dirty 100192,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 26624, dirty
100192, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 20:100352, 160 bytes,
jhead 1
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 26464, dirty
100192, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 20, free 24576, dirty 102080,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 26464, dirty
100192, flags 16
UBIFS DBG (pid 1218): ubifs_tnc_add: 20:100352, len 160, key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72, inode)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 24576, dirty
102080, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 20, free -2147483647, dirty
102240, flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 20, free 24576, dirty
102080, flags 16
UBIFS DBG (pid 1218): ubifs_jnl_write_data: ino 72, blk 253, len 4096,
key (72, data, 253)
UBIFS DBG (pid 1218): write_node: jhead 2, LEB 14:67584, len 92
UBIFS DBG (pid 1218): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 14:67584
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 14, free 59296, dirty 64416,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 1218): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1218): ubifs_tnc_add: 14:67584, len 92, key (72, data, 253)
UBIFS DBG (pid 1218): lookup_level0_dirty: search and dirty key (72,
data, 253)
UBIFS DBG (pid 1218): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 1218): tnc_insert: inserted at 1 level 0, key (72, data, 253)
UBIFS DBG (pid 1218): ubifs_wbuf_sync_nolock: LEB 14:67584, 96 bytes,
jhead 2
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 1218): ubifs_change_lp: LEB 14, free 57344, dirty 66368,
flags 16
UBIFS DBG (pid 1218): ubifs_lpt_lookup_dirty: LEB 14, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 1218): ubifs_write_end: ino 72, pos 1040384, pg 254, len
4096, copied 4096, i_size 1040384
UBIFS DBG (pid 1218): ubifs_dirty_inode: inode 72
UBIFS DBG (pid 1218): ubifs_writepage: ino 72, pg 254, pg flags 0xb0d
UBIFS DBG (pid 1218): ubifs_write_inode: inode 72, mode 0x81a4, nlink 1
UBIFS DBG (pid 1pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102400,
dirty 24256, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 19, free -2147483647, dirty
24416, flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102400, dirty
24256, flags 16
UBIFS DBG (pid 1222): ubifs_jnl_write_data: ino 73, blk 78, len 4096,
key (73, data, 78)
UBIFS DBG (pid 1222): write_node: jhead 2, LEB 18:106496, len 92
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:106496
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 20480, dirty
101504, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 18, free 20384, dirty 101504,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 20480, dirty
101504, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_tnc_add: 18:106496, len 92, key (73, data, 78)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73,
data, 78)
UBIFS DBG (pid 1222): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 1222): tnc_insert: inserted at 2 level 0, key (73, data, 78)
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 18:106496, 96 bytes,
jhead 2
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 20384, dirty
101504, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 18, free 18432, dirty 103456,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 20384, dirty
101504, flags 16
UBIFS DBG (pid 1222): ubifs_write_end: ino 73, pos 323584, pg 79, len
4096, copied 4096, i_size 323584
UBIFS DBG (pid 1222): ubifs_dirty_inode: inode 73
UBIFS DBG (pid 1222): ubifs_writepage: ino 73, pg 79, pg flags 0xb0d
UBIFS DBG (pid 1222): ubifs_write_inode: inode 73, mode 0x81a4, nlink 1
UBIFS DBG (pid 1222): ubifs_jnl_write_inode: ino 73, nlink 1
UBIFS DBG (pid 1222): write_head: jhead 1, LEB 19:24576, len 160
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 19:24576
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102400, dirty
24416, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 19, free 102240, dirty 24416,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102400, dirty
24416, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 19:24576, 160 bytes,
jhead 1
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102240, dirty
24416, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 19, free 100352, dirty 26304,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 102240, dirty
24416, flags 16
UBIFS DBG (pid 1222): ubifs_tnc_add: 19:24576, len 160, key (73, inode)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73, inode)
UBIFS DBG (pid 1222): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 100352, dirty
26304, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 19, free -2147483647, dirty
26464, flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 19, free 100352, dirty
26304, flags 16
UBIFS DBG (pid 1222): ubifs_jnl_write_data: ino 73, blk 79, len 4096,
key (73, data, 79)
UBIFS DBG (pid 1222): write_node: jhead 2, LEB 18:108544, len 92
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:108544
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 18, free 18336, dirty 103456,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_tnc_add: 18:108544, len 92, key (73, data, 79)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73,
data, 79)
UBIFS DBG (pid 1222):up_dirty: LEB 21, free 59296, dirty 64416, flags 16
UBIFS DBG (pid 1222): ubifs_write_end: ino 73, pos 753664, pg 184, len
4096, copied 4096, i_size 753664
UBIFS DBG (pid 1222): ubifs_dirty_inode: inode 73
UBIFS DBG (pid 1222): ubifs_writepage: ino 73, pg 184, pg flags 0xb0d
UBIFS DBG (pid 1222): ubifs_write_inode: inode 73, mode 0x81a4, nlink 1
UBIFS DBG (pid 1222): ubifs_jnl_write_inode: ino 73, nlink 1
UBIFS DBG (pid 1222): write_head: jhead 1, LEB 15:112640, len 160
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:112640
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 14336, dirty
112480, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 15, free 14176, dirty 112480,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 14336, dirty
112480, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 15:112640, 160 bytes,
jhead 1
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 14176, dirty
112480, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 15, free 12288, dirty 114368,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 14176, dirty
112480, flags 16
UBIFS DBG (pid 1222): ubifs_tnc_add: 15:112640, len 160, key (73, inode)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73, inode)
UBIFS DBG (pid 1222): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 12288, dirty
114368, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 15, free -2147483647, dirty
114528, flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 12288, dirty
114368, flags 16
UBIFS DBG (pid 1222): ubifs_jnl_write_data: ino 73, blk 184, len 4096,
key (73, data, 184)
UBIFS DBG (pid 1222): write_node: jhead 2, LEB 21:69632, len 92
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:69632
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 21, free 57344, dirty
66368, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 21, free 57248, dirty 66368,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 21, free 57344, dirty
66368, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_tnc_add: 21:69632, len 92, key (73, data, 184)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73,
data, 184)
UBIFS DBG (pid 1222): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 1222): tnc_insert: inserted at 4 level 0, key (73, data, 184)
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 21:69632, 96 bytes,
jhead 2
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 21, free 57248, dirty
66368, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 21, free 55296, dirty 68320,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 21, free 57248, dirty
66368, flags 16
UBIFS DBG (pid 1222): ubifs_write_end: ino 73, pos 757760, pg 185, len
4096, copied 4096, i_size 757760
UBIFS DBG (pid 1222): ubifs_dirty_inode: inode 73
UBIFS DBG (pid 1222): ubifs_writepage: ino 73, pg 185, pg flags 0xb0d
UBIFS DBG (pid 1222): ubifs_write_inode: inode 73, mode 0x81a4, nlink 1
UBIFS DBG (pid 1222): ubifs_jnl_write_inode: ino 73, nlink 1
UBIFS DBG (pid 1222): write_head: jhead 1, LEB 15:114688, len 160
UBIFS DBG (pid 1222): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:114688
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 12288, dirty
114528, flags 16
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 15, free 12128, dirty 114528,
flags 16
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 15, free 12288, dirty
114528, flags 16
UBIFS DBG (pid 1222): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 15:114688, 160 bytes,
jhead 1
UBIFS DBG (pid 1222):_timer_nolock: set timer for jhead 2, 3000-5000
millisecs
UBIFS DBG (pid 1222): ubifs_tnc_add: 16:83968, len 92, key (73, data, 253)
UBIFS DBG (pid 1222): lookup_level0_dirty: search and dirty key (73,
data, 253)
UBIFS DBG (pid 1222): ubifs_add_lpt_dirt: LEB 7 add 17 to 12237
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29312, flags 48
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 12, free -2147483647, dirty
29440, flags 48
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29312, flags 48
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29440, flags 48
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 12, free -2147483647, dirty
29548, flags 48
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29440, flags 48
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29552, flags 48
UBIFS DBG (pid 1222): ubifs_change_lp: LEB 12, free -2147483647, dirty
29600, flags 48
UBIFS DBG (pid 1222): ubifs_lpt_lookup_dirty: LEB 12, free 90112, dirty
29552, flags 48
UBIFS DBG (pid 1222): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 1222): tnc_insert: inserted at 1 level 0, key (73, data, 253)
UBIFS DBG (pid 1222): ubifs_wbuf_sync_nolock: LEB 16:83968, 96 bytes,
jhead 2
UBIFS DBG (pid 486): ubifs_tnc_end_commit: TNC height is 3
UBIFS DBG (pid 486): ubifs_lpt_end_commit:
UBIFS DBG (pid 486): write_cnodes: LPT root is at 7:10343
UBIFS DBG (pid 486): write_cnodes: LPT head is at 7:12288
UBIFS DBG (pid 486): write_cnodes: LPT ltab is at 7:10240
UBIFS DBG (pid 486): ubifs_log_end_commit: old tail was LEB 3:0, new
tail is LEB 4:0
UBIFS DBG (pid 486): ubifs_read_node: LEB 12:36096, indexing node,
length 128
UBIFS DBG (pid 486): ubifs_write_node: LEB 1:12288, master node, length
512 (aligned 2048)
UBIFS DBG (pid 486): ubifs_write_node: LEB 2:12288, master node, length
512 (aligned 2048)
UBIFS DBG (pid 486): ubifs_add_lpt_dirt: LEB 7 add 17 to 12254
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 25, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 25, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 25, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 23, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 22, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 22, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 22, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_add_lpt_dirt: LEB 7 add 17 to 12271
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 21, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 21, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 21, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 20, free 0, dirty
126752, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 20, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 20, free 0, dirty
126752, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 19, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 18, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_change_lp: LEB 18, free -2147483647, dirty
-2147483647, flags 0
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 18, free 0, dirty
121024, flags 16
UBIFS DBG (pid 486): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 16
UBIFS DBG (pid 486):0240, dirty 111264, flags 16
UBIFS DBG (pid 1224): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 1224): ubifs_tnc_add: 25:116736, len 92, key (74, data, 75)
UBIFS DBG (pid 1224): lookup_level0_dirty: search and dirty key (74,
data, 75)
UBIFS DBG (pid 1224): lookup_level0_dirty: found 0, lvl 0, n 6
UBIFS DBG (pid 1224): tnc_insert: inserted at 7 level 0, key (74, data, 75)
UBIFS DBG (pid 1224): ubifs_wbuf_sync_nolock: LEB 25:116736, 96 bytes,
jhead 2
UBIFS DBG (pid 1224): ubifs_lpt_lookup_dirty: LEB 25, free 10144, dirty?
BCM70190040
1 20000000
a456
K1
K2

K3

K4

Shmoo Version=3.5
MEMC_0
L=FFFFFFFA U=00000032
0#RTR=00000000
G00000002
R=00000000
00000000000000000000000000000000000000000000000000000000
R=00000001
00000000000000000000000000000000000000000000000000000000
R=00000002
00000000000000000000000000000000000000000000000000000000
R=00000003
00000000000000000000000000000000000000000000000000000000
R=00000004
00000000000000000000000000000000000000000000000000000000
R=00000005
00000000000011111111111111111111111111111111110011100000
R=00000006
00000000000011111111111111111111111111111111111001100000
R=00000007
00000000000011111111111111111111111111111111111011100000
R=00000008
00000000000011111111111111111111111111111111111011000000
R=00000009
00000000000011111111111111111111111111111111111011100000
R=0000000A
00000000000011111111111111111111111111111111111011100000
R=0000000B
00000000000111111111111111111111111111111111110011100000
R=0000000C
00000000000011111111111111111111111111111111111001100000
R=0000000D
00000000000011111111111111111111111111111111111001100000
R=0000000E
00000000000011111111111111111111111111111111111101100000
R=0000000F
00000000000011111111111111111111111111111111111001100000
R=00000010
00000000000111111111111111111111111111111111110011100000
R=00000011
00000000000011111111111111111111111111111111111011100000
R=00000012
00000000000011111111111111111111111111111111111011100000
R=00000013
00000000000111111111111111111111111111111111110111100000
R=00000014
00000000000011111111111111111111111111111111111001100000
R=00000015
00000000000011111111111111111111111111111111111001100000
R=00000016
00000000000011111111111101111111111111111111110001100000
R=00000017
00000000000101010100101010010101010101010101001010000000
R=00000018
00000000000000000000000000000000000000000000000000000000
R=00000019
00000000000000000000000000000000000000000000000000000000
R=0000001A
00000000000000000000000000000000000000000000000000000000
R=0000001B
00000000000000000000000000000000000000000000000000000000
R=0000001C
00000000000000000000000000000000000000000000000000000000
R=0000001D
00000000000000000000000000000000000000000000000000000000
R=0000001E
00000000000000000000000000000000000000000000000000000000
R=0000001F
00000000000000000000000000000000000000000000000000000000
G=00000002 R=0000000D W=00000018
WBL
11111111111111111111111111111111111111111111111111100000
00000000000011111111111111111111111111111111111111111000
00001111111111111111111111111111111111111111110011000000
00000000111111111111111111111111111111111111111111111111
WBLC 00000013 0000001A 00000013 00000019
RBL
00001111111111111111111111000000
01111111111111111111111110000000
00000111111111111111111111000000
01111111111111111111111000000000
RBLC 0000000E 0000000C 0000000F 0000000B
!67!#
00000000bcde@

BCM97019E0 CFE v3.20, CFE core v3.12, Endian Mode: Little
Build Date: Sat Mar 31 13:38:45 CST 2012 (fengliu@zch124app04)
Copyright (C) Broadcom Corporation.

[@Mode Selection]
cannot open flash0.macadr
cannot get flash info
cannot open flash0.macadr
!!!cannot read mac address
MAC ADDRESS MUST BE PROGRAMMED!, using macprog command
CPU speed:       405MHz
Total memory:    256MB
DDR Freq:        666MHz
DDR Mode:        DDR3
DDR Width:       32
Boot Device:     NAND
ECC:           Hamming
Total flash:     128MB

Initializing USB.
USB: Locating Class 09 Vendor 0000 Product 0000: USB Root Hub

CFE initialized.


MAC  00:22:11:44:33:71
param id:67 is not found!
param id:67 is not found!

oof flag is 0!
param id:67 is not found!
param id:67 is not found!
Pattern: 0000007000000000
Pattern: 0000000003FFFFF8
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
memory test successful
nand_erase_block called: blk addr = 0x100000
Starting splash screen.
Invalid file format byte0 = ? byte1 = ?No valid image found in
flash0.splash - disabling splash
param id:63 is not found!
param id:63 is not found!

cmdline : ecm 32 16; boot -z -elf flash0.kernrootfs: 'bmem=133088K@110M
bmem=16416K@245728K root=/dev/ram oof=0'
Geometry = 00000001
ECM will be loaded using boot window(0eff8000, 00008000) and DOCSIS
window(0f000000, 01000000)
Loading bootloader from flash0.ecmboot at aeff8000, length 00008000
Loading nonvol from flash0.dyncfg at afff8000, length 00008000
Loading nonvol from flash0.permcfg at afff0000, length 00008000
Loading DOCSIS from flash0.docsis1 at afe00000, length 00200000
pinMux11 0x11112
pinMux10 0x20000001
Booting BNM MIPS revision 70190040
Loader:elf Filesys:raw Dev:flash0.kernrootfs File:
Options:bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
Loading: 0x80001000/14251520 0x80d98600/180624 Entry address is 0x80005ed0
TP1 Entry Address at 0x80000ffc = 80005ed0
Starting program at 0x80005ed0

Linux version 2.6.31-3.3 (zhang_xiaoming@zch124app04) (gcc version 4.4.5
(Broadcom stbgcc-4.4.5-2.0) ) #10 SMP Wed Apr 11 09:18:13 CST 2012
Fetching vars from bootloader... found 56 vars.
Early serial console at MMIO 0x10406b00 (options '115200n8')
console [uart0] enabled
Options: enet_en=1 enet0_mii=0 enet_no_mdio=0 enet1_en=1 moca=0
         sata=0 docsis=0 pci=1 smp=1 usb=1
Using 256 MB + 0 MB RAM (from CFE)
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Determined physical RAM map:
 memory: 10000000 @ 00000000 (usable)
bmem: adding 129 MB RESERVED region at 110 MB (0x081f8000@0x06e00000)
bmem: adding 16 MB RESERVED region at 239 MB (0x01008000@0x0eff8000)
Initrd not found or empty - disabling initrd
Zone PFN ranges:
  Normal   0x00000000 -> 0x00010000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00010000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Kernel command line: bmem=133088K@110M bmem=16416K@245728K root=/dev/ram
oof=0
PID hash table entries: 1024 (order: 10, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Memory: 96068k/262144k available (4575k kernel code, 165892k reserved,
1247k data, 8096k init, 0k highmem)
NR_IRQS:128
Detected MIPS clock frequency: 405 MHz (202.502 MHz counter)
Console: colour dummy device 80x25
Calibrating delay loop... 404.48 BogoMIPS (lpj=202240)
Mount-cache hash table entries: 512
SMP: Booting CPU1...
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Calibrating delay loop... 407.55 BogoMIPS (lpj=203776)
SMP: CPU1 is running
Brought up 2 CPUs
NET: Registered protocol family 16
USB0: power enable is active low; overcurrent is active low
PCI2.3->SDRAM window: 1024 MB
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
NET: Registered protocol family 1
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
fuse init (API version 7.12)
msgmni has been set to 187
io scheduler noop registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0x10406b00 (irq = 22) is a 16550A
console handover: boot [uart0] -> real [ttyS0]
serial8250.0: ttyS1 at MMIO 0x10406b40 (irq = 65) is a 16550A
serial8250.0: ttyS2 at MMIO 0x10406b80 (irq = 66) is a 16550A
brd: module loaded
loop: module loaded
brcm-pm: enabling moca_genet clocks
brcm-pm: enabling enet clocks
Config EPHY through MDIO
pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethernet driver
usbcore: registered new interface driver pegasus
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver net1080
usbcore: registered new interface driver cdc_subset
usbcore: registered new interface driver zaurus
Broadcom STB NAND controller (BrcmNand Controller)
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
brcm-pm: enabling usb clocks
ehci-brcm ehci-brcm.0: Broadcom STB EHCI
ehci-brcm ehci-brcm.0: new USB bus registered, assigned bus number 1
ehci-brcm ehci-brcm.0: irq 61, io mem 0x10488300
ehci-brcm ehci-brcm.0: USB 0.0 started, EHCI 1.00
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-brcm ohci-brcm.0: Broadcom STB OHCI
ohci-brcm ohci-brcm.0: new USB bus registered, assigned bus number 2
ohci-brcm ohci-brcm.0: irq 62, io mem 0x10488400
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (1503 buckets, 6012 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or
sysctl net.netfilter.nf_conntrack_acct=1 to enable it.
ctnetlink v0.93: registering with nfnetlink.
xt_time: kernel timezone is -0000
ip_tables: (C) 2000-2006 Netfilter Core Team
ClusterIP Version 0.8 loaded successfully
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 17
Bridge firewalling registered
Ebtables v2.0 registered
ebt_ulog: out of memory trying to call netlink_kernel_create
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
EBI CS0: setting up NAND flash (primary)
mtd->oobsize=0, mtd->eccOobSize=0
NAND_CS_NAND_XOR=00000000
B4: NandSelect=40000100, nandConfig=15142200, chipSelect=0
brcmnand_read_id: CS0: dev_id=2cf18095
After: NandSelect=40000100, nandConfig=15142200
Block size=00020000, erase shift=17
NAND Config: Reg=15142200, chipSize=128 MB, blockSize=128K, erase_shift=11
busWidth=1, pageSize=2048B, page_shift=11, page_mask=000007ff
timing1 not adjusted: 5363444f
timing2 not adjusted: 00000fc6
BrcmNAND mfg 2c f1 MICRON MT29F1G08ABA 128MB on CS0

Found NAND on CS0: ACC=f7441010, cfg=15142200, flashId=2cf18095,
tim1=5363444f, tim2=00000fc6
BrcmNAND version = 0x0303 128MB @00000000
brcmnand_scan: B4 nand_select = 40000100
brcmnand_scan: After nand_select = 40000100
handle_acc_control: default CORR ERR threshold  3 bits
ACC: 16 OOB bytes per 512B ECC step; from ID probe: 16
page_shift=11, bbt_erase_shift=17, chip_shift=27, phys_erase_shift=17
Brcm NAND controller version = 3.3 NAND flash size 128MB @18000000
ECC layout=brcmnand_oob_bch4_2k
brcmnand_scan:  mtd->oobsize=64
brcmnand_scan: oobavail=35, eccsize=512, writesize=2048
brcmnand_scan, eccsize=512, writesize=2048, eccsteps=4, ecclevel=4,
eccbytes=7
-->brcmnand_default_bbt
brcmnand_default_bbt: bbt_td = bbt_slc_bch4_main_descr
brcmnand_reset_corr_threshold: default CORR ERR threshold  3 bits for CS0
RedBoot partition parsing not available
Creating 16 MTD partitions on "brcmnand.0":
0x000000000000-0x000000100000 : "cfe"
0x000000100000-0x000000180000 : "cridata0"
0x000000180000-0x000000200000 : "cridata1"
0x000000200000-0x000000400000 : "splash"
0x000000400000-0x000000440000 : "ecmboot"
0x000000440000-0x0000004a0000 : "dyncfg"
0x0000004a0000-0x0000004e0000 : "permcfg"
0x0000004e0000-0x000000760000 : "docsis0"
0x000000760000-0x0000009e0000 : "docsis1"
0x0000009e0000-0x0000010e0000 : "loader_kernrootfs"
0x0000010e0000-0x000001ee0000 : "loader_upgradeapp"
0x000001ee0000-0x0000025e0000 : "kernrootfs"
0x0000025e0000-0x0000039e0000 : "platform"
0x0000039e0000-0x000003de0000 : "app_data"
0x000003de0000-0x000007700000 : "mid_app"
0x000007700000-0x000007f00000 : "download_data"
Freeing unused kernel memory: 8096k freed
starting pid 1, tty '': '/etc/init.d/rcS'
Mounting virtual filesystems
Starting mdev
* WARNING: THIS STB CONTAINS GPLv3 SOFTWARE
* GPLv3 programs must be removed in order to enable security.
* See: http://www.gnu.org/licenses/gpl-faq.html#Tivoization
Configuring eth0 interface
eth0: Link is up, 100 Mbps Full Duplex
Configuring lo ieth0 Link UP.
nterface
Auto config phy
Starting network services
Starting user services
oof Begin ------------------------->
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
oof Step1 ------------------------->
Enter Factory mode......
UBI: attaching mtd12 to ubi12
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1173831185
UBI: background thread "ubi_bgt12d" started, PID 458
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 3/1
UBI: image sequence number: 405604914
UBI: background thread "ubi_bgt13d" started, PID 472
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1976325785
UBI: background thread "ubi_bgt14d" started, PID 479
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 13, volume 0, name "appdata"
UBIFS: file system size:   2031616 bytes (1984 KiB, 1 MiB, 16 LEBs)
UBIFS: journal size:       1904640 bytes (1860 KiB, 1 MiB, 15 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 14, volume 0, name "app_mid"
UBIFS: file system size:   55615488 bytes (54312 KiB, 53 MiB, 438 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
Initializing broadcom driver...
bcmscbeth: module license 'Proprietary' taints kernel.
Disabling lock debugging due to kernel taint
bcm0: MBOX_SHM_ADDR at init!
bcm0: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm1: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm0: MBOX_DMA_READY!
device bcm1 entered promiscuous mode
device eth0 entered promiscuous mode
br0: port 1(eth0) entering learning state
br0: port 2(bcm1) entering learning state
br0: starting userspace STP failed, starting kernel STP
Internet Systems Consortium DHCP Server V3.0.5
Copyright 2004-2006 Internet Systems Consortium.
All rights reserved.
For info, please visit http://www.isc.org/sw/dhcp/
Wrote 0 deleted host decls to leases file.
Wrote 0 new dynamic host decls to leases file.
Wrote 0 leases to leases file.
Listening on LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   Socket/fallback/fallback-net
udhcpc (v1.16.1) started
Sending discover...
mtdocap: Broadcom MTDOCAP driver v1.10 Apr  7 2012 10:47:18
insmod nexus ko...
main
Could not find ecm_prog_storage.  Setting up symbolic link to new eCM
Image Storage Path mtd_block3...
Could not find mtd_block3.  Creating...
Sending discover...
Sending select for 192.168.100.10...
nexus: module_layout: kernel tainted.
nexus driver initialized
platform_main_init_todo
DRV_Flash_SetModuleInitParam entry
DRV_Flash_SetModuleInitParam finished
*** 00:00:00.660 nexus_platform: Release 97125 7.5
*** 00:00:00.660 BCHP_PWR: BCHP_PWR power management disabled
UBIFS DBG (pid 655): do_readpage: ino 84, pg 275, i_size 3258056, flags 0x1
UBIFS DBG (pid 655): ubifs_lookup_level0: search key (84, data, 275)
UBIFS DBG (pid 655): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 655): fallible_read_node: LEB 29:105096, key (84, data, 275)
UBIFS DBG (pid 655): try_read_node: LEB 29:105096, data node, length 1940
### 00:00:00.662 nexus_platform_config:
*****************************************************
### 00:00:00.662 nexus_platform_config: GISB Timeout writing addr
0x10310000 by core BSP
### 00:00:00.662 nexus_platform_config: This GISB timeout occured before
nexus started.
### 00:00:00.662 nexus_platform_config:
*****************************************************
*** 00:00:00.665 BMRC_MONITOR: ARC0 is protecting low memory for range
0x0...0x6e00040 (110 MB)
*** 00:00:00.674 nexus_audio_module: FW download used
UBIFS DBG (pid 656): do_readpage: ino 84, pg 243, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 243)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 29:54008, key (84, data, 243)
UBIFS DBG (pid 656): try_read_node: LEB 29:54008, data node, length 2292
UBIFS DBG (pid 656): do_readpage: ino 84, pg 478, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 478)
UBIFS DBG (pid 656): ubifs_read_node: LEB 110:28776, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 110:28776, level 1, 8 branch
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:33216, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:33216, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 33:3064, key (84, data, 478)
UBIFS DBG (pid 656): try_read_node: LEB 33:3064, data node, length 2909
UBIFS DBG (pid 656): do_readpage: ino 84, pg 558, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 558)
UBIFS DBG (pid 656): ubifs_read_node: LEB 110:28968, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 110:28968, level 1, 8 branch
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:34944, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:34944, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 34:91416, key (84, data, 558)
UBIFS DBG (pid 656): try_read_node: LEB 34:91416, data node, length 2684
UBIFS DBG (pid 656): do_readpage: ino 84, pg 566, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 566)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:35136, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:35136, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 34:113240, key (84, data, 566)
UBIFS DBG (pid 656): try_read_node: LEB 34:113240, data node, length 2517
UBIFS DBG (pid 656): do_readpage: ino 84, pg 567, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 567)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 34:115760, key (84, data, 567)
UBIFS DBG (pid 656): try_read_node: LEB 34:115760, data node, length 3381
UBIFS DBG (pid 656): do_readpage: ino 84, pg 428, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 428)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:32256, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:32256, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 32:20152, key (84, data, 428)
UBIFS DBG (pid 656): try_read_node: LEB 32:20152, data node, length 3002
UBIFS DBG (pid 656): do_readpage: ino 84, pg 424, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 424)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 32:9552, key (84, data, 424)
UBIFS DBG (pid 656): try_read_node: LEB 32:9552, data node, length 2891
UBIFS DBG (pid 656): do_readpage: ino 84, pg 425, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 425)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 32:12448, key (84, data, 425)
UBIFS DBG (pid 656): try_read_node: LEB 32:12448, data node, length 1793
l0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 36:121096, key (84, data, 674)
UBIFS DBG (pid 656): try_read_node: LEB 36:121096, data node, length 1739
UBIFS DBG (pid 656): do_readpage: ino 84, pg 675, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 675)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 36:122840, key (84, data, 675)
UBIFS DBG (pid 656): try_read_node: LEB 36:122840, data node, length 1527
UBIFS DBG (pid 656): do_readpage: ino 84, pg 676, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 676)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 36:124368, key (84, data, 676)
UBIFS DBG (pid 656): try_read_node: LEB 36:124368, data node, length 1455
UBIFS DBG (pid 656): do_readpage: ino 84, pg 677, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 677)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 37:0, key (84, data, 677)
UBIFS DBG (pid 656): try_read_node: LEB 37:0, data node, length 2868
UBIFS DBG (pid 656): do_readpage: ino 84, pg 678, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 678)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 37:2872, key (84, data, 678)
UBIFS DBG (pid 656): try_read_node: LEB 37:2872, data node, length 2759
UBIFS DBG (pid 656): do_readpage: ino 84, pg 679, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 679)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 37:5632, key (84, data, 679)
UBIFS DBG (pid 656): try_read_node: LEB 37:5632, data node, length 2600
UBIFS DBG (pid 656): do_readpage: ino 84, pg 680, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 680)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 37:8232, key (84, data, 680)
UBIFS DBG (pid 656): try_read_node: LEB 37:8232, data node, length 2658
UBIFS DBG (pid 656): do_readpage: ino 84, pg 681, i_size 3258056, flags 0x21
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 681)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:37824, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:37824, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 37:10896, key (84, data, 681)
UBIFS DBG (pid 656): try_read_node: LEB 37:10896, data node, length 2606
UBIFS DBG (pid 656): do_readpage: ino 84, pg 682, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 682)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 37:13504, key (84, data, 682)
UBIFS DBG (pid 656): try_read_node: LEB 37:13504, data node, length 2691
UBIFS DBG (pid 656): do_readpage: ino 84, pg 683, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 683)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 37:16200, key (84, data, 683)
UBIFS DBG (pid 656): try_read_node: LEB 37:16200, data node, length 2795
UBIFS DBG (pid 656): do_readpage: ino 84, pg 684, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 684)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 37:19000, key (84, data, 684)
UBIFS DBG (pid 656): try_read_node: LEB 37:19000, data node, length 2830
UBIFS DBG (pid 656): do_readpage: ino 84, pg 685, i_size 3258056,
flagspg 724, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 724)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 37:80016, key (84, data, 724)
UBIFS DBG (pid 656): try_read_node: LEB 37:80016, data node, length 800
UBIFS DBG (pid 656): do_readpage: ino 84, pg 725, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 725)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 37:80816, key (84, data, 725)
UBIFS DBG (pid 656): try_read_node: LEB 37:80816, data node, length 1304
UBIFS DBG (pid 656): do_readpage: ino 84, pg 726, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 726)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 37:82120, key (84, data, 726)
UBIFS DBG (pid 656): try_read_node: LEB 37:82120, data node, length 2108
UBIFS DBG (pid 656): do_readpage: ino 84, pg 727, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 727)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:38784, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:38784, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 37:84232, key (84, data, 727)
UBIFS DBG (pid 656): try_read_node: LEB 37:84232, data node, length 1416
UBIFS DBG (pid 656): do_readpage: ino 84, pg 728, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 728)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 37:85648, key (84, data, 728)
UBIFS DBG (pid 656): try_read_node: LEB 37:85648, data node, length 2480
UBIFS DBG (pid 656): do_readpage: ino 84, pg 729, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 729)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 37:88128, key (84, data, 729)
UBIFS DBG (pid 656): try_read_node: LEB 37:88128, data node, length 1696
UBIFS DBG (pid 656): do_readpage: ino 84, pg 730, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 730)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 37:89824, key (84, data, 730)
UBIFS DBG (pid 656): try_read_node: LEB 37:89824, data node, length 2366
UBIFS DBG (pid 656): do_readpage: ino 84, pg 731, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 731)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 37:92192, key (84, data, 731)
UBIFS DBG (pid 656): try_read_node: LEB 37:92192, data node, length 2682
UBIFS DBG (pid 656): do_readpage: ino 84, pg 732, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 732)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 37:94880, key (84, data, 732)
UBIFS DBG (pid 656): try_read_node: LEB 37:94880, data node, length 2659
UBIFS DBG (pid 656): do_readpage: ino 84, pg 733, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 733)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 37:97544, key (84, data, 733)
UBIFS DBG (pid 656): try_read_node: LEB 37:97544, data node, length 2979
UBIFS DBG (pid 656): do_readpage: ino 84, pg 734, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 734)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 37:100528, key (84, data, 734)
UBIFS DBG (pid 656): try_read_node: LEB 37:100528, data node, length 2812
UBIFS DBG (pid 656): do_readpage: ino 84, pg 735, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 735)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:38976, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:38976, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 37:103344, key (84, data, 735)
UBIFS DBG (pid 656): try_read_node: LEB 37:103344, data node, length 2637
UBIFS DBG (pid 656): do_readpage: ino 84, pg 736, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 736)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 37:105984, key (84, data, 736)
UBIFS DBG (pid 656): try_read_node: LEB 37:105984, data node, length 2948
UBIFS DBG (pid 656): do_readpage: ino 84, pg 737, i_size 3258056, flags 0x21
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 737)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 37:108936, key (84, data, 737)
UBIFS DBG (pid 656): try_read_node: LEB 37:108936, data node, length 2816
UBIFS DBG (pid 656): do_readpage: ino 84, pg 738, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 738)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 37:111752, key (84, data, 738)
UBIFS DBG (pid 656): try_read_node: LEB 37:111752, data node, length 2521
UBIFS DBG (pid 656): do_readpage: ino 84, pg 739, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 739)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 37:114280, key (84, data, 739)
UBIFS DBG (pid 656): try_read_node: LEB 37:114280, data node, length 2829
UBIFS DBG (pid 656): do_readpage: ino 84, pg 740, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 740)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 37:117112, key (84, data, 740)
UBIFS DBG (pid 656): try_read_node: LEB 37:117112, data node, length 2661
UBIFS DBG (pid 656): do_readpage: ino 84, pg 741, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 741)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 37:119776, key (84, data, 741)
UBIFS DBG (pid 656): try_read_node: LEB 37:119776, data node, length 2580
UBIFS DBG (pid 656): do_readpage: ino 84, pg 742, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 742)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 37:122360, key (84, data, 742)
UBIFS DBG (pid 656): try_read_node: LEB 37:122360, data node, length 2349
UBIFS DBG (pid 656): do_readpage: ino 84, pg 743, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 743)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:39168, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:39168, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 38:0, key (84, data, 743)
UBIFS DBG (pid 656): try_read_node: LEB 38:0, data node, length 2674
UBIFS DBG (pid 656): do_readpage: ino 84, pg 744, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 744)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 38:2680, key (84, data, 744)
UBIFS DBG (pid 656): try_read_node: LEB 38:2680, data node, length 2942
UBIFS DBG (pid 656): do_readpage: ino 84, pg 745, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 745)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 38:5624, key (84, data, 745)
UBIFS DBG (pid 656): try_read_node: LEB 38:5624, data node, length 2913
Lease of 192.168.100.10 obtained, lease time 30
UBIFS DBG (pid 656): do_readpage: ino 84, pg 746, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 746)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 38:8544, key (84, data, 746)
UBIFS DBG (pid 656): try_read_node: LEB 38:8544, data node, length 2718
UBIFS DBG (pid 656): do_readpage: ino 84, pg 747, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 747)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 38:11264, key (84, data, 747)
UBIFS DBG (pid 656): try_read_node: LEB 38:11264, data node, length 2900
UBIFS DBG (pid 656): do_readpage: ino 84, pg 748, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 748)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 38:14168, key (84, data, 748)
UBIFS DBG (pid 656): try_read_node: LEB 38:14168, data node, length 2850
UBIFS DBG (pid 656): do_readpage: ino 84, pg 749, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 749)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 38:17024, key (84, data, 749)
UBIFS DBG (pid 656): try_read_node: LEB 38:17024, data node, length 2876
UBIFS DBG (pid 656): do_readpage: ino 84, pg 750, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 750)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 38:19904, key (84, data, 750)
UBIFS DBG (pid 656): try_read_node: LEB 38:19904, data node, length 2857
UBIFS DBG (pid 656): do_readpage: ino 84, pg 751, i_size 3258056, flags 0x21
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 751)
UBIFS DBG (pid 656): ubifs_read_node: LEB 109:39360, indexing node,
length 188
UBIFS DBG (pid 656): read_znode: LEB 109:39360, level 0, 8 branch
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 38:22768, key (84, data, 751)
UBIFS DBG (pid 656): try_read_node: LEB 38:22768, data node, length 1932
UBIFS DBG (pid 656): do_readpage: ino 84, pg 752, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 752)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 38:24704, key (84, data, 752)
UBIFS DBG (pid 656): try_read_node: LEB 38:24704, data node, length 1987
UBIFS DBG (pid 656): do_readpage: ino 84, pg 753, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 753)
deleting routers
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 38:26696, key (84, data, 753)
UBIFS DBG (pid 656): try_read_node: LEB 38:26696, data node, length 1910
UBIFS DBG (pid 656): do_readpage: ino 84, pg 754, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 754)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 38:28608, key (84, data, 754)
UBIFS DBG (pid 656): try_read_node: LEB 38:28608, data node, length 1924
UBIFS DBG (pid 656): do_readpage: ino 84, pg 755, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 755)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 38:30536, key (84, data, 755)
UBIFS DBG (pid 656): try_read_node: LEB 38:30536, data node, length 1981
UBIFS DBG (pid 656): do_readpage: ino 84, pg 756, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 756)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 38:32520, key (84, data, 756)
UBIFS DBG (pid 656): try_read_node: LEB 38:32520, data node, length 1840
UBIFS DBG (pid 656): do_readpage: ino 84, pg 757, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 757)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 38:34360, key (84, data, 757)
UBIFS DBG (pid 656): try_read_node: LEB 38:34360, data node, length 1839
UBIFS DBG (pid 656): do_readpage: ino 84, pg 758, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 758)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 656): fallible_read_node: LEB 38:36200, key (84, data, 758)
UBIFS DBG (pid 656): try_read_node: LEB 38:36200, data node, length 2072
UBIFS DBG (pid 656): do_readpage: ino 84, pg 759, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 759)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 656): fallible_read_node: LEB 38:38272, key (84, data, 759)
UBIFS DBG (pid 656): try_read_node: LEB 38:38272, data node, length 2169
UBIFS DBG (pid 656): do_readpage: ino 84, pg 760, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 760)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 656): fallible_read_node: LEB 38:40448, key (84, data, 760)
UBIFS DBG (pid 656): try_read_node: LEB 38:40448, data node, length 1869
UBIFS DBG (pid 656): do_readpage: ino 84, pg 761, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 761)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 656): fallible_read_node: LEB 38:42320, key (84, data, 761)
UBIFS DBG (pid 656): try_read_node: LEB 38:42320, data node, length 1819
UBIFS DBG (pid 656): do_readpage: ino 84, pg 762, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 762)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 656): fallible_read_node: LEB 38:44144, key (84, data, 762)
UBIFS DBG (pid 656): try_read_node: LEB 38:44144, data node, length 1829
UBIFS DBG (pid 656): do_readpage: ino 84, pg 763, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 763)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 656): fallible_read_node: LEB 38:45976, key (84, data, 763)
UBIFS DBG (pid 656): try_read_node: LEB 38:45976, data node, length 1877
UBIFS DBG (pid 656): do_readpage: ino 84, pg 764, i_size 3258056, flags 0x1
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 764)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 656): fallible_read_node: LEB 38:47856, key (84, data, 764)
UBIFS DBG (pid 656): try_read_node: LEB 38:47856, data node, length 1404
UBIFS DBG (pid 656): do_readpage: ino 84, pg 765, i_size 3258056, flags 0x21
UBIFS DBG (pid 656): ubifs_lookup_level0: search key (84, data, 765)
UBIFS DBG (pid 656): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 656): fallible_read_node: LEB 38:49264, key (84, data, 765)
UBIFS DBG (pid 656): try_read_node: LEB 38:49264, data node, length 1401
*** 00:00:01.160 BXVD: BXVD_Open() - Firmware revision: 150336
*** 00:00:01.179 nexus_platform_config: softI2c = false
*** 00:00:01.183 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:01.187 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
UBIFS DBG (pid 660): ubifs_lookup: 'route' in dir ino 152
UBIFS DBG (pid 660): ubifs_lookup_level0: search key (152, direntry,
0x134b8ec9)
UBIFS DBG (pid 660): ubifs_lookup_level0: found 0, lvl 0, n 1
UBIFS DBG (pid 660): ubifs_lookup: not found
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
UBIFS DBG (pid 610): do_readpage: ino 169, pg 143, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 143)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 94:104064, key (169, data, 143)
UBIFS DBG (pid 610): try_read_node: LEB 94:104064, data node, length 1491
cm_reachable.sh: ping 192.168.100.1 succeed. reset FAIL_CNT to 0
*** 00:00:04.895 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:04.897 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1164
*** 00:00:07.904 nexus_platform: initialized
UBIFS DBG (pid 653): do_readpage: ino 84, pg 81, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 81)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:25152, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:25152, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 26:49976, key (84, data, 81)
UBIFS DBG (pid 653): try_read_node: LEB 26:49976, data node, length 951
UBIFS DBG (pid 653): do_readpage: ino 84, pg 80, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 80)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 26:49040, key (84, data, 80)
UBIFS DBG (pid 653): try_read_node: LEB 26:49040, data node, length 934
UBIFS DBG (pid 653): do_readpage: ino 84, pg 78, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 78)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 26:47232, key (84, data, 78)
UBIFS DBG (pid 653): try_read_node: LEB 26:47232, data node, length 1029
UBIFS DBG (pid 653): do_readpage: ino 84, pg 71, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 71)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:24960, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:24960, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 26:41248, key (84, data, 71)
UBIFS DBG (pid 653): try_read_node: LEB 26:41248, data node, length 1217
UBIFS DBG (pid 653): do_readpage: ino 84, pg 70, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 70)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 26:40088, key (84, data, 70)
UBIFS DBG (pid 653): try_read_node: LEB 26:40088, data node, length 1157
UBIFS DBG (pid 653): do_readpage: ino 84, pg 69, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 69)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 26:39080, key (84, data, 69)
UBIFS DBG (pid 653): try_read_node: LEB 26:39080, data node, length 1002
UBIFS DBG (pid 653): do_readpage: ino 84, pg 62, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 62)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:24768, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:24768, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 26:33528, key (84, data, 62)
UBIFS DBG (pid 653): try_read_node: LEB 26:33528, data node, length 904
UBIFS DBG (pid 653): do_readpage: ino 84, pg 59, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 59)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:30576, key (84, data, 59)
UBIFS DBG (pid 653): try_read_node: LEB 26:30576, data node, length 1234
UBIFS DBG (pid 653): do_readpage: ino 84, pg 54, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 54)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:24576, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:24576, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 26:26336, key (84, data, 54)
UBIFS DBG (pid 653): try_read_node: LEB 26:26336, data node, length 931
UBIFS DBG (pid 653): do_readpage: ino 84, pg 53, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 53)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 26:25064, key (84, data, 53)
UBIFS DBG (pid 653): try_read_node: LEB 26:25064, data node, length 1266
UBIFS DBG (pid 653): do_readpage: ino 84, pg 52, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 52)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 26:24080, key (84, data, 52)
UBIFS DBG (pid 653): try_read_node: LEB 26:24080, data node, length 977
UBIFS DBG (pid 653): do_readpage: ino 84, pg 47, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 47)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 26:19976, key (84, data, 47)
UBIFS DBG (pid 653): try_read_node: LEB 26:19976, data node, length 1003
UBIFS DBG (pid 653): do_readpage: ino 84, pg 46, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 46)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 26:18952, key (84, data, 46)
UBIFS DBG (pid 653): try_read_node: LEB 26:18952, data node, length 1024
UBIFS DBG (pid 653): do_readpage: ino 84, pg 265, i_size 3258056, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 265)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 29:88200, key (84, data, 265)
UBIFS DBG (pid 653): try_read_node: LEB 29:88200, data node, length 1809
UBIFS DBG (pid 653): do_readpage: ino 84, pg 45, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 45)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 26:17968, key (84, data, 45)
UBIFS DBG (pid 653): try_read_node: LEB 26:17968, data node, length 984
UBIFS DBG (pid 653): do_readpage: ino 84, pg 44, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 44)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 26:16952, key (84, data, 44)
UBIFS DBG (pid 653): try_read_node: LEB 26:16952, data node, length 1010
UBIFS DBG (pid 653): do_readpage: ino 84, pg 43, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 43)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:15696, key (84, data, 43)
UBIFS DBG (pid 653): try_read_node: LEB 26:15696, data node, length 1250
UBIFS DBG (pid 653): do_readpage: ino 84, pg 39, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 39)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 26:8032, key (84, data, 39)
UBIFS DBG (pid 653): try_read_node: LEB 26:8032, data node, length 2322
UBIFS DBG (pid 679): do_readpage: ino 84, pg 88, i_size 3258056, flags 0x1
UBIFS DBG (pid 679): ubifs_lookup_level0: search key (84, data, 88)
UBIFS DBG (pid 679): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 679): fallible_read_node: LEB 26:62384, key (84, data, 88)
UBIFS DBG (pid 679): try_read_node: LEB 26:62384, data node, length 2495
UBIFS DBG (pid 653): do_readpage: ino 84, pg 241, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 241)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 29:48992, key (84, data, 241)
UBIFS DBG (pid 653): try_read_node: LEB 29:48992, data node, length 2498
UBIFS DBG (pid 653): do_readpage: ino 84, pg 239, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 239)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 29:44664, key (84, data, 239)
UBIFS DBG (pid 653): try_read_node: LEB 29:44664, data node, length 2112
UBIFS DBG (pid 653): do_readpage: ino 84, pg 242, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 242)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 29:51496, key (84, data, 242)
UBIFS DBG (pid 653): try_read_node: LEB 29:51496, data node, length 2505
UBIFS DBG (pid 653): do_readpage: ino 84, pg 254, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 254)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:29376, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:29376, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 29:75504, key (84, data, 254)
UBIFS DBG (pid 653): try_read_node: LEB 29:75504, data node, length 1627
UBIFS DBG (pid 653): do_readpage: ino 84, pg 91, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 91)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:69472, key (84, data, 91)
UBIFS DBG (pid 653): try_read_node: LEB 26:69472, data node, length 1853
UBIFS DBG (pid 686): do_readpage: ino 84, pg 92, i_size 3258056, flags 0x1
UBIFS DBG (pid 686): ubifs_lookup_level0: search key (84, data, 92)
UBIFS DBG (pid 686): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 686): fallible_read_node: LEB 26:71328, key (84, data, 92)
UBIFS DBG (pid 686): try_read_node: LEB 26:71328, data node, length 2103
UBIFS DBG (pid 653): do_readpage: ino 84, pg 113, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 113)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:25920, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:25920, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 26:119520, key (84, data, 113)
UBIFS DBG (pid 653): try_read_node: LEB 26:119520, data node, length 2227
UBIFS DBG (pid 653): do_readpage: ino 84, pg 251, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 251)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 29:69424, key (84, data, 251)
UBIFS DBG (pid 653): try_read_node: LEB 29:69424, data node, length 1989
UBIFS DBG (pid 653): do_readpage: ino 84, pg 118, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 118)
UBIFS DBG (pid 653): ubifs_read_node: LEB 110:28008, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 110:28008, level 1, 8 branch
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:26112, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:26112, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 27:4512, key (84, data, 118)
UBIFS DBG (pid 653): try_read_node: LEB 27:4512, data node, length 1787
UBIFS DBG (pid 653): do_readpage: ino 163, pg 47, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 47)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:125184, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:125184, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 91:115176, key (163, data, 47)
UBIFS DBG (pid 653): try_read_node: LEB 91:115176, data node, length 1608
UBIFS DBG (pid 653): do_readpage: ino 163, pg 46, i_size 515924, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 46)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 91:113384, key (163, data, 46)
UBIFS DBG (pid 653): try_read_node: LEB 91:113384, data node, length 1785
UBIFS DBG (pid 653): do_readpage: ino 163, pg 70, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 70)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:125760, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:125760, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 92:21912, key (163, data, 70)
UBIFS DBG (pid 653): try_read_node: LEB 92:21912, data node, length 1549
DRV_Mem_Init heapinit 0 [0][1048576][sys]
DRV_Mem_Init heapinit 1 [0][1048576][browser]
DRV_Flash_Init entry====================1
UBIFS DBG (pid 653): do_readpage: ino 163, pg 87, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 87)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 92:47120, key (163, data, 87)
UBIFS DBG (pid 653): try_read_node: LEB 92:47120, data node, length 1221
UBIFS DBG (pid 653): do_readpage: ino 163, pg 83, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 83)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 92:40544, key (163, data, 83)
UBIFS DBG (pid 653): try_read_node: LEB 92:40544, data node, length 1746
UBIFS DBG (pid 653): do_readpage: ino 70, pg 4, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 4)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 12:123096, key (70, data, 4)
UBIFS DBG (pid 653): try_read_node: LEB 12:123096, data node, length 1193
UBIFS DBG (pid 653): do_readpage: ino 70, pg 14, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 14)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 13:11664, key (70, data, 14)
UBIFS DBG (pid 653): try_read_node: LEB 13:11664, data node, length 1510
UBIFS DBG (pid 653): do_readpage: ino 163, pg 110, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 110)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 92:92808, key (163, data, 110)
UBIFS DBG (pid 653): try_read_node: LEB 92:92808, data node, length 1959
UBIFS DBG (pid 653): do_readpage: ino 163, pg 112, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 112)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 92:96280, key (163, data, 112)
UBIFS DBG (pid 653): try_read_node: LEB 92:96280, data node, length 2293
[flash_init] mtd_write_size = 0x800

UBIFS DBG (pid 653): do_readpage: ino 163, pg 84, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 84)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 92:42296, key (163, data, 84)
UBIFS DBG (pid 653): try_read_node: LEB 92:42296, data node, length 1684
UBIFS DBG (pid 653): do_readpage: ino 163, pg 82, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 82)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 92:39016, key (163, data, 82)
UBIFS DBG (pid 653): try_read_node: LEB 92:39016, data node, length 1523
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=14680064, seek offset=14680064
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=59899904, seek offset=59899904
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=2097152, seek offset=2097152
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=1048576, seek offset=1048576
!
UBIFS DBG (pid 653): do_readpage: ino 163, pg 88, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 88)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 92:48344, key (163, data, 88)
UBIFS DBG (pid 653): try_read_node: LEB 92:48344, data node, length 1259
UBIFS DBG (pid 653): do_readpage: ino 163, pg 17, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 17)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 91:72320, key (163, data, 17)
UBIFS DBG (pid 653): try_read_node: LEB 91:72320, data node, length 1393
UBIFS DBG (pid 653): do_readpage: ino 70, pg 11, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 11)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 13:7944, key (70, data, 11)
UBIFS DBG (pid 653): try_read_node: LEB 13:7944, data node, length 1717
UBIFS DBG (pid 653): do_readpage: ino 163, pg 103, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 103)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 92:78416, key (163, data, 103)
UBIFS DBG (pid 653): try_read_node: LEB 92:78416, data node, length 1984
UBIFS DBG (pid 653): do_readpage: ino 78, pg 38, i_size 1441440, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 38)
UBIFS DBG (pid 653): ubifs_read_node: LEB 110:26280, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 110:26280, level 1, 8 branch
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:12288, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:12288, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 17:110904, key (78, data, 38)
UBIFS DBG (pid 653): try_read_node: LEB 17:110904, data node, length 2169
UBIFS DBG (pid 653): do_readpage: ino 78, pg 171, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 171)
UBIFS DBG (pid 653): ubifs_read_node: LEB 110:26664, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 110:26664, level 1, 8 branch
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:15552, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:15552, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 20:42328, key (78, data, 171)
UBIFS DBG (pid 653): try_read_node: LEB 20:42328, data node, length 1541
ry_read_node: LEB 19:89952, data node, length 2111
UBIFS DBG (pid 653): do_readpage: ino 78, pg 83, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 83)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 18:91744, key (78, data, 83)
UBIFS DBG (pid 653): try_read_node: LEB 18:91744, data node, length 2013
UBIFS DBG (pid 653): do_readpage: ino 78, pg 136, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 136)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 19:88024, key (78, data, 136)
UBIFS DBG (pid 653): try_read_node: LEB 19:88024, data node, length 1924
UBIFS DBG (pid 653): do_readpage: ino 78, pg 82, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 82)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 18:89480, key (78, data, 82)
UBIFS DBG (pid 653): try_read_node: LEB 18:89480, data node, length 2263
UBIFS DBG (pid 653): do_readpage: ino 78, pg 81, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 81)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 18:86864, key (78, data, 81)
UBIFS DBG (pid 653): try_read_node: LEB 18:86864, data node, length 2612
UBIFS DBG (pid 653): do_readpage: ino 78, pg 306, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 306)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 22:95360, key (78, data, 306)
UBIFS DBG (pid 653): try_read_node: LEB 22:95360, data node, length 2172
UBIFS DBG (pid 653): do_readpage: ino 78, pg 324, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 324)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 23:6088, key (78, data, 324)
UBIFS DBG (pid 653): try_read_node: LEB 23:6088, data node, length 1578
UBIFS DBG (pid 653): do_readpage: ino 78, pg 305, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 305)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 22:93368, key (78, data, 305)
UBIFS DBG (pid 653): try_read_node: LEB 22:93368, data node, length 1987
UBIFS DBG (pid 653): do_readpage: ino 78, pg 300, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 300)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 22:84312, key (78, data, 300)
UBIFS DBG (pid 653): try_read_node: LEB 22:84312, data node, length 1843
UBIFS DBG (pid 653): do_readpage: ino 78, pg 298, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 298)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 22:80912, key (78, data, 298)
UBIFS DBG (pid 653): try_read_node: LEB 22:80912, data node, length 1502
UBIFS DBG (pid 653): do_readpage: ino 78, pg 303, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 303)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 22:89056, key (78, data, 303)
UBIFS DBG (pid 653): try_read_node: LEB 22:89056, data node, length 2146
br0: topology change detected, sending tcn bpdu
br0: port 1(eth0) entering forwarding state
UBIFS DBG (pid 653): ubifs_lookup: 'swcfg_runtime.xml' in dir ino 67
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (67, direntry,
0x1be09799)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): ubifs_read_node_wbuf: LEB 11:1064, direntry node,
length 74, jhead 0
UBIFS DBG (pid 653): ubifs_read_node: LEB 11:1064, direntry node, length 74
UBIFS DBG (pid 653): ubifs_iget: inode 69
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (69, inode)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): ubifs_read_node_wbuf: LEB 11:648, inode node,
length 160, jhead 0
UBIFS DBG (pid 653): ubifs_read_node: LEB 11:648, inode node, length 160
UBIFS DBG (pid 653): do_readpage: ino 69, pg 0, i_size 9805, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (69, data, 0)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): ubifs_read_node_wbuf: LEB 11:1216, data node,
length 1937, jhead 0
UBIFS DBG (pid 653): ubifs_read_node: LEB 11:1216, data node, length 1937
UBIFS DBG (pid 653): do_readpage: ino 69, pg 1, i_size 9805, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (69, data, 1)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): ubifs_read_node_wbuf: LEB 11:3160, data node,
length 1373, jhead 0
UBIFS DBG (pid 653): ubifs_read_node: LEB 11:3160, data node, length 1373
UBIFS DBG (pid 653): do_readpage: ino 69, pg 2, i_size 9805, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (69, data, 2)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): ubifs_read_node_wbuf: LEB 11:4536, data node,
length 899, jhead 0
UBIFS DBG (pid 653): ubifs_read_node: LEB 11:4536, data node, length 899
UBIFS DBG (pid 653): do_readpage: ino 71, pg 2, i_size 19184, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (71, data, 2)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 13:29336, key (71, data, 2)
UBIFS DBG (pid 653): try_read_node: LEB 13:29336, data node, length 950
UBIFS DBG (pid 653): do_readpage: ino 78, pg 147, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 147)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:14976, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:14976, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 19:112024, key (78, data, 147)
UBIFS DBG (pid 653): try_read_node: LEB 19:112024, data node, length 2169
UBIFS DBG (pid 653): do_readpage: ino 78, pg 128, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 128)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:14592, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:14592, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 19:69024, key (78, data, 128)
UBIFS DBG (pid 653): try_read_node: LEB 19:69024, data node, length 2351
UBIFS DBG (pid 653): do_readpage: ino 78, pg 126, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 126)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 19:65016, key (78, data, 126)
UBIFS DBG (pid 653): try_read_node: LEB 19:65016, data node, length 2343
br0: topology change detected, sending tcn bpdu
br0: port 2(bcm1) entering forwarding state
UBIFS DBG (pid 653): do_readpage: ino 78, pg 146, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 146)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 19:109584, key (78, data, 146)
UBIFS DBG (pid 653): try_read_node: LEB 19:109584, data node, length 2440
UBIFS DBG (pid 653): do_readpage: ino 78, pg 284, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 284)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:18240, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:18240, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 22:49784, key (78, data, 284)
UBIFS DBG (pid 653): try_read_node: LEB 22:49784, data node, length 2131
UBIFS DBG (pid 653): do_readpage: ino 78, pg 282, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 282)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 22:45328, key (78, data, 282)
UBIFS DBG (pid 653): try_read_node: LEB 22:45328, data node, length 2346
UBIFS DBG (pid 653): do_readpage: ino 78, pg 285, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 285)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 22:51920, key (78, data, 285)
UBIFS DBG (pid 653): try_read_node: LEB 22:51920, data node, length 2523
UBIFS DBG (pid 653): do_readpage: ino 78, pg 281, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 281)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 22:43608, key (78, data, 281)
UBIFS DBG (pid 653): try_read_node: LEB 22:43608, data node, length 1715
UBIFS DBG (pid 653): do_readpage: ino 78, pg 283, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 283)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 22:47680, key (78, data, 283)
UBIFS DBG (pid 653): try_read_node: LEB 22:47680, data node, length 2104
UBIFS DBG (pid 653): do_readpage: ino 78, pg 325, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 325)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 23:7672, key (78, data, 325)
UBIFS DBG (pid 653): try_read_node: LEB 23:7672, data node, length 2540
UBIFS DBG (pid 653): do_readpage: ino 78, pg 138, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 138)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 19:92064, key (78, data, 138)
UBIFS DBG (pid 653): try_read_node: LEB 19:92064, data node, length 2223
UBIFS DBG (pid 653): do_readpage: ino 78, pg 130, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 130)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 19:73568, key (78, data, 130)
UBIFS DBG (pid 653): try_read_node: LEB 19:73568, data node, length 2641
UBIFS DBG (pid 653): do_readpage: ino 78, pg 127, i_size 1441440, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 127)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 19:67360, key (78, data, 127)
UBIFS DBG (pid 653): try_read_node: LEB 19:67360, data node, length 1663
UBIFS DBG (pid 653): do_readpage: ino 78, pg 125, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 125)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 19:62488, key (78, data, 125)
UBIFS DBG (pid 653): try_read_node: LEB 19:62488, data node, length 2528
UBIFS DBG (pid 653): do_readpage: ino 78, pg 73, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 73)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 18:69000, key (78, data, 73)
UBIFS DBG (pid 653): try_read_node: LEB 18:69000, data node, length 2097
UBIFS DBG (pid 653): do_readpage: ino 78, pg 133, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 133)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 19:81256, key (78, data, 133)
UBIFS DBG (pid 653): try_read_node: LEB 19:81256, data node, length 2061
UBIFS DBG (pid 653): do_readpage: ino 78, pg 31, i_size 1441440, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (78, data, 31)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 17:95160, key (78, data, 31)
UBIFS DBG (pid 653): try_read_node: LEB 17:95160, data node, length 1924
UBIFS DBG (pid 653): do_readpage: ino 163, pg 13, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 13)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 91:67624, key (163, data, 13)
UBIFS DBG (pid 653): try_read_node: LEB 91:67624, data node, length 1209
UBIFS DBG (pid 653): do_readpage: ino 163, pg 14, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 14)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 91:68840, key (163, data, 14)
UBIFS DBG (pid 653): try_read_node: LEB 91:68840, data node, length 1300
UBIFS DBG (pid 653): do_readpage: ino 163, pg 11, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 11)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 91:64872, key (163, data, 11)
UBIFS DBG (pid 653): try_read_node: LEB 91:64872, data node, length 1436
UBIFS DBG (pid 653): do_readpage: ino 163, pg 26, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 26)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:124800, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:124800, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 91:85672, key (163, data, 26)
UBIFS DBG (pid 653): try_read_node: LEB 91:85672, data node, length 1344
UBIFS DBG (pid 653): do_readpage: ino 163, pg 24, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 24)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 91:83072, key (163, data, 24)
UBIFS DBG (pid 653): try_read_node: LEB 91:83072, data node, length 1354
UBIFS DBG (pid 653): do_readpage: ino 163, pg 81, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 81)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 92:37840, key (163, data, 81)
UBIFS DBG (pid 653): try_read_node: LEB 92:37840, data node, length 1169
UBIFS DBG (pid 653): do_readpage: ino 163, pg 115, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 115)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 92:100856, key (163, data, 115)
UBIFS DBG (pid 653): try_read_node: LEB 92:100856, data node, length 726
UBIFS DBG (pid 653): do_readpage: ino 163, pg 25, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 25)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 91:84432, key (163, data, 25)
UBIFS DBG (pid 653): try_read_node: LEB 91:84432, data node, length 1235
UBIFS DBG (pid 653): do_readpage: ino 163, pg 104, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 104)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 92:80400, key (163, data, 104)
UBIFS DBG (pid 653): try_read_node: LEB 92:80400, data node, length 2025
====FACTORY_PARAID_END:68
UBIFS DBG (pid 610): do_readpage: ino 169, pg 81, i_size 1172304, flags 0x21
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 81)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 94:9368, key (169, data, 81)
UBIFS DBG (pid 610): try_read_node: LEB 94:9368, data node, length 1831
UBIFS DBG (pid 610): do_readpage: ino 169, pg 93, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 93)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 610): fallible_read_node: LEB 94:28400, key (169, data, 93)
UBIFS DBG (pid 610): try_read_node: LEB 94:28400, data node, length 1811
UBIFS DBG (pid 610): do_readpage: ino 169, pg 87, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 87)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 94:17928, key (169, data, 87)
UBIFS DBG (pid 610): try_read_node: LEB 94:17928, data node, length 1540
UBIFS DBG (pid 610): do_readpage: ino 169, pg 90, i_size 1172304, flags 0x1
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(0)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 90)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 610): fallible_read_node: LEB 94:23112, key (169, data, 90)
UBIFS DBG (pid 610): try_read_node: LEB 94:23112, data node, length 1751
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(1)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): do_readpage: ino 169, pg 16, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 16)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(2)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:37008, key (169, data, 16)
UBIFS DBG (pid 610): try_read_node: LEB 93:37008, data node, length 1691
UBIFS DBG (pid 610): do_readpage: ino 169, pg 17, i_size 1172304, flags 0x1
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(4)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 17)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 93:38704, key (169, data, 17)
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(5)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): try_read_node: LEB 93:38704, data node, length 1800
UBIFS DBG (pid 610): do_readpage: ino 169, pg 6, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 6)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(6)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:20632, key (169, data, 6)
UBIFS DBG (pid 610): try_read_node: LEB 93:20632, data node, length 1823
UBIFS DBG (pid 610): do_readpage: ino 169, pg 96, i_size 1172304, flags 0x1
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(7)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 96)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 610): fallible_read_node: LEB 94:33616, key (169, data, 96)
UBIFS DBG (pid 610): try_read_node: LEB 94:33616, data node, length 1641
UBIFS DBG (pid 610): do_readpage: ino 169, pg 14, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 14)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 610): fallible_read_node: LEB 93:33576, key (169, data, 14)
UBIFS DBG (pid 610): try_read_node: LEB 93:33576, data node, length 2006
UBIFS DBG (pid 610): do_readpage: ino 169, pg 15, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 15)
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(50)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 93:35584, key (169, data, 15)
UBIFS DBG (pid 610): try_read_node: LEB 93:35584, data node, length 1418
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(51)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): do_readpage: ino 169, pg 9, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 9)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(52)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:25960, key (169, data, 9)
UBIFS DBG (pid 610): try_read_node: LEB 93:25960, data node, length 1939
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(53)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(54)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(55)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(56)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(57)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(58)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(59)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(60)  status(0)is invalid or space not enough!
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(61)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): do_readpage: ino 169, pg 10, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 10)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 7
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(62)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:27904, key (169, data, 10)
UBIFS DBG (pid 610): try_read_node: LEB 93:27904, data node, length 1322
UBIFS DBG (pid 610): do_readpage: ino 169, pg 11, i_size 1172304, flags 0x1
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(63)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 11)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 0
[653]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(64)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:29232, key (169, data, 11)
UBIFS DBG (pid 610): try_read_node: LEB 93:29232, data node, length 1467
UBIFS DBG (pid 610): do_readpage: ino 169, pg 12, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 12)
[653]:ERR:000000025:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(65)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 610): fallible_read_node: LEB 93:30704, key (169, data, 12)
UBIFS DBG (pid 610): try_read_node: LEB 93:30704, data node, length 1583
[653]:ERR:000000025:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(66)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): do_readpage: ino 169, pg 54, i_size 1172304, flags 0x21
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 54)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
[653]:ERR:000000025:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(67)  status(0)is invalid or space not enough!
UBIFS DBG (pid 610): fallible_read_node: LEB 93:97704, key (169, data, 54)
UBIFS DBG (pid 610): try_read_node: LEB 93:97704, data node, length 1634
UBIFS DBG (pid 610): do_readpage: ino 169, pg 13, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 13)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 610): fallible_read_node: LEB 93:32288, key (169, data, 13)
UBIFS DBG (pid 610): try_read_node: LEB 93:32288, data node, length 1284
UBIFS DBG (pid 610): do_readpage: ino 169, pg 88, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 88)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 610): fallible_read_node: LEB 94:19472, key (169, data, 88)
UBIFS DBG (pid 610): try_read_node: LEB 94:19472, data node, length 1719
UBIFS DBG (pid 610): do_readpage: ino 169, pg 89, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 89)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 94:21192, key (169, data, 89)
UBIFS DBG (pid 610): try_read_node: LEB 94:21192, data node, length 1920
UBIFS DBG (pid 653): do_readpage: ino 163, pg 105, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 105)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 92:82432, key (163, data, 105)
UBIFS DBG (pid 653): try_read_node: LEB 92:82432, data node, length 1979
UBIFS DBG (pid 653): do_readpage: ino 163, pg 38, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 38)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 91:101936, key (163, data, 38)
UBIFS DBG (pid 653): try_read_node: LEB 91:101936, data node, length 1615
UBIFS DBG (pid 653): do_readpage: ino 70, pg 10, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 10)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 13:6536, key (70, data, 10)
UBIFS DBG (pid 653): try_read_node: LEB 13:6536, data node, length 1406
UBIFS DBG (pid 653): do_readpage: ino 70, pg 12, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 12)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 13:9664, key (70, data, 12)
UBIFS DBG (pid 653): try_read_node: LEB 13:9664, data node, length 1030
[HAL1_0_Init_Step2] configured vout mode: 720P60
UBIFS DBG (pid 694): do_readpage: ino 163, pg 16, i_size 515924, flags 0x1
UBIFS DBG (pid 694): ubifs_lookup_level0: search key (163, data, 16)
UBIFS DBG (pid 694): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 694): fallible_read_node: LEB 91:71232, key (163, data, 16)
UBIFS DBG (pid 694): try_read_node: LEB 91:71232, data node, length 1087
UBIFS DBG (pid 653): do_readpage: ino 163, pg 15, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 15)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 91:70144, key (163, data, 15)
UBIFS DBG (pid 653): try_read_node: LEB 91:70144, data node, length 1083
UBIFS DBG (pid 653): do_readpage: ino 163, pg 42, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 42)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 91:107704, key (163, data, 42)
UBIFS DBG (pid 653): try_read_node: LEB 91:107704, data node, length 1244
UBIFS DBG (pid 653): do_readpage: ino 163, pg 63, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 63)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:125568, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:125568, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 92:12144, key (163, data, 63)
UBIFS DBG (pid 653): try_read_node: LEB 92:12144, data node, length 1386
UBIFS DBG (pid 653): do_readpage: ino 163, pg 45, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 45)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 91:111552, key (163, data, 45)
UBIFS DBG (pid 653): try_read_node: LEB 91:111552, data node, length 1831
UBIFS DBG (pid 653): do_readpage: ino 163, pg 52, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 52)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 91:123112, key (163, data, 52)
UBIFS DBG (pid 653): try_read_node: LEB 91:123112, data node, length 1477
UBIFS DBG (pid 653): do_readpage: ino 163, pg 67, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 67)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 92:17728, key (163, data, 67)
UBIFS DBG (pid 653): try_read_node: LEB 92:17728, data node, length 1333
UBIFS DBG (pid 653): do_readpage: ino 163, pg 68, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 68)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 92:19064, key (163, data, 68)
UBIFS DBG (pid 653): try_read_node: LEB 92:19064, data node, length 1425
UBIFS DBG (pid 653): do_readpage: ino 163, pg 71, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 71)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 92:23464, key (163, data, 71)
UBIFS DBG (pid 653): try_read_node: LEB 92:23464, data node, length 1561
UBIFS DBG (pid 653): do_readpage: ino 163, pg 77, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 77)
UBIFS DBG (pid 653): ubifs_read_node: LEB 109:125952, indexing node,
length 188
UBIFS DBG (pid 653): read_znode: LEB 109:125952, level 0, 8 branch
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 92:32712, key (163, data, 77)
UBIFS DBG (pid 653): try_read_node: LEB 92:32712, data node, length 1575
UBIFS DBG (pid 653): do_readpage: ino 84, pg 37, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 37)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 26:5112, key (84, data, 37)
UBIFS DBG (pid 653): try_read_node: LEB 26:5112, data node, length 816
UBIFS DBG (pid 653): do_readpage: ino 84, pg 76, i_size 3258056, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 76)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 26:45632, key (84, data, 76)
UBIFS DBG (pid 653): try_read_node: LEB 26:45632, data node, length 788
UBIFS DBG (pid 653): do_readpage: ino 84, pg 72, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 72)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 26:42472, key (84, data, 72)
UBIFS DBG (pid 653): try_read_node: LEB 26:42472, data node, length 793
UBIFS DBG (pid 653): do_readpage: ino 84, pg 60, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 60)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 26:31816, key (84, data, 60)
UBIFS DBG (pid 653): try_read_node: LEB 26:31816, data node, length 782
UBIFS DBG (pid 653): do_readpage: ino 87, pg 2, i_size 28872, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (87, data, 2)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 38:84880, key (87, data, 2)
UBIFS DBG (pid 653): try_read_node: LEB 38:84880, data node, length 1952
UBIFS DBG (pid 653): do_readpage: ino 84, pg 65, i_size 3258056, flags 0x1
UBIFS DBG (pid 696): do_readpage: ino 163, pg 75, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 65)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 696): ubifs_lookup_level0: search key (163, data, 75)
UBIFS DBG (pid 653): fallible_read_node: LEB 26:35960, key (84, data, 65)
UBIFS DBG (pid 696): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): try_read_node: LEB 26:35960, data node, length 771
UBIFS DBG (pid 696): fallible_read_node: LEB 92:29560, key (163, data, 75)
UBIFS DBG (pid 696): try_read_node: LEB 92:29560, data node, length 1453
UBIFS DBG (pid 653): do_readpage: ino 84, pg 66, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 66)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 26:36736, key (84, data, 66)
UBIFS DBG (pid 653): try_read_node: LEB 26:36736, data node, length 781
UBIFS DBG (pid 653): do_readpage: ino 84, pg 67, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 67)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:37520, key (84, data, 67)
UBIFS DBG (pid 653): try_read_node: LEB 26:37520, data node, length 763
UBIFS DBG (pid 653): do_readpage: ino 84, pg 63, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 63)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 26:34432, key (84, data, 63)
UBIFS DBG (pid 653): try_read_node: LEB 26:34432, data node, length 767
UBIFS DBG (pid 653): do_readpage: ino 84, pg 79, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 79)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 26:48264, key (84, data, 79)
UBIFS DBG (pid 653): try_read_node: LEB 26:48264, data node, length 773
UBIFS DBG (pid 653): do_readpage: ino 163, pg 78, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 78)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 92:34288, key (163, data, 78)
UBIFS DBG (pid 653): try_read_node: LEB 92:34288, data node, length 1156
UBIFS DBG (pid 653): do_readpage: ino 163, pg 76, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 76)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 92:31016, key (163, data, 76)
UBIFS DBG (pid 653): try_read_node: LEB 92:31016, data node, length 1692
UBIFS DBG (pid 653): do_readpage: ino 84, pg 77, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 77)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 26:46424, key (84, data, 77)
UBIFS DBG (pid 653): try_read_node: LEB 26:46424, data node, length 806
UBIFS DBG (pid 653): do_readpage: ino 163, pg 109, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 109)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 92:90608, key (163, data, 109)
UBIFS DBG (pid 653): try_read_node: LEB 92:90608, data node, length 2195
Check Tuner Type: DRV_TunerBCM7125
Check Tuner Type: DRV_TunerBCM7125
UBIFS DBG (pid 653): do_readpage: ino 163, pg 94, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 94)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 92:56576, key (163, data, 94)
UBIFS DBG (pid 653): try_read_node: LEB 92:56576, data node, length 1370
UBIFS DBG (pid 653): do_readpage: ino 84, pg 51, i_size 3258056, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 51)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:23304, key (84, data, 51)
UBIFS DBG (pid 653): try_read_node: LEB 26:23304, data node, length 770
UBIFS DBG (pid 653): do_readpage: ino 84, pg 58, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 58)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 26:29624, key (84, data, 58)
UBIFS DBG (pid 653): try_read_node: LEB 26:29624, data node, length 946
UBIFS DBG (pid 653): do_readpage: ino 84, pg 57, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 57)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 26:28848, key (84, data, 57)
UBIFS DBG (pid 653): try_read_node: LEB 26:28848, data node, length 774
UBIFS DBG (pid 653): do_readpage: ino 163, pg 108, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 108)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 92:88456, key (163, data, 108)
UBIFS DBG (pid 653): try_read_node: LEB 92:88456, data node, length 2152
SYS_MsgQCreate id=1 pmsg=0x242a9b8
SYS_MsgQCreate id=2 pmsg=0x242aba0
SYS_TaskCreate StackSize =30720
tuner process ready
UBIFS DBG (pid 653): do_readpage: ino 163, pg 50, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 50)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 91:120160, key (163, data, 50)
UBIFS DBG (pid 653): try_read_node: LEB 91:120160, data node, length 1312
TASK CREATE NAME   ==    <TUNER>
UBIFS DBG (pid 653): do_readpage: ino 70, pg 18, i_size 97860, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (70, data, 18)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 13:16584, key (70, data, 18)
UBIFS DBG (pid 653): try_read_node: LEB 13:16584, data node, length 1526
ir enter mtc mode@@@@@@@@@@@@@@

UBIFS DBG (pid 701): do_readpage: ino 70, pg 17, i_size 97860, flags 0x1
UBIFS DBG (pid 701): ubifs_lookup_level0: search key (70, data, 17)
UBIFS DBG (pid 701): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 701): fallible_read_node: LEB 13:15352, key (70, data, 17)
UBIFS DBG (pid 701): try_read_node: LEB 13:15352, data node, length 1227
UBIFS DBG (pid 701): do_readpage: ino 70, pg 13, i_size 97860, flags 0x1
UBIFS DBG (pid 701): ubifs_lookup_level0: search key (70, data, 13)
UBIFS DBG (pid 701): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 701): fallible_read_node: LEB 13:10696, key (70, data, 13)
UBIFS DBG (pid 701): try_read_node: LEB 13:10696, data node, length 968
UBIFS DBG (pid 653): do_readpage: ino 163, pg 35, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 35)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 91:97440, key (163, data, 35)
UBIFS DBG (pid 653): try_read_node: LEB 91:97440, data node, length 1525
UBIFS DBG (pid 653): do_readpage: ino 163, pg 92, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 92)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 92:53784, key (163, data, 92)
UBIFS DBG (pid 653): try_read_node: LEB 92:53784, data node, length 1539
createSettings.width[720] createSettings.height[576]
createSettings.width[720] createSettings.height[576]
UBIFS DBG (pid 653): do_readpage: ino 103, pg 3, i_size 41876, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (103, data, 3)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 83:45864, key (103, data, 3)
UBIFS DBG (pid 653): try_read_node: LEB 83:45864, data node, length 1250
UBIFS DBG (pid 653): do_readpage: ino 103, pg 5, i_size 41876, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (103, data, 5)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): fallible_read_node: LEB 83:48616, key (103, data, 5)
UBIFS DBG (pid 653): try_read_node: LEB 83:48616, data node, length 1169
UBIFS DBG (pid 653): do_readpage: ino 103, pg 7, i_size 41876, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (103, data, 7)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 83:51248, key (103, data, 7)
UBIFS DBG (pid 653): try_read_node: LEB 83:51248, data node, length 1470
UBIFS DBG (pid 653): do_readpage: ino 103, pg 6, i_size 41876, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (103, data, 6)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 83:49792, key (103, data, 6)
UBIFS DBG (pid 653): try_read_node: LEB 83:49792, data node, length 1456
UBIFS DBG (pid 653): do_readpage: ino 103, pg 4, i_size 41876, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (103, data, 4)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 83:47120, key (103, data, 4)
UBIFS DBG (pid 653): try_read_node: LEB 83:47120, data node, length 1491
UBIFS DBG (pid 653): do_readpage: ino 163, pg 62, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 62)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 653): fallible_read_node: LEB 92:10552, key (163, data, 62)
UBIFS DBG (pid 653): try_read_node: LEB 92:10552, data node, length 1590
SYS_MsgQCreate id=3 pmsg=0x242b140
UBIFS DBG (pid 653): do_readpage: ino 163, pg 59, i_size 515924, flags 0x21
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 59)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 653): fallible_read_node: LEB 92:7304, key (163, data, 59)
UBIFS DBG (pid 653): try_read_node: LEB 92:7304, data node, length 1682
UBIFS DBG (pid 653): do_readpage: ino 163, pg 64, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 64)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 92:13536, key (163, data, 64)
UBIFS DBG (pid 653): try_read_node: LEB 92:13536, data node, length 1419
UBIFS DBG (pid 653): do_readpage: ino 163, pg 58, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 58)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 92:5600, key (163, data, 58)
UBIFS DBG (pid 653): try_read_node: LEB 92:5600, data node, length 1697
SYS_TaskCreate StackSize =8192
TASK CREATE NAME   ==    <LedScanKeyTask>
SYS_MsgQCreate id=4 pmsg=0x242b1a8

DRV_PanelKeyListInit1543: KeyListInitPortFun=0x43ba3c
DRV_PanelKeyListInit1544:
KeyListInitPortFun=0x43ba3c,KeyTable=0x482c2c,DrvFpKeySize=0x7SYS_TaskCreate
StackSize =1024
TASK CREATE NAME   ==    <DispanelProcess>
UBIFS DBG (pid 707): do_readpage: ino 163, pg 60, i_size 515924, flags 0x1
UBIFS DBG (pid 653): do_readpage: ino 163, pg 32, i_size 515924, flags 0x1
UBIFS DBG (pid 707): ubifs_lookup_level0: search key (163, data, 60)
UBIFS DBG (pid 707): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 32)
UBIFS DBG (pid 707): fallible_read_node: LEB 92:8992, key (163, data, 60)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 707): try_read_node: LEB 92:8992, data node, length 862
UBIFS DBG (pid 653): fallible_read_node: LEB 91:93488, key (163, data, 32)
UBIFS DBG (pid 653): try_read_node: LEB 91:93488, data node, length 1318
UBIFS DBG (pid 707): do_readpage: ino 163, pg 61, i_size 515924, flags 0x1
UBIFS DBG (pid 707): ubifs_lookup_level0: search key (163, data, 61)
UBIFS DBG (pid 707): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 707): fallible_read_node: LEB 92:9856, key (163, data, 61)
UBIFS DBG (pid 707): try_read_node: LEB 92:9856, data node, length 689
UBIFS DBG (pid 653): do_readpage: ino 163, pg 21, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 21)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 91:78544, key (163, data, 21)
UBIFS DBG (pid 653): try_read_node: LEB 91:78544, data node, length 1456
UBIFS DBG (pid 653): do_readpage: ino 163, pg 40, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 40)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 653): fallible_read_node: LEB 91:104528, key (163, data, 40)
UBIFS DBG (pid 653): try_read_node: LEB 91:104528, data node, length 1657
UBIFS DBG (pid 653): do_readpage: ino 163, pg 29, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 29)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 653): fallible_read_node: LEB 91:89264, key (163, data, 29)
UBIFS DBG (pid 653): try_read_node: LEB 91:89264, data node, length 1704
UBIFS DBG (pid 711): do_readpage: ino 163, pg 28, i_size 515924, flags 0x1
UBIFS DBG (pid 711): ubifs_lookup_level0: search key (163, data, 28)
UBIFS DBG (pid 711): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 711): fallible_read_node: LEB 91:87688, key (163, data, 28)
UBIFS DBG (pid 711): try_read_node: LEB 91:87688, data node, length 1575
UBIFS DBG (pid 709): do_readpage: ino 163, pg 20, i_size 515924, flags 0x1
UBIFS DBG (pid 709): ubifs_lookup_level0: search key (163, data, 20)
UBIFS DBG (pid 709): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 709): fallible_read_node: LEB 91:76928, key (163, data, 20)
UBIFS DBG (pid 709): try_read_node: LEB 91:76928, data node, length 1610
UBIFS DBG (pid 653): do_readpage: ino 163, pg 18, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 18)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 91:73720, key (163, data, 18)
UBIFS DBG (pid 653): try_read_node: LEB 91:73720, data node, length 1401
_XML_GetNodeSet No result: Config.DigitalAudio.Spdif.OnOff
No element is found
process_tuner_msg ready
 UBIFS DBG (pid 653): do_readpage: ino 163, pg 41, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 41)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 91:106192, key (163, data, 41)
UBIFS DBG (pid 653): try_read_node: LEB 91:106192, data node, length 1506
UBIFS DBG (pid 653): do_readpage: ino 84, pg 75, i_size 3258056, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (84, data, 75)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 26:44840, key (84, data, 75)
UBIFS DBG (pid 653): try_read_node: LEB 26:44840, data node, length 790
UBIFS DBG (pid 653): do_readpage: ino 163, pg 79, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 79)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 92:35448, key (163, data, 79)
UBIFS DBG (pid 653): try_read_node: LEB 92:35448, data node, length 1175
_XML_GetNodeSet No result: Config.Video.Conversion
No element is found
UBIFS DBG (pid 653): do_readpage: ino 163, pg 74, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 74)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 92:27824, key (163, data, 74)
UBIFS DBG (pid 653): try_read_node: LEB 92:27824, data node, length 1731
_XML_GetNodeSet No result: Config.Video.Ratio
No element is found
[set_vout_param] unknown configured screen ration: , use default value 4:3
UBIFS DBG (pid 653): do_readpage: ino 163, pg 39, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 39)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 653): fallible_read_node: LEB 91:103552, key (163, data, 39)
UBIFS DBG (pid 653): try_read_node: LEB 91:103552, data node, length 973
UBIFS DBG (pid 653): do_readpage: ino 163, pg 65, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 65)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 653): fallible_read_node: LEB 92:14960, key (163, data, 65)
UBIFS DBG (pid 653): try_read_node: LEB 92:14960, data node, length 1309
*** 00:00:00.704 nexus_smartcard: Open smart card slot:0
KBD initializing...
UBIFS DBG (pid 716): do_readpage: ino 163, pg 30, i_size 515924, flags 0x21
UBIFS DBG (pid 716): ubifs_lookup_level0: search key (163, data, 30)
UBIFS DBG (pid 716): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 716): fallible_read_node: LEB 91:90968, key (163, data, 30)
UBIFS DBG (pid 716): try_read_node: LEB 91:90968, data node, length 1211
UBIFS DBG (pid 716): do_readpage: ino 163, pg 31, i_size 515924, flags 0x1
UBIFS DBG (pid 716): ubifs_lookup_level0: search key (163, data, 31)
UBIFS DBG (pid 716): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 716): fallible_read_node: LEB 91:92184, key (163, data, 31)
UBIFS DBG (pid 716): try_read_node: LEB 91:92184, data node, length 1302
KBD successully initialized !
@@@@@@@@@@@@@@@@@@@@@@@@@@DRV_KeySetCallBack :0x41e0b0
UBIFS DBG (pid 718): do_readpage: ino 163, pg 22, i_size 515924, flags 0x1
UBIFS DBG (pid 718): ubifs_lookup_level0: search key (163, data, 22)
UBIFS DBG (pid 718): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 718): fallible_read_node: LEB 91:80000, key (163, data, 22)
UBIFS DBG (pid 718): try_read_node: LEB 91:80000, data node, length 1501
_XML_GetNodeSet No result: platform_main
No element is found
UBIFS DBG (pid 653): do_readpage: ino 163, pg 34, i_size 515924, flags 0x1
UBIFS DBG (pid 653): ubifs_lookup_level0: search key (163, data, 34)
UBIFS DBG (pid 653): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 653): fallible_read_node: LEB 91:95984, key (163, data, 34)
UBIFS DBG (pid 653): try_read_node: LEB 91:95984, data node, length 1451
platform_main_init_ok
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
UBIFS DBG (pid 444): ubifs_lookup: 'mtc.sh' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0xc21e3e0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): ubifs_read_node: LEB 105:52176, direntry node,
length 63
UBIFS DBG (pid 444): ubifs_iget: inode 183
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:19392, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:19392, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 105:52016, key (183, inode)
UBIFS DBG (pid 444): try_read_node: LEB 105:52016, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 183, pg 0, i_size 339, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 105:51752, key (183, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 105:51752, data node, length 258
UBIFS DBG (pid 444): ubifs_lookup: 'application.env' in dir ino 65
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (65, direntry,
0x5b87476)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 444): ubifs_read_node: LEB 154:108968, direntry node,
length 72
UBIFS DBG (pid 444): ubifs_iget: inode 988
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, inode)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108808, key (988, inode)
UBIFS DBG (pid 444): try_read_node: LEB 154:108808, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 988, pg 0, i_size 2894, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108064, key (988, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 154:108064, data node, length 741
UBIFS DBG (pid 444): ubifs_lookup: 'sed' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x28c69d)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 0, lvl 0, n 3
UBIFS DBG (pid 444): ubifs_lookup: not found
UBIFS DBG (pid 727): ubifs_lookup: 'application' in dir ino 65
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (65, direntry,
0xe1931f)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 154:107992, direntry node,
length 68
UBIFS DBG (pid 727): ubifs_iget: inode 115
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (115, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:63904, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:63904, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:16408, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:16408, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:18240, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:18240, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 727): fallible_read_node: LEB 154:107832, key (115, inode)
UBIFS DBG (pid 727): try_read_node: LEB 154:107832, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'cloudbb' in dir ino 115
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (115, direntry,
0xcf80fb)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:16600, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:16600, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:18432, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:18432, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:87272, direntry node, length 64
UBIFS DBG (pid 727): ubifs_iget: inode 200
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (200, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:64480, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:64480, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:21592, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:21592, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:58368, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:58368, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 727): fallible_read_node: LEB 67:87112, key (200, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:87112, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'vinput_modules' in dir ino 200
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (200, direntry,
0xda684a3)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:86384, direntry node, length 71
UBIFS DBG (pid 727): ubifs_iget: inode 221
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (221, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:64672, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:64672, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:22936, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:22936, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:69504, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:69504, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 727): fallible_read_node: LEB 67:86224, key (221, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:86224, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'install_vinput.sh' in dir ino 221
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (221, direntry,
0x3928132)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:79832, direntry node, length 74
UBIFS DBG (pid 727): ubifs_iget: inode 222
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (222, inode)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 727): fallible_read_node: LEB 67:79672, key (222, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:79672, inode node, length 160
UBIFS DBG (pid 727): do_readpage: ino 222, pg 0, i_size 182, flags 0x1
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (222, data, 0)
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:69696, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:69696, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 727): fallible_read_node: LEB 67:79496, key (222, data, 0)
UBIFS DBG (pid 727): try_read_node: LEB 67:79496, data node, length 169
UBIFS DBG (pid 728): ubifs_lookup: 'dirname' in dir ino 152
UBIFS DBG (pid 728): ubifs_lookup_level0: search key (152, direntry,
0xeb21cb5)
UBIFS DBG (pid 728): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 728): ubifs_lookup: not found
UBIFS DBG (pid 727): ubifs_lookup: 'chmod' in dir ino 152
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (152, direntry,
0x10df8542)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 727): ubifs_lookup: not found
UBIFS DBG (pid 733): ubifs_lookup: 'vkbd.ko' in dir ino 221
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (221, direntry,
0x1f1578a1)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 733): ubifs_read_node: LEB 67:83072, direntry node, length 64
UBIFS DBG (pid 733): ubifs_iget: inode 223
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 733): fallible_read_node: LEB 67:82912, key (223, inode)
UBIFS DBG (pid 733): try_read_node: LEB 67:82912, inode node, length 160
UBIFS DBG (pid 733): do_readpage: ino 223, pg 0, i_size 6694, flags 0x1
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, data, 0)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 733): fallible_read_node: LEB 67:79912, key (223, data, 0)
UBIFS DBG (pid 733): try_read_node: LEB 67:79912, data node, length 1792
UBIFS DBG (pid 733): do_readpage: ino 223, pg 1, i_size 6694, flags 0x1
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, data, 1)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 733): fallible_read_node: LEB 67:81704, key (223, data, 1)
UBIFS DBG (pid 733): try_read_node: LEB 67:81704, data node, length 1201
input: vkeyboard as /class/input/input0
UBIFS DBG (pid 736): ubifs_lookup: 'vmouse.ko' in dir ino 221
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (221, direntry,
0x2ec3295)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 736): ubifs_read_node: LEB 67:86152, direntry node, length 66
UBIFS DBG (pid 736): ubifs_iget: inode 224
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, inode)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 736): fallible_read_node: LEB 67:85992, key (224, inode)
UBIFS DBG (pid 736): try_read_node: LEB 67:85992, inode node, length 160
UBIFS DBG (pid 736): do_readpage: ino 224, pg 0, i_size 6541, flags 0x1
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, data, 0)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 736): fallible_read_node: LEB 67:83136, key (224, data, 0)
UBIFS DBG (pid 736): try_read_node: LEB 67:83136, data node, length 1715
UBIFS DBG (pid 736): do_readpage: ino 224, pg 1, i_size 6541, flags 0x1
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, data, 1)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 736): fallible_read_node: LEB 67:84856, key (224, data, 1)
UBIFS DBG (pid 736): try_read_node: LEB 67:84856, data node, length 1132
input: vmouse as /class/input/input1
UBIFS DBG (pid 444): ubifs_lookup: 'mtcenable' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x10cf5113)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): ubifs_read_node: LEB 106:33968, direntry node,
length 66
UBIFS DBG (pid 444): ubifs_iget: inode 202
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (202, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:57408, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:57408, level 2, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:43176, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:43176, level 1, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:21504, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:21504, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): fallible_read_node: LEB 106:33808, key (202, inode)
UBIFS DBG (pid 444): try_read_node: LEB 106:33808, inode node, length 160
wait for manually start mtc by executing mtc_start.sh.
oof End ------------------------->
starting pid 1, tty '/dev/ttyS0': '/bin/login -f root'
Jan  1 00:00:28 login[741]: root login on 'ttyS0'
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
none on /proc/bus/usb type usbfs (rw,relatime)
debugfs on /proc/sys/debug type debugfs (rw,relatime)
sys on /sys type sysfs (rw,relatime)
tmpfs on /dev type tmpfs (rw,relatime,size=64k,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /tmp type tmpfs (rw,relatime)
ubi12:platform on /usr/local/hmt/platform type ubifs (rw,relatime)
ubi13_0 on /usr/local/hmt/appdata type ubifs (rw,sync,relatime)
ubi14_0 on /usr/local/hmt/.appmid type ubifs (rw,relatime)
#
#
#
# echo 7 > /proc/sys/kernel/printk
doneile :; do cp -a /usr/local/hmt/platform/f2 /usr/local/hmt/appdata/
&& sync;
UBIFS DBG (pid 791): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 112:4096, direntry node,
length 59, jhead 1
UBIFS DBG (pid 791): ubifs_read_node: LEB 112:4096, direntry node, length 59
UBIFS DBG (pid 791): ubifs_iget: inode 223
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 791): ubifs_read_node: LEB 110:71424, indexing node,
length 188
UBIFS DBG (pid 791): read_znode: LEB 110:71424, level 2, 8 branch
UBIFS DBG (pid 791): ubifs_read_node: LEB 110:69504, indexing node,
length 188
UBIFS DBG (pid 791): read_znode: LEB 110:69504, level 1, 8 branch
UBIFS DBG (pid 791): ubifs_read_node: LEB 110:69120, indexing node,
length 188
UBIFS DBG (pid 791): read_znode: LEB 110:69120, level 0, 8 branch
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 112:6144, inode node,
length 160, jhead 1
UBIFS DBG (pid 791): ubifs_read_node: LEB 112:6144, inode node, length 160
UBIFS DBG (pid 791): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 791): ubifs_iget: inode 74
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (74, inode)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 15:120832, inode node,
length 160, jhead 1
UBIFS DBG (pid 791): ubifs_read_node: LEB 15:120832, inode node, length 160
UBIFS DBG (pid 791): ubifs_unlink: dent 'f2' from ino 74 (nlink 1) in
dir ino 1
UBIFS DBG (pid 791): ubifs_jnl_update: ino 74, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 791): ubifs_find_free_space: min_space 384
UBIFS DBG (pid 791): ubifs_change_lp: LEB 14, free -2147483647, dirty
-2147483647, flags 20
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 14, free 126976, dirty
0, flags 4
UBIFS DBG (pid 791): ubifs_find_free_space: found LEB 14, free 126976
UBIFS DBG (pid 791): ubifs_add_bud_to_log: write ref LEB 6:2048
UBIFS DBG (pid 791): ubifs_write_node: LEB 6:2048, reference node,
length 64 (aligned 2048)
UBIFS DBG (pid 791): ubifs_add_bud: LEB 14:0, jhead 1, bud_bytes 311296
UBIFS DBG (pid 791): ubifs_wbuf_seek_nolock: LEB 14:0, jhead 1
UBIFS DBG (pid 791): ubifs_add_orphan: ino 74
UBIFS DBG (pid 791): write_head: jhead 1, LEB 14:0, len 384
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 14:0
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 14, free 126976, dirty
0, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 14, free 126592, dirty 0, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 14, free 126976, dirty
0, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 14:0, 384 bytes, jhead 1
_range: removing (74, data, 134)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126208, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126300, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126208, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 135)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126304, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126396, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126304, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 136)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126400, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126492, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126400, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 137)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126496, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126588, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126496, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 138)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126592, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126684, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126592, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 139)
UBIFS DBG (pid 791): tnc_delete: deleting (74, data, 132)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126688, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126780, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126688, flags 1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (74, inode)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 81920, dirty
44016, flags 48
UBIFS DBG (pid 791): ubifs_change_lp: LEB 12, free -2147483647, dirty
44204, flags 48
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 81920, dirty
44016, flags 48
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126784, flags 1
UBIFS DBG (pid 791): ubifs_change_lp: LEB 19, free -2147483647, dirty
126876, flags 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 19, free 0, dirty
126784, flags 1
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 141)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66392, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 24, free -2147483647, dirty
66484, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66392, flags 16
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 142)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66488, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 24, free -2147483647, dirty
66580, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66488, flags 16
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 143)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66584, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 24, free -2147483647, dirty
66676, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66584, flags 16
UBIFS DBG (pid 791): ubifs_tnc_remove_range: removing (74, data, 144)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66680, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 24, free -2147483647, dirty
66772, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 24, free 57344, dirty
66680, flags 16
UBIFS DBG (pid 791): ubifs_tnc_removeDBG (pid 791): ubifs_writepage: ino
75, pg 81, pg flags 0xb0d
UBIFS DBG (pid 791): ubifs_write_inode: inode 75, mode 0x81a4, nlink 1
UBIFS DBG (pid 791): ubifs_jnl_write_inode: ino 75, nlink 1
UBIFS DBG (pid 791): write_head: jhead 1, LEB 22:43008, len 160
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:43008
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 22, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 22:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 22, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 791): ubifs_tnc_add: 22:43008, len 160, key (75, inode)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75, inode)
UBIFS DBG (pid 791): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 22, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 791): ubifs_jnl_write_data: ino 75, blk 81, len 4096, key
(75, data, 81)
UBIFS DBG (pid 791): write_node: jhead 2, LEB 18:108544, len 92
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:108544
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 18, free 18336, dirty 103456,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_tnc_add: 18:108544, len 92, key (75, data, 81)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75,
data, 81)
UBIFS DBG (pid 791): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 791): tnc_insert: inserted at 5 level 0, key (75, data, 81)
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 18:108544, 96 bytes,
jhead 2
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 18, free 18336, dirty
103456, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 18, free 16384, dirty 105408,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 18, free 18336, dirty
103456, flags 16
UBIFS DBG (pid 791): do_readpage: ino 223, pg 82, i_size 1048576, flags 0x1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (223, data, 82)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 108:81600, data node,
length 92, jhead 2
UBIFS DBG (pid 791): ubifs_read_node: LEB 108:81600, data node, length 92
UBIFS DBG (pid 791): ubifs_write_end: ino 75, pos 335872, pg 82, len
4096, copied 4096, i_size 335872
UBIFS DBG (pid 791): ubifs_dirty_inode: inode 75
UBIFS DBG (pid 791): ubifs_writepage: ino 75, pg 82, pg flags 0xb0d
UBIFS DBG (pid 791): ubifs_write_inode: inode 75, mode 0x81a4, nlink 1
UBIFS DBG (pid 791): ubifs_jnl_write_inode: ino 75, nlink 1
UBIFS DBG (pid 791): write_head: jhead 1, LEB 22:45056, len 160
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:45056
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
44896, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 22, free 81760, dirty 44896,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 22, free 81920, dirty
44896, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UB0, data node, length 92, jhead 2
UBIFS DBG (pid 791): ubifs_read_node: LEB 108:89760, data node, length 92
UBIFS DBG (pid 791): ubifs_write_end: ino 75, pos 684032, pg 167, len
4096, copied 4096, i_size 684032
UBIFS DBG (pid 791): ubifs_dirty_inode: inode 75
UBIFS DBG (pid 791): ubifs_writepage: ino 75, pg 167, pg flags 0xb0d
UBIFS DBG (pid 791): ubifs_write_inode: inode 75, mode 0x81a4, nlink 1
UBIFS DBG (pid 791): ubifs_jnl_write_inode: ino 75, nlink 1
UBIFS DBG (pid 791): write_head: jhead 1, LEB 20:92160, len 160
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:92160
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 34816, dirty
92000, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 20, free 34656, dirty 92000,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 34816, dirty
92000, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 20:92160, 160 bytes,
jhead 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 34656, dirty
92000, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 20, free 32768, dirty 93888,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 34656, dirty
92000, flags 16
UBIFS DBG (pid 791): ubifs_tnc_add: 20:92160, len 160, key (75, inode)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75, inode)
UBIFS DBG (pid 791): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 32768, dirty
93888, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 20, free -2147483647, dirty
94048, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 32768, dirty
93888, flags 16
UBIFS DBG (pid 791): ubifs_jnl_write_data: ino 75, blk 167, len 4096,
key (75, data, 167)
UBIFS DBG (pid 791): write_node: jhead 2, LEB 10:30720, len 92
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:30720
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 10, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 10, free 96160, dirty 29280,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 10, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_tnc_add: 10:30720, len 92, key (75, data, 167)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75,
data, 167)
UBIFS DBG (pid 791): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 791): tnc_insert: inserted at 3 level 0, key (75, data, 167)
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 10:30720, 96 bytes, jhead 2
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 10, free 96160, dirty
29280, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 10, free 94208, dirty 31232,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 10, free 96160, dirty
29280, flags 16
UBIFS DBG (pid 791): do_readpage: ino 223, pg 168, i_size 1048576, flags 0x1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (223, data, 168)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 108:89856, data node,
length 92, jhead 2
UBIFS DBG (pid 791): ubifs_read_node: LEB 108:89856, data node, length 92
UBIFS DBG (pid 791): ubifs_write_end: ino 75, pos 688128, pg 168, len
4096, copied 4096, i_size 688128
UBIFS DBG (pid 791): ubifs_dirty_inode: inode 75
UBIFS DBG (pid 791): ubifs_writepage: ino 75, pg 168, pg flags 0xb0d
UBIFS DBG (pid 791): ubifs_write_inode: inode 75, mode 0x81a4, nlink 1
UBIFS DBG (pid 791): ubifs_jnl_write_inode: ino 75, nlink 1
UBIFS DBG (pid 791): write_head: jhead 1, LEB 20:94208, len 160
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:94208
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 20, free 32768, dirty
94048, tes (inode node) to jhead 1 wbuf at LEB 16:2048
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 124928, dirty
1888, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 16, free 124768, dirty 1888,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 124928, dirty
1888, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 16:2048, 160 bytes, jhead 1
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 124768, dirty
1888, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 16, free 122880, dirty 3776,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 124768, dirty
1888, flags 16
UBIFS DBG (pid 791): ubifs_tnc_add: 16:2048, len 160, key (75, inode)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75, inode)
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 73728, dirty
46176, flags 48
UBIFS DBG (pid 791): ubifs_change_lp: LEB 12, free -2147483647, dirty
46364, flags 48
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 73728, dirty
46176, flags 48
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 73728, dirty
46368, flags 48
UBIFS DBG (pid 791): ubifs_change_lp: LEB 12, free -2147483647, dirty
46556, flags 48
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 12, free 73728, dirty
46368, flags 48
UBIFS DBG (pid 791): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 122880, dirty
3776, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 16, free -2147483647, dirty
3936, flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 122880, dirty
3776, flags 16
UBIFS DBG (pid 791): ubifs_jnl_write_data: ino 75, blk 247, len 4096,
key (75, data, 247)
UBIFS DBG (pid 791): write_node: jhead 2, LEB 25:67584, len 92
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 25:67584
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 25, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 25, free 59296, dirty 64416,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 25, free 59392, dirty
64416, flags 16
UBIFS DBG (pid 791): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 791): ubifs_tnc_add: 25:67584, len 92, key (75, data, 247)
UBIFS DBG (pid 791): lookup_level0_dirty: search and dirty key (75,
data, 247)
UBIFS DBG (pid 791): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 791): tnc_insert: inserted at 3 level 0, key (75, data, 247)
UBIFS DBG (pid 791): ubifs_wbuf_sync_nolock: LEB 25:67584, 96 bytes, jhead 2
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 25, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 25, free 57344, dirty 66368,
flags 16
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 25, free 59296, dirty
64416, flags 16
UBIFS DBG (pid 791): do_readpage: ino 223, pg 248, i_size 1048576, flags 0x1
UBIFS DBG (pid 791): ubifs_lookup_level0: search key (223, data, 248)
UBIFS DBG (pid 791): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 791): ubifs_read_node_wbuf: LEB 108:97536, data node,
length 92, jhead 2
UBIFS DBG (pid 791): ubifs_read_node: LEB 108:97536, data node, length 92
UBIFS DBG (pid 791): ubifs_write_end: ino 75, pos 1015808, pg 248, len
4096, copied 4096, i_size 1015808
UBIFS DBG (pid 791): ubifs_dirty_inode: inode 75
UBIFS DBG (pid 791): ubifs_writepage: ino 75, pg 248, pg flags 0xb0d
UBIFS DBG (pid 791): ubifs_write_inode: inode 75, mode 0x81a4, nlink 1
UBIFS DBG (pid 791): ubifs_jnl_write_inode: ino 75, nlink 1
UBIFS DBG (pid 791): write_head: jhead 1, LEB 16:4096, len 160
UBIFS DBG (pid 791): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:4096
UBIFS DBG (pid 791): ubifs_lpt_lookup_dirty: LEB 16, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 791): ubifs_change_lp: LEB 16, free 12vel0_dirty: found
1, lvl 0, n 3
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 86016, dirty
40640, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 20, free -2147483647, dirty
40800, flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 86016, dirty
40640, flags 16
UBIFS DBG (pid 793): ubifs_jnl_write_data: ino 76, blk 66, len 4096, key
(76, data, 66)
UBIFS DBG (pid 793): write_node: jhead 2, LEB 22:94208, len 92
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 22:94208
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 22, free 32672, dirty 89792,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_tnc_add: 22:94208, len 92, key (76, data, 66)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76,
data, 66)
UBIFS DBG (pid 793): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 793): tnc_insert: inserted at 6 level 0, key (76, data, 66)
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 22:94208, 96 bytes, jhead 2
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 22, free 30720, dirty 91744,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 793): ubifs_write_end: ino 76, pos 274432, pg 67, len
4096, copied 4096, i_size 274432
UBIFS DBG (pid 793): ubifs_dirty_inode: inode 76
UBIFS DBG (pid 793): ubifs_writepage: ino 76, pg 67, pg flags 0xb0d
UBIFS DBG (pid 793): ubifs_write_inode: inode 76, mode 0x81a4, nlink 1
UBIFS DBG (pid 793): ubifs_jnl_write_inode: ino 76, nlink 1
UBIFS DBG (pid 793): write_head: jhead 1, LEB 20:40960, len 160
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:40960
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 86016, dirty
40800, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 20, free 85856, dirty 40800,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 86016, dirty
40800, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 20:40960, 160 bytes,
jhead 1
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 85856, dirty
40800, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 20, free 83968, dirty 42688,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 85856, dirty
40800, flags 16
UBIFS DBG (pid 793): ubifs_tnc_add: 20:40960, len 160, key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 20, free -2147483647, dirty
42848, flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 20, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 793): ubifs_jnl_write_data: ino 76, blk 67, len 4096, key
(76, data, 67)
UBIFS DBG (pid 793): write_node: jhead 2, LEB 22:96256, len 92
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 22:96256
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 30720, dirty
91744, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 22, free 30624, dirty 91744,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 22, free 30720, dirty
91744, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_tnc_add: 22:96256, len 92, key (76, data, 67)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76,
data, 67)
UBIFS DBG (pid 793): lookup_level0_dirty: found 0<7>UBIFS DBG (pid 793):
tnc_insert: inserting at 0 level 0, key (76, data, 172)
UBIFS DBG (pid 793): tnc_insert: inserted at 1 level 1, key (76, data, 172)
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 13:57344, 96 bytes, jhead 2
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 13, free 67584, dirty 56608,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 793): ubifs_write_end: ino 76, pos 708608, pg 173, len
4096, copied 4096, i_size 708608
UBIFS DBG (pid 793): ubifs_dirty_inode: inode 76
UBIFS DBG (pid 793): ubifs_writepage: ino 76, pg 173, pg flags 0xb0d
UBIFS DBG (pid 793): ubifs_write_inode: inode 76, mode 0x81a4, nlink 1
UBIFS DBG (pid 793): ubifs_jnl_write_inode: ino 76, nlink 1
UBIFS DBG (pid 793): write_head: jhead 1, LEB 10:4096, len 160
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:4096
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 10, free 122720, dirty 3936,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 10:4096, 160 bytes, jhead 1
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 10, free 120832, dirty 5824,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 793): ubifs_tnc_add: 10:4096, len 160, key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 10, free -2147483647, dirty
5984, flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 793): ubifs_jnl_write_data: ino 76, blk 173, len 4096,
key (76, data, 173)
UBIFS DBG (pid 793): write_node: jhead 2, LEB 13:59392, len 92
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 13:59392
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 13, free 67488, dirty 56608,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_tnc_add: 13:59392, len 92, key (76, data, 173)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76,
data, 173)
UBIFS DBG (pid 793): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 793): tnc_insert: inserted at 1 level 0, key (76, data, 173)
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 13:59392, 96 bytes, jhead 2
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 13, free 65536, dirty 58560,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 13, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 793): ubifs_write_end: ino 76, pos 712704, pg 174, len
4096, copied 4096, i_size 712704
UBIFS DBG (pid 793): ubifs_dirty_inode: inode 76
UBIFS DBG (pid 793): ubifs_writepage: ino 76, pg 174, pg flags 0xb0d
UBIFS DBG (pid 793): ubifs_write_inode: inode 76, mode 0x81a4, nlink 1
UBIFS DBG (pid 793): ubifs_jnl_write_inode: ino 76, nlink 1
UBIFS DBG (pid 793): write_head: jhead 1, LEB 10:6144, len 160
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:6144
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 10, free 120832, dirty
5984, fS DBG (pid 793): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:96256
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 30720, dirty
91744, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 21, free 30624, dirty 91744,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 30720, dirty
91744, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_tnc_add: 21:96256, len 92, key (76, data, 253)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76,
data, 253)
UBIFS DBG (pid 793): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 793): tnc_insert: inserted at 1 level 0, key (76, data, 253)
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 21:96256, 96 bytes, jhead 2
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 30624, dirty
91744, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 21, free 28672, dirty 93696,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 30624, dirty
91744, flags 16
UBIFS DBG (pid 793): ubifs_write_end: ino 76, pos 1040384, pg 254, len
4096, copied 4096, i_size 1040384
UBIFS DBG (pid 793): ubifs_dirty_inode: inode 76
UBIFS DBG (pid 793): ubifs_writepage: ino 76, pg 254, pg flags 0xb0d
UBIFS DBG (pid 793): ubifs_write_inode: inode 76, mode 0x81a4, nlink 1
UBIFS DBG (pid 793): ubifs_jnl_write_inode: ino 76, nlink 1
UBIFS DBG (pid 793): write_head: jhead 1, LEB 24:43008, len 160
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 24:43008
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 24, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 24:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 24, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 793): ubifs_tnc_add: 24:43008, len 160, key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76, inode)
UBIFS DBG (pid 793): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 24, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 24, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 793): ubifs_jnl_write_data: ino 76, blk 254, len 4096,
key (76, data, 254)
UBIFS DBG (pid 793): write_node: jhead 2, LEB 21:98304, len 92
UBIFS DBG (pid 793): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:98304
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 28672, dirty
93696, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 21, free 28576, dirty 93696,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 28672, dirty
93696, flags 16
UBIFS DBG (pid 793): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 793): ubifs_tnc_add: 21:98304, len 92, key (76, data, 254)
UBIFS DBG (pid 793): lookup_level0_dirty: search and dirty key (76,
data, 254)
UBIFS DBG (pid 793): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 793): tnc_insert: inserted at 2 level 0, key (76, data, 254)
UBIFS DBG (pid 793): ubifs_wbuf_sync_nolock: LEB 21:98304, 96 bytes, jhead 2
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 28576, dirty
93696, flags 16
UBIFS DBG (pid 793): ubifs_change_lp: LEB 21, free 26624, dirty 95648,
flags 16
UBIFS DBG (pid 793): ubifs_lpt_lookup_dirty: LEB 21, free 28576, dirty
93696, flags 16
UBIFS DBG (pid 7kup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 797): tnc_insert: inserted at 1 level 0, key (77, data, 85)
UBIFS DBG (pid 797): ubifs_wbuf_sync_nolock: LEB 10:22528, 96 bytes, jhead 2
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 104352, dirty
21472, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 10, free 102400, dirty 23424,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 104352, dirty
21472, flags 16
UBIFS DBG (pid 797): ubifs_write_end: ino 77, pos 352256, pg 86, len
4096, copied 4096, i_size 352256
UBIFS DBG (pid 797): ubifs_dirty_inode: inode 77
UBIFS DBG (pid 797): ubifs_writepage: ino 77, pg 86, pg flags 0xb0d
UBIFS DBG (pid 797): ubifs_write_inode: inode 77, mode 0x81a4, nlink 1
UBIFS DBG (pid 797): ubifs_jnl_write_inode: ino 77, nlink 1
UBIFS DBG (pid 797): write_head: jhead 1, LEB 20:106496, len 160
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:106496
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 20, free 20320, dirty 106336,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 797): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 797): ubifs_wbuf_sync_nolock: LEB 20:106496, 160 bytes,
jhead 1
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 20, free 18432, dirty 108224,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 797): ubifs_tnc_add: 20:106496, len 160, key (77, inode)
UBIFS DBG (pid 797): lookup_level0_dirty: search and dirty key (77, inode)
UBIFS DBG (pid 797): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 20, free -2147483647, dirty
108384, flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 797): ubifs_jnl_write_data: ino 77, blk 86, len 4096, key
(77, data, 86)
UBIFS DBG (pid 797): write_node: jhead 2, LEB 10:24576, len 92
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:24576
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 102400, dirty
23424, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 10, free 102304, dirty 23424,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 102400, dirty
23424, flags 16
UBIFS DBG (pid 797): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 797): ubifs_tnc_add: 10:24576, len 92, key (77, data, 86)
UBIFS DBG (pid 797): lookup_level0_dirty: search and dirty key (77,
data, 86)
UBIFS DBG (pid 797): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 797): tnc_insert: inserted at 2 level 0, key (77, data, 86)
UBIFS DBG (pid 797): ubifs_wbuf_sync_nolock: LEB 10:24576, 96 bytes, jhead 2
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 102304, dirty
23424, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 10, free 100352, dirty 25376,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 10, free 102304, dirty
23424, flags 16
UBIFS DBG (pid 797): ubifs_write_end: ino 77, pos 356352, pg 87, len
4096, copied 4096, i_size 356352
UBIFS DBG (pid 797): ubifs_dirty_inode: inode 77
UBIFS DBG (pid 797): ubifs_writepage: ino 77, pg 87, pg flags 0xb0d
UBIFS DBG (pid 797): ubifs_write_inode: inode 77, mode 0x81a4, nlink 1
UBIFS DBG (pid 797): ubifs_jnl_write_inode: ino 77, nlink 1
UBIFS DBG (pid 797): write_head: jhead 1, LEB 20:108544, len 160
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:108544
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 20, free 18432, dirty
108384, flags 16
UBIFS DBG_lookup_dirty: LEB 13, free 55296, dirty 71360, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 13, free -2147483647, dirty
71520, flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 55296, dirty
71360, flags 16
UBIFS DBG (pid 797): ubifs_jnl_write_data: ino 77, blk 192, len 4096,
key (77, data, 192)
UBIFS DBG (pid 797): write_node: jhead 2, LEB 18:114688, len 92
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:114688
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 12288, dirty
109312, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 18, free 12192, dirty 109312,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 12288, dirty
109312, flags 16
UBIFS DBG (pid 797): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 797): ubifs_tnc_add: 18:114688, len 92, key (77, data, 192)
UBIFS DBG (pid 797): lookup_level0_dirty: search and dirty key (77,
data, 192)
UBIFS DBG (pid 797): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 797): tnc_insert: inserted at 4 level 0, key (77, data, 192)
UBIFS DBG (pid 797): ubifs_wbuf_sync_nolock: LEB 18:114688, 96 bytes,
jhead 2
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 12192, dirty
109312, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 18, free 10240, dirty 111264,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 12192, dirty
109312, flags 16
UBIFS DBG (pid 797): ubifs_write_end: ino 77, pos 790528, pg 193, len
4096, copied 4096, i_size 790528
UBIFS DBG (pid 797): ubifs_dirty_inode: inode 77
UBIFS DBG (pid 797): ubifs_writepage: ino 77, pg 193, pg flags 0xb0d
UBIFS DBG (pid 797): ubifs_write_inode: inode 77, mode 0x81a4, nlink 1
UBIFS DBG (pid 797): ubifs_jnl_write_inode: ino 77, nlink 1
UBIFS DBG (pid 797): write_head: jhead 1, LEB 13:71680, len 160
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:71680
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 13, free 55136, dirty 71520,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 797): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 797): ubifs_wbuf_sync_nolock: LEB 13:71680, 160 bytes,
jhead 1
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 13, free 53248, dirty 73408,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 797): ubifs_tnc_add: 13:71680, len 160, key (77, inode)
UBIFS DBG (pid 797): lookup_level0_dirty: search and dirty key (77, inode)
UBIFS DBG (pid 797): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 13, free -2147483647, dirty
73568, flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 13, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 797): ubifs_jnl_write_data: ino 77, blk 193, len 4096,
key (77, data, 193)
UBIFS DBG (pid 797): write_node: jhead 2, LEB 18:116736, len 92
UBIFS DBG (pid 797): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:116736
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 10240, dirty
111264, flags 16
UBIFS DBG (pid 797): ubifs_change_lp: LEB 18, free 10144, dirty 111264,
flags 16
UBIFS DBG (pid 797): ubifs_lpt_lookup_dirty: LEB 18, free 10240, dirty
111264, flags 16
UBIFS DBG (pid 797): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 797): ubifs_tnc_add: 18:116736, len 92, key (77, data, 193)
UBIFS DBG (pid 797): lookup_level0_dirty: search and dirty key (77,
data, 193)
UBIFS DBG (pid 797): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 797): t96, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 22, free -2147483647, dirty
112256, flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 14336, dirty
112096, flags 16
UBIFS DBG (pid 799): ubifs_jnl_write_data: ino 78, blk 13, len 4096, key
(78, data, 13)
UBIFS DBG (pid 799): write_node: jhead 2, LEB 16:18432, len 92
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:18432
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 108544, dirty
17568, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 16, free 108448, dirty 17568,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 108544, dirty
17568, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_tnc_add: 16:18432, len 92, key (78, data, 13)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78,
data, 13)
UBIFS DBG (pid 799): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 799): tnc_insert: inserted at 1 level 0, key (78, data, 13)
UBIFS DBG (pid 799): ubifs_wbuf_sync_nolock: LEB 16:18432, 96 bytes, jhead 2
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 108448, dirty
17568, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 16, free 106496, dirty 19520,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 108448, dirty
17568, flags 16
UBIFS DBG (pid 799): ubifs_write_end: ino 78, pos 57344, pg 14, len
4096, copied 4096, i_size 57344
UBIFS DBG (pid 799): ubifs_dirty_inode: inode 78
UBIFS DBG (pid 799): ubifs_writepage: ino 78, pg 14, pg flags 0xb0d
UBIFS DBG (pid 799): ubifs_write_inode: inode 78, mode 0x81a4, nlink 1
UBIFS DBG (pid 799): ubifs_jnl_write_inode: ino 78, nlink 1
UBIFS DBG (pid 799): write_head: jhead 1, LEB 22:112640, len 160
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:112640
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 14336, dirty
112256, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 22, free 14176, dirty 112256,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 14336, dirty
112256, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_wbuf_sync_nolock: LEB 22:112640, 160 bytes,
jhead 1
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 14176, dirty
112256, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 22, free 12288, dirty 114144,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 14176, dirty
112256, flags 16
UBIFS DBG (pid 799): ubifs_tnc_add: 22:112640, len 160, key (78, inode)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78, inode)
UBIFS DBG (pid 799): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 12288, dirty
114144, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 22, free -2147483647, dirty
114304, flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 22, free 12288, dirty
114144, flags 16
UBIFS DBG (pid 799): ubifs_jnl_write_data: ino 78, blk 14, len 4096, key
(78, data, 14)
UBIFS DBG (pid 799): write_node: jhead 2, LEB 16:20480, len 92
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:20480
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 16, free 106400, dirty 19520,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 16, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_tnc_add: 16:20480, len 92, key (78, data, 14)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78,
data, 14)
UBIFS DBG (pid 799): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 799): tnc_insert: inserted at 2 level 0, key (78, data,
10, free 51200, dirty 75456, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 10, free -2147483647, dirty
75616, flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 51200, dirty
75456, flags 16
UBIFS DBG (pid 799): ubifs_jnl_write_data: ino 78, blk 119, len 4096,
key (78, data, 119)
UBIFS DBG (pid 799): write_node: jhead 2, LEB 18:108544, len 92
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:108544
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 18, free 18336, dirty 103456,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 18432, dirty
103456, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_tnc_add: 18:108544, len 92, key (78, data, 119)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78,
data, 119)
UBIFS DBG (pid 799): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 799): tnc_insert: inserted at 3 level 0, key (78, data, 119)
UBIFS DBG (pid 799): ubifs_wbuf_sync_nolock: LEB 18:108544, 96 bytes,
jhead 2
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 18336, dirty
103456, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 18, free 16384, dirty 105408,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 18336, dirty
103456, flags 16
UBIFS DBG (pid 799): ubifs_write_end: ino 78, pos 491520, pg 120, len
4096, copied 4096, i_size 491520
UBIFS DBG (pid 799): ubifs_dirty_inode: inode 78
UBIFS DBG (pid 799): ubifs_writepage: ino 78, pg 120, pg flags 0xb0d
UBIFS DBG (pid 799): ubifs_write_inode: inode 78, mode 0x81a4, nlink 1
UBIFS DBG (pid 799): ubifs_jnl_write_inode: ino 78, nlink 1
UBIFS DBG (pid 799): write_head: jhead 1, LEB 10:75776, len 160
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:75776
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 10, free 51040, dirty 75616,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_wbuf_sync_nolock: LEB 10:75776, 160 bytes,
jhead 1
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 10, free 49152, dirty 77504,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 799): ubifs_tnc_add: 10:75776, len 160, key (78, inode)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78, inode)
UBIFS DBG (pid 799): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 49152, dirty
77504, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 10, free -2147483647, dirty
77664, flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 10, free 49152, dirty
77504, flags 16
UBIFS DBG (pid 799): ubifs_jnl_write_data: ino 78, blk 120, len 4096,
key (78, data, 120)
UBIFS DBG (pid 799): write_node: jhead 2, LEB 18:110592, len 92
UBIFS DBG (pid 799): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:110592
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 16384, dirty
105408, flags 16
UBIFS DBG (pid 799): ubifs_change_lp: LEB 18, free 16288, dirty 105408,
flags 16
UBIFS DBG (pid 799): ubifs_lpt_lookup_dirty: LEB 18, free 16384, dirty
105408, flags 16
UBIFS DBG (pid 799): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 799): ubifs_tnc_add: 18:110592, len 92, key (78, data, 120)
UBIFS DBG (pid 799): lookup_level0_dirty: search and dirty key (78,
data, 120)
UBIFS DBG (pid 799): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 799): tnc_insert: inserte06): lookup_level0_dirty: found
1, lvl 0, n 3
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94208, dirty
32448, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 25, free -2147483647, dirty
32608, flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94208, dirty
32448, flags 16
UBIFS DBG (pid 806): ubifs_jnl_write_data: ino 79, blk 23, len 4096, key
(79, data, 23)
UBIFS DBG (pid 806): write_node: jhead 2, LEB 15:55296, len 92
UBIFS DBG (pid 806): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:55296
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 71680, dirty
53088, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 15, free 71584, dirty 53088,
flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 71680, dirty
53088, flags 16
UBIFS DBG (pid 806): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 806): ubifs_tnc_add: 15:55296, len 92, key (79, data, 23)
UBIFS DBG (pid 806): lookup_level0_dirty: search and dirty key (79,
data, 23)
UBIFS DBG (pid 806): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 806): tnc_insert: inserted at 3 level 0, key (79, data, 23)
UBIFS DBG (pid 806): ubifs_wbuf_sync_nolock: LEB 15:55296, 96 bytes, jhead 2
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 71584, dirty
53088, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 15, free 69632, dirty 55040,
flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 71584, dirty
53088, flags 16
UBIFS DBG (pid 806): ubifs_write_end: ino 79, pos 98304, pg 24, len
4096, copied 4096, i_size 98304
UBIFS DBG (pid 806): ubifs_dirty_inode: inode 79
UBIFS DBG (pid 806): ubifs_writepage: ino 79, pg 24, pg flags 0xb0d
UBIFS DBG (pid 806): ubifs_write_inode: inode 79, mode 0x81a4, nlink 1
UBIFS DBG (pid 806): ubifs_jnl_write_inode: ino 79, nlink 1
UBIFS DBG (pid 806): write_head: jhead 1, LEB 25:32768, len 160
UBIFS DBG (pid 806): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 25:32768
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94208, dirty
32608, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 25, free 94048, dirty 32608,
flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94208, dirty
32608, flags 16
UBIFS DBG (pid 806): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 806): ubifs_wbuf_sync_nolock: LEB 25:32768, 160 bytes,
jhead 1
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94048, dirty
32608, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 25, free 92160, dirty 34496,
flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 94048, dirty
32608, flags 16
UBIFS DBG (pid 806): ubifs_tnc_add: 25:32768, len 160, key (79, inode)
UBIFS DBG (pid 806): lookup_level0_dirty: search and dirty key (79, inode)
UBIFS DBG (pid 806): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 25, free -2147483647, dirty
34656, flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 25, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 806): ubifs_jnl_write_data: ino 79, blk 24, len 4096, key
(79, data, 24)
UBIFS DBG (pid 806): write_node: jhead 2, LEB 15:57344, len 92
UBIFS DBG (pid 806): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:57344
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 69632, dirty
55040, flags 16
UBIFS DBG (pid 806): ubifs_change_lp: LEB 15, free 69536, dirty 55040,
flags 16
UBIFS DBG (pid 806): ubifs_lpt_lookup_dirty: LEB 15, free 69632, dirty
55040, flags 16
UBIFS DBG (pid 806): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 806): ubifs_tnc_add: 15:57344, len 92, key (79, data, 24)
UBIFS DBG (pid 806): lookup_level0_dirty: search and dirty key (79,
data, 24)
UBIFS DBG (pid 806): lookup_level0_diG (pid 806): ubifs_jnl_write_inode:
ino 79, nlink 1
UBIFS DBG (pid 806): write_head: jhead 1, LEB 10:120832, le
BCM70190040
1 20000000
a456
K1
K2

K3

K4

Shmoo Version=3.5
MEMC_0
L=FFFFFFFA U=00000032
0#RTR=00000000
G00000002
R=00000000
00000000000000000000000000000000000000000000000000000000
R=00000001
00000000000000000000000000000000000000000000000000000000
R=00000002
00000000000000000000000000000000000000000000000000000000
R=00000003
00000000000000000000000000000000000000000000000000000000
R=00000004
00000000000000000000000000000000000000000000000000000000
R=00000005
00000000000011111111111111111111111111111111110011100000
R=00000006
00000000000011111111111111111111111111111111110011100000
R=00000007
00000000000011111111111111111111111111111111111001100000
R=00000008
00000000000011111111111111111111111111111111110001100000
R=00000009
00000000000011111111111111111111111111111111111011100000
R=0000000A
00000000000011111111111111111111111111111111111011100000
R=0000000B
00000000000011111111111111111111111111111111111001100000
R=0000000C
00000000000011111111111111111111111111111111110011100000
R=0000000D
00000000000011111111111111111111111111111111111011100000
R=0000000E
00000000000011111111111111111111111111111111111001100000
R=0000000F
00000000000011111111111111111111111111111111111001100000
R=00000010
00000000000011111111111111111111111111111111110011100000
R=00000011
00000000000011111111111111111111111111111111111011100000
R=00000012
00000000000011111111111111111111111111111111111001100000
R=00000013
00000000000011111111111111111111111111111111111001100000
R=00000014
00000000000011111111111111111111111111111111111011100000
R=00000015
00000000000011111111111111111111111111111111111011100000
R=00000016
00000000000010101110101011111111111101011101011010000000
R=00000017
00000000000001001010010101010101010101010100000010100000
R=00000018
00000000000000000000000000000000000000000000000000000000
R=00000019
00000000000000000000000000000000000000000000000000000000
R=0000001A
00000000000000000000000000000000000000000000000000000000
R=0000001B
00000000000000000000000000000000000000000000000000000000
R=0000001C
00000000000000000000000000000000000000000000000000000000
R=0000001D
00000000000000000000000000000000000000000000000000000000
R=0000001E
00000000000000000000000000000000000000000000000000000000
R=0000001F
00000000000000000000000000000000000000000000000000000000
G=00000002 R=0000000D W=00000018
WBL
00001111111111111111111111111111111111111111111111110000
00000000000001111111111111111111111111111111111111111100
00001111111111111111111111111111111111111111110011100000
00000000111111111111111111111111111111111111111111111111
WBLC 00000015 0000001B 00000014 00000019
RBL
00001111111111111111111111000000
01111111111111111111111110000000
00000111111111111111111111000000
01111111111111111111111000000000
RBLC 0000000E 0000000C 0000000F 0000000B
!67!#
00000000bcde@

BCM97019E0 CFE v3.20, CFE core v3.12, Endian Mode: Little
Build Date: Sat Mar 31 13:38:45 CST 2012 (fengliu@zch124app04)
Copyright (C) Broadcom Corporation.

[@Mode Selection]
cannot open flash0.macadr
cannot get flash info
cannot open flash0.macadr
!!!cannot read mac address
MAC ADDRESS MUST BE PROGRAMMED!, using macprog command
CPU speed:       405MHz
Total memory:    256MB
DDR Freq:        666MHz
DDR Mode:        DDR3
DDR Width:       32
Boot Device:     NAND
ECC:           Hamming
Total flash:     128MB

Initializing USB.
USB: Locating Class 09 Vendor 0000 Product 0000: USB Root Hub

CFE initialized.


MAC  00:22:11:44:33:71
param id:67 is not found!
param id:67 is not found!

oof flag is 0!
param id:67 is not found!
param id:67 is not found!
Pattern: 0000007000000000
Pattern: 0000000003FFFFF8
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
memory test successful
nand_erase_block called: blk addr = 0x100000
Starting splash screen.
Invalid file format byte0 = ? byte1 = ?No valid image found in
flash0.splash - disabling splash
param id:63 is not found!
param id:63 is not found!

cmdline : ecm 32 16; boot -z -elf flash0.kernrootfs: 'bmem=133088K@110M
bmem=16416K@245728K root=/dev/ram oof=0'
Geometry = 00000001
ECM will be loaded using boot window(0eff8000, 00008000) and DOCSIS
window(0f000000, 01000000)
Loading bootloader from flash0.ecmboot at aeff8000, length 00008000
Loading nonvol from flash0.dyncfg at afff8000, length 00008000
Loading nonvol from flash0.permcfg at afff0000, length 00008000
Loading DOCSIS from flash0.docsis1 at afe00000, length 00200000
pinMux11 0x11112
pinMux10 0x20000001
Booting BNM MIPS revision 70190040
Loader:elf Filesys:raw Dev:flash0.kernrootfs File:
Options:bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
Loading: 0x80001000/14251520 0x80d98600/180624 Entry address is 0x80005ed0
TP1 Entry Address at 0x80000ffc = 80005ed0
Starting program at 0x80005ed0

Linux version 2.6.31-3.3 (zhang_xiaoming@zch124app04) (gcc version 4.4.5
(Broadcom stbgcc-4.4.5-2.0) ) #10 SMP Wed Apr 11 09:18:13 CST 2012
Fetching vars from bootloader... found 56 vars.
Early serial console at MMIO 0x10406b00 (options '115200n8')
console [uart0] enabled
Options: enet_en=1 enet0_mii=0 enet_no_mdio=0 enet1_en=1 moca=0
         sata=0 docsis=0 pci=1 smp=1 usb=1
Using 256 MB + 0 MB RAM (from CFE)
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Determined physical RAM map:
 memory: 10000000 @ 00000000 (usable)
bmem: adding 129 MB RESERVED region at 110 MB (0x081f8000@0x06e00000)
bmem: adding 16 MB RESERVED region at 239 MB (0x01008000@0x0eff8000)
Initrd not found or empty - disabling initrd
Zone PFN ranges:
  Normal   0x00000000 -> 0x00010000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00010000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Kernel command line: bmem=133088K@110M bmem=16416K@245728K root=/dev/ram
oof=0
PID hash table entries: 1024 (order: 10, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Memory: 96068k/262144k available (4575k kernel code, 165892k reserved,
1247k data, 8096k init, 0k highmem)
NR_IRQS:128
Detected MIPS clock frequency: 405 MHz (202.502 MHz counter)
Console: colour dummy device 80x25
Calibrating delay loop... 404.48 BogoMIPS (lpj=202240)
Mount-cache hash table entries: 512
SMP: Booting CPU1...
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Calibrating delay loop... 407.55 BogoMIPS (lpj=203776)
SMP: CPU1 is running
Brought up 2 CPUs
NET: Registered protocol family 16
USB0: power enable is active low; overcurrent is active low
PCI2.3->SDRAM window: 1024 MB
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
NET: Registered protocol family 1
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
fuse init (API version 7.12)
msgmni has been set to 187
io scheduler noop registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0x10406b00 (irq = 22) is a 16550A
console handover: boot [uart0] -> real [ttyS0]
serial8250.0: ttyS1 at MMIO 0x10406b40 (irq = 65) is a 16550A
serial8250.0: ttyS2 at MMIO 0x10406b80 (irq = 66) is a 16550A
brd: module loaded
loop: module loaded
brcm-pm: enabling moca_genet clocks
brcm-pm: enabling enet clocks
Config EPHY through MDIO
pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethernet driver
usbcore: registered new interface driver pegasus
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver net1080
usbcore: registered new interface driver cdc_subset
usbcore: registered new interface driver zaurus
Broadcom STB NAND controller (BrcmNand Controller)
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
brcm-pm: enabling usb clocks
ehci-brcm ehci-brcm.0: Broadcom STB EHCI
ehci-brcm ehci-brcm.0: new USB bus registered, assigned bus number 1
ehci-brcm ehci-brcm.0: irq 61, io mem 0x10488300
ehci-brcm ehci-brcm.0: USB 0.0 started, EHCI 1.00
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-brcm ohci-brcm.0: Broadcom STB OHCI
ohci-brcm ohci-brcm.0: new USB bus registered, assigned bus number 2
ohci-brcm ohci-brcm.0: irq 62, io mem 0x10488400
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (1503 buckets, 6012 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or
sysctl net.netfilter.nf_conntrack_acct=1 to enable it.
ctnetlink v0.93: registering with nfnetlink.
xt_time: kernel timezone is -0000
ip_tables: (C) 2000-2006 Netfilter Core Team
ClusterIP Version 0.8 loaded successfully
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 17
Bridge firewalling registered
Ebtables v2.0 registered
ebt_ulog: out of memory trying to call netlink_kernel_create
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
EBI CS0: setting up NAND flash (primary)
mtd->oobsize=0, mtd->eccOobSize=0
NAND_CS_NAND_XOR=00000000
B4: NandSelect=40000100, nandConfig=15142200, chipSelect=0
brcmnand_read_id: CS0: dev_id=2cf18095
After: NandSelect=40000100, nandConfig=15142200
Block size=00020000, erase shift=17
NAND Config: Reg=15142200, chipSize=128 MB, blockSize=128K, erase_shift=11
busWidth=1, pageSize=2048B, page_shift=11, page_mask=000007ff
timing1 not adjusted: 5363444f
timing2 not adjusted: 00000fc6
BrcmNAND mfg 2c f1 MICRON MT29F1G08ABA 128MB on CS0

Found NAND on CS0: ACC=f7441010, cfg=15142200, flashId=2cf18095,
tim1=5363444f, tim2=00000fc6
BrcmNAND version = 0x0303 128MB @00000000
brcmnand_scan: B4 nand_select = 40000100
brcmnand_scan: After nand_select = 40000100
handle_acc_control: default CORR ERR threshold  3 bits
ACC: 16 OOB bytes per 512B ECC step; from ID probe: 16
page_shift=11, bbt_erase_shift=17, chip_shift=27, phys_erase_shift=17
Brcm NAND controller version = 3.3 NAND flash size 128MB @18000000
ECC layout=brcmnand_oob_bch4_2k
brcmnand_scan:  mtd->oobsize=64
brcmnand_scan: oobavail=35, eccsize=512, writesize=2048
brcmnand_scan, eccsize=512, writesize=2048, eccsteps=4, ecclevel=4,
eccbytes=7
-->brcmnand_default_bbt
brcmnand_default_bbt: bbt_td = bbt_slc_bch4_main_descr
brcmnand_reset_corr_threshold: default CORR ERR threshold  3 bits for CS0
RedBoot partition parsing not available
Creating 16 MTD partitions on "brcmnand.0":
0x000000000000-0x000000100000 : "cfe"
0x000000100000-0x000000180000 : "cridata0"
0x000000180000-0x000000200000 : "cridata1"
0x000000200000-0x000000400000 : "splash"
0x000000400000-0x000000440000 : "ecmboot"
0x000000440000-0x0000004a0000 : "dyncfg"
0x0000004a0000-0x0000004e0000 : "permcfg"
0x0000004e0000-0x000000760000 : "docsis0"
0x000000760000-0x0000009e0000 : "docsis1"
0x0000009e0000-0x0000010e0000 : "loader_kernrootfs"
0x0000010e0000-0x000001ee0000 : "loader_upgradeapp"
0x000001ee0000-0x0000025e0000 : "kernrootfs"
0x0000025e0000-0x0000039e0000 : "platform"
0x0000039e0000-0x000003de0000 : "app_data"
0x000003de0000-0x000007700000 : "mid_app"
0x000007700000-0x000007f00000 : "download_data"
Freeing unused kernel memory: 8096k freed
starting pid 1, tty '': '/etc/init.d/rcS'
Mounting virtual filesystems
Starting mdev
* WARNING: THIS STB CONTAINS GPLv3 SOFTWARE
* GPLv3 programs must be removed in order to enable security.
* See: http://www.gnu.org/licenses/gpl-faq.html#Tivoization
Configuring eth0 interface
eth0: Link is up, 100 Mbps Full Duplex
eth0 Link UP.
Auto config phy
Configuring lo interface
Starting network services
Starting user service/etc/init.d/rcS: line 75: echo: write error:
Interrupted system call
oof Begin ------------------------->
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
oof Step1 ----------------UBI: attaching mtd12 to ubi12
--------->
EnteUBI: physical eraseblock size:   131072 bytes (128 KiB)
r Factory mode..UBI: logical eraseblock size:    126976 bytes
....
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1173831185
UBI: background thread "ubi_bgt12d" started, PID 453
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 5/3
UBI: image sequence number: 405604914
UBI: background thread "ubi_bgt13d" started, PID 472
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1976325785
UBI: background thread "ubi_bgt14d" started, PID 479
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 13, volume 0, name "appdata"
UBIFS: file system size:   2031616 bytes (1984 KiB, 1 MiB, 16 LEBs)
UBIFS: journal size:       1904640 bytes (1860 KiB, 1 MiB, 15 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 14, volume 0, name "app_mid"
UBIFS: file system size:   55615488 bytes (54312 KiB, 53 MiB, 438 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
Initializing broadcom driver...
bcmscbeth: module license 'Proprietary' taints kernel.
Disabling lock debugging due to kernel taint
bcm0: MBOX_SHM_ADDR at init!
bcm0: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm1: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm0: MBOX_DMA_READY!
device bcm1 entered promiscuous mode
device eth0 entered promiscuous mode
br0: port 1(eth0) entering learning state
br0: port 2(bcm1) entering learning state
br0: starting userspace STP failed, starting kernel STP
Internet Systems Consortium DHCP Server V3.0.5
Copyright 2004-2006 Internet Systems Consortium.
All rights reserved.
For info, please visit http://www.isc.org/sw/dhcp/
Wrote 0 deleted host decls to leases file.
Wrote 0 new dynamic host decls to leases file.
Wrote 0 leases to leases file.
Listening on LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   Socket/fallback/fallback-net
udhcpc (v1.16.1) started
Sending discover...
mtdocap: Broadcom MTDOCAP driver v1.10 Apr  7 2012 10:47:18
insmod nexus ko...
main
Could not find ecm_prog_storage.  Setting up symbolic link to new eCM
Image Storage Path mtd_block3...
Could not find mtd_block3.  Creating...
Sending discover...
Sending select for 192.168.100.10...
nexus: module_layout: kernel tainted.
Lease of 192.168.100.10 obtained, lease time 30
deleting routers
nexus driver initialized
platform_main_init_todo
DRV_Flash_SetModuleInitParam entry
DRV_Flash_SetModuleInitParam finished
*** 00:00:00.664 nexus_platform: Release 97125 7.5
*** 00:00:00.664 BCHP_PWR: BCHP_PWR power management disabled
UBIFS DBG (pid 660): do_readpage: ino 84, pg 275, i_size 3258056, flags 0x1
UBIFS DBG (pid 660): ubifs_lookup_level0: search key (84, data, 275)
UBIFS DBG (pid 660): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 660): fallible_read_node: LEB 29:105096, key (84, data, 275)
UBIFS DBG (pid 660): try_read_node: LEB 29:105096, data node, length 1940
### 00:00:00.666 nexus_platform_config:
*****************************************************
### 00:00:00.666 nexus_platform_config: GISB Timeout writing addr
0x10310000 by core BSP
### 00:00:00.666 nexus_platform_config: This GISB timeout occured before
nexus started.
### 00:00:00.666 nexus_platform_config:
*****************************************************
*** 00:00:00.669 BMRC_MONITOR: ARC0 is protecting low memory for range
0x0...0x6e00040 (110 MB)
*** 00:00:00.678 nexus_audio_module: FW download used
UBIFS DBG (pid 661): do_readpage: ino 84, pg 243, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 243)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 29:54008, key (84, data, 243)
UBIFS DBG (pid 661): try_read_node: LEB 29:54008, data node, length 2292
UBIFS DBG (pid 661): do_readpage: ino 84, pg 478, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 478)
UBIFS DBG (pid 661): ubifs_read_node: LEB 110:28776, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 110:28776, level 1, 8 branch
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:33216, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:33216, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 33:3064, key (84, data, 478)
UBIFS DBG (pid 661): try_read_node: LEB 33:3064, data node, length 2909
UBIFS DBG (pid 661): do_readpage: ino 84, pg 558, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 558)
UBIFS DBG (pid 661): ubifs_read_node: LEB 110:28968, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 110:28968, level 1, 8 branch
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:34944, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:34944, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 34:91416, key (84, data, 558)
UBIFS DBG (pid 661): try_read_node: LEB 34:91416, data node, length 2684
UBIFS DBG (pid 661): do_readpage: ino 84, pg 566, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 566)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:35136, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:35136, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 34:113240, key (84, data, 566)
UBIFS DBG (pid 661): try_read_node: LEB 34:113240, data node, length 2517
UBIFS DBG (pid 661): do_readpage: ino 84, pg 567, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 567)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 34:115760, key (84, data, 567)
UBIFS DBG (pid 661): try_read_node: LEB 34:115760, data node, length 3381
UBIFS DBG (pid 661): do_readpage: ino 84, pg 428, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 428)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:32256, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:32256, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 32:20152, key (84, data, 428)
UBIFS DBG (pid 661): try_read_node: LEB 32:20152, data node, length 3002
UBIFS DBG (pid 661): do_readpage: ino 84, pg 424, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 424)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 32:9552, key (84, data, 424)
UBIFS DBG (pid 661): try_read_node: LEB 32:9552, data node, length 2891
UBIFS DBG (pid 661): do_readpage: ino 84, pg 425, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 425)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 32:12448, key (84, data, 425)
UBIFS DBG (pid 661): try_read_node: LEB 32:12448, data node, length 1793
UBIFS DBG (pid 661): do_readpage: ino 84, pg 476, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 476)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:33024, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:33024, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 32:125208, key (84, data, 476)
UBIFS DBG (pid 661): try_read_node: LEB 32:125208, data node, length 1715
122840, data node, length 1527
UBIFS DBG (pid 661): do_readpage: ino 84, pg 676, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 676)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 36:124368, key (84, data, 676)
UBIFS DBG (pid 661): try_read_node: LEB 36:124368, data node, length 1455
UBIFS DBG (pid 661): do_readpage: ino 84, pg 677, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 677)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 37:0, key (84, data, 677)
UBIFS DBG (pid 661): try_read_node: LEB 37:0, data node, length 2868
UBIFS DBG (pid 661): do_readpage: ino 84, pg 678, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 678)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 37:2872, key (84, data, 678)
UBIFS DBG (pid 661): try_read_node: LEB 37:2872, data node, length 2759
UBIFS DBG (pid 661): do_readpage: ino 84, pg 679, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 679)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 37:5632, key (84, data, 679)
UBIFS DBG (pid 661): try_read_node: LEB 37:5632, data node, length 2600
UBIFS DBG (pid 661): do_readpage: ino 84, pg 680, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 680)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 37:8232, key (84, data, 680)
UBIFS DBG (pid 661): try_read_node: LEB 37:8232, data node, length 2658
UBIFS DBG (pid 661): do_readpage: ino 84, pg 681, i_size 3258056, flags 0x21
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 681)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:37824, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:37824, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 37:10896, key (84, data, 681)
UBIFS DBG (pid 661): try_read_node: LEB 37:10896, data node, length 2606
UBIFS DBG (pid 661): do_readpage: ino 84, pg 682, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 682)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 37:13504, key (84, data, 682)
UBIFS DBG (pid 661): try_read_node: LEB 37:13504, data node, length 2691
UBIFS DBG (pid 661): do_readpage: ino 84, pg 683, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 683)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 37:16200, key (84, data, 683)
UBIFS DBG (pid 661): try_read_node: LEB 37:16200, data node, length 2795
UBIFS DBG (pid 661): do_readpage: ino 84, pg 684, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 684)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 37:19000, key (84, data, 684)
UBIFS DBG (pid 661): try_read_node: LEB 37:19000, data node, length 2830
UBIFS DBG (pid 661): do_readpage: ino 84, pg 685, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 685)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 37:21832, key (84, data, 685)
UBIFS DBG (pid 661): try_read_node: LEB 37:21832, data node, length 2708
UBIFS DBG (pid 661): do_readpage: ino 84, pg 686, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 686)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS , i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 725)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 37:80816, key (84, data, 725)
UBIFS DBG (pid 661): try_read_node: LEB 37:80816, data node, length 1304
UBIFS DBG (pid 661): do_readpage: ino 84, pg 726, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 726)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 37:82120, key (84, data, 726)
UBIFS DBG (pid 661): try_read_node: LEB 37:82120, data node, length 2108
UBIFS DBG (pid 661): do_readpage: ino 84, pg 727, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 727)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:38784, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:38784, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 37:84232, key (84, data, 727)
UBIFS DBG (pid 661): try_read_node: LEB 37:84232, data node, length 1416
UBIFS DBG (pid 661): do_readpage: ino 84, pg 728, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 728)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 37:85648, key (84, data, 728)
UBIFS DBG (pid 661): try_read_node: LEB 37:85648, data node, length 2480
UBIFS DBG (pid 661): do_readpage: ino 84, pg 729, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 729)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 37:88128, key (84, data, 729)
UBIFS DBG (pid 661): try_read_node: LEB 37:88128, data node, length 1696
UBIFS DBG (pid 661): do_readpage: ino 84, pg 730, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 730)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 37:89824, key (84, data, 730)
UBIFS DBG (pid 661): try_read_node: LEB 37:89824, data node, length 2366
UBIFS DBG (pid 661): do_readpage: ino 84, pg 731, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 731)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 37:92192, key (84, data, 731)
UBIFS DBG (pid 661): try_read_node: LEB 37:92192, data node, length 2682
UBIFS DBG (pid 661): do_readpage: ino 84, pg 732, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 732)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 37:94880, key (84, data, 732)
UBIFS DBG (pid 661): try_read_node: LEB 37:94880, data node, length 2659
UBIFS DBG (pid 661): do_readpage: ino 84, pg 733, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 733)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 37:97544, key (84, data, 733)
UBIFS DBG (pid 661): try_read_node: LEB 37:97544, data node, length 2979
UBIFS DBG (pid 661): do_readpage: ino 84, pg 734, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 734)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 37:100528, key (84, data, 734)
UBIFS DBG (pid 661): try_read_node: LEB 37:100528, data node, length 2812
UBIFS DBG (pid 661): do_readpage: ino 84, pg 735, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 735)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:38976, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:38976, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 37:103344, key (84, data, 735)
UBIFS DBG (pid 661): try_read_node: LEB 37:103344, data node, length 2637
UBIFS DBG (pid 661): do_readpage: ino 84, pg 736, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 736)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 37:105984, key (84, data, 736)
UBIFS DBG (pid 661): try_read_node: LEB 37:105984, data node, length 2948
UBIFS DBG (pid 661): do_readpage: ino 84, pg 737, i_size 3258056, flags 0x21
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 737)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 37:108936, key (84, data, 737)
UBIFS DBG (pid 661): try_read_node: LEB 37:108936, data node, length 2816
UBIFS DBG (pid 661): do_readpage: ino 84, pg 738, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 738)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 37:111752, key (84, data, 738)
UBIFS DBG (pid 661): try_read_node: LEB 37:111752, data node, length 2521
UBIFS DBG (pid 661): do_readpage: ino 84, pg 739, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 739)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 37:114280, key (84, data, 739)
UBIFS DBG (pid 661): try_read_node: LEB 37:114280, data node, length 2829
UBIFS DBG (pid 661): do_readpage: ino 84, pg 740, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 740)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 37:117112, key (84, data, 740)
UBIFS DBG (pid 661): try_read_node: LEB 37:117112, data node, length 2661
UBIFS DBG (pid 661): do_readpage: ino 84, pg 741, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 741)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 37:119776, key (84, data, 741)
UBIFS DBG (pid 661): try_read_node: LEB 37:119776, data node, length 2580
UBIFS DBG (pid 661): do_readpage: ino 84, pg 742, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 742)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 37:122360, key (84, data, 742)
UBIFS DBG (pid 661): try_read_node: LEB 37:122360, data node, length 2349
UBIFS DBG (pid 661): do_readpage: ino 84, pg 743, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 743)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:39168, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:39168, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 38:0, key (84, data, 743)
UBIFS DBG (pid 661): try_read_node: LEB 38:0, data node, length 2674
UBIFS DBG (pid 661): do_readpage: ino 84, pg 744, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 744)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 38:2680, key (84, data, 744)
UBIFS DBG (pid 661): try_read_node: LEB 38:2680, data node, length 2942
UBIFS DBG (pid 610): do_readpage: ino 169, pg 143, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 143)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 94:104064, key (169, data, 143)
UBIFS DBG (pid 610): try_read_node: LEB 94:104064, data node, length 1491
UBIFS DBG (pid 661): do_readpage: ino 84, pg 745, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 745)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 38:5624, key (84, data, 745)
UBIFS DBG (pid 661): try_read_node: LEB 38:5624, data node, length 2913
cm_reachable.sh: ping 192.168.100.1 succeed. reset FAIL_CNT to 0
UBIFS DBG (pid 661): do_readpage: ino 84, pg 746, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 746)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 38:8544, key (84, data, 746)
UBIFS DBG (pid 661): try_read_node: LEB 38:8544, data node, length 2718
UBIFS DBG (pid 661): do_readpage: ino 84, pg 747, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 747)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 38:11264, key (84, data, 747)
UBIFS DBG (pid 661): try_read_node: LEB 38:11264, data node, length 2900
UBIFS DBG (pid 661): do_readpage: ino 84, pg 748, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 748)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 38:14168, key (84, data, 748)
UBIFS DBG (pid 661): try_read_node: LEB 38:14168, data node, length 2850
UBIFS DBG (pid 661): do_readpage: ino 84, pg 749, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 749)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 38:17024, key (84, data, 749)
UBIFS DBG (pid 661): try_read_node: LEB 38:17024, data node, length 2876
UBIFS DBG (pid 661): do_readpage: ino 84, pg 750, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 750)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 38:19904, key (84, data, 750)
UBIFS DBG (pid 661): try_read_node: LEB 38:19904, data node, length 2857
UBIFS DBG (pid 661): do_readpage: ino 84, pg 751, i_size 3258056, flags 0x21
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 751)
UBIFS DBG (pid 661): ubifs_read_node: LEB 109:39360, indexing node,
length 188
UBIFS DBG (pid 661): read_znode: LEB 109:39360, level 0, 8 branch
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 38:22768, key (84, data, 751)
UBIFS DBG (pid 661): try_read_node: LEB 38:22768, data node, length 1932
UBIFS DBG (pid 661): do_readpage: ino 84, pg 752, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 752)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 38:24704, key (84, data, 752)
UBIFS DBG (pid 661): try_read_node: LEB 38:24704, data node, length 1987
UBIFS DBG (pid 661): do_readpage: ino 84, pg 753, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 753)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 38:26696, key (84, data, 753)
UBIFS DBG (pid 661): try_read_node: LEB 38:26696, data node, length 1910
UBIFS DBG (pid 661): do_readpage: ino 84, pg 754, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 754)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 38:28608, key (84, data, 754)
UBIFS DBG (pid 661): try_read_node: LEB 38:28608, data node, length 1924
UBIFS DBG (pid 661): do_readpage: ino 84, pg 755, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 755)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 38:30536, key (84, data, 755)
UBIFS DBG (pid 661): try_read_node: LEB 38:30536, data node, length 1981
UBIFS DBG (pid 661): do_readpage: ino 84, pg 756, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 756)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 38:32520, key (84, data, 756)
UBIFS DBG (pid 661): try_read_node: LEB 38:32520, data node, length 1840
UBIFS DBG (pid 661): do_readpage: ino 84, pg 757, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 757)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 38:34360, key (84, data, 757)
UBIFS DBG (pid 661): try_read_node: LEB 38:34360, data node, length 1839
UBIFS DBG (pid 661): do_readpage: ino 84, pg 758, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 758)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 661): fallible_read_node: LEB 38:36200, key (84, data, 758)
UBIFS DBG (pid 661): try_read_node: LEB 38:36200, data node, length 2072
UBIFS DBG (pid 661): do_readpage: ino 84, pg 759, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 759)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 661): fallible_read_node: LEB 38:38272, key (84, data, 759)
UBIFS DBG (pid 661): try_read_node: LEB 38:38272, data node, length 2169
UBIFS DBG (pid 661): do_readpage: ino 84, pg 760, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 760)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 661): fallible_read_node: LEB 38:40448, key (84, data, 760)
UBIFS DBG (pid 661): try_read_node: LEB 38:40448, data node, length 1869
UBIFS DBG (pid 661): do_readpage: ino 84, pg 761, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 761)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 661): fallible_read_node: LEB 38:42320, key (84, data, 761)
UBIFS DBG (pid 661): try_read_node: LEB 38:42320, data node, length 1819
UBIFS DBG (pid 661): do_readpage: ino 84, pg 762, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 762)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 661): fallible_read_node: LEB 38:44144, key (84, data, 762)
UBIFS DBG (pid 661): try_read_node: LEB 38:44144, data node, length 1829
UBIFS DBG (pid 661): do_readpage: ino 84, pg 763, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 763)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 661): fallible_read_node: LEB 38:45976, key (84, data, 763)
UBIFS DBG (pid 661): try_read_node: LEB 38:45976, data node, length 1877
UBIFS DBG (pid 661): do_readpage: ino 84, pg 764, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 764)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 661): fallible_read_node: LEB 38:47856, key (84, data, 764)
UBIFS DBG (pid 661): try_read_node: LEB 38:47856, data node, length 1404
UBIFS DBG (pid 661): do_readpage: ino 84, pg 765, i_size 3258056, flags 0x21
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 765)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 38:49264, key (84, data, 765)
UBIFS DBG (pid 661): try_read_node: LEB 38:49264, data node, length 1401
*** 00:00:01.174 BXVD: BXVD_Open() - Firmware revision: 150336
*** 00:00:01.193 nexus_platform_config: softI2c = false
*** 00:00:01.197 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:01.201 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
*** 00:00:04.907 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:04.909 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1164
*** 00:00:07.916 nexus_platform: initialized
UBIFS DBG (pid 658): do_readpage: ino 84, pg 81, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 81)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:25152, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:25152, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 26:49976, key (84, data, 81)
UBIFS DBG (pid 658): try_read_node: LEB 26:49976, data node, length 951
UBIFS DBG (pid 658): do_readpage: ino 84, pg 80, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 80)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 26:49040, key (84, data, 80)
UBIFS DBG (pid 658): try_read_node: LEB 26:49040, data node, length 934
UBIFS DBG (pid 658): do_readpage: ino 84, pg 78, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 78)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 26:47232, key (84, data, 78)
UBIFS DBG (pid 658): try_read_node: LEB 26:47232, data node, length 1029
UBIFS DBG (pid 658): do_readpage: ino 84, pg 71, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 71)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:24960, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:24960, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 26:41248, key (84, data, 71)
UBIFS DBG (pid 658): try_read_node: LEB 26:41248, data node, length 1217
UBIFS DBG (pid 658): do_readpage: ino 84, pg 70, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 70)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 26:40088, key (84, data, 70)
UBIFS DBG (pid 658): try_read_node: LEB 26:40088, data node, length 1157
UBIFS DBG (pid 658): do_readpage: ino 84, pg 69, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 69)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 26:39080, key (84, data, 69)
UBIFS DBG (pid 658): try_read_node: LEB 26:39080, data node, length 1002
UBIFS DBG (pid 658): do_readpage: ino 84, pg 62, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 62)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:24768, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:24768, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 26:33528, key (84, data, 62)
UBIFS DBG (pid 658): try_read_node: LEB 26:33528, data node, length 904
UBIFS DBG (pid 658): do_readpage: ino 84, pg 59, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 59)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:30576, key (84, data, 59)
UBIFS DBG (pid 658): try_read_node: LEB 26:30576, data node, length 1234
UBIFS DBG (pid 658): do_readpage: ino 84, pg 54, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 54)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:24576, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:24576, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 26:26336, key (84, data, 54)
UBIFS DBG (pid 658): try_read_node: LEB 26:26336, data node, length 931
UBIFS DBG (pid 658): do_readpage: ino 84, pg 53, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 53)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 26:25064, key (84, data, 53)
UBIFS DBG (pid 658): try_read_node: LEB 26:25064, data node, length 1266
UBIFS DBG (pid 658): do_readpage: ino 84, pg 52, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 52)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 26:24080, key (84, data, 52)
UBIFS DBG (pid 658): try_read_node: LEB 26:24080, data node, length 977
UBIFS DBG (pid 658): do_readpage: ino 84, pg 47, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 47)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 26:19976, key (84, data, 47)
UBIFS DBG (pid 658): try_read_node: LEB 26:19976, data node, length 1003
UBIFS DBG (pid 658): do_readpage: ino 84, pg 46, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 46)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 26:18952, key (84, data, 46)
UBIFS DBG (pid 658): try_read_node: LEB 26:18952, data node, length 1024
UBIFS DBG (pid 658): do_readpage: ino 84, pg 265, i_size 3258056, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 265)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 29:88200, key (84, data, 265)
UBIFS DBG (pid 658): try_read_node: LEB 29:88200, data node, length 1809
UBIFS DBG (pid 658): do_readpage: ino 84, pg 45, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 45)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 26:17968, key (84, data, 45)
UBIFS DBG (pid 658): try_read_node: LEB 26:17968, data node, length 984
UBIFS DBG (pid 658): do_readpage: ino 84, pg 44, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 44)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 26:16952, key (84, data, 44)
UBIFS DBG (pid 658): try_read_node: LEB 26:16952, data node, length 1010
UBIFS DBG (pid 658): do_readpage: ino 84, pg 43, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 43)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:15696, key (84, data, 43)
UBIFS DBG (pid 658): try_read_node: LEB 26:15696, data node, length 1250
UBIFS DBG (pid 658): do_readpage: ino 84, pg 39, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 39)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 26:8032, key (84, data, 39)
UBIFS DBG (pid 658): try_read_node: LEB 26:8032, data node, length 2322
UBIFS DBG (pid 677): do_readpage: ino 84, pg 88, i_size 3258056, flags 0x1
UBIFS DBG (pid 677): ubifs_lookup_level0: search key (84, data, 88)
UBIFS DBG (pid 677): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 677): fallible_read_node: LEB 26:62384, key (84, data, 88)
UBIFS DBG (pid 677): try_read_node: LEB 26:62384, data node, length 2495
UBIFS DBG (pid 658): do_readpage: ino 84, pg 241, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 241)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 29:48992, key (84, data, 241)
UBIFS DBG (pid 658): try_read_node: LEB 29:48992, data node, length 2498
UBIFS DBG (pid 658): do_readpage: ino 84, pg 239, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 239)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 29:44664, key (84, data, 239)
UBIFS DBG (pid 658): try_read_node: LEB 29:44664, data node, length 2112
UBIFS DBG (pid 658): do_readpage: ino 84, pg 242, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 242)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 29:51496, key (84, data, 242)
UBIFS DBG (pid 658): try_read_node: LEB 29:51496, data node, length 2505
UBIFS DBG (pid 658): do_readpage: ino 84, pg 254, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 254)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:29376, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:29376, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 29:75504, key (84, data, 254)
UBIFS DBG (pid 658): try_read_node: LEB 29:75504, data node, length 1627
UBIFS DBG (pid 658): do_readpage: ino 84, pg 91, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 91)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:69472, key (84, data, 91)
UBIFS DBG (pid 658): try_read_node: LEB 26:69472, data node, length 1853
UBIFS DBG (pid 684): do_readpage: ino 84, pg 92, i_size 3258056, flags 0x1
UBIFS DBG (pid 684): ubifs_lookup_level0: search key (84, data, 92)
UBIFS DBG (pid 684): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 684): fallible_read_node: LEB 26:71328, key (84, data, 92)
UBIFS DBG (pid 684): try_read_node: LEB 26:71328, data node, length 2103
UBIFS DBG (pid 658): do_readpage: ino 84, pg 113, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 113)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:25920, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:25920, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 26:119520, key (84, data, 113)
UBIFS DBG (pid 658): try_read_node: LEB 26:119520, data node, length 2227
UBIFS DBG (pid 658): do_readpage: ino 84, pg 251, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 251)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 29:69424, key (84, data, 251)
UBIFS DBG (pid 658): try_read_node: LEB 29:69424, data node, length 1989
UBIFS DBG (pid 658): do_readpage: ino 84, pg 118, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 118)
UBIFS DBG (pid 658): ubifs_read_node: LEB 110:28008, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 110:28008, level 1, 8 branch
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:26112, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:26112, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 27:4512, key (84, data, 118)
UBIFS DBG (pid 658): try_read_node: LEB 27:4512, data node, length 1787
UBIFS DBG (pid 658): do_readpage: ino 163, pg 47, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 47)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:125184, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:125184, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 91:115176, key (163, data, 47)
UBIFS DBG (pid 658): try_read_node: LEB 91:115176, data node, length 1608
UBIFS DBG (pid 658): do_readpage: ino 163, pg 46, i_size 515924, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 46)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 91:113384, key (163, data, 46)
UBIFS DBG (pid 658): try_read_node: LEB 91:113384, data node, length 1785
UBIFS DBG (pid 658): do_readpage: ino 163, pg 70, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 70)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:125760, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:125760, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 92:21912, key (163, data, 70)
UBIFS DBG (pid 658): try_read_node: LEB 92:21912, data node, length 1549
DRV_Mem_Init heapinit 0 [0][1048576][sys]
DRV_Mem_Init heapinit 1 [0][1048576][browser]
DRV_Flash_Init entry====================1
UBIFS DBG (pid 658): do_readpage: ino 163, pg 87, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 87)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 92:47120, key (163, data, 87)
UBIFS DBG (pid 658): try_read_node: LEB 92:47120, data node, length 1221
UBIFS DBG (pid 658): do_readpage: ino 163, pg 83, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 83)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 92:40544, key (163, data, 83)
UBIFS DBG (pid 658): try_read_node: LEB 92:40544, data node, length 1746
UBIFS DBG (pid 658): do_readpage: ino 70, pg 4, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 4)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 12:123096, key (70, data, 4)
UBIFS DBG (pid 658): try_read_node: LEB 12:123096, data node, length 1193
UBIFS DBG (pid 658): do_readpage: ino 70, pg 14, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 14)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 13:11664, key (70, data, 14)
UBIFS DBG (pid 658): try_read_node: LEB 13:11664, data node, length 1510
UBIFS DBG (pid 658): do_readpage: ino 163, pg 110, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 110)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 92:92808, key (163, data, 110)
UBIFS DBG (pid 658): try_read_node: LEB 92:92808, data node, length 1959
UBIFS DBG (pid 658): do_readpage: ino 163, pg 112, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 112)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 92:96280, key (163, data, 112)
UBIFS DBG (pid 658): try_read_node: LEB 92:96280, data node, length 2293
[flash_init] mtd_write_size = 0x800

UBIFS DBG (pid 658): do_readpage: ino 163, pg 84, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 84)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 92:42296, key (163, data, 84)
UBIFS DBG (pid 658): try_read_node: LEB 92:42296, data node, length 1684
UBIFS DBG (pid 658): do_readpage: ino 163, pg 82, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 82)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 92:39016, key (163, data, 82)
UBIFS DBG (pid 658): try_read_node: LEB 92:39016, data node, length 1523
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=14680064, seek offset=14680064
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=59899904, seek offset=59899904
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=2097152, seek offset=2097152
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=1048576, seek offset=1048576
!
UBIFS DBG (pid 658): do_readpage: ino 163, pg 88, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 88)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 92:48344, key (163, data, 88)
UBIFS DBG (pid 658): try_read_node: LEB 92:48344, data node, length 1259
UBIFS DBG (pid 658): do_readpage: ino 163, pg 17, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 17)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 91:72320, key (163, data, 17)
UBIFS DBG (pid 658): try_read_node: LEB 91:72320, data node, length 1393
UBIFS DBG (pid 658): do_readpage: ino 70, pg 11, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 11)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 13:7944, key (70, data, 11)
UBIFS DBG (pid 658): try_read_node: LEB 13:7944, data node, length 1717
UBIFS DBG (pid 658): do_readpage: ino 163, pg 103, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 103)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 92:78416, key (163, data, 103)
UBIFS DBG (pid 658): try_read_node: LEB 92:78416, data node, length 1984
UBIFS DBG (pid 658): do_readpage: ino 78, pg 38, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 38)
UBIFS DBG (pid 658): ubifs_read_node: LEB 110:26280, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 110:26280, level 1, 8 branch
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:12288, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:12288, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 17:110904, key (78, data, 38)
UBIFS DBG (pid 658): try_read_node: LEB 17:110904, data node, length 2169
UBIFS DBG (pid 658): do_readpage: ino 78, pg 171, i_size 1441440, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 171)
UBIFS DBG (pid 658): ubifs_read_node: LEB 110:26664, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 110:26664, level 1, 8 branch
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:15552, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:15552, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 20:42328, key (78, data, 171)
UBIFS DBG (pid 658): try_read_node: LEB 20:42328, data node, length 1541
:112024, data node, length 2169
UBIFS DBG (pid 658): do_readpage: ino 78, pg 128, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 128)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:14592, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:14592, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 19:69024, key (78, data, 128)
UBIFS DBG (pid 658): try_read_node: LEB 19:69024, data node, length 2351
UBIFS DBG (pid 658): do_readpage: ino 78, pg 126, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 126)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 19:65016, key (78, data, 126)
UBIFS DBG (pid 658): try_read_node: LEB 19:65016, data node, length 2343
UBIFS DBG (pid 658): do_readpage: ino 78, pg 146, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 146)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 19:109584, key (78, data, 146)
UBIFS DBG (pid 658): try_read_node: LEB 19:109584, data node, length 2440
UBIFS DBG (pid 658): do_readpage: ino 78, pg 284, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 284)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:18240, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:18240, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 22:49784, key (78, data, 284)
UBIFS DBG (pid 658): try_read_node: LEB 22:49784, data node, length 2131
UBIFS DBG (pid 658): do_readpage: ino 78, pg 282, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 282)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 22:45328, key (78, data, 282)
UBIFS DBG (pid 658): try_read_node: LEB 22:45328, data node, length 2346
UBIFS DBG (pid 658): do_readpage: ino 78, pg 285, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 285)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 22:51920, key (78, data, 285)
UBIFS DBG (pid 658): try_read_node: LEB 22:51920, data node, length 2523
UBIFS DBG (pid 658): do_readpage: ino 78, pg 281, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 281)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 22:43608, key (78, data, 281)
UBIFS DBG (pid 658): try_read_node: LEB 22:43608, data node, length 1715
UBIFS DBG (pid 658): do_readpage: ino 78, pg 283, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 283)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 22:47680, key (78, data, 283)
UBIFS DBG (pid 658): try_read_node: LEB 22:47680, data node, length 2104
UBIFS DBG (pid 658): do_readpage: ino 78, pg 325, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 325)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 23:7672, key (78, data, 325)
UBIFS DBG (pid 658): try_read_node: LEB 23:7672, data node, length 2540
UBIFS DBG (pid 658): do_readpage: ino 78, pg 138, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 138)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 19:92064, key (78, data, 138)
UBIFS DBG (pid 658): try_read_node: LEB 19:92064, data node, length 2223
UBIFS DBG (pid 658): do_readpage: ino 78, pg 130, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 130)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 19:73568, key (78, data, 130)
UBIFS DBG (pid 658): try_read_node: LEB 19:73568, data node, length 2641
UBIFS DBG (pid 658): do_readpage: ino 78, pg 127, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 127)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 19:67360, key (78, data, 127)
UBIFS DBG (pid 658): try_read_node: LEB 19:67360, data node, length 1663
UBIFS DBG (pid 658): do_readpage: ino 78, pg 125, i_size 1441440, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 125)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 19:62488, key (78, data, 125)
UBIFS DBG (pid 658): try_read_node: LEB 19:62488, data node, length 2528
UBIFS DBG (pid 658): do_readpage: ino 78, pg 73, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 73)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 18:69000, key (78, data, 73)
UBIFS DBG (pid 658): try_read_node: LEB 18:69000, data node, length 2097
UBIFS DBG (pid 658): do_readpage: ino 78, pg 133, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 133)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 19:81256, key (78, data, 133)
UBIFS DBG (pid 658): try_read_node: LEB 19:81256, data node, length 2061
UBIFS DBG (pid 658): do_readpage: ino 78, pg 31, i_size 1441440, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (78, data, 31)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 17:95160, key (78, data, 31)
UBIFS DBG (pid 658): try_read_node: LEB 17:95160, data node, length 1924
UBIFS DBG (pid 658): do_readpage: ino 163, pg 13, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 13)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 91:67624, key (163, data, 13)
UBIFS DBG (pid 658): try_read_node: LEB 91:67624, data node, length 1209
UBIFS DBG (pid 658): do_readpage: ino 163, pg 14, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 14)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 91:68840, key (163, data, 14)
UBIFS DBG (pid 658): try_read_node: LEB 91:68840, data node, length 1300
UBIFS DBG (pid 658): do_readpage: ino 163, pg 11, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 11)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 91:64872, key (163, data, 11)
UBIFS DBG (pid 658): try_read_node: LEB 91:64872, data node, length 1436
UBIFS DBG (pid 658): do_readpage: ino 163, pg 26, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 26)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:124800, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:124800, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 91:85672, key (163, data, 26)
UBIFS DBG (pid 658): try_read_node: LEB 91:85672, data node, length 1344
UBIFS DBG (pid 658): do_readpage: ino 163, pg 24, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 24)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 91:83072, key (163, data, 24)
UBIFS DBG (pid 658): try_read_node: LEB 91:83072, data node, length 1354
UBIFS DBG (pid 658): do_readpage: ino 163, pg 81, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 81)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 92:37840, key (163, data, 81)
UBIFS DBG (pid 658): try_read_node: LEB 92:37840, data node, length 1169
UBIFS DBG (pid 658): do_readpage: ino 163, pg 115, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 115)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 92:100856, key (163, data, 115)
UBIFS DBG (pid 658): try_read_node: LEB 92:100856, data node, length 726
UBIFS DBG (pid 658): do_readpage: ino 163, pg 25, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 25)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 91:84432, key (163, data, 25)
UBIFS DBG (pid 658): try_read_node: LEB 91:84432, data node, length 1235
UBIFS DBG (pid 658): do_readpage: ino 163, pg 104, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 104)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 92:80400, key (163, data, 104)
UBIFS DBG (pid 658): try_read_node: LEB 92:80400, data node, length 2025
UBIFS DBG (pid 610): do_readpage: ino 169, pg 81, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 81)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 94:9368, key (169, data, 81)
UBIFS DBG (pid 610): try_read_node: LEB 94:9368, data node, length 1831
UBIFS DBG (pid 610): do_readpage: ino 169, pg 93, i_size 1172304, flags 0x21
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 93)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 610): fallible_read_node: LEB 94:28400, key (169, data, 93)
UBIFS DBG (pid 610): try_read_node: LEB 94:28400, data node, length 1811
UBIFS DBG (pid 610): do_readpage: ino 169, pg 87, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 87)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 94:17928, key (169, data, 87)
UBIFS DBG (pid 610): try_read_node: LEB 94:17928, data node, length 1540
UBIFS DBG (pid 610): do_readpage: ino 169, pg 90, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 90)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 610): fallible_read_node: LEB 94:23112, key (169, data, 90)
UBIFS DBG (pid 610): try_read_node: LEB 94:23112, data node, length 1751
UBIFS DBG (pid 610): do_readpage: ino 169, pg 16, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 16)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 610): fallible_read_node: LEB 93:37008, key (169, data, 16)
UBIFS DBG (pid 610): try_read_node: LEB 93:37008, data node, length 1691
UBIFS DBG (pid 610): do_readpage: ino 169, pg 17, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 17)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 93:38704, key (169, data, 17)
UBIFS DBG (pid 610): try_read_node: LEB 93:38704, data node, length 1800
UBIFS DBG (pid 610): do_readpage: ino 169, pg 6, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 6)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 610): fallible_read_node: LEB 93:20632, key (169, data, 6)
UBIFS DBG (pid 610): try_read_node: LEB 93:20632, data node, length 1823
UBIFS DBG (pid 610): do_readpage: ino 169, pg 96, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 96)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 610): fallible_read_node: LEB 94:33616, key (169, data, 96)
UBIFS DBG (pid 610): try_read_node: LEB 94:33616, data node, length 1641
UBIFS DBG (pid 610): do_readpage: ino 169, pg 14, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 14)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 610): fallible_read_node: LEB 93:33576, key (169, data, 14)
UBIFS DBG (pid 610): try_read_node: LEB 93:33576, data node, length 2006
UBIFS DBG (pid 610): do_readpage: ino 169, pg 15, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 15)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 610): fallible_read_node: LEB 93:35584, key (169, data, 15)
UBIFS DBG (pid 610): try_read_node: LEB 93:35584, data node, length 1418
UBIFS DBG (pid 610): do_readpage: ino 169, pg 9, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 9)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 93:25960, key (169, data, 9)
UBIFS DBG (pid 610): try_read_node: LEB 93:25960, data node, length 1939
UBIFS DBG (pid 610): do_readpage: ino 169, pg 10, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 10)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 610): fallible_read_node: LEB 93:27904, key (169, data, 10)
UBIFS DBG (pid 610): try_read_node: LEB 93:27904, data node, length 1322
UBIFS DBG (pid 610): do_readpage: ino 169, pg 11, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 11)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 610): fallible_read_node: LEB 93:29232, key (169, data, 11)
UBIFS DBG (pid 610): try_read_node: LEB 93:29232, data node, length 1467
UBIFS DBG (pid 610): do_readpage: ino 169, pg 12, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 12)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 610): fallible_read_node: LEB 93:30704, key (169, data, 12)
UBIFS DBG (pid 610): try_read_node: LEB 93:30704, data node, length 1583
UBIFS DBG (pid 610): do_readpage: ino 169, pg 54, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 54)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 610): fallible_read_node: LEB 93:97704, key (169, data, 54)
UBIFS DBG (pid 610): try_read_node: LEB 93:97704, data node, length 1634
UBIFS DBG (pid 610): do_readpage: ino 169, pg 13, i_size 1172304, flags 0x21
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 13)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 610): fallible_read_node: LEB 93:32288, key (169, data, 13)
UBIFS DBG (pid 610): try_read_node: LEB 93:32288, data node, length 1284
UBIFS DBG (pid 610): do_readpage: ino 169, pg 88, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 88)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 610): fallible_read_node: LEB 94:19472, key (169, data, 88)
UBIFS DBG (pid 610): try_read_node: LEB 94:19472, data node, length 1719
UBIFS DBG (pid 610): do_readpage: ino 169, pg 89, i_size 1172304, flags 0x1
UBIFS DBG (pid 610): ubifs_lookup_level0: search key (169, data, 89)
UBIFS DBG (pid 610): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 610): fallible_read_node: LEB 94:21192, key (169, data, 89)
UBIFS DBG (pid 610): try_read_node: LEB 94:21192, data node, length 1920
====FACTORY_PARAID_END:68
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(0)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(1)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(2)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(4)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(5)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(6)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(7)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(50)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(51)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(52)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(53)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(54)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(55)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(56)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(57)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(58)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(59)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(60)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(61)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(62)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(63)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(64)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(65)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(66)  status(0)is invalid or space not enough!
[658]:ERR:000000024:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(67)  status(0)is invalid or space not enough!
UBIFS DBG (pid 658): do_readpage: ino 163, pg 105, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 105)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 92:82432, key (163, data, 105)
UBIFS DBG (pid 658): try_read_node: LEB 92:82432, data node, length 1979
UBIFS DBG (pid 658): do_readpage: ino 163, pg 38, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 38)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 91:101936, key (163, data, 38)
UBIFS DBG (pid 658): try_read_node: LEB 91:101936, data node, length 1615
UBIFS DBG (pid 658): do_readpage: ino 70, pg 10, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 10)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 13:6536, key (70, data, 10)
UBIFS DBG (pid 658): try_read_node: LEB 13:6536, data node, length 1406
UBIFS DBG (pid 658): do_readpage: ino 70, pg 12, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 12)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 13:9664, key (70, data, 12)
UBIFS DBG (pid 658): try_read_node: LEB 13:9664, data node, length 1030
UBIFS DBG (pid 691): do_readpage: ino 163, pg 16, i_size 515924, flags 0x1
UBIFS DBG (pid 691): ubifs_lookup_level0: search key (163, data, 16)
UBIFS DBG (pid 691): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 691): fallible_read_node: LEB 91:71232, key (163, data, 16)
UBIFS DBG (pid 691): try_read_node: LEB 91:71232, data node, length 1087
UBIFS DBG (pid 658): do_readpage: ino 163, pg 15, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 15)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 91:70144, key (163, data, 15)
UBIFS DBG (pid 658): try_read_node: LEB 91:70144, data node, length 1083
UBIFS DBG (pid 658): do_readpage: ino 163, pg 42, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 42)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 91:107704, key (163, data, 42)
UBIFS DBG (pid 658): try_read_node: LEB 91:107704, data node, length 1244
UBIFS DBG (pid 658): do_readpage: ino 163, pg 63, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 63)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:125568, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:125568, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 92:12144, key (163, data, 63)
UBIFS DBG (pid 658): try_read_node: LEB 92:12144, data node, length 1386
UBIFS DBG (pid 658): do_readpage: ino 163, pg 45, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 45)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 91:111552, key (163, data, 45)
UBIFS DBG (pid 658): try_read_node: LEB 91:111552, data node, length 1831
UBIFS DBG (pid 658): do_readpage: ino 163, pg 52, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 52)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 91:123112, key (163, data, 52)
UBIFS DBG (pid 658): try_read_node: LEB 91:123112, data node, length 1477
UBIFS DBG (pid 658): do_readpage: ino 163, pg 67, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 67)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 92:17728, key (163, data, 67)
UBIFS DBG (pid 658): try_read_node: LEB 92:17728, data node, length 1333
UBIFS DBG (pid 658): do_readpage: ino 163, pg 68, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 68)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 92:19064, key (163, data, 68)
UBIFS DBG (pid 658): try_read_node: LEB 92:19064, data node, length 1425
UBIFS DBG (pid 658): do_readpage: ino 163, pg 71, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 71)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 92:23464, key (163, data, 71)
UBIFS DBG (pid 658): try_read_node: LEB 92:23464, data node, length 1561
UBIFS DBG (pid 658): do_readpage: ino 163, pg 77, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 77)
UBIFS DBG (pid 658): ubifs_read_node: LEB 109:125952, indexing node,
length 188
UBIFS DBG (pid 658): read_znode: LEB 109:125952, level 0, 8 branch
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 92:32712, key (163, data, 77)
UBIFS DBG (pid 658): try_read_node: LEB 92:32712, data node, length 1575
[HAL1_0_Init_Step2] configured vout mode: 720P60
UBIFS DBG (pid 658): do_readpage: ino 84, pg 37, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 37)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 26:5112, key (84, data, 37)
UBIFS DBG (pid 658): try_read_node: LEB 26:5112, data node, length 816
UBIFS DBG (pid 658): do_readpage: ino 84, pg 76, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 76)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 26:45632, key (84, data, 76)
UBIFS DBG (pid 658): try_read_node: LEB 26:45632, data node, length 788
UBIFS DBG (pid 658): do_readpage: ino 84, pg 72, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 72)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 26:42472, key (84, data, 72)
UBIFS DBG (pid 658): try_read_node: LEB 26:42472, data node, length 793
UBIFS DBG (pid 658): do_readpage: ino 84, pg 60, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 60)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 26:31816, key (84, data, 60)
UBIFS DBG (pid 658): try_read_node: LEB 26:31816, data node, length 782
UBIFS DBG (pid 658): do_readpage: ino 87, pg 2, i_size 28872, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (87, data, 2)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 38:84880, key (87, data, 2)
UBIFS DBG (pid 658): try_read_node: LEB 38:84880, data node, length 1952
UBIFS DBG (pid 658): do_readpage: ino 84, pg 65, i_size 3258056, flags 0x1
UBIFS DBG (pid 696): do_readpage: ino 163, pg 75, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 65)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 696): ubifs_lookup_level0: search key (163, data, 75)
UBIFS DBG (pid 658): fallible_read_node: LEB 26:35960, key (84, data, 65)
UBIFS DBG (pid 696): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): try_read_node: LEB 26:35960, data node, length 771
UBIFS DBG (pid 696): fallible_read_node: LEB 92:29560, key (163, data, 75)
UBIFS DBG (pid 696): try_read_node: LEB 92:29560, data node, length 1453
UBIFS DBG (pid 658): do_readpage: ino 84, pg 66, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 66)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 26:36736, key (84, data, 66)
UBIFS DBG (pid 658): try_read_node: LEB 26:36736, data node, length 781
UBIFS DBG (pid 658): do_readpage: ino 84, pg 67, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 67)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:37520, key (84, data, 67)
UBIFS DBG (pid 658): try_read_node: LEB 26:37520, data node, length 763
UBIFS DBG (pid 658): do_readpage: ino 84, pg 63, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 63)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 26:34432, key (84, data, 63)
UBIFS DBG (pid 658): try_read_node: LEB 26:34432, data node, length 767
UBIFS DBG (pid 658): do_readpage: ino 84, pg 79, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 79)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 26:48264, key (84, data, 79)
UBIFS DBG (pid 658): try_read_node: LEB 26:48264, data node, length 773
UBIFS DBG (pid 658): do_readpage: ino 163, pg 78, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 78)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 92:34288, key (163, data, 78)
UBIFS DBG (pid 658): try_read_node: LEB 92:34288, data node, length 1156
UBIFS DBG (pid 658): do_readpage: ino 163, pg 76, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 76)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 92:31016, key (163, data, 76)
UBIFS DBG (pid 658): try_read_node: LEB 92:31016, data node, length 1692
UBIFS DBG (pid 658): do_readpage: ino 84, pg 77, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 77)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 26:46424, key (84, data, 77)
UBIFS DBG (pid 658): try_read_node: LEB 26:46424, data node, length 806
UBIFS DBG (pid 658): do_readpage: ino 163, pg 109, i_size 515924, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 109)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 92:90608, key (163, data, 109)
UBIFS DBG (pid 658): try_read_node: LEB 92:90608, data node, length 2195
Check Tuner Type: DRV_TunerBCM7125
Check Tuner Type: DRV_TunerBCM7125
UBIFS DBG (pid 658): do_readpage: ino 163, pg 94, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 94)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 92:56576, key (163, data, 94)
UBIFS DBG (pid 658): try_read_node: LEB 92:56576, data node, length 1370
UBIFS DBG (pid 658): do_readpage: ino 84, pg 51, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 51)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:23304, key (84, data, 51)
UBIFS DBG (pid 658): try_read_node: LEB 26:23304, data node, length 770
UBIFS DBG (pid 658): do_readpage: ino 84, pg 58, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 58)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 26:29624, key (84, data, 58)
UBIFS DBG (pid 658): try_read_node: LEB 26:29624, data node, length 946
UBIFS DBG (pid 658): do_readpage: ino 84, pg 57, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 57)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 26:28848, key (84, data, 57)
UBIFS DBG (pid 658): try_read_node: LEB 26:28848, data node, length 774
UBIFS DBG (pid 658): do_readpage: ino 163, pg 108, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 108)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 92:88456, key (163, data, 108)
UBIFS DBG (pid 658): try_read_node: LEB 92:88456, data node, length 2152
SYS_MsgQCreate id=1 pmsg=0x242a9b8
SYS_MsgQCreate id=2 pmsg=0x242aba0
SYS_TaskCreate StackSize =30720
tuner process ready
UBIFS DBG (pid 658): do_readpage: ino 163, pg 50, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 50)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 91:120160, key (163, data, 50)
UBIFS DBG (pid 658): try_read_node: LEB 91:120160, data node, length 1312
TASK CREATE NAME   ==    <TUNER>
UBIFS DBG (pid 658): do_readpage: ino 70, pg 18, i_size 97860, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (70, data, 18)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 13:16584, key (70, data, 18)
UBIFS DBG (pid 658): try_read_node: LEB 13:16584, data node, length 1526
ir enter mtc mode@@@@@@@@@@@@@@

UBIFS DBG (pid 700): do_readpage: ino 70, pg 17, i_size 97860, flags 0x1
UBIFS DBG (pid 700): ubifs_lookup_level0: search key (70, data, 17)
UBIFS DBG (pid 700): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 700): fallible_read_node: LEB 13:15352, key (70, data, 17)
UBIFS DBG (pid 700): try_read_node: LEB 13:15352, data node, length 1227
UBIFS DBG (pid 700): do_readpage: ino 70, pg 13, i_size 97860, flags 0x1
UBIFS DBG (pid 700): ubifs_lookup_level0: search key (70, data, 13)
UBIFS DBG (pid 700): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 700): fallible_read_node: LEB 13:10696, key (70, data, 13)
UBIFS DBG (pid 700): try_read_node: LEB 13:10696, data node, length 968
UBIFS DBG (pid 658): do_readpage: ino 163, pg 35, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 35)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 91:97440, key (163, data, 35)
UBIFS DBG (pid 658): try_read_node: LEB 91:97440, data node, length 1525
UBIFS DBG (pid 658): do_readpage: ino 163, pg 92, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 92)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 92:53784, key (163, data, 92)
UBIFS DBG (pid 658): try_read_node: LEB 92:53784, data node, length 1539
createSettings.width[720] createSettings.height[576]
createSettings.width[720] createSettings.height[576]
UBIFS DBG (pid 658): do_readpage: ino 103, pg 3, i_size 41876, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (103, data, 3)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 83:45864, key (103, data, 3)
UBIFS DBG (pid 658): try_read_node: LEB 83:45864, data node, length 1250
UBIFS DBG (pid 658): do_readpage: ino 103, pg 5, i_size 41876, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (103, data, 5)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): fallible_read_node: LEB 83:48616, key (103, data, 5)
UBIFS DBG (pid 658): try_read_node: LEB 83:48616, data node, length 1169
UBIFS DBG (pid 658): do_readpage: ino 103, pg 7, i_size 41876, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (103, data, 7)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 83:51248, key (103, data, 7)
UBIFS DBG (pid 658): try_read_node: LEB 83:51248, data node, length 1470
UBIFS DBG (pid 658): do_readpage: ino 103, pg 6, i_size 41876, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (103, data, 6)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 83:49792, key (103, data, 6)
UBIFS DBG (pid 658): try_read_node: LEB 83:49792, data node, length 1456
UBIFS DBG (pid 658): do_readpage: ino 103, pg 4, i_size 41876, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (103, data, 4)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 83:47120, key (103, data, 4)
UBIFS DBG (pid 658): try_read_node: LEB 83:47120, data node, length 1491
SYS_MsgQCreate id=3 pmsg=0x242b140
UBIFS DBG (pid 658): do_readpage: ino 163, pg 62, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 62)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 658): fallible_read_node: LEB 92:10552, key (163, data, 62)
UBIFS DBG (pid 658): try_read_node: LEB 92:10552, data node, length 1590
UBIFS DBG (pid 658): do_readpage: ino 163, pg 59, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 59)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 658): fallible_read_node: LEB 92:7304, key (163, data, 59)
UBIFS DBG (pid 658): try_read_node: LEB 92:7304, data node, length 1682
UBIFS DBG (pid 658): do_readpage: ino 163, pg 64, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 64)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 92:13536, key (163, data, 64)
UBIFS DBG (pid 658): try_read_node: LEB 92:13536, data node, length 1419
UBIFS DBG (pid 658): do_readpage: ino 163, pg 58, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 58)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 92:5600, key (163, data, 58)
UBIFS DBG (pid 658): try_read_node: LEB 92:5600, data node, length 1697
SYS_TaskCreate StackSize =8192
TASK CREATE NAME   ==    <LedScanKeyTask>
SYS_MsgQCreate id=4 pmsg=0x242b1a8

DRV_PanelKeyListInit1543: KeyListInitPortFun=0x43ba3c
DRV_PanelKeyListInit1544:
KeyListInitPortFun=0x43ba3c,KeyTable=0x482c2c,DrvFpKeySize=0x7SYS_TaskCreate
StackSize =1024
TASK CREATE NAME   ==    <DispanelProcess>
UBIFS DBG (pid 704): do_readpage: ino 163, pg 60, i_size 515924, flags 0x1
UBIFS DBG (pid 704): ubifs_lookup_level0: search key (163, data, 60)
UBIFS DBG (pid 658): do_readpage: ino 163, pg 32, i_size 515924, flags 0x1
UBIFS DBG (pid 704): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 32)
UBIFS DBG (pid 704): fallible_read_node: LEB 92:8992, key (163, data, 60)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 704): try_read_node: LEB 92:8992, data node, length 862
UBIFS DBG (pid 658): fallible_read_node: LEB 91:93488, key (163, data, 32)
UBIFS DBG (pid 658): try_read_node: LEB 91:93488, data node, length 1318
UBIFS DBG (pid 704): do_readpage: ino 163, pg 61, i_size 515924, flags 0x1
UBIFS DBG (pid 704): ubifs_lookup_level0: search key (163, data, 61)
UBIFS DBG (pid 704): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 704): fallible_read_node: LEB 92:9856, key (163, data, 61)
UBIFS DBG (pid 704): try_read_node: LEB 92:9856, data node, length 689
UBIFS DBG (pid 658): do_readpage: ino 163, pg 21, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 21)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 91:78544, key (163, data, 21)
UBIFS DBG (pid 658): try_read_node: LEB 91:78544, data node, length 1456
UBIFS DBG (pid 706): do_readpage: ino 163, pg 20, i_size 515924, flags 0x1
UBIFS DBG (pid 706): ubifs_lookup_level0: search key (163, data, 20)
UBIFS DBG (pid 706): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 706): fallible_read_node: LEB 91:76928, key (163, data, 20)
UBIFS DBG (pid 706): try_read_node: LEB 91:76928, data node, length 1610
UBIFS DBG (pid 658): do_readpage: ino 163, pg 40, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 40)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 658): fallible_read_node: LEB 91:104528, key (163, data, 40)
UBIFS DBG (pid 658): try_read_node: LEB 91:104528, data node, length 1657
process_tuner_msg ready
 UBIFS DBG (pid 658): do_readpage: ino 163, pg 29, i_size 515924, flags 0x21
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 29)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 658): fallible_read_node: LEB 91:89264, key (163, data, 29)
UBIFS DBG (pid 658): try_read_node: LEB 91:89264, data node, length 1704
UBIFS DBG (pid 708): do_readpage: ino 163, pg 28, i_size 515924, flags 0x1
UBIFS DBG (pid 708): ubifs_lookup_level0: search key (163, data, 28)
UBIFS DBG (pid 708): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 708): fallible_read_node: LEB 91:87688, key (163, data, 28)
UBIFS DBG (pid 708): try_read_node: LEB 91:87688, data node, length 1575
UBIFS DBG (pid 658): do_readpage: ino 163, pg 18, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 18)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 91:73720, key (163, data, 18)
UBIFS DBG (pid 658): try_read_node: LEB 91:73720, data node, length 1401
_XML_GetNodeSet No result: Config.DigitalAudio.Spdif.OnOff
No element is found
UBIFS DBG (pid 658): do_readpage: ino 163, pg 41, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 41)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 91:106192, key (163, data, 41)
UBIFS DBG (pid 658): try_read_node: LEB 91:106192, data node, length 1506
UBIFS DBG (pid 658): do_readpage: ino 84, pg 75, i_size 3258056, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (84, data, 75)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 26:44840, key (84, data, 75)
UBIFS DBG (pid 658): try_read_node: LEB 26:44840, data node, length 790
UBIFS DBG (pid 658): do_readpage: ino 163, pg 79, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 79)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 92:35448, key (163, data, 79)
UBIFS DBG (pid 658): try_read_node: LEB 92:35448, data node, length 1175
_XML_GetNodeSet No result: Config.Video.Conversion
No element is found
UBIFS DBG (pid 658): do_readpage: ino 163, pg 74, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 74)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 92:27824, key (163, data, 74)
UBIFS DBG (pid 658): try_read_node: LEB 92:27824, data node, length 1731
_XML_GetNodeSet No result: Config.Video.Ratio
No element is found
[set_vout_param] unknown configured screen ration: , use default value 4:3
UBIFS DBG (pid 658): do_readpage: ino 163, pg 39, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 39)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 658): fallible_read_node: LEB 91:103552, key (163, data, 39)
UBIFS DBG (pid 658): try_read_node: LEB 91:103552, data node, length 973
UBIFS DBG (pid 658): do_readpage: ino 163, pg 65, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 65)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 658): fallible_read_node: LEB 92:14960, key (163, data, 65)
UBIFS DBG (pid 658): try_read_node: LEB 92:14960, data node, length 1309
*** 00:00:00.699 nexus_smartcard: Open smart card slot:0
KBD initializing...
KBD successully initialized !
@@@@@@@@@@@@@@@@@@@@@@@@@@DRV_KeySetCallBack :0x41e0b0
UBIFS DBG (pid 713): do_readpage: ino 163, pg 30, i_size 515924, flags 0x1
UBIFS DBG (pid 713): ubifs_lookup_level0: search key (163, data, 30)
UBIFS DBG (pid 713): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 713): fallible_read_node: LEB 91:90968, key (163, data, 30)
UBIFS DBG (pid 713): try_read_node: LEB 91:90968, data node, length 1211
UBIFS DBG (pid 713): do_readpage: ino 163, pg 31, i_size 515924, flags 0x1
UBIFS DBG (pid 713): ubifs_lookup_level0: search key (163, data, 31)
UBIFS DBG (pid 713): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 713): fallible_read_node: LEB 91:92184, key (163, data, 31)
UBIFS DBG (pid 713): try_read_node: LEB 91:92184, data node, length 1302
UBIFS DBG (pid 715): do_readpage: ino 163, pg 22, i_size 515924, flags 0x1
UBIFS DBG (pid 715): ubifs_lookup_level0: search key (163, data, 22)
UBIFS DBG (pid 715): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 715): fallible_read_node: LEB 91:80000, key (163, data, 22)
UBIFS DBG (pid 715): try_read_node: LEB 91:80000, data node, length 1501
_XML_GetNodeSet No result: platform_main
No element is found
platform_main_init_ok
UBIFS DBG (pid 658): do_readpage: ino 163, pg 34, i_size 515924, flags 0x1
UBIFS DBG (pid 658): ubifs_lookup_level0: search key (163, data, 34)
UBIFS DBG (pid 658): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 658): fallible_read_node: LEB 91:95984, key (163, data, 34)
UBIFS DBG (pid 658): try_read_node: LEB 91:95984, data node, length 1451
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
UBIFS DBG (pid 444): ubifs_lookup: 'mtc.sh' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0xc21e3e0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): ubifs_read_node: LEB 105:52176, direntry node,
length 63
UBIFS DBG (pid 444): ubifs_iget: inode 183
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:19392, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:19392, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 105:52016, key (183, inode)
UBIFS DBG (pid 444): try_read_node: LEB 105:52016, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 183, pg 0, i_size 339, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 105:51752, key (183, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 105:51752, data node, length 258
UBIFS DBG (pid 444): ubifs_lookup: 'application.env' in dir ino 65
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (65, direntry,
0x5b87476)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 444): ubifs_read_node: LEB 154:108968, direntry node,
length 72
UBIFS DBG (pid 444): ubifs_iget: inode 988
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, inode)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108808, key (988, inode)
UBIFS DBG (pid 444): try_read_node: LEB 154:108808, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 988, pg 0, i_size 2894, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108064, key (988, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 154:108064, data node, length 741
UBIFS DBG (pid 444): ubifs_lookup: 'sed' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x28c69d)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 0, lvl 0, n 3
UBIFS DBG (pid 444): ubifs_lookup: not found
UBIFS DBG (pid 727): ubifs_lookup: 'application' in dir ino 65
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (65, direntry,
0xe1931f)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 154:107992, direntry node,
length 68
UBIFS DBG (pid 727): ubifs_iget: inode 115
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (115, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:63904, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:63904, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:16408, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:16408, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:18240, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:18240, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 727): fallible_read_node: LEB 154:107832, key (115, inode)
UBIFS DBG (pid 727): try_read_node: LEB 154:107832, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'cloudbb' in dir ino 115
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (115, direntry,
0xcf80fb)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:16600, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:16600, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:18432, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:18432, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:87272, direntry node, length 64
UBIFS DBG (pid 727): ubifs_iget: inode 200
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (200, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:64480, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:64480, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:21592, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:21592, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:58368, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:58368, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 727): fallible_read_node: LEB 67:87112, key (200, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:87112, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'vinput_modules' in dir ino 200
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (200, direntry,
0xda684a3)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:86384, direntry node, length 71
UBIFS DBG (pid 727): ubifs_iget: inode 221
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (221, inode)
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:64672, indexing node,
length 188
wait for manually start mtc by executing mtc_start.sh.
UBIFS DBG (pid 727): read_znode: LEB 305:64672, level 2, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 305:22936, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 305:22936, level 1, 8 branch
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:69504, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:69504, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 727): fallible_read_node: LEB 67:86224, key (221, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:86224, inode node, length 160
UBIFS DBG (pid 727): ubifs_lookup: 'install_vinput.sh' in dir ino 221
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (221, direntry,
0x3928132)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 727): ubifs_read_node: LEB 67:79832, direntry node, length 74
oof End ------------------------->
UBIFS DBG (pid 727): ubifs_iget: inode 222
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (222, inode)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 727): fallible_read_node: LEB 67:79672, key (222, inode)
UBIFS DBG (pid 727): try_read_node: LEB 67:79672, inode node, length 160
UBIFS DBG (pid 727): do_readpage: ino 222, pg 0, i_size 182, flags 0x1
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (222, data, 0)
UBIFS DBG (pid 727): ubifs_read_node: LEB 302:69696, indexing node,
length 188
UBIFS DBG (pid 727): read_znode: LEB 302:69696, level 0, 8 branch
UBIFS DBG (pid 727): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 727): fallible_read_node: LEB 67:79496, key (222, data, 0)
UBIFS DBG (pid 727): try_read_node: LEB 67:79496, data node, length 169
UBIFS DBG (pid 728): ubifs_lookup: 'dirname' in dir ino 152
UBIFS DBG (pid 728): ubifs_lookup_level0: search key (152, direntry,
0xeb21cb5)
UBIFS DBG (pid 728): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 728): ubifs_lookup: not found
UBIFS DBG (pid 727): ubifs_lookup: 'chmod' in dir ino 152
UBIFS DBG (pid 727): ubifs_lookup_level0: search key (152, direntry,
0x10df8542)
UBIFS DBG (pid 727): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 727): ubifs_lookup: not found
UBIFS DBG (pid 733): ubifs_lookup: 'vkbd.ko' in dir ino 221
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (221, direntry,
0x1f1578a1)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 733): ubifs_read_node: LEB 67:83072, direntry node, length 64
UBIFS DBG (pid 733): ubifs_iget: inode 223
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 733): fallible_read_node: LEB 67:82912, key (223, inode)
UBIFS DBG (pid 733): try_read_node: LEB 67:82912, inode node, length 160
UBIFS DBG (pid 733): do_readpage: ino 223, pg 0, i_size 6694, flags 0x1
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, data, 0)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 733): fallible_read_node: LEB 67:79912, key (223, data, 0)
UBIFS DBG (pid 733): try_read_node: LEB 67:79912, data node, length 1792
UBIFS DBG (pid 733): do_readpage: ino 223, pg 1, i_size 6694, flags 0x1
UBIFS DBG (pid 733): ubifs_lookup_level0: search key (223, data, 1)
UBIFS DBG (pid 733): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 733): fallible_read_node: LEB 67:81704, key (223, data, 1)
UBIFS DBG (pid 733): try_read_node: LEB 67:81704, data node, length 1201
input: vkeyboard as /class/input/input0
UBIFS DBG (pid 736): ubifs_lookup: 'vmouse.ko' in dir ino 221
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (221, direntry,
0x2ec3295)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 736): ubifs_read_node: LEB 67:86152, direntry node, length 66
starting pid 1, tty '/dev/ttyS0': '/bin/login -f root'
UBIFS DBG (pid 736): ubifs_iget: inode 224
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, inode)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 736): fallible_read_node: LEB 67:85992, key (224, inode)
UBIFS DBG (pid 736): try_read_node: LEB 67:85992, inode node, length 160
UBIFS DBG (pid 736): do_readpage: ino 224, pg 0, i_size 6541, flags 0x1
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, data, 0)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 736): fallible_read_node: LEB 67:83136, key (224, data, 0)
UBIFS DBG (pid 736): try_read_node: LEB 67:83136, data node, length 1715
UBIFS DBG (pid 736): do_readpage: ino 224, pg 1, i_size 6541, flags 0x1
UBIFS DBG (pid 736): ubifs_lookup_level0: search key (224, data, 1)
UBIFS DBG (pid 736): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 736): fallible_read_node: LEB 67:84856, key (224, data, 1)
UBIFS DBG (pid 736): try_read_node: LEB 67:84856, data node, length 1132
input: vmouse as /class/input/input1
UBIFS DBG (pid 444): ubifs_lookup: 'mtcenable' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x10cf5113)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): ubifs_read_node: LEB 106:33968, direntry node,
length 66
UBIFS DBG (pid 444): ubifs_iget: inode 202
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (202, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:57408, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:57408, level 2, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:43176, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:43176, level 1, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:21504, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:21504, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): fallible_read_node: LEB 106:33808, key (202, inode)
UBIFS DBG (pid 444): try_read_node: LEB 106:33808, inode node, length 160
Jan  1 00:00:28 login[741]: root login on 'ttyS0'
#
#
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
none on /proc/bus/usb type usbfs (rw,relatime)
debugfs on /proc/sys/debug type debugfs (rw,relatime)
sys on /sys type sysfs (rw,relatime)
tmpfs on /dev type tmpfs (rw,relatime,size=64k,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /tmp type tmpfs (rw,relatime)
ubi12:platform on /usr/local/hmt/platform type ubifs (rw,relatime)
ubi13_0 on /usr/local/hmt/appdata type ubifs (rw,sync,relatime)
ubi14_0 on /usr/local/hmt/.appmid type ubifs (rw,relatime)
#
#
#
# echo 7 > /proc/sys/kernel/printk
doneile :; do cp -a /usr/local/hmt/platform/f2 /usr/local/hmt/appdata/
&& sync;
UBIFS DBG (pid 757): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 112:4096, direntry node,
length 59, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 112:4096, direntry node, length 59
UBIFS DBG (pid 757): ubifs_iget: inode 223
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:71424, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:71424, level 2, 8 branch
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:69504, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:69504, level 1, 8 branch
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:69120, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:69120, level 0, 8 branch
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 112:6144, inode node,
length 160, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 112:6144, inode node, length 160
UBIFS DBG (pid 757): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 757): ubifs_iget: inode 79
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, inode)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 14:45056, inode node,
length 160, jhead 1
UBIFS DBG (pid 757): ubifs_read_node: LEB 14:45056, inode node, length 160
UBIFS DBG (pid 757): ubifs_unlink: dent 'f2' from ino 79 (nlink 1) in
dir ino 1
UBIFS DBG (pid 757): ubifs_jnl_update: ino 79, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 757): ubifs_add_orphan: ino 79
UBIFS DBG (pid 757): write_head: jhead 1, LEB 14:51200, len 384
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 14:51200
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free 75392, dirty 50880,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75776, dirty
50880, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 14:51200, 384 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75392, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free 73728, dirty 52544,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 75392, dirty
50880, flags 16
UBIFS DBG (pid 757): ubifs_tnc_remove_nm: f2, key (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85712, flags 48
UBIFS DBG (pid 757): ubifs_change_lp: LEB 12, free -2147483647, dirty
85840, flags 48
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85712, flags 48
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 1
UBIFS DBG (pid 757): ubifs_tnc_remove_nm: rc returned 1, znode 85950180, n 1
UBIFS DBG (pid 757): tnc_delete: deleting (1, direntry, 0x0328b7)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126752, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 13, free -2147483647, dirty
126811, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126752, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52544, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free -2147483647, dirty
52603, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52544, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 14:51264, len 160, key (79, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (79, inode)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85840, flags 48
UBIFS DBG (pid 757): ubifs_change_lp: LEB 12, free -2147483647, dirty
86028, flags 48
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 12, free 36864, dirty
85840, flags 48
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 14, free -2147483647, dirty
52768, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 14, free 73728, dirty
52608, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 14:51424, len 160, key (1, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126816, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 13, free -2147483647, dirty
126976, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 13, free 0, dirty
126816, flags 1
UBIFS DBG (pid 757): ubifs_delete_inode: inode 79, mode 0x81a4
UBIFS DBG (pid 757): ubifs_tnc_remove_ino: ino 79
UBIFS DBG (pid 757): ubifs_tnc_next_ent: (lowest) (79, xentry, 0x000000)
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, xentry, 0x000000)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 0, lvl 0, n 5
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (79, inode)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121408, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121500, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121408, flags 1
UBIFS DBG (pid 757): ubifs_tnc_remove_range: removing (79, data, 0)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121504, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121596, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121504, flags 1
UBIFS DBG (pid 757): ubifs_tnc_remove_range: removing (79, data, 1)
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121600, flags 1
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
121692, flags 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
121600, flags 1
UBIFS DBG (pid 757): u6:83968, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:83968
UBIFookup_dirty: LEB: ubifs_change_lp: LEB 16, free 42848, dirty 83808,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 43008, dirty
83808, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 16:83968, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 42848, dirty
83808, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free 40960, dirty 85696,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 42848, dirty
83808, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 16:83968, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85696, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free -2147483647, dirty
85856, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85696, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 76, len 4096, key
(80, data, 76)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 19:100352, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 19:100352
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26624, dirty
95648, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 19, free 26528, dirty 95648,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26624, dirty
95648, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 19:100352, len 92, key (80, data, 76)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 76)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 757): tnc_insert: splitting level 0, key (80, data, 76)
UBIFS DBG (pid 757): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 757): tnc_insert: inserting at 0 level 0, key (80, data, 76)
UBIFS DBG (pid 757): tnc_insert: inserted at 5 level 1, key (80, data, 76)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 19:100352, 96 bytes,
jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 19, free 24576, dirty 97600,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 77, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 77)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:81120, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:81120, data node, length 92
UBIFS DBG (pid 757): ubifs_write_end: ino 80, pos 315392, pg 77, len
4096, copied 4096, i_size 315392
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 77, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 16:86016, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:86016
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85856, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 16, free 40800, dirty 85856,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, free 40960, dirty
85856, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 16:86016, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 16, fred: jhead 1, LEB
22:4096, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:4096
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 122720, dirty 3936,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122880, dirty
3936, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 22:4096, 160 bytes, jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 120832, dirty 5824,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 122720, dirty
3936, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 22:4096, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free -2147483647, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5824, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 161, len 4096,
key (80, data, 161)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 24:20480, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:20480
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 24, free 106400, dirty 19520,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106496, dirty
19520, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 24:20480, len 92, key (80, data, 161)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 161)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 757): tnc_insert: inserted at 5 level 0, key (80, data, 161)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 24:20480, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106400, dirty
19520, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 24, free 104448, dirty 21472,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 24, free 106400, dirty
19520, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 162, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 162)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:89280, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:89280, data node, length 92
UBIFS DBG (pid 757): ubifs_write_end: ino 80, pos 663552, pg 162, len
4096, copied 4096, i_size 663552
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 162, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 22:6144, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:6144
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 120672, dirty 5984,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 22:6144, 160 bytes, jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 22, free 120672, dirty
5984, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 22, free 118784, dirty 769536,
dirty 54656, flEB 21, free 69632, dirtynew_wbuf_timer_nou0_dirty: search
 found 0, lvl 0, n 4
UBIFS DBG (pid 757): tnc_insert: inserted at 5 le, 241)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 21:57344, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 67584, dirty 56608,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 242, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 242)
UBIFS DBG (pid 757): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 757): ubifs_read_node_wbuf: LEB 108:96960, data node,
length 92, jhead 2
UBIFS DBG (pid 757): ubifs_read_node: LEB 108:96960, data node, leDBG
(pid 757): ubifs_write_end96, i_size 991232
UBIFS DBG (pid 757): ubifs_dirty_inode: inode 80
UBIFS DBG (pid 757): ubifs_writepage: ino 80, pg 242, pg flags 0xb0d
UBIFS DBG (pid 757): ubifs_write_inode: inode 80, mode 0x81a4, nlink 1
UBIFS DBG (pid 757): ubifs_jnl_write_inode: ino 80, nlink 1
UBIFS DBG (pid 757): write_head: jhead 1, LEB 15:43008, len 160
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:43008
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 15:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 757): ubifs_tnc_add: 15:43008, len 160, key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80, inode)
UBIFS DBG (pid 757): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 15, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 15, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 757): ubifs_jnl_write_data: ino 80, blk 242, len 4096,
key (80, data, 242)
UBIFS DBG (pid 757): write_node: jhead 2, LEB 21:59392, len 92
UBIFS DBG (pid 757): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:59392
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 67488, dirty 56608,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67584, dirty
56608, flags 16
UBIFS DBG (pid 757): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 757): ubifs_tnc_add: 21:59392, len 92, key (80, data, 242)
UBIFS DBG (pid 757): lookup_level0_dirty: search and dirty key (80,
data, 242)
UBIFS DBG (pid 757): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 757): tnc_insert: inserted at 6 level 0, key (80, data, 242)
UBIFS DBG (pid 757): ubifs_wbuf_sync_nolock: LEB 21:59392, 96 bytes, jhead 2
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 757): ubifs_change_lp: LEB 21, free 65536, dirty 58560,
flags 16
UBIFS DBG (pid 757): ubifs_lpt_lookup_dirty: LEB 21, free 67488, dirty
56608, flags 16
UBIFS DBG (pid 757): do_readpage: ino 223, pg 243, i_size 1048576, flags 0x1
UBIFS DBG (pid 757): ubifs_lookup_level0: search key (223, data, 243)
UBIFS DBG (pid 757): ubifs_read_node: LEB 110:76032, indexing node,
length 188
UBIFS DBG (pid 757): read_znode: LEB 110:76032, level d 759):
ubifs_wbuf_sync_nolock: LEB 23:92160, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 34720, dirty
87840, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 32768, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 34720, dirty
87840, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 266240, pg 65, len
4096, copied 4096, i_size 266240
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 65, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 22:88064, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:88064
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38912, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 38752, dirty 87904,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38912, dirty
87904, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 22:88064, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38752, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 36864, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 38752, dirty
87904, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 22:88064, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free -2147483647, dirty
89952, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 65, len 4096, key
(81, data, 65)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 23:94208, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 23:94208
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 32672, dirty 89792,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32768, dirty
89792, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 23:94208, len 92, key (81, data, 65)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 65)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 759): tnc_insert: inserted at 5 level 0, key (81, data, 65)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 23:94208, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 23, free 30720, dirty 91744,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 23, free 32672, dirty
89792, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 270336, pg 66, len
4096, copied 4096, i_size 270336
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 66, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 22:90112, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:90112
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89952, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 22, free 36704, dirty 89952,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 22, free 36864, dirty
89952, flags (pid 759): ubnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 13:55296, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:55296
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 71680, dirty
55136, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 71520, dirty 55136,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 71680, dirty
55136, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wlock: LEB 13:55296, 160 byrty: LEB 13, free
715759): ubifs_change_lp: LEB 13,pid 759): ubifs_lpt_lookup_dirty: LEB
13, free 71520, dirty 55136, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 13:55296, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57024, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free -2147483647, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57024, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 173, len 4096,
key (81, data, 173)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 10:61440, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:61440
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65536, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 10, free 65440, dirty 58560,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65536, dirty
58560, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 10:61440, len 92, key (81, data, 173)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 173)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 759): tnc_insert: inserted at 1 level 0, key (81, data, 173)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 10:61440, 96 bytes, jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65440, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 10, free 63488, dirty 60512,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 10, free 65440, dirty
58560, flags 16
UBIFS DBG (pid 759): ubifs_write_end: ino 81, pos 712704, pg 174, len
4096, copied 4096, i_size 712704
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_writepage: ino 81, pg 174, pg flags 0xb0d
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 13:57344, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:57344
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 69472, dirty 57184,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69632, dirty
57184, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 13:57344, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69472, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free 67584, dirty 59072,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 69472, dirty
57184, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 13:57344, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 13, free 67584, dirty
59072, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 13, free ck: 160 bytes (inode
node) to jhead 1 wbuf at LEB 20:96256
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30720, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 30560, dirty 96096,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30720, dirty
96096, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 20:96256, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30560, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 28672, dirty 97984,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 30560, dirty
96096, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 20:96256, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
97984, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free -2147483647, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
97984, flags 16
UBIFS DBG (pid 759): ubifs_jnl_write_data: ino 81, blk 255, len 4096,
key (81, data, 255)
UBIFS DBG (pid 759): write_node: jhead 2, LEB 24:102400, len 92
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:102400
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24576, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 24, free 24480, dirty 97600,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24576, dirty
97600, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_tnc_add: 24:102400, len 92, key (81, data, 255)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81,
data, 255)
UBIFS DBG (pid 759): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 759): tnc_insert: inserted at 3 level 0, key (81, data, 255)
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 24:102400, 96 bytes,
jhead 2
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24480, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 24, free 22528, dirty 99552,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 24, free 24480, dirty
97600, flags 16
UBIFS DBG (pid 759): ubifs_setattr: ino 81, mode 0x81a4, ia_valid 0x101f0
UBIFS DBG (pid 759): ubifs_dirty_inode: inode 81
UBIFS DBG (pid 759): ubifs_write_inode: inode 81, mode 0x81a4, nlink 1
UBIFS DBG (pid 759): ubifs_jnl_write_inode: ino 81, nlink 1
UBIFS DBG (pid 759): write_head: jhead 1, LEB 20:98304, len 160
UBIFS DBG (pid 759): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:98304
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 28512, dirty 98144,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28672, dirty
98144, flags 16
UBIFS DBG (pid 759): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 759): ubifs_wbuf_sync_nolock: LEB 20:98304, 160 bytes,
jhead 1
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28512, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free 26624, dirty 100032,
flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 28512, dirty
98144, flags 16
UBIFS DBG (pid 759): ubifs_tnc_add: 20:98304, len 160, key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: search and dirty key (81, inode)
UBIFS DBG (pid 759): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, free 26624, dirty
100032, flags 16
UBIFS DBG (pid 759): ubifs_change_lp: LEB 20, free -2147483647, dirty
100192, flags 16
UBIFS DBG (pid 759): ubifs_lpt_lookup_dirty: LEB 20, f):
lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free -2147483647, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34496, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 87, len 4096, key
(82, data, 87)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 16:28672, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:28672
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98304, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 98208, dirty 27328,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98304, dirty
27328, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 16:28672, len 92, key (82, data, 87)
UBIFS DBG (pid 763): l key (82, data, 87)
UBIFS IFS DBG (pid 763): tnc_insert: inse DBG (pid 763):
ubifs_wbuf_sync_nolock: LEB 16:28672, 96 bytes, jhead 2
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98208, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 96256, dirty 29280,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 98208, dirty
27328, flags 16
UBIFS DBG (pid 763): ubifs_write_end: ino 82, pos 360448, pg 88, len
4096, copied 4096, i_size 360448
UBIFS DBG (pid 763): ubifs_dirty_inode: inode 82
UBIFS DBG (pid 763): ubifs_writepage: ino 82, pg 88, pg flags 0xb0d
UBIFS DBG (pid 763): ubifs_write_inode: inode 82, mode 0x81a4, nlink 1
UBIFS DBG (pid 763): ubifs_jnl_write_inode: ino 82, nlink 1
UBIFS DBG (pid 763): write_head: jhead 1, LEB 10:34816, len 160
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 10:34816
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free 92000, dirty 34656,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92160, dirty
34656, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_wbuf_sync_nolock: LEB 10:34816, 160 bytes,
jhead 1
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92000, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free 90112, dirty 36544,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 92000, dirty
34656, flags 16
UBIFS DBG (pid 763): ubifs_tnc_add: 10:34816, len 160, key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
36544, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 10, free -2147483647, dirty
36704, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 10, free 90112, dirty
36544, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 88, len 4096, key
(82, data, 88)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 16:30720, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 16:30720
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 16, free 96160, dirty 29280,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 16, free 96256, dirty
29280, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 16:30720, len 92, key (82, data, 88)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82,
data, 88)
UBIFS DBG (pid 763): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 763): tnc_insert: inserted at 4 level 0, key (82, data, 88)
UBIFS DBG (pid 763): ubifs_wbuf_sync_ino 82, nlink 1
UBIFFS DBG (pid t LEB 23:124928
24768, flags 16
UBIFS DBGflags 16
UBIFS DBG (pid 763): ubifs_lpt_loodirty 124768, flags 16
Ur jhead 1, 3000-5000 m_sync_nolock: LEB 23:124928, 1pt_lookup_dirty:
LEB 23, free 1888, dirty 124768, flags 16
UBIFS DBG (pid 3): ubifs_change_lp: LEB 23, free 0, dirty 126656, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 1888, dirty
124768, flags 16
UBIFS DBG (pid 763): ubifs_tnc_add: 23:124928, len 160, key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82, inode)
UBIFS DBG (pid 763): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126656, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 23, free -2147483647, dirty
126816, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 23, free 0, dirty
126656, flags 16
UBIFS DBG (pid 763): ubifs_jnl_write_data: ino 82, blk 194, len 4096,
key (82, data, 194)
UBIFS DBG (pid 763): write_node: jhead 2, LEB 21:120832, len 92
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:120832
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6144, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 21, free 6048, dirty 115168,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6144, dirty
115168, flags 16
UBIFS DBG (pid 763): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 763): ubifs_tnc_add: 21:120832, len 92, key (82, data, 194)
UBIFS DBG (pid 763): lookup_level0_dirty: search and dirty key (82,
data, 194)
UBIFS DBG (pid 763): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 763): tnc_insert: inserted at 6 level 0, key (82, data, 194)
UBIFS DBG (pid 763): ubifs_wbuf_sync_nolock: LEB 21:120832, 96 bytes,
jhead 2
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6048, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 21, free 4096, dirty 117120,
flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 21, free 6048, dirty
115168, flags 16
UBIFS DBG (pid 763): ubifs_write_end: ino 82, pos 798720, pg 195, len
4096, copied 4096, i_size 798720
UBIFS DBG (pid 763): ubifs_dirty_inode: inode 82
UBIFS DBG (pid 763): ubifs_writepage: ino 82, pg 195, pg flags 0xb0d
UBIFS DBG (pid 763): ubifs_write_inode: inode 82, mode 0x81a4, nlink 1
UBIFS DBG (pid 763): ubifs_jnl_write_inode: ino 82, nlink 1
UBIFS DBG (pid 763): ubifs_find_free_space: min_space 160
UBIFS DBG (pid 763): reserve_space: no free space  jhead 1, run GC
UBIFS DBG (pid 763): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 763): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 763): ubifs_find_dirty_leb: found LEB 15, free 0, dirty
126976, flags 0x5
UBIFS DBG (pid 763): ubifs_change_lp: LEB 15, free -2147483647, dirty
-2147483647, flags 21
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 5
UBIFS DBG (pid 763): ubifs_garbage_collect: found LEB 15: free 0, dirty
126976, sum 126976 (min. space 2048)
UBIFS DBG (pid 763): ubifs_garbage_collect: LEB 15 is free, return it
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 16
UBIFS DBG (pid 763): ubifs_change_lp: LEB 15, free 126976, dirty 0, flags 16
UBIFS DBG (pid 763): ubifs_lpt_lookup_dirty: LEB 15, free 0, dirty
126976, flags 16
UBIFS DBG (pid 763): reserve_space: got LEB 15 for jhead 1
UBIFS DBG (pid 763): ubifs_add_bud_to_log: write ref LEB 5:14336
UBIFS DBG (pid 763): ubifs_write_node: LEB 5:14336, reference node,
length 64 (aligned 2048)
UBIFS DBG (pid 763): ubifs_add_bud: LEB 15:0, jhead 1, bud_bytes 1048576
UBIFS DBG (pid 763): ubifs_wbuf_seek_nolock: LEB 15:0, jhead 1
UBIFS DBG (pid 763): write_head: jhead 1, LEB 15:0, len 160
UBIFS DBG (pid 763): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 15:0
UBIFS DBG (pid 763): ubifs_lpt_lookupup_dirty: LEB 13, free 6144, dirty
120640, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 13, free -2147483647, dirty
120732, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120640, flags 16
UBIFS DBG (pid 765): ubifs_tnc_remove_range: removing (82, data, 255)
UBIFS DBG (pid 765): tnc_delete: deleting (82, data, 252)
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120736, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 13, free -2147483647, dirty
120828, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 13, free 6144, dirty
120736, flags 16
UBIFS DBG (pid 765): ubifs_lookup_level0: search key (82, inode)
UBIFS DBG (pid 765): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 765): ubifs_delete_orphan: inum 82
UBIFS DBG (pid 765): ubifs_create: dent 'f2', mode 0x81a4 in dir ino 1
UBIFS DBG (pid 765): ubifs_jnl_update: ino 83, dent 'f2', data len 0 in
dir ino 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 14:6144, len 384
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 384 bytes (direntry node)
to jhead 1 wbuf at LEB 14:6144
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 120448, dirty 5984,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120832, dirty
5984, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 14:6144, 384 bytes, jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 120448, dirty
5984, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 118784, dirty 7648,
flags 16
UBIFS DBG (pid 765): ubif_lpt_lookup_dirty: LEB 14, fred 765):
ubifs_tnc_add_nm: LEB 14:6144, name 'f2', key (1, direntry, 0x0328b7)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 765): tnc_insert: inserted at 1 level 0, key (1,
direntry, 0x0328b7)
UBIFS DBG (pid 765): ubifs_tnc_add: 14:6208, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 765): tnc_insert: inserted at 3 level 0, key (83, inode)
UBIFS DBG (pid 765): ubifs_tnc_add: 14:6368, len 160, key (1, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7648, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free -2147483647, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7648, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 0, pg 0, len 4096,
copied 4096, i_size 0
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 0, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 14:8192, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 14:8192
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 118624, dirty 7808,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 14:8192, 160 bytes, jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, free 118624, dirty
7808, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 14, free 116736, dirty 9696,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 14, fr>UBIFS DBG (pid
765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106176, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free -2147483647, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106176, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 109, len 4096,
key (83, data, 109)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 15:90112, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:90112
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36864, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 36768, dirty 85888,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36864, dirty
85888, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 15:90112, len 92, key (83, data, 109)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83,
data, 109)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 765): tnc_insert: inserted at 1 level 0, key (83, data, 109)
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 15:90112, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36768, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 34816, dirty 87840,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 36768, dirty
85888, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 450560, pg 110, len
4096, copied 4096, i_size 450560
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 110, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 19:106496, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 19:106496
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free 20320, dirty 106336,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20480, dirty
106336, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 19:106496, 160 bytes,
jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free 18432, dirty 108224,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 20320, dirty
106336, flags 16
UBIFS DBG (pid 765): ubifs_tnc_add: 19:106496, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 19, free -2147483647, dirty
108384, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 19, free 18432, dirty
108224, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 110, len 4096,
key (83, data, 110)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 15:92160, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 15:92160
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 34816, dirty
87840, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 15, free 34720, dirty 87840,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 15, free 34816, dirty
87840, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 15:92160, len 92, key (83, data, 110
LEB 21:55296, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 71584, dirty
52704, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 69632, dirty 54656,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 71584, dirty
52704, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 888832, pg 217, len
4096, copied 4096, i_size 888832
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 217, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 22:71680, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:71680
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 55136, dirty 71520,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55296, dirty
71520, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 22:71680, 160 bytes,
jhead 1
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 53248, dirty 73408,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 55136, dirty
71520, flags 16
UBIFS DBG (pid 765): ubifs_tnc_add: 22:71680, len 160, key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83, inode)
UBIFS DBG (pid 765): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free -2147483647, dirty
73568, flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73408, flags 16
UBIFS DBG (pid 765): ubifs_jnl_write_data: ino 83, blk 217, len 4096,
key (83, data, 217)
UBIFS DBG (pid 765): write_node: jhead 2, LEB 21:57344, len 92
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 21:57344
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69632, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 69536, dirty 54656,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69632, dirty
54656, flags 16
UBIFS DBG (pid 765): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 765): ubifs_tnc_add: 21:57344, len 92, key (83, data, 217)
UBIFS DBG (pid 765): lookup_level0_dirty: search and dirty key (83,
data, 217)
UBIFS DBG (pid 765): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 765): tnc_insert: inserted at 5 level 0, key (83, data, 217)
UBIFS DBG (pid 765): ubifs_wbuf_sync_nolock: LEB 21:57344, 96 bytes, jhead 2
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 21, free 67584, dirty 56608,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 21, free 69536, dirty
54656, flags 16
UBIFS DBG (pid 765): ubifs_write_end: ino 83, pos 892928, pg 218, len
4096, copied 4096, i_size 892928
UBIFS DBG (pid 765): ubifs_dirty_inode: inode 83
UBIFS DBG (pid 765): ubifs_writepage: ino 83, pg 218, pg flags 0xb0d
UBIFS DBG (pid 765): ubifs_write_inode: inode 83, mode 0x81a4, nlink 1
UBIFS DBG (pid 765): ubifs_jnl_write_inode: ino 83, nlink 1
UBIFS DBG (pid 765): write_head: jhead 1, LEB 22:73728, len 160
UBIFS DBG (pid 765): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 22:73728
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 765): ubifs_change_lp: LEB 22, free 53088, dirty 73568,
flags 16
UBIFS DBG (pid 765): ubifs_lpt_lookup_dirty: LEB 22, free 53248, dirty
73568, flags 16
UBIFS DBG (pid  ubifs_lpt_lookup_dirty: LEB 18, free 49056, dirty 74656,
flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 139264, pg 34, len
4096, copied 4096, i_size 139264
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 34, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 16:104448, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:104448
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 22368, dirty 104064,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22528, dirty
104064, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 16:104448, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 20480, dirty 105952,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 22368, dirty
104064, flags 16
UBIFS DBG (pid 767): ubifs_tnc_add: 16:104448, len 160, key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free -2147483647, dirty
106112, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
105952, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 34, len 4096, key
(84, data, 34)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 18:79872, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 18:79872
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47104, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 18, free 47008, dirty 76608,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47104, dirty
76608, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 18:79872, len 92, key (84, data, 34)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 34)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 767): tnc_insert: inserted at 6 level 0, key (84, data, 34)
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 18:79872, 96 bytes, jhead 2
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47008, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 18, free 45056, dirty 78560,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 18, free 47008, dirty
76608, flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 143360, pg 35, len
4096, copied 4096, i_size 143360
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 35, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 16:106496, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 16:106496
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
106112, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 16, free 20320, dirty 106112,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 20480, dirty
106112, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 16:106496, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 16, free 203203
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65216, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free -2147483647, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65216, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 138, len 4096,
key (84, data, 138)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 24:38912, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:38912
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 87968, dirty 37088,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 24:38912, len 92, key (84, data, 138)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 138)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 767): tnc_insert: inserted at 6 level 0, key (84, data, 138)
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 24:38912, 96 bytes, jhead 2
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 86016, dirty 39040,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 767): ubifs_write_end: ino 84, pos 569344, pg 139, len
4096, copied 4096, i_size 569344
UBIFS DBG (pid 767): ubifs_dirty_inode: inode 84
UBIFS DBG (pid 767): ubifs_writepage: ino 84, pg 139, pg flags 0xb0d
UBIFS DBG (pid 767): ubifs_write_inode: inode 84, mode 0x81a4, nlink 1
UBIFS DBG (pid 767): ubifs_jnl_write_inode: ino 84, nlink 1
UBIFS DBG (pid 767): write_head: jhead 1, LEB 20:65536, len 160
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 20:65536
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free 61280, dirty 65376,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61440, dirty
65376, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_wbuf_sync_nolock: LEB 20:65536, 160 bytes,
jhead 1
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61280, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free 59392, dirty 67264,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 61280, dirty
65376, flags 16
UBIFS DBG (pid 767): ubifs_tnc_add: 20:65536, len 160, key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84, inode)
UBIFS DBG (pid 767): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 20, free -2147483647, dirty
67424, flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 20, free 59392, dirty
67264, flags 16
UBIFS DBG (pid 767): ubifs_jnl_write_data: ino 84, blk 139, len 4096,
key (84, data, 139)
UBIFS DBG (pid 767): write_node: jhead 2, LEB 24:40960, len 92
UBIFS DBG (pid 767): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 24:40960
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 86016, dirty
39040, flags 16
UBIFS DBG (pid 767): ubifs_change_lp: LEB 24, free 85920, dirty 39040,
flags 16
UBIFS DBG (pid 767): ubifs_lpt_lookup_dirty: LEB 24, free 86016, dirty
39040, flags 16
UBIFS DBG (pid 767): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 767): ubifs_tnc_add: 24:40960, len 92, key (84, data, 139)
UBIFS DBG (pid 767): lookup_level0_dirty: search and dirty key (84,
data, 139)
UBIFS DBG (pid 767): lookup_level0_dirty: found 0, lvl 0, n 6
UBIp_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free -2147483647, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42688, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 52, len 4096, key
(85, data, 52)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 20:6144, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 20:6144
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120832, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 120736, dirty 5856,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120832, dirty
5856, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 20:6144, len 92, key (85, data, 52)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 52)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 7
UBIFS DBG (pid 770): tnc_insert: splitting level 0, key (85, data, 52)
UBIFS DBG (pid 770): tnc_insert: moving 0, keeping 8
UBIFS DBG (pid 770): tnc_insert: inserting at 0 level 0, key (85, data, 52)
UBIFS DBG (pid 770): tnc_insert: inserted at 2 level 1, key (85, data, 52)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 20:6144, 96 bytes, jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120736, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 118784, dirty 7808,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 120736, dirty
5856, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 217088, pg 53, len
4096, copied 4096, i_size 217088
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 53, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 21:43008, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 21:43008
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free 83808, dirty 42848,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83968, dirty
42848, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 21:43008, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free 81920, dirty 44736,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 83808, dirty
42848, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 21:43008, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 21, free -2147483647, dirty
44896, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 21, free 81920, dirty
44736, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 53, len 4096, key
(85, data, 53)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 20:8192, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 20:8192
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 20, free 118688, dirty 7808,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 20, free 118784, dirty
7808, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
id 770): ubifs_lpt_lookup_dirty: LEB 14,  16
UBIFS D3000-5000 mil02400, len 92, key (85, data,evel0_dirty: slvl 0, n 4
UBIFS DBG (p7>UBIFS DBG (pBIFS DBG (pid 77IFS DBG (pid 770):
ubifs_change (pid 770): ubifs_lpt_lookup_dirty: LEUBIFS DBG (pid 770):
ubifs_write_end: ino 85, pos 663552, pg 162, len 4096, copied 4096,
i_size 663552
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 162, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 13:12288, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:12288
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114688, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 114528, dirty 12128,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114688, dirty
12128, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 13:12288, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114528, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 112640, dirty 14016,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 114528, dirty
12128, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 13:12288, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14016, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free -2147483647, dirty
14176, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14016, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 162, len 4096,
key (85, data, 162)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 14:104448, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 14:104448
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 14, free 22432, dirty 99552,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22528, dirty
99552, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 14:104448, len 92, key (85, data, 162)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 162)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 770): tnc_insert: inserted at 6 level 0, key (85, data, 162)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 14:104448, 96 bytes,
jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 14, free 20480, dirty 101504,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 14, free 22432, dirty
99552, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 667648, pg 163, len
4096, copied 4096, i_size 667648
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 163, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 13:14336, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:14336
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14176, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 13, free 112480, dirty 14176,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 13, free 112640, dirty
14176, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhe7>UBIFS DBG
(pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 24:73728, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 24:73728
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 53088, dirty 73568,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53248, dirty
73568, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 24:73728, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53088, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 51200, dirty 75456,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 53088, dirty
73568, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 24:73728, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85, inode)
UBIFS DBG (pid 770): lookup_level0_dirty: found 1, lvl 0, n 3
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75456, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free -2147483647, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75456, flags 16
UBIFS DBG (pid 770): ubifs_jnl_write_data: ino 85, blk 254, len 4096,
key (85, data, 254)
UBIFS DBG (pid 770): write_node: jhead 2, LEB 10:38912, len 92
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 92 bytes (data node) to
jhead 2 wbuf at LEB 10:38912
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 10, free 87968, dirty 37088,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 88064, dirty
37088, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 2,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_tnc_add: 10:38912, len 92, key (85, data, 254)
UBIFS DBG (pid 770): lookup_level0_dirty: search and dirty key (85,
data, 254)
UBIFS DBG (pid 770): lookup_level0_dirty: found 0, lvl 0, n 1
UBIFS DBG (pid 770): tnc_insert: inserted at 2 level 0, key (85, data, 254)
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 10:38912, 96 bytes, jhead 2
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 10, free 86016, dirty 39040,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 10, free 87968, dirty
37088, flags 16
UBIFS DBG (pid 770): ubifs_write_end: ino 85, pos 1044480, pg 255, len
4096, copied 4096, i_size 1044480
UBIFS DBG (pid 770): ubifs_dirty_inode: inode 85
UBIFS DBG (pid 770): ubifs_writepage: ino 85, pg 255, pg flags 0xb0d
UBIFS DBG (pid 770): ubifs_write_inode: inode 85, mode 0x81a4, nlink 1
UBIFS DBG (pid 770): ubifs_jnl_write_inode: ino 85, nlink 1
UBIFS DBG (pid 770): write_head: jhead 1, LEB 24:75776, len 160
UBIFS DBG (pid 770): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 24:75776
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 51040, dirty 75616,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51200, dirty
75616, flags 16
UBIFS DBG (pid 770): new_wbuf_timer_nolock: set timer for jhead 1,
3000-5000 millisecs
UBIFS DBG (pid 770): ubifs_wbuf_sync_nolock: LEB 24:75776, 160 bytes,
jhead 1
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_change_lp: LEB 24, free 49152, dirty 77504,
flags 16
UBIFS DBG (pid 770): ubifs_lpt_lookup_dirty: LEB 24, free 51040, dirty
75616, flags 16
UBIFS DBG (pid 770): ubifs_tnc_add: 24:75776, len 160, key (85, inode)
UBIFS DBG (pid 770): lookup_leved 2
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 778): ubifs_change_lp: LEB 19, free 24576, dirty 97600,
flags 16
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 19, free 26528, dirty
95648, flags 16
UBIFS DBG (pid 778): ubifs_write_end: ino 86, pos 372736, pg 91, len
4096, copied 4096, i_size 372736
UBIFS DBG (pid 778): ubifs_dirty_inode: inode 86
UBIFS DBG (pid 778): ubifs_writepage: ino 86, pg 91, pg flags 0xb0d
UBIFS DBG (pid 778): ubifs_write_inode: inode 86, mode 0x81a4, nlink 1
UBIFS DBG (pid 778): ubifs_jnl_write_inode: ino 86, nlink 1
UBIFS DBG (pid 778): write_head: jhead 1, LEB 13:20480, len 160
UBIFS DBG (pid 778): ubifs_wbuf_write_nolock: 160 bytes (inode node) to
jhead 1 wbuf at LEB 13:20480
UBIFS DBG (pid 778): ubifs_lpt_lookup_dirty: LEB 13, free 106496, dirty
20320, flags 16
UBIFS DBG (pid 778): ubifs
BCM70190040
1 20000000
a456
K1
K2

K3

K4

Shmoo Version=3.5
MEMC_0
L=FFFFFFFA U=00000032
0#RTR=00000000
G00000002
R=00000000
00000000000000000000000000000000000000000000000000000000
R=00000001
00000000000000000000000000000000000000000000000000000000
R=00000002
00000000000000000000000000000000000000000000000000000000
R=00000003
00000000000000000000000000000000000000000000000000000000
R=00000004
00000000000000000000000000000000000000000000000000000000
R=00000005
00000000000011111111111111111111111111111111110011100000
R=00000006
00000000000011111111111111111111111111111111111001100000
R=00000007
00000000000111111111111111111111111111111111110011100000
R=00000008
00000000000011111111111111111111111111111111111001100000
R=00000009
00000000000011111111111111111111111111111111111001100000
R=0000000A
00000000000011111111111111111111111111111111110011100000
R=0000000B
00000000000011111111111111111111111111111111110011100000
R=0000000C
00000000000011111111111111111111111111111111110001100000
R=0000000D
00000000000011111111111111111111111111111111110001100000
R=0000000E
00000000000111111111111111111111111111111111110001100000
R=0000000F
00000000000111111111111111111111111111111111110011100000
R=00000010
00000000000011111111111111111111111111111111110011100000
R=00000011
00000000000011111111111111111111111111111111111011100000
R=00000012
00000000000011111111111111111111111111111111111001100000
R=00000013
00000000000111111111111111111111111111111111110001100000
R=00000014
00000000000111111111111111111111111111111111110011100000
R=00000015
00000000000011111111111111111111111111111111111011100000
R=00000016
00000000000010111111111101111111111011111111110001000000
R=00000017
00000000000001010101000010010101010101010101010001000000
R=00000018
00000000000000000000000000000000000000000000000000000000
R=00000019
00000000000000000000000000000000000000000000000000000000
R=0000001A
00000000000000000000000000000000000000000000000000000000
R=0000001B
00000000000000000000000000000000000000000000000000000000
R=0000001C
00000000000000000000000000000000000000000000000000000000
R=0000001D
00000000000000000000000000000000000000000000000000000000
R=0000001E
00000000000000000000000000000000000000000000000000000000
R=0000001F
00000000000000000000000000000000000000000000000000000000
G=00000002 R=0000000D W=00000017
WBL
00001111111111111111111111111111111111111111111111110000
00000000000011111111111111111111111111111111111111111000
00001111111111111111111111111111111111111111110011000000
00000000111111111111111111111111111111111111111111111111
WBLC 00000015 0000001A 00000013 00000019
RBL
00001111111111111111111111000000
01111111111111111111111110000000
00000111111111111111111110000000
01111111111111111111111000000000
RBLC 0000000E 0000000C 0000000E 0000000B
!67!#
00000000bcde@

BCM97019E0 CFE v3.20, CFE core v3.12, Endian Mode: Little
Build Date: Sat Mar 31 13:38:45 CST 2012 (fengliu@zch124app04)
Copyright (C) Broadcom Corporation.

[@Mode Selection]
cannot open flash0.macadr
cannot get flash info
cannot open flash0.macadr
!!!cannot read mac address
MAC ADDRESS MUST BE PROGRAMMED!, using macprog command
CPU speed:       405MHz
Total memory:    256MB
DDR Freq:        666MHz
DDR Mode:        DDR3
DDR Width:       32
Boot Device:     NAND
ECC:           Hamming
Total flash:     128MB

Initializing USB.
USB: Locating Class 09 Vendor 0000 Product 0000: USB Root Hub

CFE initialized.


MAC  00:22:11:44:33:71
param id:67 is not found!
param id:67 is not found!

oof flag is 0!
param id:67 is not found!
param id:67 is not found!
Pattern: 0000007000000000
Pattern: 0000000003FFFFF8
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
Pattern: 0000007000000000
Pattern: 0000000089055D18
Pattern: 5555555555555555
Pattern: AAAAAAAAAAAAAAAA
memory test successful
nand_erase_block called: blk addr = 0x100000
Starting splash screen.
Invalid file format byte0 = ? byte1 = ?No valid image found in
flash0.splash - disabling splash
param id:63 is not found!
param id:63 is not found!

cmdline : ecm 32 16; boot -z -elf flash0.kernrootfs: 'bmem=133088K@110M
bmem=16416K@245728K root=/dev/ram oof=0'
Geometry = 00000001
ECM will be loaded using boot window(0eff8000, 00008000) and DOCSIS
window(0f000000, 01000000)
Loading bootloader from flash0.ecmboot at aeff8000, length 00008000
Loading nonvol from flash0.dyncfg at afff8000, length 00008000
Loading nonvol from flash0.permcfg at afff0000, length 00008000
Loading DOCSIS from flash0.docsis1 at afe00000, length 00200000
pinMux11 0x11112
pinMux10 0x20000001
Booting BNM MIPS revision 70190040
Loader:elf Filesys:raw Dev:flash0.kernrootfs File:
Options:bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
Loading: 0x80001000/14251520 0x80d98600/180624 Entry address is 0x80005ed0
TP1 Entry Address at 0x80000ffc = 80005ed0
Starting program at 0x80005ed0

Linux version 2.6.31-3.3 (zhang_xiaoming@zch124app04) (gcc version 4.4.5
(Broadcom stbgcc-4.4.5-2.0) ) #10 SMP Wed Apr 11 09:18:13 CST 2012
Fetching vars from bootloader... found 56 vars.
Early serial console at MMIO 0x10406b00 (options '115200n8')
console [uart0] enabled
Options: enet_en=1 enet0_mii=0 enet_no_mdio=0 enet1_en=1 moca=0
         sata=0 docsis=0 pci=1 smp=1 usb=1
Using 256 MB + 0 MB RAM (from CFE)
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Determined physical RAM map:
 memory: 10000000 @ 00000000 (usable)
bmem: adding 129 MB RESERVED region at 110 MB (0x081f8000@0x06e00000)
bmem: adding 16 MB RESERVED region at 239 MB (0x01008000@0x0eff8000)
Initrd not found or empty - disabling initrd
Zone PFN ranges:
  Normal   0x00000000 -> 0x00010000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00010000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Kernel command line: bmem=133088K@110M bmem=16416K@245728K root=/dev/ram
oof=0
PID hash table entries: 1024 (order: 10, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Memory: 96068k/262144k available (4575k kernel code, 165892k reserved,
1247k data, 8096k init, 0k highmem)
NR_IRQS:128
Detected MIPS clock frequency: 405 MHz (202.502 MHz counter)
Console: colour dummy device 80x25
Calibrating delay loop... 404.48 BogoMIPS (lpj=202240)
Mount-cache hash table entries: 512
SMP: Booting CPU1...
CPU revision is: 0002a044 (Broadcom BMIPS4380)
FPU revision is: 00130001
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, cache aliases, linesize 64 bytes
Calibrating delay loop... 407.55 BogoMIPS (lpj=203776)
SMP: CPU1 is running
Brought up 2 CPUs
NET: Registered protocol family 16
USB0: power enable is active low; overcurrent is active low
PCI2.3->SDRAM window: 1024 MB
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
NET: Registered protocol family 1
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
fuse init (API version 7.12)
msgmni has been set to 187
io scheduler noop registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0x10406b00 (irq = 22) is a 16550A
console handover: boot [uart0] -> real [ttyS0]
serial8250.0: ttyS1 at MMIO 0x10406b40 (irq = 65) is a 16550A
serial8250.0: ttyS2 at MMIO 0x10406b80 (irq = 66) is a 16550A
brd: module loaded
loop: module loaded
brcm-pm: enabling moca_genet clocks
brcm-pm: enabling enet clocks
Config EPHY through MDIO
pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethernet driver
usbcore: registered new interface driver pegasus
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver net1080
usbcore: registered new interface driver cdc_subset
usbcore: registered new interface driver zaurus
Broadcom STB NAND controller (BrcmNand Controller)
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
brcm-pm: enabling usb clocks
ehci-brcm ehci-brcm.0: Broadcom STB EHCI
ehci-brcm ehci-brcm.0: new USB bus registered, assigned bus number 1
ehci-brcm ehci-brcm.0: irq 61, io mem 0x10488300
ehci-brcm ehci-brcm.0: USB 0.0 started, EHCI 1.00
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-brcm ohci-brcm.0: Broadcom STB OHCI
ohci-brcm ohci-brcm.0: new USB bus registered, assigned bus number 2
ohci-brcm ohci-brcm.0: irq 62, io mem 0x10488400
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (1503 buckets, 6012 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or
sysctl net.netfilter.nf_conntrack_acct=1 to enable it.
ctnetlink v0.93: registering with nfnetlink.
xt_time: kernel timezone is -0000
ip_tables: (C) 2000-2006 Netfilter Core Team
ClusterIP Version 0.8 loaded successfully
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 17
Bridge firewalling registered
Ebtables v2.0 registered
ebt_ulog: out of memory trying to call netlink_kernel_create
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
EBI CS0: setting up NAND flash (primary)
mtd->oobsize=0, mtd->eccOobSize=0
NAND_CS_NAND_XOR=00000000
B4: NandSelect=40000100, nandConfig=15142200, chipSelect=0
brcmnand_read_id: CS0: dev_id=2cf18095
After: NandSelect=40000100, nandConfig=15142200
Block size=00020000, erase shift=17
NAND Config: Reg=15142200, chipSize=128 MB, blockSize=128K, erase_shift=11
busWidth=1, pageSize=2048B, page_shift=11, page_mask=000007ff
timing1 not adjusted: 5363444f
timing2 not adjusted: 00000fc6
BrcmNAND mfg 2c f1 MICRON MT29F1G08ABA 128MB on CS0

Found NAND on CS0: ACC=f7441010, cfg=15142200, flashId=2cf18095,
tim1=5363444f, tim2=00000fc6
BrcmNAND version = 0x0303 128MB @00000000
brcmnand_scan: B4 nand_select = 40000100
brcmnand_scan: After nand_select = 40000100
handle_acc_control: default CORR ERR threshold  3 bits
ACC: 16 OOB bytes per 512B ECC step; from ID probe: 16
page_shift=11, bbt_erase_shift=17, chip_shift=27, phys_erase_shift=17
Brcm NAND controller version = 3.3 NAND flash size 128MB @18000000
ECC layout=brcmnand_oob_bch4_2k
brcmnand_scan:  mtd->oobsize=64
brcmnand_scan: oobavail=35, eccsize=512, writesize=2048
brcmnand_scan, eccsize=512, writesize=2048, eccsteps=4, ecclevel=4,
eccbytes=7
-->brcmnand_default_bbt
brcmnand_default_bbt: bbt_td = bbt_slc_bch4_main_descr
brcmnand_reset_corr_threshold: default CORR ERR threshold  3 bits for CS0
RedBoot partition parsing not available
Creating 16 MTD partitions on "brcmnand.0":
0x000000000000-0x000000100000 : "cfe"
0x000000100000-0x000000180000 : "cridata0"
0x000000180000-0x000000200000 : "cridata1"
0x000000200000-0x000000400000 : "splash"
0x000000400000-0x000000440000 : "ecmboot"
0x000000440000-0x0000004a0000 : "dyncfg"
0x0000004a0000-0x0000004e0000 : "permcfg"
0x0000004e0000-0x000000760000 : "docsis0"
0x000000760000-0x0000009e0000 : "docsis1"
0x0000009e0000-0x0000010e0000 : "loader_kernrootfs"
0x0000010e0000-0x000001ee0000 : "loader_upgradeapp"
0x000001ee0000-0x0000025e0000 : "kernrootfs"
0x0000025e0000-0x0000039e0000 : "platform"
0x0000039e0000-0x000003de0000 : "app_data"
0x000003de0000-0x000007700000 : "mid_app"
0x000007700000-0x000007f00000 : "download_data"
Freeing unused kernel memory: 8096k freed
starting pid 1, tty '': '/etc/init.d/rcS'
Mounting virtual filesystems
Starting mdev
* WARNING: THIS STB CONTAINS GPLv3 SOFTWARE
* GPLv3 programs must be removed in order to enable security.
* See: http://www.gnu.org/licenses/gpl-faq.html#Tivoization
Configuring eth0 interface
eth0: Link is up, 100 Mbps Full Duplex
eth0 Link UP.
Auto config phy
Configuring lo interface
Starting network services
Starting user services
oof Begin ------------------------->
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
oof Step1 ----------------UBI: attaching mtd12 to ubi12
--------->
EnteUBI: physical eraseblock size:   131072 bytes (128 KiB)
r Factory mode..UBI: logical eraseblock size:    126976 bytes
....
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd12 to ubi12
UBI: MTD device name:            "platform"
UBI: MTD device size:            20 MiB
UBI: number of good PEBs:        160
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 160
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1173831185
UBI: background thread "ubi_bgt12d" started, PID 453
UBI device number 12, total 160 LEBs (20316160 bytes, 19.4 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 12, volume 0, name "platform"
UBIFS: file system size:   17776640 bytes (17360 KiB, 16 MiB, 140 LEBs)
UBIFS: journal size:       2666496 bytes (2604 KiB, 2 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBI: attaching mtd13 to ubi13
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd13 to ubi13
UBI: MTD device name:            "app_data"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 8/5
UBI: image sequence number: 405604914
UBI: background thread "ubi_bgt13d" started, PID 472
UBI device number 13, total 32 LEBs (4063232 bytes, 3.9 MiB), available
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBI: attaching mtd14 to ubi14
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd14 to ubi14
UBI: MTD device name:            "mid_app"
UBI: MTD device size:            57 MiB
UBI: number of good PEBs:        457
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 457
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 1976325785
UBI: background thread "ubi_bgt14d" started, PID 479
UBI device number 14, total 457 LEBs (58028032 bytes, 55.3 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
UBIFS: recovery needed
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: f4f5fcf6 a83e3e6f 5e9fbf5e e6e83f80 b34e9dcf a8d9fa9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 773b0d4e fdbc5bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b b94d4319 dffafb6b fa1fe3db de84b3df fd78dada
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede786c 75f43cd0
fb7ae95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2bec0c 4c2b469e
3f67c7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 57dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 621ba2b0 7f7f15a7 da677f7c ff6e7fd8 7e0f3f8e 7c497bf2 b2bbe479
5a06bd30
0100: ed7ecc62 c789e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7d10dc67
0120: dd395ffa b7a5fc16 fd015759 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c664bda2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a b36fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc5c
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cbc
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 3f48fe83 6738ff10 55d66b77 2eb6ff53 a722ef79 76ab0d7b 5499fa5c
fcbefa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a64c>] ubi_io_read+0x8c/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: f4f5fcf6 a83e3e6f 5e9fbf5e e6e83f80 b34e9dcf a8d9fa9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 773b0d4e fdbc5bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b bd4d6319 dffafb6b fa1fe3db de84b3df fd78dada
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2f1 ff91ff1f f629fee9 8ede706c 75f63cd0
fb7ae95f
0080: 2dfe37df a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2fec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06da9e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab3
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc8fdfe f0c37a4e
f17befff
00e0: 621fa2b0 7f7f15a7 da677f7c ff6e7fd8 7e0fbf8e 7c497bf2 b2bbe479
5e06bd30
0100: ed7ecc62 c789e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7d10dc67
0120: dd395ffa b7a5fc16 fd01575d f7baf8ae 6285f7ad bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a5bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a b36fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc5c
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cbc
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff26 cf2dee8d b1402f18 b648bb25
465078a1
01e0: 3f48fe83 6738ff00 55d66b77 aeb6ff53 a726ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: b4f5fcf4 a83e3e6f 5e9fbf5e e6e83f80 a34e9dcf a8d9fb9d ff563694
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 771b0d4e fdb45bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b bd4d0319 dffafb6b fa1fe3d3 de84b3df fd78dade
e1ab1f4f
0060: 6f7227dc f7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede706c 75f63cd0
fb7aa95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadff45 ff2bec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 221ba2b0 7f7f15a7 da677f7c ff6e7fd8 7e0fbf8e 7c497bf2 b2bbe479
5a06b930
0100: ed7ecc62 c389e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7c10dc67
0120: dd395ffa b7a5fc16 fd015659 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667df1f 7989ff9a bb6fcf78 fc8edab6 b7dfd770 7f69fdce
686bfc54
0180: c66e3c7d 2785ff1e bf7ffe9c 7f9733f0 26b66140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bbb 6f749b71
da357cb4
01c0: 3b4bdb8c 52e3e0fa b57affb4 dd82ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 3f48fe87 6738ff10 55d46b77 2eb6ff53 a722ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
p8[9]=af
brcmnand_handle_false_read_ecc_unc_errors:2573 Uncorrectable error at
offset 3c81c00
Data:

0000: b4f5fcf4 a83e3e6f 5e8fbf5e e6e03f80 a34e9dcf a8d9fa9d ff563684
7ebebdf4
0020: dcdab2e7 4dfcbff7 ff72b703 771b0d4a fda45bdc bbbe7834 e6dd2f5f
f1ed7b1b
0040: da66594d fe18303b b94d4319 dffafb6b fa1fe3d3 de84b3df fd78d2da
e1ab1f4f
0060: 6f7227dc b7c87ef6 ff1ab2b1 ff91ff1f f629fee9 8ede786c 75f63cd0
fb7aa95f
0080: 2dfe375f a731feef 1ddefa4a 2dcbbbe5 fcadef05 ff2bec0c 4c2b469e
3f67d7fe
00a0: 276dfec0 2b59ffbf 06d89e8f ffbaffe1 e87fff56 fe437a9f 55dfbea7
3eb83ab1
00c0: bbb8bf7c 6b5ddffb fa146f34 ef6b65ee ff6c7b0e 7fc0fdfe f0c37a4e
f17befff
00e0: 221ba2b0 7f7f15a7 da677f7c ff6e77dc 7e0fbf8e 7c497bf2 b2bbe479
5a06b930
0100: ed7ecc62 d389e8f8 3ff57a12 74ebbfb8 5f095f52 dec741ee 79169d2e
7c10dc67
0120: dd395ffa b7a5fc16 fd015759 f7baf8ae 6285f72d bd7edffb f97cf7dd
77aaffda
0140: c6643da2 e3b21f3d 71a1bf47 ff785ffe 0f10ef72 4fec036f e7fe8f37
fdc6fb02
0160: 7ff6bf16 1667dd1f 7989ff9a bb6fcff8 fc8edab6 b7dfd770 7f69fdce
686bfc54
0180: c66e3c7d 2785ff1e af7ffe9c 7f9733f0 26b64140 ff9b98fd baaa7c66
c6fcbc60
01a0: fb2c263b e8dfbe0c b602ffcb 65d7ae3a f74a5eab d7593bab 6f749b71
da357cb4
01c0: 3b4bdb8c 52e3e0fa b57affb4 d982ff24 cb2dee8d b1402f18 b648bb25
464078a1
01e0: 1f48ee83 6738ff10 55d46b77 2eb6ff53 a722ef79 76ab0d7b 5489fa5c
f8befa6f
Spare Area
 ffffffff ffffffff ffafbfff fd9ffffe
brcmnand_post_mortem_dump at offset 3c81c00
Call Trace:
[<80016f2c>] dump_stack+0x8/0x34
[<803293d4>] brcmnand_post_mortem_dump+0x54/0x128
[<8032cffc>] brcmnand_ctrl_posted_read_cache+0x6f4/0x968
[<80326848>] brcmnand_read_page+0xdc/0x228
[<80327cf8>] brcmnand_do_read_ops+0xe4/0x2a8
[<80328cd8>] brcmnand_read+0xd0/0x144
[<80304954>] part_read+0x7c/0x124
[<8033a6a8>] ubi_io_read+0xe8/0x1a4
[<8033a000>] ubi_eba_read_leb+0x130/0x2e8
[<803379b8>] ubi_leb_read+0xf0/0x150
[<801efa48>] ubifs_start_scan+0x8c/0x18c
[<8020a830>] ubifs_recover_leb+0x78/0xc88
[<801f0d10>] ubifs_replay_journal+0x580/0x1d3c
[<801e26d0>] ubifs_fill_super+0xc34/0x1eb0
[<801e3ba0>] ubifs_get_sb+0x254/0x430
[<800cdca8>] vfs_kern_mount+0x50/0xbc
[<800cdd68>] do_kern_mount+0x44/0x128
[<800ed264>] do_mount+0x2d8/0x8d4
[<800ed8e4>] sys_mount+0x84/0xf8
[<80003e1c>] stack_done+0x20/0x3c

NAND registers snapshot

00442800:  00000303  01000000  00000000  03c81c00
00442810:  00000000  40000100  00000000  00000000
00442820:  ffffffff  ffffffff  ffafbfff  fd9ffffe
00442830:  ffffffff  ffffffff  ffffffff  ffffffff
00442840:  f7441010  00000000  15142200  00000000
00442850:  5363444f  00000fc6  00000000  00000000
00442860:  2cf18095  02000000  00000000  f00000e0
00442870:  00000000  00000000  00000000  03c81c00
00442880:  00000000  00000003  00000000  00000000
00442890:  00000000  03c81c00  00000000  03660600
004428a0:  00000000  00000000  00000000  03660000
004428b0:  00000000  1fc00010  00000000  00000000
004428c0:  00000000  00000000  00000000  00000000
004428d0:  f7441010  15142200  5363444f  00000fc6
004428e0:  f7441010  15142200  5363444f  00000fc6
004428f0:  f7441010  15142200  5363444f  00000fc6
brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
offset=3c81c00, ret=-77
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
21:4096, read 2048 bytes
UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
LEB 18:0, error -5
mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Input/output error
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 14, volume 0, name "app_mid"
UBIFS: file system size:   55615488 bytes (54312 KiB, 53 MiB, 438 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
Initializing broadcom driver...
bcmscbeth: module license 'Proprietary' taints kernel.
Disabling lock debugging due to kernel taint
bcm0: MBOX_SHM_ADDR at init!
bcm0: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm1: Broadcom BCM7019(E0) Virtual Ethernet Driver v1.18 Apr  7 2012
10:47:17
bcm0: MBOX_DMA_READY!
device bcm1 entered promiscuous mode
device eth0 entered promiscuous mode
br0: port 1(eth0) entering learning state
br0: port 2(bcm1) entering learning state
br0: starting userspace STP failed, starting kernel STP
Internet Systems Consortium DHCP Server V3.0.5
Copyright 2004-2006 Internet Systems Consortium.
All rights reserved.
For info, please visit http://www.isc.org/sw/dhcp/
Wrote 0 deleted host decls to leases file.
Wrote 0 new dynamic host decls to leases file.
Wrote 0 leases to leases file.
Listening on LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   LPF/br0/00:22:11:44:33:71/193.1.254/24
Sending on   Socket/fallback/fallback-net
udhcpc (v1.16.1) started
Sending discover...
mtdocap: Broadcom MTDOCAP driver v1.10 Apr  7 2012 10:47:18
insmod nexus ko...
main
Could not find ecm_prog_storage.  Setting up symbolic link to new eCM
Image Storage Path mtd_block3...
Could not find mtd_block3.  Creating...
Sending discover...
Sending select for 192.168.100.10...
nexus: module_layout: kernel tainted.
Lease of 192.168.100.10 obtained, lease time 30
deleting routers
nexus driver initialized
platform_main_init_todo
open log data error!
DRV_Flash_SetModuleInitParam entry
DRV_Flash_SetModuleInitParam finished
*** 00:00:00.645 nexus_platform: Release 97125 7.5
*** 00:00:00.645 BCHP_PWR: BCHP_PWR power management disabled
UBIFS DBG (pid 661): do_readpage: ino 84, pg 275, i_size 3258056, flags 0x1
UBIFS DBG (pid 661): ubifs_lookup_level0: search key (84, data, 275)
UBIFS DBG (pid 661): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 661): fallible_read_node: LEB 29:105096, key (84, data, 275)
UBIFS DBG (pid 661): try_read_node: LEB 29:105096, data node, length 1940
### 00:00:00.647 nexus_platform_config:
*****************************************************
### 00:00:00.647 nexus_platform_config: GISB Timeout writing addr
0x10310000 by core BSP
### 00:00:00.647 nexus_platform_config: This GISB timeout occured before
nexus started.
### 00:00:00.647 nexus_platform_config:
*****************************************************
*** 00:00:00.650 BMRC_MONITOR: ARC0 is protecting low memory for range
0x0...0x6e00040 (110 MB)
*** 00:00:00.659 nexus_audio_module: FW download used
UBIFS DBG (pid 662): do_readpage: ino 84, pg 243, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 243)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 29:54008, key (84, data, 243)
UBIFS DBG (pid 662): try_read_node: LEB 29:54008, data node, length 2292
UBIFS DBG (pid 662): do_readpage: ino 84, pg 478, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 478)
UBIFS DBG (pid 662): ubifs_read_node: LEB 110:28776, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 110:28776, level 1, 8 branch
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:33216, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:33216, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 33:3064, key (84, data, 478)
UBIFS DBG (pid 662): try_read_node: LEB 33:3064, data node, length 2909
UBIFS DBG (pid 662): do_readpage: ino 84, pg 558, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 558)
UBIFS DBG (pid 662): ubifs_read_node: LEB 110:28968, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 110:28968, level 1, 8 branch
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:34944, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:34944, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 34:91416, key (84, data, 558)
UBIFS DBG (pid 662): try_read_node: LEB 34:91416, data node, length 2684
UBIFS DBG (pid 662): do_readpage: ino 84, pg 566, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 566)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:35136, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:35136, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 34:113240, key (84, data, 566)
UBIFS DBG (pid 662): try_read_node: LEB 34:113240, data node, length 2517
UBIFS DBG (pid 662): do_readpage: ino 84, pg 567, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 567)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 34:115760, key (84, data, 567)
UBIFS DBG (pid 662): try_read_node: LEB 34:115760, data node, length 3381
UBIFS DBG (pid 662): do_readpage: ino 84, pg 428, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 428)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:32256, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:32256, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 32:20152, key (84, data, 428)
UBIFS DBG (pid 662): try_read_node: LEB 32:20152, data node, length 3002
UBIFS DBG (pid 662): do_readpage: ino 84, pg 424, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 424)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 32:9552, key (84, data, 424)
UBIFS DBG (pid 662): try_read_node: LEB 32:9552, data node, length 2891
UBIFS DBG (pid 662): do_readpage: ino 84, pg 425, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 425)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 32:12448, key (84, data, 425)
UBIFS DBG (pid 662): try_read_node: LEB 32:12448, data node, length 1793
UBIFS DBG (pid 662): do_readpage: ino 84, pg 476, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 476)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:33024, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:33024, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 32:125208, key (84, data, 476)
UBIFS DBG (pid 662): try_read_node: LEB 32:125208, data node, length 1715
6:124368, data node, length 1455
UBIFS DBG (pid 662): do_readpage: ino 84, pg 677, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 677)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 37:0, key (84, data, 677)
UBIFS DBG (pid 662): try_read_node: LEB 37:0, data node, length 2868
UBIFS DBG (pid 662): do_readpage: ino 84, pg 678, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 678)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 37:2872, key (84, data, 678)
UBIFS DBG (pid 662): try_read_node: LEB 37:2872, data node, length 2759
UBIFS DBG (pid 662): do_readpage: ino 84, pg 679, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 679)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 37:5632, key (84, data, 679)
UBIFS DBG (pid 662): try_read_node: LEB 37:5632, data node, length 2600
UBIFS DBG (pid 662): do_readpage: ino 84, pg 680, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 680)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 37:8232, key (84, data, 680)
UBIFS DBG (pid 662): try_read_node: LEB 37:8232, data node, length 2658
UBIFS DBG (pid 662): do_readpage: ino 84, pg 681, i_size 3258056, flags 0x21
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 681)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:37824, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:37824, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 37:10896, key (84, data, 681)
UBIFS DBG (pid 662): try_read_node: LEB 37:10896, data node, length 2606
UBIFS DBG (pid 662): do_readpage: ino 84, pg 682, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 682)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 37:13504, key (84, data, 682)
UBIFS DBG (pid 662): try_read_node: LEB 37:13504, data node, length 2691
UBIFS DBG (pid 662): do_readpage: ino 84, pg 683, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 683)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 37:16200, key (84, data, 683)
UBIFS DBG (pid 662): try_read_node: LEB 37:16200, data node, length 2795
UBIFS DBG (pid 662): do_readpage: ino 84, pg 684, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 684)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 37:19000, key (84, data, 684)
UBIFS DBG (pid 662): try_read_node: LEB 37:19000, data node, length 2830
UBIFS DBG (pid 662): do_readpage: ino 84, pg 685, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 685)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 37:21832, key (84, data, 685)
UBIFS DBG (pid 662): try_read_node: LEB 37:21832, data node, length 2708
UBIFS DBG (pid 662): do_readpage: ino 84, pg 686, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 686)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 37:24544, key (84, data, 686)
UBIFS DBG (pid 662): try_read_node: LEB 37:24544, data node, length 2629
UBIFS DBG (pid 662): do_readpage: ino 84, pg 687, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 687)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS , i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 725)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 37:80816, key (84, data, 725)
UBIFS DBG (pid 662): try_read_node: LEB 37:80816, data node, length 1304
UBIFS DBG (pid 662): do_readpage: ino 84, pg 726, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 726)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 37:82120, key (84, data, 726)
UBIFS DBG (pid 662): try_read_node: LEB 37:82120, data node, length 2108
UBIFS DBG (pid 662): do_readpage: ino 84, pg 727, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 727)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:38784, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:38784, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 37:84232, key (84, data, 727)
UBIFS DBG (pid 662): try_read_node: LEB 37:84232, data node, length 1416
UBIFS DBG (pid 662): do_readpage: ino 84, pg 728, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 728)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 37:85648, key (84, data, 728)
UBIFS DBG (pid 662): try_read_node: LEB 37:85648, data node, length 2480
UBIFS DBG (pid 662): do_readpage: ino 84, pg 729, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 729)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 37:88128, key (84, data, 729)
UBIFS DBG (pid 662): try_read_node: LEB 37:88128, data node, length 1696
UBIFS DBG (pid 662): do_readpage: ino 84, pg 730, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 730)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 37:89824, key (84, data, 730)
UBIFS DBG (pid 662): try_read_node: LEB 37:89824, data node, length 2366
UBIFS DBG (pid 662): do_readpage: ino 84, pg 731, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 731)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 37:92192, key (84, data, 731)
UBIFS DBG (pid 662): try_read_node: LEB 37:92192, data node, length 2682
UBIFS DBG (pid 662): do_readpage: ino 84, pg 732, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 732)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 37:94880, key (84, data, 732)
UBIFS DBG (pid 662): try_read_node: LEB 37:94880, data node, length 2659
UBIFS DBG (pid 662): do_readpage: ino 84, pg 733, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 733)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 37:97544, key (84, data, 733)
UBIFS DBG (pid 662): try_read_node: LEB 37:97544, data node, length 2979
UBIFS DBG (pid 662): do_readpage: ino 84, pg 734, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 734)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 37:100528, key (84, data, 734)
UBIFS DBG (pid 662): try_read_node: LEB 37:100528, data node, length 2812
UBIFS DBG (pid 662): do_readpage: ino 84, pg 735, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 735)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:38976, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:38976, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 37:103344, key (84, data, 735)
UBIFS DBG (pid 662): try_read_node: LEB 37:103344, data node, length 2637
UBIFS DBG (pid 662): do_readpage: ino 84, pg 736, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 736)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
cm_reachable.sh: ping 192.168.100.1 succeed. reset FAIL_CNT to 0
UBIFS DBG (pid 662): fallible_read_node: LEB 37:105984, key (84, data, 736)
UBIFS DBG (pid 662): try_read_node: LEB 37:105984, data node, length 2948
UBIFS DBG (pid 662): do_readpage: ino 84, pg 737, i_size 3258056, flags 0x21
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 737)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 37:108936, key (84, data, 737)
UBIFS DBG (pid 662): try_read_node: LEB 37:108936, data node, length 2816
UBIFS DBG (pid 662): do_readpage: ino 84, pg 738, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 738)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 37:111752, key (84, data, 738)
UBIFS DBG (pid 662): try_read_node: LEB 37:111752, data node, length 2521
UBIFS DBG (pid 662): do_readpage: ino 84, pg 739, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 739)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 37:114280, key (84, data, 739)
UBIFS DBG (pid 662): try_read_node: LEB 37:114280, data node, length 2829
UBIFS DBG (pid 662): do_readpage: ino 84, pg 740, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 740)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 37:117112, key (84, data, 740)
UBIFS DBG (pid 662): try_read_node: LEB 37:117112, data node, length 2661
UBIFS DBG (pid 662): do_readpage: ino 84, pg 741, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 741)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 37:119776, key (84, data, 741)
UBIFS DBG (pid 662): try_read_node: LEB 37:119776, data node, length 2580
UBIFS DBG (pid 662): do_readpage: ino 84, pg 742, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 742)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 37:122360, key (84, data, 742)
UBIFS DBG (pid 662): try_read_node: LEB 37:122360, data node, length 2349
UBIFS DBG (pid 662): do_readpage: ino 84, pg 743, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 743)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:39168, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:39168, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 38:0, key (84, data, 743)
UBIFS DBG (pid 662): try_read_node: LEB 38:0, data node, length 2674
UBIFS DBG (pid 662): do_readpage: ino 84, pg 744, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 744)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 38:2680, key (84, data, 744)
UBIFS DBG (pid 662): try_read_node: LEB 38:2680, data node, length 2942
UBIFS DBG (pid 662): do_readpage: ino 84, pg 745, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 745)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 38:5624, key (84, data, 745)
UBIFS DBG (pid 662): try_read_node: LEB 38:5624, data node, length 2913
UBIFS DBG (pid 662): do_readpage: ino 84, pg 746, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 746)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 38:8544, key (84, data, 746)
UBIFS DBG (pid 662): try_read_node: LEB 38:8544, data node, length 2718
UBIFS DBG (pid 662): do_readpage: ino 84, pg 747, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 747)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 38:11264, key (84, data, 747)
UBIFS DBG (pid 662): try_read_node: LEB 38:11264, data node, length 2900
UBIFS DBG (pid 662): do_readpage: ino 84, pg 748, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 748)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 38:14168, key (84, data, 748)
UBIFS DBG (pid 662): try_read_node: LEB 38:14168, data node, length 2850
UBIFS DBG (pid 662): do_readpage: ino 84, pg 749, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 749)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 38:17024, key (84, data, 749)
UBIFS DBG (pid 662): try_read_node: LEB 38:17024, data node, length 2876
UBIFS DBG (pid 662): do_readpage: ino 84, pg 750, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 750)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 38:19904, key (84, data, 750)
UBIFS DBG (pid 662): try_read_node: LEB 38:19904, data node, length 2857
UBIFS DBG (pid 662): do_readpage: ino 84, pg 751, i_size 3258056, flags 0x21
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 751)
UBIFS DBG (pid 662): ubifs_read_node: LEB 109:39360, indexing node,
length 188
UBIFS DBG (pid 662): read_znode: LEB 109:39360, level 0, 8 branch
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 38:22768, key (84, data, 751)
UBIFS DBG (pid 662): try_read_node: LEB 38:22768, data node, length 1932
UBIFS DBG (pid 662): do_readpage: ino 84, pg 752, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 752)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 38:24704, key (84, data, 752)
UBIFS DBG (pid 662): try_read_node: LEB 38:24704, data node, length 1987
UBIFS DBG (pid 662): do_readpage: ino 84, pg 753, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 753)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 38:26696, key (84, data, 753)
UBIFS DBG (pid 662): try_read_node: LEB 38:26696, data node, length 1910
UBIFS DBG (pid 662): do_readpage: ino 84, pg 754, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 754)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 38:28608, key (84, data, 754)
UBIFS DBG (pid 662): try_read_node: LEB 38:28608, data node, length 1924
UBIFS DBG (pid 662): do_readpage: ino 84, pg 755, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 755)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 38:30536, key (84, data, 755)
UBIFS DBG (pid 662): try_read_node: LEB 38:30536, data node, length 1981
UBIFS DBG (pid 662): do_readpage: ino 84, pg 756, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 756)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 38:32520, key (84, data, 756)
UBIFS DBG (pid 662): try_read_node: LEB 38:32520, data node, length 1840
UBIFS DBG (pid 662): do_readpage: ino 84, pg 757, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 757)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 38:34360, key (84, data, 757)
UBIFS DBG (pid 662): try_read_node: LEB 38:34360, data node, length 1839
UBIFS DBG (pid 662): do_readpage: ino 84, pg 758, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 758)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 662): fallible_read_node: LEB 38:36200, key (84, data, 758)
UBIFS DBG (pid 662): try_read_node: LEB 38:36200, data node, length 2072
UBIFS DBG (pid 662): do_readpage: ino 84, pg 759, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 759)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 662): fallible_read_node: LEB 38:38272, key (84, data, 759)
UBIFS DBG (pid 662): try_read_node: LEB 38:38272, data node, length 2169
UBIFS DBG (pid 662): do_readpage: ino 84, pg 760, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 760)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 662): fallible_read_node: LEB 38:40448, key (84, data, 760)
UBIFS DBG (pid 662): try_read_node: LEB 38:40448, data node, length 1869
UBIFS DBG (pid 662): do_readpage: ino 84, pg 761, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 761)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 662): fallible_read_node: LEB 38:42320, key (84, data, 761)
UBIFS DBG (pid 662): try_read_node: LEB 38:42320, data node, length 1819
UBIFS DBG (pid 662): do_readpage: ino 84, pg 762, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 762)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 662): fallible_read_node: LEB 38:44144, key (84, data, 762)
UBIFS DBG (pid 662): try_read_node: LEB 38:44144, data node, length 1829
UBIFS DBG (pid 662): do_readpage: ino 84, pg 763, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 763)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 662): fallible_read_node: LEB 38:45976, key (84, data, 763)
UBIFS DBG (pid 662): try_read_node: LEB 38:45976, data node, length 1877
UBIFS DBG (pid 662): do_readpage: ino 84, pg 764, i_size 3258056, flags 0x1
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 764)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 662): fallible_read_node: LEB 38:47856, key (84, data, 764)
UBIFS DBG (pid 662): try_read_node: LEB 38:47856, data node, length 1404
UBIFS DBG (pid 662): do_readpage: ino 84, pg 765, i_size 3258056, flags 0x21
UBIFS DBG (pid 662): ubifs_lookup_level0: search key (84, data, 765)
UBIFS DBG (pid 662): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 662): fallible_read_node: LEB 38:49264, key (84, data, 765)
UBIFS DBG (pid 662): try_read_node: LEB 38:49264, data node, length 1401
UBIFS DBG (pid 611): do_readpage: ino 169, pg 143, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 143)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 611): fallible_read_node: LEB 94:104064, key (169, data, 143)
UBIFS DBG (pid 611): try_read_node: LEB 94:104064, data node, length 1491
*** 00:00:01.149 BXVD: BXVD_Open() - Firmware revision: 150336
*** 00:00:01.168 nexus_platform_config: softI2c = false
*** 00:00:01.172 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:01.175 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
*** 00:00:04.882 nexus_frontend_3255:  waiting for 3255 booting up!
*** 00:00:04.883 nexus_frontend_3255:  RPC is initialized between 3255
and 740x
!!!Error BRPC_CallProc(h3255ObDev->hRpc, BRPC_ProcId_TNR_Oob_Open,
(const uint32_t *)&Param, (sizeof(Param)/sizeof(long)), ((void *)0), 0,
&retVal)(0x9) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/../magnum/portinginterface/tnr/3255ob/btnr_3255ob.c:250
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1155
!!!Error BERR_NOT_SUPPORTED(0x8) at
/home3/zhangqing/durian/src/vendor/brcm/sdk/trinity/nexus/modules/frontend/3255/src/nexus_frontend_3255.c:1164
*** 00:00:07.891 nexus_platform: initialized
UBIFS DBG (pid 659): do_readpage: ino 84, pg 81, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 81)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:25152, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:25152, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 26:49976, key (84, data, 81)
UBIFS DBG (pid 659): try_read_node: LEB 26:49976, data node, length 951
UBIFS DBG (pid 659): do_readpage: ino 84, pg 80, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 80)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 26:49040, key (84, data, 80)
UBIFS DBG (pid 659): try_read_node: LEB 26:49040, data node, length 934
UBIFS DBG (pid 659): do_readpage: ino 84, pg 78, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 78)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 26:47232, key (84, data, 78)
UBIFS DBG (pid 659): try_read_node: LEB 26:47232, data node, length 1029
UBIFS DBG (pid 659): do_readpage: ino 84, pg 71, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 71)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:24960, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:24960, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 26:41248, key (84, data, 71)
UBIFS DBG (pid 659): try_read_node: LEB 26:41248, data node, length 1217
UBIFS DBG (pid 659): do_readpage: ino 84, pg 70, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 70)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 26:40088, key (84, data, 70)
UBIFS DBG (pid 659): try_read_node: LEB 26:40088, data node, length 1157
UBIFS DBG (pid 659): do_readpage: ino 84, pg 69, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 69)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 26:39080, key (84, data, 69)
UBIFS DBG (pid 659): try_read_node: LEB 26:39080, data node, length 1002
UBIFS DBG (pid 659): do_readpage: ino 84, pg 62, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 62)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:24768, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:24768, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 26:33528, key (84, data, 62)
UBIFS DBG (pid 659): try_read_node: LEB 26:33528, data node, length 904
UBIFS DBG (pid 659): do_readpage: ino 84, pg 59, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 59)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:30576, key (84, data, 59)
UBIFS DBG (pid 659): try_read_node: LEB 26:30576, data node, length 1234
UBIFS DBG (pid 659): do_readpage: ino 84, pg 54, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 54)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:24576, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:24576, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 26:26336, key (84, data, 54)
DRV_Mem_Init heapinit 0 [0][1048576][sys]
UBIFS DBG (pid 659): try_read_node: LEB 26:26336, data node, length 931
UBIFS DBG (pid 659): do_readpage: ino 84, pg 53, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 53)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
DRV_Mem_Init heapinit 1 [0][1048576][browser]
UBIFS DBG (pid 659): fallible_read_node: LEB 26:25064, key (84, data, 53)
DRV_Flash_Init entry====================1
UBIFS DBG (pid 659): try_read_node: LEB 26:25064, data node, length 1266
UBIFS DBG (pid 659): do_readpage: ino 84, pg 52, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 52)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 26:24080, key (84, data, 52)
UBIFS DBG (pid 659): try_read_node: LEB 26:24080, data node, length 977
UBIFS DBG (pid 659): do_readpage: ino 84, pg 47, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 47)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 26:19976, key (84, data, 47)
UBIFS DBG (pid 659): try_read_node: LEB 26:19976, data node, length 1003
UBIFS DBG (pid 659): do_readpage: ino 84, pg 46, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 46)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 26:18952, key (84, data, 46)
UBIFS DBG (pid 659): try_read_node: LEB 26:18952, data node, length 1024
UBIFS DBG (pid 659): do_readpage: ino 84, pg 265, i_size 3258056, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 265)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 29:88200, key (84, data, 265)
UBIFS DBG (pid 659): try_read_node: LEB 29:88200, data node, length 1809
UBIFS DBG (pid 659): do_readpage: ino 84, pg 45, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 45)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 26:17968, key (84, data, 45)
UBIFS DBG (pid 659): try_read_node: LEB 26:17968, data node, length 984
UBIFS DBG (pid 659): do_readpage: ino 84, pg 44, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 44)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 26:16952, key (84, data, 44)
UBIFS DBG (pid 659): try_read_node: LEB 26:16952, data node, length 1010
UBIFS DBG (pid 659): do_readpage: ino 84, pg 43, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 43)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:15696, key (84, data, 43)
UBIFS DBG (pid 659): try_read_node: LEB 26:15696, data node, length 1250
UBIFS DBG (pid 659): do_readpage: ino 84, pg 39, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 39)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 26:8032, key (84, data, 39)
UBIFS DBG (pid 659): try_read_node: LEB 26:8032, data node, length 2322
UBIFS DBG (pid 680): do_readpage: ino 84, pg 88, i_size 3258056, flags 0x1
UBIFS DBG (pid 680): ubifs_lookup_level0: search key (84, data, 88)
UBIFS DBG (pid 680): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 680): fallible_read_node: LEB 26:62384, key (84, data, 88)
UBIFS DBG (pid 680): try_read_node: LEB 26:62384, data node, length 2495
UBIFS DBG (pid 659): do_readpage: ino 84, pg 241, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 241)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 29:48992, key (84, data, 241)
UBIFS DBG (pid 659): try_read_node: LEB 29:48992, data node, length 2498
UBIFS DBG (pid 659): do_readpage: ino 84, pg 239, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 239)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 29:44664, key (84, data, 239)
UBIFS DBG (pid 659): try_read_node: LEB 29:44664, data node, length 2112
UBIFS DBG (pid 659): do_readpage: ino 84, pg 242, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 242)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 29:51496, key (84, data, 242)
UBIFS DBG (pid 659): try_read_node: LEB 29:51496, data node, length 2505
UBIFS DBG (pid 659): do_readpage: ino 84, pg 254, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 254)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:29376, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:29376, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 29:75504, key (84, data, 254)
UBIFS DBG (pid 659): try_read_node: LEB 29:75504, data node, length 1627
UBIFS DBG (pid 659): do_readpage: ino 84, pg 91, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 91)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:69472, key (84, data, 91)
UBIFS DBG (pid 659): try_read_node: LEB 26:69472, data node, length 1853
UBIFS DBG (pid 687): do_readpage: ino 84, pg 92, i_size 3258056, flags 0x1
UBIFS DBG (pid 687): ubifs_lookup_level0: search key (84, data, 92)
UBIFS DBG (pid 687): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 687): fallible_read_node: LEB 26:71328, key (84, data, 92)
UBIFS DBG (pid 687): try_read_node: LEB 26:71328, data node, length 2103
UBIFS DBG (pid 659): do_readpage: ino 84, pg 113, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 113)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:25920, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:25920, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 26:119520, key (84, data, 113)
UBIFS DBG (pid 659): try_read_node: LEB 26:119520, data node, length 2227
UBIFS DBG (pid 659): do_readpage: ino 84, pg 251, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 251)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 29:69424, key (84, data, 251)
UBIFS DBG (pid 659): try_read_node: LEB 29:69424, data node, length 1989
UBIFS DBG (pid 659): do_readpage: ino 84, pg 118, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 118)
UBIFS DBG (pid 659): ubifs_read_node: LEB 110:28008, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 110:28008, level 1, 8 branch
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:26112, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:26112, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 27:4512, key (84, data, 118)
UBIFS DBG (pid 659): try_read_node: LEB 27:4512, data node, length 1787
UBIFS DBG (pid 659): do_readpage: ino 163, pg 47, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 47)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:125184, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:125184, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 91:115176, key (163, data, 47)
UBIFS DBG (pid 659): try_read_node: LEB 91:115176, data node, length 1608
UBIFS DBG (pid 659): do_readpage: ino 163, pg 46, i_size 515924, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 46)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 91:113384, key (163, data, 46)
UBIFS DBG (pid 659): try_read_node: LEB 91:113384, data node, length 1785
UBIFS DBG (pid 659): do_readpage: ino 163, pg 70, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 70)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:125760, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:125760, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 92:21912, key (163, data, 70)
UBIFS DBG (pid 659): try_read_node: LEB 92:21912, data node, length 1549
UBIFS DBG (pid 659): do_readpage: ino 163, pg 87, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 87)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 92:47120, key (163, data, 87)
UBIFS DBG (pid 659): try_read_node: LEB 92:47120, data node, length 1221
UBIFS DBG (pid 659): do_readpage: ino 163, pg 83, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 83)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 92:40544, key (163, data, 83)
UBIFS DBG (pid 659): try_read_node: LEB 92:40544, data node, length 1746
UBIFS DBG (pid 659): do_readpage: ino 70, pg 4, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 4)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 12:123096, key (70, data, 4)
UBIFS DBG (pid 659): try_read_node: LEB 12:123096, data node, length 1193
UBIFS DBG (pid 659): do_readpage: ino 70, pg 14, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 14)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 13:11664, key (70, data, 14)
UBIFS DBG (pid 659): try_read_node: LEB 13:11664, data node, length 1510
UBIFS DBG (pid 659): do_readpage: ino 163, pg 110, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 110)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 92:92808, key (163, data, 110)
UBIFS DBG (pid 659): try_read_node: LEB 92:92808, data node, length 1959
UBIFS DBG (pid 659): do_readpage: ino 163, pg 112, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 112)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 92:96280, key (163, data, 112)
UBIFS DBG (pid 659): try_read_node: LEB 92:96280, data node, length 2293
[flash_init] mtd_write_size = 0x800

UBIFS DBG (pid 659): do_readpage: ino 163, pg 84, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 84)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 92:42296, key (163, data, 84)
UBIFS DBG (pid 659): try_read_node: LEB 92:42296, data node, length 1684
UBIFS DBG (pid 659): do_readpage: ino 163, pg 82, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 82)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 92:39016, key (163, data, 82)
UBIFS DBG (pid 659): try_read_node: LEB 92:39016, data node, length 1523
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=14680064, seek offset=14680064
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=524288, seek offset=524288
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=59899904, seek offset=59899904
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=7340032, seek offset=7340032
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=2097152, seek offset=2097152
!
[seek_to_good_block] seek_to_good_block out of the scope,
dev_size=1048576, seek offset=1048576
!
UBIFS DBG (pid 659): do_readpage: ino 163, pg 88, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 88)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 92:48344, key (163, data, 88)
UBIFS DBG (pid 659): try_read_node: LEB 92:48344, data node, length 1259
UBIFS DBG (pid 659): do_readpage: ino 163, pg 17, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 17)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 91:72320, key (163, data, 17)
UBIFS DBG (pid 659): try_read_node: LEB 91:72320, data node, length 1393
UBIFS DBG (pid 659): do_readpage: ino 70, pg 11, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 11)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 13:7944, key (70, data, 11)
UBIFS DBG (pid 659): try_read_node: LEB 13:7944, data node, length 1717
UBIFS DBG (pid 659): do_readpage: ino 163, pg 103, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 103)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 92:78416, key (163, data, 103)
UBIFS DBG (pid 659): try_read_node: LEB 92:78416, data node, length 1984
UBIFS DBG (pid 659): do_readpage: ino 78, pg 38, i_size 1441440, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 38)
UBIFS DBG (pid 659): ubifs_read_node: LEB 110:26280, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 110:26280, level 1, 8 branch
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:12288, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:12288, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 17:110904, key (78, data, 38)
UBIFS DBG (pid 659): try_read_node: LEB 17:110904, data node, length 2169
UBIFS DBG (pid 659): do_readpage: ino 78, pg 171, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 171)
UBIFS DBG (pid 659): ubifs_read_node: LEB 110:26664, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 110:26664, level 1, 8 branch
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:15552, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:15552, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 20:42328, key (78, data, 171)
UBIFS DBG (pid 659): try_read_node: LEB 20:42328, data node, length 1541
UBIFS DBG (pid 659): do_readpage: ino 78, pg 30, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 30)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 17:92600, key (78, data, 30)
UBIFS DBG (pid 659): try_read_node: LEB 17:92600, data node, length 2554
s_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 18:116664, key (78, data, 94)
UBIFS DBG (pid 659): try_read_node: LEB 18:116664, data node, length 2024
UBIFS DBG (pid 659): do_readpage: ino 78, pg 51, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 51)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:12672, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:12672, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 18:15760, key (78, data, 51)
UBIFS DBG (pid 659): try_read_node: LEB 18:15760, data node, length 2672
UBIFS DBG (pid 659): do_readpage: ino 78, pg 56, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 56)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:12864, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:12864, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 18:29000, key (78, data, 56)
UBIFS DBG (pid 659): try_read_node: LEB 18:29000, data node, length 2528
UBIFS DBG (pid 659): do_readpage: ino 78, pg 54, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 54)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 18:23592, key (78, data, 54)
UBIFS DBG (pid 659): try_read_node: LEB 18:23592, data node, length 2801
UBIFS DBG (pid 659): do_readpage: ino 78, pg 44, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 44)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 18:0, key (78, data, 44)
UBIFS DBG (pid 659): try_read_node: LEB 18:0, data node, length 2566
UBIFS DBG (pid 659): do_readpage: ino 78, pg 41, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 41)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 17:117640, key (78, data, 41)
UBIFS DBG (pid 659): try_read_node: LEB 17:117640, data node, length 2705
UBIFS DBG (pid 659): do_readpage: ino 78, pg 55, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 55)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 18:26400, key (78, data, 55)
UBIFS DBG (pid 659): try_read_node: LEB 18:26400, data node, length 2596
UBIFS DBG (pid 659): do_readpage: ino 78, pg 269, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 269)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 22:19224, key (78, data, 269)
UBIFS DBG (pid 659): try_read_node: LEB 22:19224, data node, length 2278
UBIFS DBG (pid 659): do_readpage: ino 78, pg 270, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 270)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 22:21504, key (78, data, 270)
UBIFS DBG (pid 659): try_read_node: LEB 22:21504, data node, length 2580
UBIFS DBG (pid 659): do_readpage: ino 78, pg 75, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 75)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:13248, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:13248, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 18:73208, key (78, data, 75)
UBIFS DBG (pid 659): try_read_node: LEB 18:73208, data node, length 2301
UBIFS DBG (pid 659): do_readpage: ino 78, pg 76, i_size 1441440, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 76)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 18:75512, key (78, data, 76)
UBIFS DBG (pid 659): try_read_node: LEB 18:75512, data node, length 2213
UBIFS DBG (pid 659): do_readpage: ino 78, pg 74, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 74)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 18:71104, key (78, data, 74)
UBIFS DBG (pid 659): try_read_node: LEB 18:71104, data node, length 2104
UBIFS DBG (pid 659): do_readpage: ino 78, pg 40, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 40)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 17:115184, key (78, data, 40)
UBIFS DBG (pid 659): try_read_node: LEB 17:115184, data node, length 2449
UBIFS DBG (pid 659): do_readpage: ino 78, pg 98, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 98)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:13824, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:13824, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 19:0, key (78, data, 98)
UBIFS DBG (pid 659): try_read_node: LEB 19:0, data node, length 2326
UBIFS DBG (pid 659): do_readpage: ino 78, pg 66, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 66)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 18:53560, key (78, data, 66)
UBIFS DBG (pid 659): try_read_node: LEB 18:53560, data node, length 2075
UBIFS DBG (pid 659): do_readpage: ino 78, pg 46, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 46)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 18:4880, key (78, data, 46)
UBIFS DBG (pid 659): try_read_node: LEB 18:4880, data node, length 2212
UBIFS DBG (pid 659): do_readpage: ino 78, pg 176, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 176)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:15744, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:15744, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 20:53112, key (78, data, 176)
UBIFS DBG (pid 659): try_read_node: LEB 20:53112, data node, length 2333
UBIFS DBG (pid 659): do_readpage: ino 78, pg 42, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 42)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 17:120352, key (78, data, 42)
UBIFS DBG (pid 659): try_read_node: LEB 17:120352, data node, length 2475
UBIFS DBG (pid 659): do_readpage: ino 78, pg 53, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 53)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 18:20928, key (78, data, 53)
UBIFS DBG (pid 659): try_read_node: LEB 18:20928, data node, length 2661
UBIFS DBG (pid 659): do_readpage: ino 78, pg 71, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 71)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 18:64488, key (78, data, 71)
UBIFS DBG (pid 659): try_read_node: LEB 18:64488, data node, length 2220
UBIFS DBG (pid 659): do_readpage: ino 78, pg 97, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 97)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 18:122976, key (78, data, 97)
UBIFS DBG (pid 659): try_read_node: LEB 18:122976, data node, length 2438
UBIFS DBG (pid 659): do_readpage: ino 78, pg 70, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 70)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 18:62160, key (78, data, 70)
UBIFS DBG (pid 659): try_read_node: LEB 18:62160, data node, length 2321
UBIFS DBG (pid 659): do_readpage: ino 998, pg 1, i_size 9805, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (998, data, 1)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 154:115288, key (998, data, 1)
UBIFS DBG (pid 659): try_read_node: LEB 154:115288, data node, length 1241
UBIFS DBG (pid 659): do_readpage: ino 998, pg 2, i_size 9805, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (998, data, 2)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 154:116536, key (998, data, 2)
UBIFS DBG (pid 659): try_read_node: LEB 154:116536, data node, length 831
UBIFS DBG (pid 659): do_readpage: ino 78, pg 296, i_size 1441440, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 296)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 22:76984, key (78, data, 296)
UBIFS DBG (pid 659): try_read_node: LEB 22:76984, data node, length 1806
UBIFS DBG (pid 659): do_readpage: ino 78, pg 137, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 137)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:14784, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:14784, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 19:89952, key (78, data, 137)
UBIFS DBG (pid 659): try_read_node: LEB 19:89952, data node, length 2111
UBIFS DBG (pid 659): do_readpage: ino 78, pg 83, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 83)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 18:91744, key (78, data, 83)
UBIFS DBG (pid 659): try_read_node: LEB 18:91744, data node, length 2013
UBIFS DBG (pid 659): do_readpage: ino 78, pg 136, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 136)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 19:88024, key (78, data, 136)
UBIFS DBG (pid 659): try_read_node: LEB 19:88024, data node, length 1924
UBIFS DBG (pid 659): do_readpage: ino 78, pg 82, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 82)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 18:89480, key (78, data, 82)
UBIFS DBG (pid 659): try_read_node: LEB 18:89480, data node, length 2263
UBIFS DBG (pid 659): do_readpage: ino 78, pg 81, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 81)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 18:86864, key (78, data, 81)
UBIFS DBG (pid 659): try_read_node: LEB 18:86864, data node, length 2612
UBIFS DBG (pid 659): do_readpage: ino 78, pg 306, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 306)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 22:95360, key (78, data, 306)
UBIFS DBG (pid 659): try_read_node: LEB 22:95360, data node, length 2172
UBIFS DBG (pid 659): do_readpage: ino 78, pg 324, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 324)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 23:6088, key (78, data, 324)
UBIFS DBG (pid 659): try_read_node: LEB 23:6088, data node, length 1578
UBIFS DBG (pid 659): do_readpage: ino 78, pg 305, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 305)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 22:93368, key (78, data, 305)
UBIFS DBG (pid 659): try_read_node: LEB 22:93368, data node, length 1987
UBIFS DBG (pid 659): do_readpage: ino 78, pg 300, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 300)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 22:84312, key (78, data, 300)
UBIFS DBG (pid 659): try_read_node: LEB 22:84312, data node, length 1843
UBIFS DBG (pid 659): do_readpage: ino 78, pg 298, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 298)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 22:80912, key (78, data, 298)
UBIFS DBG (pid 659): try_read_node: LEB 22:80912, data node, length 1502
UBIFS DBG (pid 659): do_readpage: ino 78, pg 303, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 303)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 22:89056, key (78, data, 303)
UBIFS DBG (pid 659): try_read_node: LEB 22:89056, data node, length 2146
UBIFS DBG (pid 659): do_readpage: ino 78, pg 169, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 169)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 20:38024, key (78, data, 169)
UBIFS DBG (pid 659): try_read_node: LEB 20:38024, data node, length 2081
UBIFS DBG (pid 659): do_readpage: ino 78, pg 166, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 166)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 20:30920, key (78, data, 166)
UBIFS DBG (pid 659): try_read_node: LEB 20:30920, data node, length 2399
UBIFS DBG (pid 659): do_readpage: ino 78, pg 165, i_size 1441440, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 165)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 20:28472, key (78, data, 165)
UBIFS DBG (pid 659): try_read_node: LEB 20:28472, data node, length 2448
UBIFS DBG (pid 659): do_readpage: ino 78, pg 168, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 168)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 20:35576, key (78, data, 168)
UBIFS DBG (pid 659): try_read_node: LEB 20:35576, data node, length 2448
UBIFS DBG (pid 659): do_readpage: ino 78, pg 170, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 170)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 20:40112, key (78, data, 170)
UBIFS DBG (pid 659): try_read_node: LEB 20:40112, data node, length 2212
UBIFS DBG (pid 659): do_readpage: ino 78, pg 31, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 31)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 17:95160, key (78, data, 31)
UBIFS DBG (pid 659): try_read_node: LEB 17:95160, data node, length 1924
br0: topology change detected, sending tcn bpdu
br0: port 1(eth0) entering forwarding state
br0: topology change detected, sending tcn bpdu
br0: port 2(bcm1) entering forwarding state
UBIFS DBG (pid 611): do_readpage: ino 169, pg 81, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 81)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 611): fallible_read_node: LEB 94:9368, key (169, data, 81)
UBIFS DBG (pid 611): try_read_node: LEB 94:9368, data node, length 1831
UBIFS DBG (pid 611): do_readpage: ino 169, pg 93, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 93)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 611): fallible_read_node: LEB 94:28400, key (169, data, 93)
UBIFS DBG (pid 611): try_read_node: LEB 94:28400, data node, length 1811
UBIFS DBG (pid 611): do_readpage: ino 169, pg 87, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 87)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 611): fallible_read_node: LEB 94:17928, key (169, data, 87)
UBIFS DBG (pid 611): try_read_node: LEB 94:17928, data node, length 1540
UBIFS DBG (pid 611): do_readpage: ino 169, pg 90, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 90)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 611): fallible_read_node: LEB 94:23112, key (169, data, 90)
UBIFS DBG (pid 611): try_read_node: LEB 94:23112, data node, length 1751
UBIFS DBG (pid 611): do_readpage: ino 169, pg 16, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 16)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 611): fallible_read_node: LEB 93:37008, key (169, data, 16)
UBIFS DBG (pid 611): try_read_node: LEB 93:37008, data node, length 1691
UBIFS DBG (pid 611): do_readpage: ino 169, pg 17, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 17)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 611): fallible_read_node: LEB 93:38704, key (169, data, 17)
UBIFS DBG (pid 611): try_read_node: LEB 93:38704, data node, length 1800
UBIFS DBG (pid 611): do_readpage: ino 169, pg 6, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 6)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 611): fallible_read_node: LEB 93:20632, key (169, data, 6)
UBIFS DBG (pid 611): try_read_node: LEB 93:20632, data node, length 1823
UBIFS DBG (pid 611): do_readpage: ino 169, pg 96, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 96)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 611): fallible_read_node: LEB 94:33616, key (169, data, 96)
UBIFS DBG (pid 611): try_read_node: LEB 94:33616, data node, length 1641
UBIFS DBG (pid 611): do_readpage: ino 169, pg 14, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 14)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 611): fallible_read_node: LEB 93:33576, key (169, data, 14)
UBIFS DBG (pid 611): try_read_node: LEB 93:33576, data node, length 2006
UBIFS DBG (pid 611): do_readpage: ino 169, pg 15, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 15)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 611): fallible_read_node: LEB 93:35584, key (169, data, 15)
UBIFS DBG (pid 611): try_read_node: LEB 93:35584, data node, length 1418
UBIFS DBG (pid 611): do_readpage: ino 169, pg 9, i_size 1172304, flags 0x21
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 9)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 611): fallible_read_node: LEB 93:25960, key (169, data, 9)
UBIFS DBG (pid 611): try_read_node: LEB 93:25960, data node, length 1939
UBIFS DBG (pid 611): do_readpage: ino 169, pg 10, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 10)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 611): fallible_read_node: LEB 93:27904, key (169, data, 10)
UBIFS DBG (pid 611): try_read_node: LEB 93:27904, data node, length 1322
UBIFS DBG (pid 611): do_readpage: ino 169, pg 11, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 11)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 611): fallible_read_node: LEB 93:29232, key (169, data, 11)
UBIFS DBG (pid 611): try_read_node: LEB 93:29232, data node, length 1467
UBIFS DBG (pid 611): do_readpage: ino 169, pg 12, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 12)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 611): fallible_read_node: LEB 93:30704, key (169, data, 12)
UBIFS DBG (pid 611): try_read_node: LEB 93:30704, data node, length 1583
UBIFS DBG (pid 611): do_readpage: ino 169, pg 54, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 54)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 611): fallible_read_node: LEB 93:97704, key (169, data, 54)
UBIFS DBG (pid 611): try_read_node: LEB 93:97704, data node, length 1634
UBIFS DBG (pid 611): do_readpage: ino 169, pg 13, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 13)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 611): fallible_read_node: LEB 93:32288, key (169, data, 13)
UBIFS DBG (pid 611): try_read_node: LEB 93:32288, data node, length 1284
UBIFS DBG (pid 611): do_readpage: ino 169, pg 88, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 88)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 611): fallible_read_node: LEB 94:19472, key (169, data, 88)
UBIFS DBG (pid 611): try_read_node: LEB 94:19472, data node, length 1719
UBIFS DBG (pid 611): do_readpage: ino 169, pg 89, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 89)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 611): fallible_read_node: LEB 94:21192, key (169, data, 89)
UBIFS DBG (pid 611): try_read_node: LEB 94:21192, data node, length 1920
I/O warning : failed to load external entity
"/usr/local/hmt/appdata/configd/swcfg_runtime.xml"
[659]:ERR:000000025:[pstore_open] load xml file
/usr/local/hmt/appdata/configd/swcfg_runtime.xml failed, copy it from
/usr/local/hmt/app/config/syscfg/swcfg_default.xml
UBIFS DBG (pid 659): do_readpage: ino 78, pg 304, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 304)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 22:91208, key (78, data, 304)
UBIFS DBG (pid 659): try_read_node: LEB 22:91208, data node, length 2155
====FACTORY_PARAID_END:68
UBIFS DBG (pid 659): do_readpage: ino 163, pg 11, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 11)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 91:64872, key (163, data, 11)
UBIFS DBG (pid 659): try_read_node: LEB 91:64872, data node, length 1436
UBIFS DBG (pid 659): do_readpage: ino 71, pg 2, i_size 19184, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (71, data, 2)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 13:29336, key (71, data, 2)
UBIFS DBG (pid 659): try_read_node: LEB 13:29336, data node, length 950
UBIFS DBG (pid 659): do_readpage: ino 78, pg 147, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 147)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(0)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:14976, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:14976, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 19:112024, key (78, data, 147)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(1)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): try_read_node: LEB 19:112024, data node, length 2169
UBIFS DBG (pid 659): do_readpage: ino 78, pg 128, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 128)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:14592, indexing node,
length 188
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(2)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): read_znode: LEB 109:14592, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 19:69024, key (78, data, 128)
UBIFS DBG (pid 659): try_read_node: LEB 19:69024, data node, length 2351
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(4)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): do_readpage: ino 78, pg 126, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 126)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(5)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): fallible_read_node: LEB 19:65016, key (78, data, 126)
UBIFS DBG (pid 659): try_read_node: LEB 19:65016, data node, length 2343
UBIFS DBG (pid 659): do_readpage: ino 78, pg 146, i_size 1441440, flags 0x1
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(6)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 146)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 19:109584, key (78, data, 146)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(7)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): try_read_node: LEB 19:109584, data node, length 2440
UBIFS DBG (pid 659): do_readpage: ino 78, pg 284, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 284)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:18240, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:18240, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 22:49784, key (78, data, 284)
UBIFS DBG (pid 659): try_read_node: LEB 22:49784, data node, length 2131
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(50)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): do_readpage: ino 78, pg 282, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 282)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 22:45328, key (78, data, 282)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(51)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): try_read_node: LEB 22:45328, data node, length 2346
UBIFS DBG (pid 659): do_readpage: ino 78, pg 285, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 285)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(52)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 22:51920, key (78, data, 285)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(53)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): try_read_node: LEB 22:51920, data node, length 2523
UBIFS DBG (pid 659): do_readpage: ino 78, pg 281, i_size 1441440, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 281)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(54)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 22:43608, key (78, data, 281)
UBIFS DBG (pid 659): try_read_node: LEB 22:43608, data node, length 1715
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(55)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): do_readpage: ino 78, pg 283, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 283)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(56)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): fallible_read_node: LEB 22:47680, key (78, data, 283)
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(57)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(58)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(59)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(60)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(61)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(62)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(63)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(64)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(65)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(66)  status(0)is invalid or space not enough!
[659]:ERR:000000026:[hwcfg_util.c:422] FactoryParam_GetParaValue failed.
ParaID(67)  status(0)is invalid or space not enough!
UBIFS DBG (pid 659): try_read_node: LEB 22:47680, data node, length 2104
UBIFS DBG (pid 659): do_readpage: ino 78, pg 325, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 325)
[HAL1_0_Init_Step2] configured vout mode: 720P60
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 23:7672, key (78, data, 325)
UBIFS DBG (pid 659): try_read_node: LEB 23:7672, data node, length 2540
UBIFS DBG (pid 659): do_readpage: ino 78, pg 138, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 138)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 19:92064, key (78, data, 138)
UBIFS DBG (pid 659): try_read_node: LEB 19:92064, data node, length 2223
UBIFS DBG (pid 659): do_readpage: ino 78, pg 130, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 130)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 19:73568, key (78, data, 130)
UBIFS DBG (pid 659): try_read_node: LEB 19:73568, data node, length 2641
UBIFS DBG (pid 659): do_readpage: ino 78, pg 127, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 127)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 19:67360, key (78, data, 127)
UBIFS DBG (pid 659): try_read_node: LEB 19:67360, data node, length 1663
UBIFS DBG (pid 659): do_readpage: ino 78, pg 125, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 125)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 19:62488, key (78, data, 125)
UBIFS DBG (pid 659): try_read_node: LEB 19:62488, data node, length 2528
UBIFS DBG (pid 659): do_readpage: ino 78, pg 73, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 73)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 18:69000, key (78, data, 73)
UBIFS DBG (pid 659): try_read_node: LEB 18:69000, data node, length 2097
UBIFS DBG (pid 659): do_readpage: ino 78, pg 133, i_size 1441440, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (78, data, 133)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 19:81256, key (78, data, 133)
UBIFS DBG (pid 659): try_read_node: LEB 19:81256, data node, length 2061
UBIFS DBG (pid 659): do_readpage: ino 163, pg 13, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 13)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 91:67624, key (163, data, 13)
UBIFS DBG (pid 659): try_read_node: LEB 91:67624, data node, length 1209
UBIFS DBG (pid 659): do_readpage: ino 163, pg 14, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 14)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 91:68840, key (163, data, 14)
UBIFS DBG (pid 659): try_read_node: LEB 91:68840, data node, length 1300
UBIFS DBG (pid 659): do_readpage: ino 163, pg 26, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 26)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:124800, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:124800, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 91:85672, key (163, data, 26)
UBIFS DBG (pid 659): try_read_node: LEB 91:85672, data node, length 1344
UBIFS DBG (pid 659): do_readpage: ino 163, pg 24, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 24)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 91:83072, key (163, data, 24)
UBIFS DBG (pid 659): try_read_node: LEB 91:83072, data node, length 1354
UBIFS DBG (pid 659): do_readpage: ino 163, pg 81, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 81)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 92:37840, key (163, data, 81)
UBIFS DBG (pid 659): try_read_node: LEB 92:37840, data node, length 1169
UBIFS DBG (pid 659): do_readpage: ino 163, pg 115, i_size 515924, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 115)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 92:100856, key (163, data, 115)
UBIFS DBG (pid 659): try_read_node: LEB 92:100856, data node, length 726
UBIFS DBG (pid 659): do_readpage: ino 163, pg 25, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 25)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 91:84432, key (163, data, 25)
UBIFS DBG (pid 659): try_read_node: LEB 91:84432, data node, length 1235
UBIFS DBG (pid 659): do_readpage: ino 163, pg 104, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 104)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 92:80400, key (163, data, 104)
UBIFS DBG (pid 659): try_read_node: LEB 92:80400, data node, length 2025
UBIFS DBG (pid 659): do_readpage: ino 163, pg 105, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 105)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 92:82432, key (163, data, 105)
UBIFS DBG (pid 659): try_read_node: LEB 92:82432, data node, length 1979
UBIFS DBG (pid 659): do_readpage: ino 163, pg 38, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 38)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 91:101936, key (163, data, 38)
UBIFS DBG (pid 659): try_read_node: LEB 91:101936, data node, length 1615
UBIFS DBG (pid 659): do_readpage: ino 70, pg 10, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 10)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 13:6536, key (70, data, 10)
UBIFS DBG (pid 659): try_read_node: LEB 13:6536, data node, length 1406
UBIFS DBG (pid 659): do_readpage: ino 70, pg 12, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 12)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 13:9664, key (70, data, 12)
UBIFS DBG (pid 659): try_read_node: LEB 13:9664, data node, length 1030
UBIFS DBG (pid 695): do_readpage: ino 163, pg 16, i_size 515924, flags 0x1
UBIFS DBG (pid 695): ubifs_lookup_level0: search key (163, data, 16)
UBIFS DBG (pid 695): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 695): fallible_read_node: LEB 91:71232, key (163, data, 16)
UBIFS DBG (pid 695): try_read_node: LEB 91:71232, data node, length 1087
UBIFS DBG (pid 659): do_readpage: ino 163, pg 15, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 15)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 91:70144, key (163, data, 15)
UBIFS DBG (pid 659): try_read_node: LEB 91:70144, data node, length 1083
UBIFS DBG (pid 659): do_readpage: ino 163, pg 42, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 42)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 91:107704, key (163, data, 42)
UBIFS DBG (pid 659): try_read_node: LEB 91:107704, data node, length 1244
UBIFS DBG (pid 659): do_readpage: ino 163, pg 63, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 63)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:125568, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:125568, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 92:12144, key (163, data, 63)
UBIFS DBG (pid 659): try_read_node: LEB 92:12144, data node, length 1386
UBIFS DBG (pid 659): do_readpage: ino 163, pg 45, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 45)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 91:111552, key (163, data, 45)
UBIFS DBG (pid 659): try_read_node: LEB 91:111552, data node, length 1831
UBIFS DBG (pid 659): do_readpage: ino 163, pg 52, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 52)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 91:123112, key (163, data, 52)
UBIFS DBG (pid 659): try_read_node: LEB 91:123112, data node, length 1477
UBIFS DBG (pid 659): do_readpage: ino 163, pg 67, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 67)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 92:17728, key (163, data, 67)
UBIFS DBG (pid 659): try_read_node: LEB 92:17728, data node, length 1333
UBIFS DBG (pid 659): do_readpage: ino 163, pg 68, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 68)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 92:19064, key (163, data, 68)
UBIFS DBG (pid 659): try_read_node: LEB 92:19064, data node, length 1425
UBIFS DBG (pid 659): do_readpage: ino 163, pg 71, i_size 515924, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 71)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 92:23464, key (163, data, 71)
UBIFS DBG (pid 659): try_read_node: LEB 92:23464, data node, length 1561
UBIFS DBG (pid 659): do_readpage: ino 163, pg 77, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 77)
UBIFS DBG (pid 659): ubifs_read_node: LEB 109:125952, indexing node,
length 188
UBIFS DBG (pid 659): read_znode: LEB 109:125952, level 0, 8 branch
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 92:32712, key (163, data, 77)
UBIFS DBG (pid 659): try_read_node: LEB 92:32712, data node, length 1575
UBIFS DBG (pid 659): do_readpage: ino 84, pg 37, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 37)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 26:5112, key (84, data, 37)
UBIFS DBG (pid 659): try_read_node: LEB 26:5112, data node, length 816
UBIFS DBG (pid 659): do_readpage: ino 84, pg 76, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 76)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 26:45632, key (84, data, 76)
UBIFS DBG (pid 659): try_read_node: LEB 26:45632, data node, length 788
UBIFS DBG (pid 659): do_readpage: ino 84, pg 72, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 72)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 26:42472, key (84, data, 72)
UBIFS DBG (pid 659): try_read_node: LEB 26:42472, data node, length 793
UBIFS DBG (pid 659): do_readpage: ino 84, pg 60, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 60)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 26:31816, key (84, data, 60)
UBIFS DBG (pid 659): try_read_node: LEB 26:31816, data node, length 782
UBIFS DBG (pid 659): do_readpage: ino 87, pg 2, i_size 28872, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (87, data, 2)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 38:84880, key (87, data, 2)
UBIFS DBG (pid 659): try_read_node: LEB 38:84880, data node, length 1952
UBIFS DBG (pid 697): do_readpage: ino 163, pg 75, i_size 515924, flags 0x1
UBIFS DBG (pid 659): do_readpage: ino 84, pg 65, i_size 3258056, flags 0x1
UBIFS DBG (pid 697): ubifs_lookup_level0: search key (163, data, 75)
UBIFS DBG (pid 697): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 697): fallible_read_node: LEB 92:29560, key (163, data, 75)
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 65)
UBIFS DBG (pid 697): try_read_node: LEB 92:29560, data node, length 1453
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 26:35960, key (84, data, 65)
UBIFS DBG (pid 659): try_read_node: LEB 26:35960, data node, length 771
UBIFS DBG (pid 659): do_readpage: ino 84, pg 66, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 66)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 26:36736, key (84, data, 66)
UBIFS DBG (pid 659): try_read_node: LEB 26:36736, data node, length 781
UBIFS DBG (pid 659): do_readpage: ino 84, pg 67, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 67)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:37520, key (84, data, 67)
UBIFS DBG (pid 659): try_read_node: LEB 26:37520, data node, length 763
UBIFS DBG (pid 659): do_readpage: ino 84, pg 63, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 63)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 26:34432, key (84, data, 63)
UBIFS DBG (pid 659): try_read_node: LEB 26:34432, data node, length 767
UBIFS DBG (pid 659): do_readpage: ino 84, pg 79, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 79)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 26:48264, key (84, data, 79)
UBIFS DBG (pid 659): try_read_node: LEB 26:48264, data node, length 773
UBIFS DBG (pid 659): do_readpage: ino 163, pg 78, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 78)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 92:34288, key (163, data, 78)
UBIFS DBG (pid 659): try_read_node: LEB 92:34288, data node, length 1156
UBIFS DBG (pid 659): do_readpage: ino 163, pg 76, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 76)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 92:31016, key (163, data, 76)
UBIFS DBG (pid 659): try_read_node: LEB 92:31016, data node, length 1692
UBIFS DBG (pid 659): do_readpage: ino 84, pg 77, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 77)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 26:46424, key (84, data, 77)
UBIFS DBG (pid 659): try_read_node: LEB 26:46424, data node, length 806
UBIFS DBG (pid 659): do_readpage: ino 163, pg 109, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 109)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 92:90608, key (163, data, 109)
UBIFS DBG (pid 659): try_read_node: LEB 92:90608, data node, length 2195
Check Tuner Type: DRV_TunerBCM7125
Check Tuner Type: DRV_TunerBCM7125
UBIFS DBG (pid 659): do_readpage: ino 163, pg 94, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 94)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 92:56576, key (163, data, 94)
UBIFS DBG (pid 659): try_read_node: LEB 92:56576, data node, length 1370
UBIFS DBG (pid 659): do_readpage: ino 84, pg 51, i_size 3258056, flags 0x21
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 51)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:23304, key (84, data, 51)
UBIFS DBG (pid 659): try_read_node: LEB 26:23304, data node, length 770
UBIFS DBG (pid 659): do_readpage: ino 84, pg 58, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 58)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 26:29624, key (84, data, 58)
UBIFS DBG (pid 659): try_read_node: LEB 26:29624, data node, length 946
UBIFS DBG (pid 659): do_readpage: ino 84, pg 57, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 57)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 26:28848, key (84, data, 57)
UBIFS DBG (pid 659): try_read_node: LEB 26:28848, data node, length 774
UBIFS DBG (pid 659): do_readpage: ino 163, pg 108, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 108)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 92:88456, key (163, data, 108)
UBIFS DBG (pid 659): try_read_node: LEB 92:88456, data node, length 2152
SYS_MsgQCreate id=1 pmsg=0x2427208
SYS_MsgQCreate id=2 pmsg=0x24276c8
SYS_TaskCreate StackSize =30720
tuner process ready
UBIFS DBG (pid 659): do_readpage: ino 163, pg 50, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 50)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 91:120160, key (163, data, 50)
UBIFS DBG (pid 659): try_read_node: LEB 91:120160, data node, length 1312
TASK CREATE NAME   ==    <TUNER>
UBIFS DBG (pid 659): do_readpage: ino 70, pg 18, i_size 97860, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (70, data, 18)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 13:16584, key (70, data, 18)
UBIFS DBG (pid 659): try_read_node: LEB 13:16584, data node, length 1526
ir enter mtc mode@@@@@@@@@@@@@@

UBIFS DBG (pid 703): do_readpage: ino 70, pg 17, i_size 97860, flags 0x1
UBIFS DBG (pid 703): ubifs_lookup_level0: search key (70, data, 17)
UBIFS DBG (pid 703): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 703): fallible_read_node: LEB 13:15352, key (70, data, 17)
UBIFS DBG (pid 703): try_read_node: LEB 13:15352, data node, length 1227
UBIFS DBG (pid 703): do_readpage: ino 70, pg 13, i_size 97860, flags 0x1
UBIFS DBG (pid 703): ubifs_lookup_level0: search key (70, data, 13)
UBIFS DBG (pid 703): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 703): fallible_read_node: LEB 13:10696, key (70, data, 13)
UBIFS DBG (pid 703): try_read_node: LEB 13:10696, data node, length 968
UBIFS DBG (pid 659): do_readpage: ino 163, pg 35, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 35)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 91:97440, key (163, data, 35)
UBIFS DBG (pid 659): try_read_node: LEB 91:97440, data node, length 1525
UBIFS DBG (pid 659): do_readpage: ino 163, pg 92, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 92)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 92:53784, key (163, data, 92)
UBIFS DBG (pid 659): try_read_node: LEB 92:53784, data node, length 1539
createSettings.width[720] createSettings.height[576]
createSettings.width[720] createSettings.height[576]
UBIFS DBG (pid 659): do_readpage: ino 103, pg 3, i_size 41876, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (103, data, 3)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 83:45864, key (103, data, 3)
UBIFS DBG (pid 659): try_read_node: LEB 83:45864, data node, length 1250
UBIFS DBG (pid 659): do_readpage: ino 103, pg 5, i_size 41876, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (103, data, 5)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): fallible_read_node: LEB 83:48616, key (103, data, 5)
UBIFS DBG (pid 659): try_read_node: LEB 83:48616, data node, length 1169
UBIFS DBG (pid 659): do_readpage: ino 103, pg 7, i_size 41876, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (103, data, 7)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 83:51248, key (103, data, 7)
UBIFS DBG (pid 659): try_read_node: LEB 83:51248, data node, length 1470
UBIFS DBG (pid 659): do_readpage: ino 103, pg 6, i_size 41876, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (103, data, 6)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 83:49792, key (103, data, 6)
UBIFS DBG (pid 659): try_read_node: LEB 83:49792, data node, length 1456
UBIFS DBG (pid 659): do_readpage: ino 103, pg 4, i_size 41876, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (103, data, 4)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 83:47120, key (103, data, 4)
UBIFS DBG (pid 659): try_read_node: LEB 83:47120, data node, length 1491
UBIFS DBG (pid 659): do_readpage: ino 163, pg 62, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 62)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 659): fallible_read_node: LEB 92:10552, key (163, data, 62)
UBIFS DBG (pid 659): try_read_node: LEB 92:10552, data node, length 1590
SYS_MsgQCreate id=3 pmsg=0x2427cf8
UBIFS DBG (pid 659): do_readpage: ino 163, pg 59, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 59)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 659): fallible_read_node: LEB 92:7304, key (163, data, 59)
UBIFS DBG (pid 659): try_read_node: LEB 92:7304, data node, length 1682
UBIFS DBG (pid 659): do_readpage: ino 163, pg 64, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 64)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 92:13536, key (163, data, 64)
UBIFS DBG (pid 659): try_read_node: LEB 92:13536, data node, length 1419
UBIFS DBG (pid 659): do_readpage: ino 163, pg 58, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 58)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 92:5600, key (163, data, 58)
UBIFS DBG (pid 659): try_read_node: LEB 92:5600, data node, length 1697
SYS_TaskCreate StackSize =8192
TASK CREATE NAME   ==    <LedScanKeyTask>
SYS_MsgQCreate id=4 pmsg=0x242aa48

DRV_PanelKeyListInit1543: KeyListInitPortFun=0x43ba3c
DRV_PanelKeyListInit1544:
KeyListInitPortFun=0x43ba3c,KeyTable=0x482c2c,DrvFpKeySize=0x7SYS_TaskCreate
StackSize =1024
TASK CREATE NAME   ==    <DispanelProcess>
UBIFS DBG (pid 708): do_readpage: ino 163, pg 60, i_size 515924, flags 0x1
UBIFS DBG (pid 659): do_readpage: ino 163, pg 32, i_size 515924, flags 0x1
UBIFS DBG (pid 708): ubifs_lookup_level0: search key (163, data, 60)
UBIFS DBG (pid 708): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 32)
UBIFS DBG (pid 708): fallible_read_node: LEB 92:8992, key (163, data, 60)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 708): try_read_node: LEB 92:8992, data node, length 862
UBIFS DBG (pid 659): fallible_read_node: LEB 91:93488, key (163, data, 32)
UBIFS DBG (pid 659): try_read_node: LEB 91:93488, data node, length 1318
UBIFS DBG (pid 708): do_readpage: ino 163, pg 61, i_size 515924, flags 0x1
UBIFS DBG (pid 708): ubifs_lookup_level0: search key (163, data, 61)
UBIFS DBG (pid 708): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 708): fallible_read_node: LEB 92:9856, key (163, data, 61)
UBIFS DBG (pid 708): try_read_node: LEB 92:9856, data node, length 689
UBIFS DBG (pid 659): do_readpage: ino 163, pg 21, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 21)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 91:78544, key (163, data, 21)
UBIFS DBG (pid 659): try_read_node: LEB 91:78544, data node, length 1456
UBIFS DBG (pid 710): do_readpage: ino 163, pg 20, i_size 515924, flags 0x1
UBIFS DBG (pid 710): ubifs_lookup_level0: search key (163, data, 20)
UBIFS DBG (pid 710): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 710): fallible_read_node: LEB 91:76928, key (163, data, 20)
UBIFS DBG (pid 710): try_read_node: LEB 91:76928, data node, length 1610
UBIFS DBG (pid 659): do_readpage: ino 163, pg 40, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 40)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 659): fallible_read_node: LEB 91:104528, key (163, data, 40)
UBIFS DBG (pid 659): try_read_node: LEB 91:104528, data node, length 1657
process_tuner_msg ready
 UBIFS DBG (pid 659): do_readpage: ino 163, pg 29, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 29)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 659): fallible_read_node: LEB 91:89264, key (163, data, 29)
UBIFS DBG (pid 659): try_read_node: LEB 91:89264, data node, length 1704
UBIFS DBG (pid 659): do_readpage: ino 163, pg 18, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 18)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 91:73720, key (163, data, 18)
UBIFS DBG (pid 659): try_read_node: LEB 91:73720, data node, length 1401
UBIFS DBG (pid 714): do_readpage: ino 163, pg 28, i_size 515924, flags 0x1
UBIFS DBG (pid 714): ubifs_lookup_level0: search key (163, data, 28)
UBIFS DBG (pid 714): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 714): fallible_read_node: LEB 91:87688, key (163, data, 28)
UBIFS DBG (pid 714): try_read_node: LEB 91:87688, data node, length 1575
_XML_GetNodeSet No result: Config.DigitalAudio.Spdif.OnOff
No element is found
UBIFS DBG (pid 659): do_readpage: ino 163, pg 41, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 41)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 91:106192, key (163, data, 41)
UBIFS DBG (pid 659): try_read_node: LEB 91:106192, data node, length 1506
UBIFS DBG (pid 659): do_readpage: ino 84, pg 75, i_size 3258056, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (84, data, 75)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 26:44840, key (84, data, 75)
UBIFS DBG (pid 659): try_read_node: LEB 26:44840, data node, length 790
UBIFS DBG (pid 659): do_readpage: ino 163, pg 79, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 79)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 92:35448, key (163, data, 79)
UBIFS DBG (pid 659): try_read_node: LEB 92:35448, data node, length 1175
_XML_GetNodeSet No result: Config.Video.Conversion
No element is found
UBIFS DBG (pid 659): do_readpage: ino 163, pg 74, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 74)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 92:27824, key (163, data, 74)
UBIFS DBG (pid 659): try_read_node: LEB 92:27824, data node, length 1731
_XML_GetNodeSet No result: Config.Video.Ratio
No element is found
[set_vout_param] unknown configured screen ration: , use default value 4:3
UBIFS DBG (pid 659): do_readpage: ino 163, pg 39, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 39)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 659): fallible_read_node: LEB 91:103552, key (163, data, 39)
UBIFS DBG (pid 659): try_read_node: LEB 91:103552, data node, length 973
UBIFS DBG (pid 659): do_readpage: ino 163, pg 65, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 65)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 659): fallible_read_node: LEB 92:14960, key (163, data, 65)
UBIFS DBG (pid 659): try_read_node: LEB 92:14960, data node, length 1309
*** 00:00:00.712 nexus_smartcard: Open smart card slot:0
KBD initializing...
KBD successully initialized !
@@@@@@@@@@@@@@@@@@@@@@@@@@DRV_KeySetCallBack :0x41e0b0
UBIFS DBG (pid 718): do_readpage: ino 163, pg 30, i_size 515924, flags 0x1
UBIFS DBG (pid 718): ubifs_lookup_level0: search key (163, data, 30)
UBIFS DBG (pid 718): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 718): fallible_read_node: LEB 91:90968, key (163, data, 30)
UBIFS DBG (pid 718): try_read_node: LEB 91:90968, data node, length 1211
UBIFS DBG (pid 718): do_readpage: ino 163, pg 31, i_size 515924, flags 0x1
UBIFS DBG (pid 718): ubifs_lookup_level0: search key (163, data, 31)
UBIFS DBG (pid 718): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 718): fallible_read_node: LEB 91:92184, key (163, data, 31)
UBIFS DBG (pid 718): try_read_node: LEB 91:92184, data node, length 1302
_XML_GetNodeSet No result: platform_main
No element is found
UBIFS DBG (pid 720): do_readpage: ino 163, pg 22, i_size 515924, flags 0x1
UBIFS DBG (pid 720): ubifs_lookup_level0: search key (163, data, 22)
UBIFS DBG (pid 720): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 720): fallible_read_node: LEB 91:80000, key (163, data, 22)
UBIFS DBG (pid 720): try_read_node: LEB 91:80000, data node, length 1501
UBIFS DBG (pid 659): do_readpage: ino 163, pg 34, i_size 515924, flags 0x1
UBIFS DBG (pid 659): ubifs_lookup_level0: search key (163, data, 34)
UBIFS DBG (pid 659): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 659): fallible_read_node: LEB 91:95984, key (163, data, 34)
UBIFS DBG (pid 659): try_read_node: LEB 91:95984, data node, length 1451
platform_main_init_ok
bmem=133088K@110M bmem=16416K@245728K root=/dev/ram oof=0
oof === 0
UBIFS DBG (pid 444): ubifs_lookup: 'mtc.sh' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0xc21e3e0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): ubifs_read_node: LEB 105:52176, direntry node,
length 63
UBIFS DBG (pid 444): ubifs_iget: inode 183
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:19392, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:19392, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 105:52016, key (183, inode)
UBIFS DBG (pid 444): try_read_node: LEB 105:52016, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 183, pg 0, i_size 339, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (183, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 105:51752, key (183, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 105:51752, data node, length 258
UBIFS DBG (pid 444): ubifs_lookup: 'application.env' in dir ino 65
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (65, direntry,
0x5b87476)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 444): ubifs_read_node: LEB 154:108968, direntry node,
length 72
UBIFS DBG (pid 444): ubifs_iget: inode 988
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, inode)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108808, key (988, inode)
UBIFS DBG (pid 444): try_read_node: LEB 154:108808, inode node, length 160
UBIFS DBG (pid 444): do_readpage: ino 988, pg 0, i_size 2894, flags 0x1
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (988, data, 0)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 444): fallible_read_node: LEB 154:108064, key (988, data, 0)
UBIFS DBG (pid 444): try_read_node: LEB 154:108064, data node, length 741
UBIFS DBG (pid 444): ubifs_lookup: 'sed' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x28c69d)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 0, lvl 0, n 3
UBIFS DBG (pid 444): ubifs_lookup: not found
UBIFS DBG (pid 729): ubifs_lookup: 'application' in dir ino 65
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (65, direntry,
0xe1931f)
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 729): ubifs_read_node: LEB 154:107992, direntry node,
length 68
UBIFS DBG (pid 729): ubifs_iget: inode 115
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (115, inode)
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:63904, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:63904, level 2, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:16408, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:16408, level 1, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 302:18240, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 302:18240, level 0, 8 branch
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 729): fallible_read_node: LEB 154:107832, key (115, inode)
UBIFS DBG (pid 729): try_read_node: LEB 154:107832, inode node, length 160
UBIFS DBG (pid 729): ubifs_lookup: 'cloudbb' in dir ino 115
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (115, direntry,
0xcf80fb)
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:16600, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:16600, level 1, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 302:18432, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 302:18432, level 0, 8 branch
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 729): ubifs_read_node: LEB 67:87272, direntry node, length 64
UBIFS DBG (pid 729): ubifs_iget: inode 200
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (200, inode)
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:64480, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:64480, level 2, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:21592, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:21592, level 1, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 302:58368, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 302:58368, level 0, 8 branch
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 729): fallible_read_node: LEB 67:87112, key (200, inode)
UBIFS DBG (pid 729): try_read_node: LEB 67:87112, inode node, length 160
UBIFS DBG (pid 729): ubifs_lookup: 'vinput_modules' in dir ino 200
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (200, direntry,
0xda684a3)
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 729): ubifs_read_node: LEB 67:86384, direntry node, length 71
UBIFS DBG (pid 729): ubifs_iget: inode 221
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (221, inode)
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:64672, indexing node,
length 188
wait for manually start mtc by executing mtc_start.sh.
UBIFS DBG (pid 729): read_znode: LEB 305:64672, level 2, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 305:22936, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 305:22936, level 1, 8 branch
UBIFS DBG (pid 729): ubifs_read_node: LEB 302:69504, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 302:69504, level 0, 8 branch
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 729): fallible_read_node: LEB 67:86224, key (221, inode)
UBIFS DBG (pid 729): try_read_node: LEB 67:86224, inode node, length 160
UBIFS DBG (pid 729): ubifs_lookup: 'install_vinput.sh' in dir ino 221
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (221, direntry,
0x3928132)
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 729): ubifs_read_node: LEB 67:79832, direntry node, length 74
oof End ------------------------->
UBIFS DBG (pid 729): ubifs_iget: inode 222
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (222, inode)
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 729): fallible_read_node: LEB 67:79672, key (222, inode)
UBIFS DBG (pid 729): try_read_node: LEB 67:79672, inode node, length 160
UBIFS DBG (pid 729): do_readpage: ino 222, pg 0, i_size 182, flags 0x1
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (222, data, 0)
UBIFS DBG (pid 729): ubifs_read_node: LEB 302:69696, indexing node,
length 188
UBIFS DBG (pid 729): read_znode: LEB 302:69696, level 0, 8 branch
UBIFS DBG (pid 729): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 729): fallible_read_node: LEB 67:79496, key (222, data, 0)
UBIFS DBG (pid 729): try_read_node: LEB 67:79496, data node, length 169
UBIFS DBG (pid 730): ubifs_lookup: 'dirname' in dir ino 152
UBIFS DBG (pid 730): ubifs_lookup_level0: search key (152, direntry,
0xeb21cb5)
UBIFS DBG (pid 730): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 730): ubifs_lookup: not found
UBIFS DBG (pid 729): ubifs_lookup: 'chmod' in dir ino 152
UBIFS DBG (pid 729): ubifs_lookup_level0: search key (152, direntry,
0x10df8542)
UBIFS DBG (pid 729): ubifs_lookup_level0: found 0, lvl 0, n 2
UBIFS DBG (pid 729): ubifs_lookup: not found
UBIFS DBG (pid 735): ubifs_lookup: 'vkbd.ko' in dir ino 221
UBIFS DBG (pid 735): ubifs_lookup_level0: search key (221, direntry,
0x1f1578a1)
UBIFS DBG (pid 735): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 735): ubifs_read_node: LEB 67:83072, direntry node, length 64
UBIFS DBG (pid 735): ubifs_iget: inode 223
UBIFS DBG (pid 735): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 735): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 735): fallible_read_node: LEB 67:82912, key (223, inode)
UBIFS DBG (pid 735): try_read_node: LEB 67:82912, inode node, length 160
UBIFS DBG (pid 735): do_readpage: ino 223, pg 0, i_size 6694, flags 0x1
UBIFS DBG (pid 735): ubifs_lookup_level0: search key (223, data, 0)
UBIFS DBG (pid 735): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 735): fallible_read_node: LEB 67:79912, key (223, data, 0)
UBIFS DBG (pid 735): try_read_node: LEB 67:79912, data node, length 1792
UBIFS DBG (pid 735): do_readpage: ino 223, pg 1, i_size 6694, flags 0x1
starting pid 1, tty '/dev/ttyS0': '/bin/login -f root'
UBIFS DBG (pid 735): ubifs_lookup_level0: search key (223, data, 1)
UBIFS DBG (pid 735): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 735): fallible_read_node: LEB 67:81704, key (223, data, 1)
UBIFS DBG (pid 735): try_read_node: LEB 67:81704, data node, length 1201
input: vkeyboard as /class/input/input0
UBIFS DBG (pid 738): ubifs_lookup: 'vmouse.ko' in dir ino 221
UBIFS DBG (pid 738): ubifs_lookup_level0: search key (221, direntry,
0x2ec3295)
UBIFS DBG (pid 738): ubifs_lookup_level0: found 1, lvl 0, n 4
Jan  1 00:00:30 login[743]: root login on 'ttyS0'
UBIFS DBG (pid 738): ubifs_read_node: LEB 67:86152, direntry node, length 66
UBIFS DBG (pid 738): ubifs_iget: inode 224
UBIFS DBG (pid 738): ubifs_lookup_level0: search key (224, inode)
UBIFS DBG (pid 738): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 738): fallible_read_node: LEB 67:85992, key (224, inode)
UBIFS DBG (pid 738): try_read_node: LEB 67:85992, inode node, length 160
UBIFS DBG (pid 738): do_readpage: ino 224, pg 0, i_size 6541, flags 0x1
UBIFS DBG (pid 738): ubifs_lookup_level0: search key (224, data, 0)
UBIFS DBG (pid 738): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 738): fallible_read_node: LEB 67:83136, key (224, data, 0)
UBIFS DBG (pid 738): try_read_node: LEB 67:83136, data node, length 1715
UBIFS DBG (pid 738): do_readpage: ino 224, pg 1, i_size 6541, flags 0x1
UBIFS DBG (pid 738): ubifs_lookup_level0: search key (224, data, 1)
UBIFS DBG (pid 738): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 738): fallible_read_node: LEB 67:84856, key (224, data, 1)
UBIFS DBG (pid 738): try_read_node: LEB 67:84856, data node, length 1132
input: vmouse as /class/input/input1
UBIFS DBG (pid 444): ubifs_lookup: 'mtcenable' in dir ino 152
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (152, direntry,
0x10cf5113)
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 444): ubifs_read_node: LEB 106:33968, direntry node,
length 66
UBIFS DBG (pid 444): ubifs_iget: inode 202
UBIFS DBG (pid 444): ubifs_lookup_level0: search key (202, inode)
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:57408, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:57408, level 2, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:43176, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:43176, level 1, 8 branch
UBIFS DBG (pid 444): ubifs_read_node: LEB 110:21504, indexing node,
length 188
UBIFS DBG (pid 444): read_znode: LEB 110:21504, level 0, 8 branch
UBIFS DBG (pid 444): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 444): fallible_read_node: LEB 106:33808, key (202, inode)
UBIFS DBG (pid 444): try_read_node: LEB 106:33808, inode node, length 160
#
# ls -l /usr/local/hmt/platform/f2
UBIFS DBG (pid 743): ubifs_lookup: 'ls' in dir ino 152
UBIFS DBG (pid 743): ubifs_lookup_level0: search key (152, direntry,
0x0382f3)
UBIFS DBG (pid 743): ubifs_lookup_level0: found 0, lvl 0, n 1
UBIFS DBG (pid 743): ubifs_lookup: not found
UBIFS DBG (pid 1066): ubifs_lookup: 'f2' in dir ino 1
UBIFS DBG (pid 1066): ubifs_lookup_level0: search key (1, direntry,
0x0328b7)
UBIFS DBG (pid 1066): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 1066): ubifs_read_node_wbuf: LEB 112:4096, direntry node,
length 59, jhead 1
UBIFS DBG (pid 1066): ubifs_read_node: LEB 112:4096, direntry node,
length 59
UBIFS DBG (pid 1066): ubifs_iget: inode 223
UBIFS DBG (pid 1066): ubifs_lookup_level0: search key (223, inode)
UBIFS DBG (pid 1066): ubifs_read_node: LEB 110:71424, indexing node,
length 188
UBIFS DBG (pid 1066): read_znode: LEB 110:71424, level 2, 8 branch
UBIFS DBG (pid 1066): ubifs_read_node: LEB 110:69504, indexing node,
length 188
UBIFS DBG (pid 1066): read_znode: LEB 110:69504, level 1, 8 branch
UBIFS DBG (pid 1066): ubifs_read_node: LEB 110:69120, indexing node,
length 188
UBIFS DBG (pid 1066): read_znode: LEB 110:69120, level 0, 8 branch
UBIFS DBG (pid 1066): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 1066): ubifs_read_node_wbuf: LEB 112:6144, inode node,
length 160, jhead 1
UBIFS DBG (pid 1066): ubifs_read_node: LEB 112:6144, inode node, length 160
-rw-rw-r--    1 506      506        1048576 Apr 11  2012
/usr/local/hmt/platform/f2
# UBIFS DBG (pid 611): do_readpage: ino 169, pg 7, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 7)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 611): fallible_read_node: LEB 93:22456, key (169, data, 7)
UBIFS DBG (pid 611): try_read_node: LEB 93:22456, data node, length 1820
UBIFS DBG (pid 611): do_readpage: ino 169, pg 28, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 28)
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 611): fallible_read_node: LEB 93:57232, key (169, data, 28)
UBIFS DBG (pid 611): try_read_node: LEB 93:57232, data node, length 1410
UBIFS DBG (pid 611): do_readpage: ino 169, pg 37, i_size 1172304, flags 0x1
UBIFS DBG (pid 611): ubifs_lookup_level0: search key (169, data, 37)
UBIFS DBG (pid 611): ubifs_read_node: LEB 110:1728, indexing node,
length 188
UBIFS DBG (pid 611): read_znode: LEB 110:1728, level 0, 8 branch
UBIFS DBG (pid 611): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 611): fallible_read_node: LEB 93:72056, key (169, data, 37)
UBIFS DBG (pid 611): try_read_node: LEB 93:72056, data node, length 1442

# pwd
/root
#


-- 
Have fun,
Mark Zhang
