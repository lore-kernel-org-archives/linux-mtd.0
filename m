Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkZp-0000Y5-BH
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:01:27 -0500
Date: Tue, 21 Dec 2004 15:01:02 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140102.GT22636@wohnheim.fh-wedel.de>
References: <20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221135705.GS22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/22] Change add_device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

o Remove the last remaining #ifdef.
o s/mtd_info/mtd/ makes nicer reading.
o General cleanup to add_device

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   86 ++++++++++++++++++++++++++-----------------------------------
 1 files changed, 37 insertions(+), 49 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_ifdef	2004-12-20 22:21:50.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:38:34.000000000 +0100
@@ -45,7 +45,7 @@
 struct blkmtd_dev {
 	struct list_head list;
 	struct block_device *blkdev;
-	struct mtd_info mtd_info;
+	struct mtd_info mtd;
 	struct semaphore wrbuf_mutex;
 };
 
@@ -349,8 +349,8 @@
 	if (!dev)
 		return;
 
-	kfree(dev->mtd_info.eraseregions);
-	kfree(dev->mtd_info.name);
+	kfree(dev->mtd.eraseregions);
+	kfree(dev->mtd.name);
 
 	if (dev->blkdev) {
 		invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
@@ -361,78 +361,66 @@
 }
 
 
-extern dev_t __init name_to_dev_t(const char *line);
-
 static struct blkmtd_dev *add_device(char *devname, int erase_size)
 {
 	struct block_device *bdev;
-	int mode;
 	struct blkmtd_dev *dev;
 
 	if (!devname)
 		return NULL;
 
-	/* Get a handle on the device */
+	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
+	if (!dev)
+		return NULL;
+	memset(dev, 0, sizeof(*dev));
 
-#ifdef MODULE
-	mode = O_RDWR;
-	bdev = open_bdev_excl(devname, mode, NULL);
-#else
-	mode = FMODE_WRITE;
-	bdev = open_by_devnum(name_to_dev_t(devname), mode);
-#endif
+	/* Get a handle on the device */
+	bdev = open_bdev_excl(devname, O_RDWR, NULL);
 	if (IS_ERR(bdev)) {
 		ERROR("error: cannot open device %s", devname);
-		return NULL;
+		goto devinit_err;
 	}
+	dev->blkdev = bdev;
 
 	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
 		ERROR("attempting to use an MTD device as a block device");
-		blkdev_put(bdev);
-		return NULL;
-	}
-
-	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
-	if (dev == NULL) {
-		blkdev_put(bdev);
-		return NULL;
+		goto devinit_err;
 	}
 
-	memset(dev, 0, sizeof(struct blkmtd_dev));
-	dev->blkdev = bdev;
-	atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
+	atomic_set(&bdev->bd_inode->i_mapping->truncate_count, 0);
 	init_MUTEX(&dev->wrbuf_mutex);
 
-	dev->mtd_info.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
-
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
-	dev->mtd_info.name = kmalloc(sizeof("blkmtd: ") + strlen(devname), GFP_KERNEL);
-	if (dev->mtd_info.name == NULL)
+	dev->mtd.name = kmalloc(sizeof("blockmtd: ") + strlen(devname),
+			GFP_KERNEL);
+	if (!dev->mtd.name)
 		goto devinit_err;
 
-	sprintf(dev->mtd_info.name, "blkmtd: %s", devname);
+	sprintf(dev->mtd.name, "blockmtd: %s", devname);
 
-	dev->mtd_info.erasesize = erase_size;
-	dev->mtd_info.type = MTD_RAM;
-	dev->mtd_info.flags = MTD_CAP_RAM;
-	dev->mtd_info.erase = blkmtd_erase;
-	dev->mtd_info.write = blkmtd_write;
-	dev->mtd_info.writev = default_mtd_writev;
-	dev->mtd_info.sync = blockmtd_sync;
-	dev->mtd_info.read = blkmtd_read;
-	dev->mtd_info.readv = default_mtd_readv;
-	dev->mtd_info.priv = dev;
-	dev->mtd_info.owner = THIS_MODULE;
+	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.erasesize = erase_size;
+	dev->mtd.type = MTD_RAM;
+	dev->mtd.flags = MTD_CAP_RAM;
+	dev->mtd.erase = blkmtd_erase;
+	dev->mtd.write = blkmtd_write;
+	dev->mtd.writev = default_mtd_writev;
+	dev->mtd.sync = blockmtd_sync;
+	dev->mtd.read = blkmtd_read;
+	dev->mtd.readv = default_mtd_readv;
+	dev->mtd.priv = dev;
+	dev->mtd.owner = THIS_MODULE;
 
 	list_add(&dev->list, &blkmtd_device_list);
-	if (add_mtd_device(&dev->mtd_info)) {
+	if (add_mtd_device(&dev->mtd)) {
 		/* Device didnt get added, so free the entry */
 		list_del(&dev->list);
 		goto devinit_err;
-	} else {
-		INFO("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "), dev->mtd_info.erasesize >> 10, PAGE_SIZE);
 	}
+	INFO("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd.index,
+			dev->mtd.name + strlen("blkmtd: "),
+			dev->mtd.erasesize >> 10, PAGE_SIZE);
 	return dev;
 
 devinit_err:
@@ -564,10 +552,10 @@
 	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
 		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
 						    list);
-		blockmtd_sync(&dev->mtd_info);
-		del_mtd_device(&dev->mtd_info);
-		INFO("mtd%d: [%s] removed", dev->mtd_info.index,
-				dev->mtd_info.name + strlen("blkmtd: "));
+		blockmtd_sync(&dev->mtd);
+		del_mtd_device(&dev->mtd);
+		INFO("mtd%d: [%s] removed", dev->mtd.index,
+				dev->mtd.name + strlen("blkmtd: "));
 		list_del(&dev->list);
 		blockmtd_free_device(dev);
 	}
