Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkSH-0000Wg-Vh
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:53:39 -0500
Date: Tue, 21 Dec 2004 14:53:12 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221135312.GP22636@wohnheim.fh-wedel.de>
References: <20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221135139.GO22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/22] Cleanup macro usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change some macros.  "err" and "info" were both macros and variables,
which is at best confusing to the reader.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   26 ++++++++++----------------
 1 files changed, 10 insertions(+), 16 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_macros	2004-12-20 22:07:09.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:12:07.000000000 +0100
@@ -33,12 +33,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/buffer_head.h>
 
-#define ERROR(fmt, args...) printk(KERN_ERR "blockmtd: " fmt , ## args)
-
-#define err(format, arg...) printk(KERN_ERR "blkmtd: " format "\n" , ## arg)
-#define info(format, arg...) printk(KERN_INFO "blkmtd: " format "\n" , ## arg)
-#define warn(format, arg...) printk(KERN_WARNING "blkmtd: " format "\n" , ## arg)
-#define crit(format, arg...) printk(KERN_CRIT "blkmtd: " format "\n" , ## arg)
+#define ERROR(fmt, args...) printk(KERN_ERR "blockmtd: " fmt "\n" , ## args)
+#define INFO(fmt, args...) printk(KERN_INFO "blockmtd: " fmt "\n" , ## args)
 
 
 /* Default erase size in K, always make it a multiple of PAGE_SIZE */
@@ -57,8 +53,6 @@
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
 
-#define MAX_DEVICES 4
-
 
 #define PAGE_READAHEAD 64
 
@@ -143,7 +137,7 @@
 		err=0;
 		page = page_readahead(mapping,index);
 		if( unlikely(!page) ) {
-			crit("unable to read page (%d) in write_pages\n",index);
+			ERROR("unable to read page (%d) in write_pages\n", index);
 			err=-ENOMEM;
 		}
 		//if(IS_ERR(page)) err=-EIO;
@@ -255,7 +249,7 @@
 
 	if (!numregions) {
 		/* Not a valid erase block */
-		err("erase: invalid erase request 0x%lX @ 0x%08zX", len, from);
+		ERROR("erase: invalid erase request 0x%lX @ 0x%08zX", len,from);
 		instr->state = MTD_ERASE_FAILED;
 		err = -EIO;
 	}
@@ -264,7 +258,7 @@
 		/* do the erase */
 		err = write_pages(dev, NULL, from, len, &retlen);
 		if (err || retlen != len) {
-			err("erase failed err = %d", err);
+			ERROR("erase failed err = %d", err);
 			instr->state = MTD_ERASE_FAILED;
 		} else {
 			instr->state = MTD_ERASE_DONE;
@@ -445,12 +439,12 @@
 	bdev = open_by_devnum(name_to_dev_t(devname), mode);
 #endif
 	if (IS_ERR(bdev)) {
-		err("error: cannot open device %s", devname);
+		ERROR("error: cannot open device %s", devname);
 		return NULL;
 	}
 
 	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
-		err("attempting to use an MTD device as a block device");
+		ERROR("attempting to use an MTD device as a block device");
 		blkdev_put(bdev);
 		return NULL;
 	}
@@ -497,7 +491,7 @@
 		list_del(&dev->list);
 		goto devinit_err;
 	} else {
-		info("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "), dev->mtd_info.erasesize >> 10, PAGE_SIZE);
+		INFO("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "), dev->mtd_info.erasesize >> 10, PAGE_SIZE);
 	}
 	return dev;
 
@@ -617,7 +611,7 @@
 
 static int __init blockmtd_init(void)
 {
-	info("version " VERSION);
+	INFO("version " VERSION);
 	return 0;
 }
 
@@ -632,7 +626,7 @@
 						    list);
 		blkmtd_sync(&dev->mtd_info);
 		del_mtd_device(&dev->mtd_info);
-		info("mtd%d: [%s] removed", dev->mtd_info.index,
+		INFO("mtd%d: [%s] removed", dev->mtd_info.index,
 				dev->mtd_info.name + strlen("blkmtd: "));
 		list_del(&dev->list);
 		free_device(dev);
