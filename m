Received: from mx.tdiedrich.de ([2001:6f8:1132::2])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MXvKa-0001dk-Mg
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 11:03:53 +0000
Date: Mon, 3 Aug 2009 13:03:42 +0200
From: Tobias Diedrich <ranma+kernel@tdiedrich.de>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [patch] Make block2mtd work with devices >=4GB
Message-ID: <20090803110342.GA7489@yamamaya.is-a-geek.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

block2mtd uses PAGE_MASK to mask the size and offset values, but
this a 32bit mask and so devices >=4GB wrap around to <4GB.
This adds a define MTD_PAGE_MASK, which casts PAGE_SIZE to loff_t
before inverting it.

Without the patch:

|# echo /dev/sdb3,$((1024 * 1024)) > /sys/module/block2mtd/parameters/block2mtd
|# cat /proc/mtd
|dev:    size   erasesize  name
|mtd0: c0200000 00100000 "block2mtd: /dev/sdb2"
|mtd1: 08e00000 00100000 "block2mtd: /dev/sdb3"

With this patch:

|# echo /dev/sdb3,$((1024 * 1024)) > /sys/module/block2mtd/parameters/block2mtd
|# cat /proc/mtd
|dev:    size   erasesize  name
|mtd0: c0200000 00100000 "block2mtd: /dev/sdb2"
|mtd1: 308e00000 00100000 "block2mtd: /dev/sdb3"

Creating an ubi volume works (but ubinfo seems to use 32bit math to
calculate the size in bytes and MiB):
|# ubinfo /dev/ubi1
|ubi1
|Volumes count:                           1
|Logical eraseblock size:                 1048448 bytes, 1023.9 KiB
|Total amount of logical eraseblocks:     12430 (147306752 bytes, 140.5 MiB)
|Amount of available logical eraseblocks: 0 (0 bytes)
|Maximum count of volumes                 128
|Count of bad physical eraseblocks:       0
|Count of reserved physical eraseblocks:  0
|Current maximum erase counter value:     2
|Minimum input/output unit size:          1 byte
|Character device major/minor:            250:0
|Present volumes:                         0
|# ubinfo /dev/ubi1_0
|Volume ID:   0 (on ubi1)
|Type:        dynamic
|Alignment:   1
|Size:        12426 LEBs (143112960 bytes, 136.5 MiB)
|State:       OK
|Name:        home
|Character device major/minor: 250:1

mkfs.ubifs also claims to succeed, but the ubifs cannot be mounted:
[10423.520009] UBIFS error (pid 7239): ubifs_scanned_corruption: corruption at LEB 1:512
[10423.520009] 00000000: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 ................................
[...]
[10423.520009] 00001fe0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 ................................
[10423.520009] UBIFS error (pid 7239): ubifs_scan: LEB 1 scanning failed
[10423.520009] UBIFS error (pid 7239): ubifs_recover_master_node: failed to recover master node


Signed-off-by: Tobias Diedrich <ranma+kernel@tdiedrich.de>

Index: linux-2.6.31-rc5/drivers/mtd/devices/block2mtd.c
===================================================================
--- linux-2.6.31-rc5.orig/drivers/mtd/devices/block2mtd.c	2009-08-03 16:33:55.846298216 +0900
+++ linux-2.6.31-rc5/drivers/mtd/devices/block2mtd.c	2009-08-03 16:34:29.986318468 +0900
@@ -24,6 +24,7 @@
 #define ERROR(fmt, args...) printk(KERN_ERR "block2mtd: " fmt "\n" , ## args)
 #define INFO(fmt, args...) printk(KERN_INFO "block2mtd: " fmt "\n" , ## args)
 
+#define MTD_PAGE_MASK (~((loff_t)(PAGE_SIZE-1)))
 
 /* Info for the block device */
 struct block2mtd_dev {
@@ -149,7 +150,7 @@
 	struct page *page;
 	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
 	int index = to >> PAGE_SHIFT;	// page index
-	int offset = to & ~PAGE_MASK;	// page offset
+	int offset = to & ~MTD_PAGE_MASK;	// page offset
 	int cpylen;
 
 	if (retlen)
@@ -286,7 +287,7 @@
 	sprintf(name, "block2mtd: %s", devname);
 	dev->mtd.name = name;
 
-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = dev->blkdev->bd_inode->i_size & MTD_PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.type = MTD_RAM;

-- 
Tobias						PGP: http://9ac7e0bc.uguu.de
