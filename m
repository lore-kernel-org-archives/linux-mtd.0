Received: from argos.cerberus.ch ([193.5.45.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T1ng-0007VA-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 14:21:25 +0000
Received: from localhost (localhost [[UNIX: localhost]])
	by argos.cerberus.ch (8.11.0/8.11.0) with SMTP id g0MEaXU07055
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 15:36:34 +0100 (MET)
Received: from cerberus.ch ([143.99.72.47])
	by chmanappl08.man.ch.cerberus.ch (Build 98 8.9.3/NT-8.9.3) with ESMTP id PAA06417
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 15:32:13 +0100
Message-ID: <3C4D77FE.CCAC1B9F@cerberus.ch>
Date: Tue, 22 Jan 2002 15:32:30 +0100
From: Daniel Zwirner <daniel.zwirner@cerberus.ch>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Problem with MTD + RPXLite
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi

I am trying to install an JFFS2 filesystem on a RPXLite board. 
It doesn't work..... (I have also a TQM8xxL Board with a working JFFS2
filesystem :-) )


Here are the logs:


Linux version 2.4.4  (zwl@w0012) (gcc version 2.95.3 20010315
(release/MontaVista)) #87 Fre Jan 18 08:45:54 CET 2002

.....

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
loop: loaded (max 8 devices)
zwl: init_rpxlite: chip probing count 0
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
zwl: init_rpxlite: bank1, name:zwl: RPX0, size:16777216bytes 
zwl: mtd_size >= flash_size
zwl: RPX  flash0: Using Static image partition definition
Creating 2 MTD partitions on "zwl: RPX0":
0x00000000-0x00040000 : "small"
mtd: Giving out device 0 to small
0x00040000-0x00440000 : "big"
mtd: Giving out device 1 to big


Mounting and unmount the jffs2.....

mtdblock_open
ok
jffs2: read_super for device 1f:01
jffs2_scan_eraseblock(): Scanning block at 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x6064 instead
Found empty flash at 0x4
Empty flash detected from 0x00000004 to 0x00040000
Block at 0x00000000: free 0x0003fffc, dirty 0x00000004, used 0x00000000
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Scanning block at 0x40000
Found empty flash at 0x40000
Empty flash detected from 0x00040000 to 0x00080000
Block at 0x00040000: free 0x00040000, dirty 0x00000000, used 0x00000000
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased

.......

jffs2_scan_eraseblock(): Scanning block at 0x340000
Found empty flash at 0x340000
Empty flash detected from 0x00340000 to 0x00380000
Block at 0x00340000: free 0x00040000, dirty 0x00000000, used 0x00000000
JFFS2: Erase block at 0x00340000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Scanning block at 0x380000
jffs2_scan_eraseblock(): Node at 0x00380000 {0x1985, 0x20ff, 0xffffffff)
has invalid CRC 0xffffffff (calculated 0xaaa90d0c)
Found empty flash at 0x380004
Empty flash detected from 0x00380004 to 0x003c0000
Block at 0x00380000: free 0x0003fffc, dirty 0x00000004, used 0x00000000
JFFS2: Erase block at 0x00380000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Scanning block at 0x3c0000
jffs2_scan_eraseblock(): Node at 0x003c0000 {0x1985, 0x20ff, 0xffffffff)
has invalid CRC 0xffffffff (calculated 0xaaa90d0c)
Found empty flash at 0x3c0004
Empty flash detected from 0x003c0004 to 0x00400000
Block at 0x003c0000: free 0x0003fffc, dirty 0x00000004, used 0x00000000
JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
Scanned flash completely
Pass 1 complete
Pass 2 (re)starting
Pass 2 complete
Pass 3 complete
jffs2_read_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_read_inode(): Got inocache at 00000000
Allocated inocache at c0bd82c0
jffs2_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add c0bd82c0 (ino #1)
jffs2_read_inode(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
jffs2_read_inode() returning
jffs2_read_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 22
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 16, dirty_size
0xc
jffs2_garbage_collect_thread sleeping...
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 16, dirty_size
0xc
Starting erase of pending block 0x003c0000
Freeing all node refs for eraseblock offset 0x003c0000
Erase completed successfully at 0x00400000
Starting erase of pending block 0x00380000

.............


Erase completed successfully at 0x000c0000
Starting erase of pending block 0x00040000
Freeing all node refs for eraseblock offset 0x00040000
Erase completed successfully at 0x00080000
Starting erase of pending block 0x00000000
Freeing all node refs for eraseblock offset 0x00000000
Erase completed successfully at 0x00040000
jffs2_erase_pending_blocks completed
Verifying erase at 0x003c0000
Writing erased marker to block at 0x003c0000
Last[2] is 198520ff, datum is 19852003
Write clean marker to block at 0x003c0000 failed: -5
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 15, dirty_size
0x0
jffs2_erase_pending_blocks completed
Verifying erase at 0x00380000
Writing erased marker to block at 0x00380000
Last[2] is 198520ff, datum is 19852003
Write clean marker to block at 0x00380000 failed: -5
jffs2: jffs2_put_super()
jffs2: Killing GC task 22
jffs2_free_ino_caches: Freeing ino #1 at c0bd82c0
Freeing inocache at c0bd82c0
jffs2_put_super returning
jffs2_clear_inode(): ino #1 mode 40755
mtdblock_release
ok
jffs2_garbage_collect_thread(): SIGKILL received.



I receive always the message "Write clean marker to block at XX failed:
-5". 
Has anybody an idea what's wrong or some experience with an RPXLite
board?


Any help would be greatly appreciated.

Thanks,

Daniel
