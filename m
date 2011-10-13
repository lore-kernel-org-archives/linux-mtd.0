Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RESNP-0002f5-6g
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 20:59:41 +0000
Message-ID: <4E975135.9090702@grid-net.com>
Date: Thu, 13 Oct 2011 13:59:33 -0700
From: Steve Iribarne <siribarne@grid-net.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Need to recover from corruption
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I work on a system where we need to be as 100% uptime as possible.  The 
other day we had an issue here where one of our applications was 
crashing while a write to one of the partitions was happening.

I then turned on UBIFS debugging in u-boot and I have a bunch of info 
but I have no idea what is going on.

Here is the output after (at the u-boot) prompt I do:

ubi part nand0,1
ubifsmount boot-info

"boot-info" in one of our volumes that has boot information that we use 
in u-boot.

Here is the output I get....
Any help I can get debugging this is much appreciated.

I also have alot more output... but I've just put the tail end of it here.


Thanks so much.

UBIFS DBG (pid 0): apply_replay_entry: LEB 50:2048 len 0 flgs 2 sqnum 
96299 <NULL>
UBIFS DBG (pid 0): ubifs_add_lpt_dirt: LEB 8 add 12 to 12065
UBIFS DBG (pid 0): ubifs_add_lpt_dirt: LEB 8 add 17 to 12077
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 126976, dirty 
1888, flags 3
UBIFS DBG (pid 0): ubifs_change_lp: LEB 50, free 0, dirty 114856, flags 19
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 126976, dirty 
1888, flags 3
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 35:116736 len 0 flgs 2 sqnum 
96300 <NULL>
UBIFS DBG (pid 0): ubifs_add_lpt_dirt: LEB 8 add 17 to 12094
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 35, free 12288, dirty 
115696, flags 1
UBIFS DBG (pid 0): ubifs_change_lp: LEB 35, free 0, dirty 125792, flags 17
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 35, free 12288, dirty 
115696, flags 1
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 35:116736 len 53 flgs 0 sqnum 
96313 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 35:116736, len 53, key (99, data, 0)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (99, data, 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:73072, , length 148
UBIFS DBG (pid 0): read_znode: LEB 27:73072, level 3, 6 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68360, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
68508, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68360, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72568, , length 108
UBIFS DBG (pid 0): read_znode: LEB 27:72568, level 2, 4 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68512, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
68620, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68512, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72440, , length 128
UBIFS DBG (pid 0): read_znode: LEB 27:72440, level 1, 5 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68624, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
68752, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68624, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72328, , length 108
UBIFS DBG (pid 0): read_znode: LEB 27:72328, level 0, 4 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68752, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
68860, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68752, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 2
UBIFS DBG (pid 0): tnc_insert: inserted at 3 level 0, key (99, data, 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:2048 len 70 flgs 0 sqnum 
96317 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add_nm: LEB 50:2048, name 'zigbee-state~', 
key (1, direntry, 0x82fc123)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (1, 
direntry, 0x82fc123)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72152, , length 128
UBIFS DBG (pid 0): read_znode: LEB 27:72152, level 2, 5 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68864, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
68992, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68864, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72000, , length 148
UBIFS DBG (pid 0): read_znode: LEB 27:72000, level 1, 6 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68992, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69140, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
68992, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:71848, , length 148
UBIFS DBG (pid 0): read_znode: LEB 27:71848, level 0, 6 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69144, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69292, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69144, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 0
UBIFS DBG (pid 0): tnc_insert: inserted at 1 level 0, key (1, direntry, 
0x82fc123)
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: , key (1, direntry, 0x82fc123)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (1, 
direntry, 0x82fc123)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 1
UBIFS DBG (pid 0): fallible_read_node: LEB 50:2048, key (1, direntry, 
0x82fc123)
UBIFS DBG (pid 0): try_read_node: LEB 50:2048, , length 70
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: rc returned 0, znode 82d59a10, n 1
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:2120 len 160 flgs 0 sqnum 
96318 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 50:2120, len 160, key (4359, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, inode)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72920, , length 148
UBIFS DBG (pid 0): read_znode: LEB 27:72920, level 2, 6 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69296, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69444, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69296, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72792, , length 128
UBIFS DBG (pid 0): read_znode: LEB 27:72792, level 1, 5 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69448, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69576, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69448, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:72680, , length 108
UBIFS DBG (pid 0): read_znode: LEB 27:72680, level 0, 4 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69576, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69684, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69576, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 3
UBIFS DBG (pid 0): tnc_insert: inserted at 4 level 0, key (4359, inode)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:2280 len 160 flgs 0 sqnum 
96319 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 50:2280, len 160, key (1, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (1, inode)
UBIFS DBG (pid 0): ubifs_read_node: LEB 27:71680, , length 168
UBIFS DBG (pid 0): read_znode: LEB 27:71680, level 0, 7 branch
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69688, flags 48
UBIFS DBG (pid 0): ubifs_change_lp: LEB 27, free -2147483647, dirty 
69856, flags 48
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 27, free 55296, dirty 
69688, flags 48
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 0
UBIFS DBG (pid 0): ubifs_add_lpt_dirt: LEB 8 add 17 to 12111
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 47, free 0, dirty 128192, 
flags 1
UBIFS DBG (pid 0): ubifs_change_lp: LEB 47, free -2147483647, dirty 
128352, flags 1
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 47, free 0, dirty 128192, 
flags 1
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:4096 len 73 flgs 0 sqnum 
96321 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add_nm: LEB 50:4096, name 
'security.selinux', key (4359, xentry, 0xaebb094)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, 
xentry, 0xaebb094)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 0): tnc_insert: inserted at 5 level 0, key (4359, xentry, 
0xaebb094)
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: , key (4359, xentry, 0xaebb094)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, 
xentry, 0xaebb094)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 5
UBIFS DBG (pid 0): fallible_read_node: LEB 50:4096, key (4359, xentry, 
0xaebb094)
UBIFS DBG (pid 0): try_read_node: LEB 50:4096, , length 73
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: rc returned 0, znode 82d59d30, n 5
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:4176 len 193 flgs 0 sqnum 
96322 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 50:4176, len 193, key (4360, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4360, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 5
UBIFS DBG (pid 0): tnc_insert: inserted at 6 level 0, key (4360, inode)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:4376 len 160 flgs 0 sqnum 
96323 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 50:4376, len 160, key (4359, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 4
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 114856, 
flags 16
UBIFS DBG (pid 0): ubifs_change_lp: LEB 50, free -2147483647, dirty 
115016, flags 16
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 114856, 
flags 16
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:6144 len 160 flgs 0 sqnum 
96324 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 50:6144, len 160, key (4359, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, inode)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 4
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 115016, 
flags 16
UBIFS DBG (pid 0): ubifs_change_lp: LEB 50, free -2147483647, dirty 
115176, flags 16
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 115016, 
flags 16
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 35:118784 len 983 flgs 0 
sqnum 96325 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add: 35:118784, len 983, key (4359, data, 0)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (4359, data, 0)
UBIFS DBG (pid 0): lookup_level0_dirty: found 0, lvl 0, n 4
UBIFS DBG (pid 0): tnc_insert: inserted at 5 level 0, key (4359, data, 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:8192 len 69 flgs 0 sqnum 
96326 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_add_nm: LEB 50:8192, name 'zigbee-state', 
key (1, direntry, 0x68ff262)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (1, 
direntry, 0x68ff262)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 5
UBIFS DBG (pid 0): fallible_read_node: LEB 47:118784, key (1, direntry, 
0x68ff262)
UBIFS DBG (pid 0): try_read_node: LEB 47:118784, , length 69
UBIFS DBG (pid 0): ubifs_tnc_add_nm: rc returned 1, znode 82d59e50, n 5
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 47, free 0, dirty 128352, 
flags 1
UBIFS DBG (pid 0): ubifs_change_lp: LEB 47, free -2147483647, dirty 
128421, flags 1
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 47, free 0, dirty 128352, 
flags 1
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:8264 len 70 flgs 1 sqnum 
96327 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: zigbee-state~, key (1, direntry, 
0x82fc123)
UBIFS DBG (pid 0): lookup_level0_dirty: search and dirty key (1, 
direntry, 0x82fc123)
UBIFS DBG (pid 0): lookup_level0_dirty: found 1, lvl 0, n 1
UBIFS DBG (pid 0): ubifs_tnc_remove_nm: rc returned 1, znode 82d59a10, n 1
UBIFS DBG (pid 0): tnc_delete: deleting (1, direntry, 0x82fc123)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 115176, 
flags 16
UBIFS DBG (pid 0): ubifs_change_lp: LEB 50, free -2147483647, dirty 
115246, flags 16
UBIFS assert failed in ubifs_change_lp at 545 (pid 0)
UBIFS DBG (pid 0): ubifs_lpt_lookup_dirty: LEB 50, free 0, dirty 115176, 
flags 16
UBIFS assert failed in ubifs_release_lprops at 304 (pid 0)
UBIFS DBG (pid 0): apply_replay_entry: LEB 50:8336 len 160 flgs 1 sqnum 
96328 <NULL>
UBIFS DBG (pid 0): ubifs_tnc_remove_ino: ino 4357
UBIFS DBG (pid 0): ubifs_tnc_next_ent: (lowest) (4357, xentry, 0x000000)
UBIFS DBG (pid 0): ubifs_lookup_level0: search key (4357, xentry, 0x000000)
UBIFS DBG (pid 0): ubifs_lookup_level0: found 0, lvl 0, n 1
UBIFS DBG (pid 0): ubifs_read_node: LEB 47:114688, , length 73
UBIFS error (pid 0): ubifs_tnc_read_node: bad key in node at LEB 47:114688
UBIFS DBG (pid 0): ubifs_tnc_read_node: looked for key (4357, xentry, 
0xaebb094) found node's key (4413, xentry, 0xaebb094)
Error reading superblock!

-- 

This e-mail and any of its attachments may contain proprietary
information, which is privileged, confidential or subject to copyright
belonging to Grid Net, Inc. This e-mail is intended solely for the use
of the individual or entity to which it is addressed. If you are not the
intended recipient, you are hereby notified that any dissemination,
distribution, copying or action taken in relation to the contents of
this e-mail is strictly prohibited and may be unlawful. If you have
received this e-mail in error, please notify the sender immediately and
permanently delete.
