Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCjDO-0005GS-2X
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 23:20:35 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	mBGNKTrl017252
	for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2008 15:20:29 -0800
To: linux-mtd@lists.infradead.org
Subject: UBIFS failures
MIME-Version: 1.0
Message-ID: <OF7D8D85A1.8CD2CCD5-ON88257521.007FE753-88257521.00803388@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 16 Dec 2008 15:20:26 -0800
Content-Type: text/plain; charset="US-ASCII"
Cc: Barry_Grussling@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, list, et. al. :),

We're getting down towards the end of one of our projects and we've 
started seeing some problems with UBIFS in the boxes in our test racks. 
We're running version 2.6.27.3 of the kernel on an MPC8347 processor, 
using 16MiB of NOR flash for u-boot/rcw/device tree/kernel and NAND flash 
for root/other filesystems using UBI/UBIFS, organized like this:

Filesystem      Size            Used    Available Use% Mounted on
rootfs                          239.0M  43.0M    196.0M      18%         /
ubi0:rootfs1            239.0M  43.0M    196.0M      18%         /
ubi0:database   139.5M  22.2M    117.2M      16%         /home/postgres

We haven't been able to isolate what causes a failure yet.  Most of the 
time the device fails sometime overnight.
There should be minimal activity on the box during this time, but reads 
and writes will be happening due to 
some daemons. 

The problem we're running into is that the second UBI volume (database) is 
becoming corrupted and we're not sure why.  Following a power cycle of the 
box with a clean shutdown we get the following error messages when we try 
to mount the database volume:

# mount /home/postgres/
UBIFS: background thread "ubifs_bgt0_2" started, PID 362
UBIFS: recovery needed
UBIFS error (pid 361): alloc_lpt_leb: last LEB 8
Call Trace:
[df04bbb0] [c0007e64] show_stack+0x58/0x154 (unreliable)
[df04bbf0] [c0120680] alloc_lpt_leb+0x160/0x17c
[df04bc10] [c0122038] ubifs_lpt_start_commit+0x7dc/0xad4
[df04bc50] [c010c5b4] do_commit+0x130/0x77c
[df04bcd0] [c011f37c] ubifs_rcvry_gc_commit+0x6d4/0x71c
[df04bd10] [c00fc21c] ubifs_fill_super+0xc6c/0x1820
[df04bda0] [c00fdf10] ubifs_get_sb+0x318/0x37c
[df04be20] [c006d278] vfs_kern_mount+0xa0/0x138
[df04be50] [c006d360] do_kern_mount+0x40/0xf4
[df04be70] [c008795c] do_new_mount+0x6c/0xb8
[df04be90] [c0087b58] do_mount+0x1b0/0x1dc
[df04bf10] [c0087c18] sys_mount+0x94/0xe8
[df04bf40] [c000f234] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe271c4
    LR = 0x1002797c
UBIFS error (pid 361): do_commit: commit failed, error -28
UBIFS warning (pid 361): ubifs_ro_mode: switched to read-only mode, error 
-28
Call Trace:
[df04bc00] [c0007e64] show_stack+0x58/0x154 (unreliable)
[df04bc40] [c00ff7a4] ubifs_ro_mode+0x50/0x60
[df04bc50] [c010cbe8] do_commit+0x764/0x77c
[df04bcd0] [c011f37c] ubifs_rcvry_gc_commit+0x6d4/0x71c
[df04bd10] [c00fc21c] ubifs_fill_super+0xc6c/0x1820
[df04bda0] [c00fdf10] ubifs_get_sb+0x318/0x37c
[df04be20] [c006d278] vfs_kern_mount+0xa0/0x138
[df04be50] [c006d360] do_kern_mount+0x40/0xf4
[df04be70] [c008795c] do_new_mount+0x6c/0xb8
[df04be90] [c0087b58] do_mount+0x1b0/0x1dc
[df04bf10] [c0087c18] sys_mount+0x94/0xe8
[df04bf40] [c000f234] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe271c4
    LR = 0x1002797c
mount: mounting ubi0:database on /home/postgres failed: No space left on 
device
# dmesg -s64000 -c
replay_entry: LEB 525:4792 len 160 flgs 0 sqnum 1239035 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:4952 len 160 flgs 0 sqnum 
1239036 (67, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:67584 len 1344 flgs 0 
sqnum 1239037 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:68928 len 76 flgs 0 
sqnum 1239038 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:69632 len 1824 flgs 0 
sqnum 1239039 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:71456 len 1232 flgs 0 
sqnum 1239040 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6144 len 67 flgs 0 sqnum 
1239042 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6216 len 160 flgs 0 sqnum 
1239043 (103203, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6376 len 160 flgs 0 sqnum 
1239044 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6536 len 68 flgs 0 sqnum 
1239045 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6608 len 67 flgs 1 sqnum 
1239046 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6680 len 160 flgs 1 sqnum 
1239047 (103202, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:6840 len 160 flgs 0 sqnum 
1239048 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:73728 len 1824 flgs 0 
sqnum 1239049 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:75552 len 1305 flgs 0 
sqnum 1239050 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:77824 len 1824 flgs 0 
sqnum 1239051 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:79648 len 1354 flgs 0 
sqnum 1239052 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7000 len 67 flgs 0 sqnum 
1239054 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7072 len 160 flgs 0 sqnum 
1239055 (103204, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7232 len 160 flgs 0 sqnum 
1239056 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7392 len 68 flgs 0 sqnum 
1239057 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7464 len 67 flgs 1 sqnum 
1239058 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7536 len 160 flgs 1 sqnum 
1239059 (103203, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:7696 len 160 flgs 0 sqnum 
1239060 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:81920 len 1824 flgs 0 
sqnum 1239061 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:83744 len 1405 flgs 0 
sqnum 1239062 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:86016 len 1824 flgs 0 
sqnum 1239063 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:87840 len 1457 flgs 0 
sqnum 1239064 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8192 len 67 flgs 0 sqnum 
1239066 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8264 len 160 flgs 0 sqnum 
1239067 (103205, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8424 len 160 flgs 0 sqnum 
1239068 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8584 len 68 flgs 0 sqnum 
1239069 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8656 len 67 flgs 1 sqnum 
1239070 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8728 len 160 flgs 1 sqnum 
1239071 (103204, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:8888 len 160 flgs 0 sqnum 
1239072 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:90112 len 1824 flgs 0 
sqnum 1239073 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:91936 len 1510 flgs 0 
sqnum 1239074 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:94208 len 1824 flgs 0 
sqnum 1239075 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:96032 len 1563 flgs 0 
sqnum 1239076 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9048 len 67 flgs 0 sqnum 
1239078 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9120 len 160 flgs 0 sqnum 
1239079 (103206, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9280 len 160 flgs 0 sqnum 
1239080 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9440 len 68 flgs 0 sqnum 
1239081 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9512 len 67 flgs 1 sqnum 
1239082 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9584 len 160 flgs 1 sqnum 
1239083 (103205, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:9744 len 160 flgs 0 sqnum 
1239084 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:98304 len 1824 flgs 0 
sqnum 1239085 (67, data, 1262)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:100128 len 1588 flgs 0 
sqnum 1239086 (67, data, 1263)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:101720 len 134 flgs 0 
sqnum 1239087 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:101856 len 76 flgs 0 
sqnum 1239088 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:102400 len 207 flgs 0 
sqnum 1239089 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:102608 len 76 flgs 0 
sqnum 1239090 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10240 len 67 flgs 0 sqnum 
1239092 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10312 len 160 flgs 0 
sqnum 1239093 (103207, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10472 len 160 flgs 0 
sqnum 1239094 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10632 len 68 flgs 0 sqnum 
1239095 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10704 len 67 flgs 1 sqnum 
1239096 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10776 len 160 flgs 1 
sqnum 1239097 (103206, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:10936 len 160 flgs 0 
sqnum 1239098 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11096 len 67 flgs 0 sqnum 
1239100 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11168 len 160 flgs 0 
sqnum 1239101 (103208, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11328 len 160 flgs 0 
sqnum 1239102 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11488 len 68 flgs 0 sqnum 
1239103 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11560 len 67 flgs 1 sqnum 
1239104 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11632 len 160 flgs 1 
sqnum 1239105 (103207, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11792 len 160 flgs 0 
sqnum 1239106 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:104448 len 259 flgs 0 
sqnum 1239107 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:104712 len 76 flgs 0 
sqnum 1239108 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:106496 len 309 flgs 0 
sqnum 1239109 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:106808 len 76 flgs 0 
sqnum 1239110 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:11952 len 67 flgs 0 sqnum 
1239112 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12024 len 160 flgs 0 
sqnum 1239113 (103209, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12184 len 160 flgs 0 
sqnum 1239114 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12344 len 68 flgs 0 sqnum 
1239115 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12416 len 67 flgs 1 sqnum 
1239116 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12488 len 160 flgs 1 
sqnum 1239117 (103208, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:12648 len 160 flgs 0 
sqnum 1239118 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:108544 len 363 flgs 0 
sqnum 1239119 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:108912 len 76 flgs 0 
sqnum 1239120 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:110592 len 416 flgs 0 
sqnum 1239121 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:111008 len 76 flgs 0 
sqnum 1239122 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14336 len 67 flgs 0 sqnum 
1239124 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14408 len 160 flgs 0 
sqnum 1239125 (103210, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14568 len 160 flgs 0 
sqnum 1239126 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14728 len 68 flgs 0 sqnum 
1239127 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14800 len 67 flgs 1 sqnum 
1239128 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:14872 len 160 flgs 1 
sqnum 1239129 (103209, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:15032 len 160 flgs 0 
sqnum 1239130 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:112640 len 466 flgs 0 
sqnum 1239131 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:113112 len 76 flgs 0 
sqnum 1239132 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:114688 len 520 flgs 0 
sqnum 1239133 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:115208 len 76 flgs 0 
sqnum 1239134 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16384 len 67 flgs 0 sqnum 
1239136 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16456 len 160 flgs 0 
sqnum 1239137 (103211, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16616 len 160 flgs 0 
sqnum 1239138 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16776 len 68 flgs 0 sqnum 
1239139 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16848 len 67 flgs 1 sqnum 
1239140 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:16920 len 160 flgs 1 
sqnum 1239141 (103210, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:17080 len 160 flgs 0 
sqnum 1239142 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:17240 len 160 flgs 0 
sqnum 1239143 (67, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:116736 len 570 flgs 0 
sqnum 1239144 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:117312 len 76 flgs 0 
sqnum 1239145 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:118784 len 622 flgs 0 
sqnum 1239146 (67, data, 1264)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:119408 len 76 flgs 0 
sqnum 1239147 (67, data, 1265)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18432 len 67 flgs 0 sqnum 
1239149 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18504 len 160 flgs 0 
sqnum 1239150 (103212, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18664 len 160 flgs 0 
sqnum 1239151 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18824 len 68 flgs 0 sqnum 
1239152 (78, direntry, 0x18e71a85)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18896 len 67 flgs 1 sqnum 
1239153 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:18968 len 160 flgs 1 
sqnum 1239154 (103211, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19128 len 160 flgs 0 
sqnum 1239155 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19288 len 67 flgs 0 sqnum 
1239157 (78, direntry, 0x1c723a8a)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19360 len 160 flgs 0 
sqnum 1239158 (103213, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19520 len 160 flgs 0 
sqnum 1239159 (78, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19680 len 160 flgs 0 
sqnum 1239160 (67, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:19840 len 160 flgs 0 
sqnum 1239161 (103212, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:120832 len 954 flgs 0 
sqnum 1239162 (103212, data, 0)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:121792 len 893 flgs 0 
sqnum 1239163 (103212, data, 1)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:122688 len 799 flgs 0 
sqnum 1239164 (103212, data, 2)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:123488 len 875 flgs 0 
sqnum 1239165 (103212, data, 3)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:124368 len 813 flgs 0 
sqnum 1239166 (103212, data, 4)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:125184 len 788 flgs 0 
sqnum 1239167 (103212, data, 5)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:125976 len 853 flgs 0 
sqnum 1239168 (103212, data, 6)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:126832 len 879 flgs 0 
sqnum 1239169 (103212, data, 7)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:127712 len 199 flgs 0 
sqnum 1239170 (103212, data, 8)
UBIFS DBG (pid 361): apply_replay_entry: LEB 525:20000 len 160 flgs 0 
sqnum 1239171 (103213, inode)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1026:127912 len 949 flgs 0 
sqnum 1239172 (103213, data, 0)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1192:0 len 0 flgs 2 sqnum 
1239173 (0, inode)
UBIFS DBG (pid 361): set_bud_lprops: bud LEB 1192 was GC'd (0 free, 129024 
dirty)
UBIFS DBG (pid 361): set_bud_lprops: bud LEB 1192 was GC'd (0 free, 129024 
dirty)
UBIFS DBG (pid 361): apply_replay_entry: LEB 1192:0 len 893 flgs 0 sqnum 
1239174 (103213, data, 1)
UBIFS DBG (pid 361): ubifs_replay_journal: finished, log head LEB 3:2048, 
max_sqnum 1239230, highest_inum 103213
UBIFS DBG (pid 361): ubifs_find_dirty_leb: found LEB 1207, free 129024, 
dirty 0, flags 0x4
UBIFS DBG (pid 361): do_commit: start
UBIFS DBG (pid 361): get_znodes_to_commit: committing 70 znodes
UBIFS DBG (pid 361): alloc_idx_lebs: need about 1 empty LEBS for TNC 
commit
UBIFS DBG (pid 361): ubifs_find_free_leb_for_idx: found LEB 1015, free 
129024, dirty 0, flags 0x4
UBIFS DBG (pid 361): alloc_idx_lebs: LEB 1015
UBIFS DBG (pid 361): ubifs_save_dirty_idx_lnums: found 11 dirty index LEBs
UBIFS DBG (pid 361): ubifs_save_dirty_idx_lnums: dirtiest index LEB is 
1154 with dirty 115584 and free 0
UBIFS DBG (pid 361): ubifs_tnc_start_commit: number of index LEBs 15
UBIFS DBG (pid 361): ubifs_tnc_start_commit: size of index 466936
UBIFS DBG (pid 361): get_cnodes_to_commit: committing 403 cnodes
UBIFS error (pid 361): alloc_lpt_leb: last LEB 8
Call Trace:
[df04bbb0] [c0007e64] show_stack+0x58/0x154 (unreliable)
[df04bbf0] [c0120680] alloc_lpt_leb+0x160/0x17c
[df04bc10] [c0122038] ubifs_lpt_start_commit+0x7dc/0xad4
[df04bc50] [c010c5b4] do_commit+0x130/0x77c
[df04bcd0] [c011f37c] ubifs_rcvry_gc_commit+0x6d4/0x71c
[df04bd10] [c00fc21c] ubifs_fill_super+0xc6c/0x1820
[df04bda0] [c00fdf10] ubifs_get_sb+0x318/0x37c
[df04be20] [c006d278] vfs_kern_mount+0xa0/0x138
[df04be50] [c006d360] do_kern_mount+0x40/0xf4
[df04be70] [c008795c] do_new_mount+0x6c/0xb8
[df04be90] [c0087b58] do_mount+0x1b0/0x1dc
[df04bf10] [c0087c18] sys_mount+0x94/0xe8
[df04bf40] [c000f234] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe271c4
    LR = 0x1002797c
UBIFS error (pid 361): do_commit: commit failed, error -28
UBIFS warning (pid 361): ubifs_ro_mode: switched to read-only mode, error 
-28
Call Trace:
[df04bc00] [c0007e64] show_stack+0x58/0x154 (unreliable)
[df04bc40] [c00ff7a4] ubifs_ro_mode+0x50/0x60
[df04bc50] [c010cbe8] do_commit+0x764/0x77c
[df04bcd0] [c011f37c] ubifs_rcvry_gc_commit+0x6d4/0x71c
[df04bd10] [c00fc21c] ubifs_fill_super+0xc6c/0x1820
[df04bda0] [c00fdf10] ubifs_get_sb+0x318/0x37c
[df04be20] [c006d278] vfs_kern_mount+0xa0/0x138
[df04be50] [c006d360] do_kern_mount+0x40/0xf4
[df04be70] [c008795c] do_new_mount+0x6c/0xb8
[df04be90] [c0087b58] do_mount+0x1b0/0x1dc
[df04bf10] [c0087c18] sys_mount+0x94/0xe8
[df04bf40] [c000f234] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe271c4
    LR = 0x1002797c
UBIFS DBG (pid 362): ubifs_bg_thread: background thread "ubifs_bgt0_2" 
stops
# 

There have been a number of variants to this, but they all seem to have 
the same thing in common.  UBIFS thinks a recovery is needed as if the 
last reboot wasn't clean, and then when it trys to allocate some space on 
the device for an LPT is can't find any room, so it fails claiming the 
device is full.  When it trys to mount it read-only it also fails to mount 
the volume.

At first we were thinking "okay we've got a wayward process and the device 
really _is_ full".  We're not sure now, because we can re-format the 
partition and fill it totally full of files, reboot, and we don't get 
kernel thread crashes.  Unlike in our crash case, we are still able to 
mount the filesystem, remove the extra files, and things continue 
normally.  We're stuck.  Neither of us who are working on this know the 
intimate details of UBI/UBIFS so we're having trouble figuring out what's 
wrong.  Been at it a couple of weeks now without success.

This is obviously something that's happening before the reboot, but the 
only diagnostic messages we've been able to get so far have been 
postmortum.  Does anyone have any suggestions on how we can proceed?

Bruce
