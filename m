Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkIB-0000Sx-4n
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:43:13 -0500
Date: Tue, 21 Dec 2004 14:42:58 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134258.GI22636@wohnheim.fh-wedel.de>
References: <41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134120.GH22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/22] Remove read-only option
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read-only devices are an inherintly stupid idea.  Get rid of them.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   51 +++++++++++++--------------------------------------
 1 files changed, 13 insertions(+), 38 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_readonly	2004-12-20 18:34:22.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 18:37:15.000000000 +0100
@@ -62,7 +62,6 @@
 /* Module parameters passed by insmod/modprobe */
 char *device[MAX_DEVICES];    /* the block device to use */
 int erasesz[MAX_DEVICES];     /* optional default erase size */
-int ro[MAX_DEVICES];          /* optional read only flag */
 int sync;
 
 
@@ -73,8 +72,6 @@
 MODULE_PARM_DESC(device, "block device to use");
 MODULE_PARM(erasesz, "1-4i");
 MODULE_PARM_DESC(erasesz, "optional erase size to use in KiB. eg 4=4KiB.");
-MODULE_PARM(ro, "1-4i");
-MODULE_PARM_DESC(ro, "1=Read only, writes and erases cause errors");
 MODULE_PARM(sync, "i");
 MODULE_PARM_DESC(sync, "1=Synchronous writes");
 
@@ -445,7 +442,7 @@
 
 extern dev_t __init name_to_dev_t(const char *line);
 
-static struct blkmtd_dev *add_device(char *devname, int readonly, int erase_size)
+static struct blkmtd_dev *add_device(char *devname, int erase_size)
 {
 	struct block_device *bdev;
 	int mode;
@@ -458,10 +455,10 @@
 
 
 #ifdef MODULE
-	mode = (readonly) ? O_RDONLY : O_RDWR;
+	mode = O_RDWR;
 	bdev = open_bdev_excl(devname, mode, NULL);
 #else
-	mode = (readonly) ? FMODE_READ : FMODE_WRITE;
+	mode = FMODE_WRITE;
 	bdev = open_by_devnum(name_to_dev_t(devname), mode);
 #endif
 	if(IS_ERR(bdev)) {
@@ -488,9 +485,7 @@
 	memset(dev, 0, sizeof(struct blkmtd_dev));
 	dev->blkdev = bdev;
 	atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
-	if(!readonly) {
-		init_MUTEX(&dev->wrbuf_mutex);
-	}
+	init_MUTEX(&dev->wrbuf_mutex);
 
 	dev->mtd_info.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 
@@ -510,17 +505,12 @@
 	DEBUG(1, "blkmtd: init: found %d erase regions\n",
 	      dev->mtd_info.numeraseregions);
 
-	if(readonly) {
-		dev->mtd_info.type = MTD_ROM;
-		dev->mtd_info.flags = MTD_CAP_ROM;
-	} else {
-		dev->mtd_info.type = MTD_RAM;
-		dev->mtd_info.flags = MTD_CAP_RAM;
-		dev->mtd_info.erase = blkmtd_erase;
-		dev->mtd_info.write = blkmtd_write;
-		dev->mtd_info.writev = default_mtd_writev;
-		dev->mtd_info.sync = blkmtd_sync;
-	}
+	dev->mtd_info.type = MTD_RAM;
+	dev->mtd_info.flags = MTD_CAP_RAM;
+	dev->mtd_info.erase = blkmtd_erase;
+	dev->mtd_info.write = blkmtd_write;
+	dev->mtd_info.writev = default_mtd_writev;
+	dev->mtd_info.sync = blkmtd_sync;
 	dev->mtd_info.read = blkmtd_read;
 	dev->mtd_info.readv = default_mtd_readv;
 	dev->mtd_info.priv = dev;
@@ -532,10 +522,10 @@
 		list_del(&dev->list);
 		goto devinit_err;
 	} else {
-		info("mtd%d: [%s] erase_size = %dKiB %s [%ld]",
+		info("mtd%d: [%s] erase_size = %dKiB [%ld]",
 		     dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "),
 		     dev->mtd_info.erasesize >> 10,
-		     readonly ? "(read-only)" : "", PAGE_SIZE);
+		     PAGE_SIZE);
 	}
 	return dev;
 
@@ -595,20 +585,6 @@
 }
 
 
-static int __init param_blkmtd_ro(char *str)
-{
-	int i;
-	for(i = 0; i < MAX_DEVICES; i++) {
-		char *val = strsep(&str, ",");
-		if(val)
-			ro[i] = simple_strtoul(val, NULL, 0);
-		DEBUG(2, "blkmtd: ro setup: %d = %d\n", i, ro[i]);
-	}
-
-	return 1;
-}
-
-
 static int __init param_blkmtd_sync(char *str)
 {
 	if(str[0] == '1')
@@ -618,7 +594,6 @@
 
 __setup("blkmtd_device=", param_blkmtd_device);
 __setup("blkmtd_erasesz=", param_blkmtd_erasesz);
-__setup("blkmtd_ro=", param_blkmtd_ro);
 __setup("blkmtd_sync=", param_blkmtd_sync);
 
 #endif
@@ -637,7 +612,7 @@
 	}
 
 	for(i = 0; i < MAX_DEVICES; i++)
-		add_device(device[i], ro[i], erasesz[i] << 10);
+		add_device(device[i], erasesz[i] << 10);
 
 	if(list_empty(&blkmtd_device_list))
 		return -EINVAL;
