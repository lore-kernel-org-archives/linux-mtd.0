Received: from verein.lst.de ([212.34.189.10] helo=mail.lst.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19U9cL-0000cW-LV
	for <linux-mtd@lists.infradead.org>; Sun, 22 Jun 2003 19:31:09 +0100
Date: Sun, 22 Jun 2003 20:31:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: dwmw2@infradead.org
Message-ID: <20030622183130.GA5109@lst.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: [PATCH] better prototypes for mtd_blktrans_ops methods
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

->open and ->release lose the totally pointless inode and file
arguments, ->ioctl gets replaced by ->getgeo and ->flush, removing
duplicated code from the individual drivers and avoiding to sneak
more ioctl mess.. :)

Against 2.5-BKCURRENT


--- 1.47/drivers/mtd/ftl.c	Wed May 28 17:01:02 2003
+++ edited/drivers/mtd/ftl.c	Sat Jun 21 20:27:44 2003
@@ -984,21 +984,11 @@
     return 0;
 } /* ftl_write */
 
-/*======================================================================
-
-    IOCTL calls for getting device parameters.
-
-======================================================================*/
-
-static int ftl_ioctl(struct mtd_blktrans_dev *dev, struct inode *inode, 
-		     struct file *file, u_int cmd, u_long arg)
+static int ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
-    struct hd_geometry *geo = (struct hd_geometry *)arg;
-    partition_t *part = (void *)dev;
-    u_long sect;
+	partition_t *part = (void *)dev;
+	u_long sect;
 
-    switch (cmd) {
-    case HDIO_GETGEO:
 	/* Sort of arbitrary: round size down to 4K boundary */
 	sect = le32_to_cpu(part->header.FormattedSize)/SECTOR_SIZE;
 	if (put_user(1, (char *)&geo->heads) ||
@@ -1006,15 +996,8 @@
 	    put_user((sect>>3), (short *)&geo->cylinders) ||
 	    put_user(0, (u_long *)&geo->start))
 		return -EFAULT;
-
-    case BLKFLSBUF:
-	    return 0;
-    }
-    return -ENOTTY;
-} /* ftl_ioctl */
-
-
-/*======================================================================*/
+	return 0;
+}
 
 static int ftl_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
@@ -1102,7 +1085,7 @@
 	.part_bits	= PART_BITS,
 	.readsect	= ftl_readsect,
 	.writesect	= ftl_writesect,
-	.ioctl		= ftl_ioctl,
+	.getgeo		= ftl_getgeo,
 	.add_mtd	= ftl_add_mtd,
 	.remove_dev	= ftl_remove_dev,
 	.owner		= THIS_MODULE,
--- 1.1/drivers/mtd/inftlcore.c	Wed May 28 17:01:11 2003
+++ edited/drivers/mtd/inftlcore.c	Sat Jun 21 20:28:38 2003
@@ -835,35 +835,23 @@
 	return 0;
 }
 
-
-static int inftl_ioctl(struct mtd_blktrans_dev *dev,
-		     struct inode *inode, struct file *file, 
-		     unsigned int cmd, unsigned long arg)
+static int inftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
 	struct NFTLrecord *nftl = (void *)dev;
+	struct hd_geometry g;
 
-	switch (cmd) {
-	case HDIO_GETGEO: {
-		struct hd_geometry g;
-
-		g.heads = nftl->heads;
-		g.sectors = nftl->sectors;
-		g.cylinders = nftl->cylinders;
-		g.start = 0;
-		return copy_to_user((void *)arg, &g, sizeof g) ? -EFAULT : 0;
-	}
-
-	default:
-		return -ENOTTY;
-	}
+	g.heads = nftl->heads;
+	g.sectors = nftl->sectors;
+	g.cylinders = nftl->cylinders;
+	g.start = 0;
+	return copy_to_user(geo, &g, sizeof g) ? -EFAULT : 0;
 }
 
-
 struct mtd_blktrans_ops inftl_tr = {
 	.name		= "inftl",
 	.major		= INFTL_MAJOR,
 	.part_bits	= INFTL_PARTN_BITS,
-	.ioctl		= inftl_ioctl,
+	.getgeo		= inftl_getgeo,
 	.readsect	= inftl_readblock,
 	.writesect	= inftl_writeblock,
 	.add_mtd	= inftl_add_mtd,
--- 1.1/drivers/mtd/mtd_blkdevs.c	Wed May 28 17:01:23 2003
+++ edited/drivers/mtd/mtd_blkdevs.c	Sat Jun 21 20:25:24 2003
@@ -18,6 +18,7 @@
 #include <linux/blk.h>
 #include <linux/blkpg.h>
 #include <linux/spinlock.h>
+#include <linux/hdreg.h>
 #include <linux/init.h>
 #include <asm/semaphore.h>
 #include <linux/devfs_fs_kernel.h>
@@ -159,7 +160,7 @@
 	dev->mtd->usecount++;
 
 	ret = 0;
-	if (tr->open && (ret = tr->open(dev, i, f))) {
+	if (tr->open && (ret = tr->open(dev))) {
 		dev->mtd->usecount--;
 		module_put(dev->mtd->owner);
 	out_tr:
@@ -179,7 +180,7 @@
 	tr = dev->tr;
 
 	if (tr->release)
-		ret = tr->release(dev, i, f);
+		ret = tr->release(dev);
 
 	if (!ret) {
 		dev->mtd->usecount--;
@@ -194,21 +195,22 @@
 static int blktrans_ioctl(struct inode *inode, struct file *file, 
 			      unsigned int cmd, unsigned long arg)
 {
-	struct mtd_blktrans_dev *dev;
-	struct mtd_blktrans_ops *tr;
-	int ret = -ENOTTY;
-
-	dev = inode->i_bdev->bd_disk->private_data;
-	tr = dev->tr;
+	struct mtd_blktrans_dev *dev = inode->i_bdev->bd_disk->private_data;
+	struct mtd_blktrans_ops *tr = dev->tr;
 
-	if (tr->ioctl)
-		ret = tr->ioctl(dev, inode, file, cmd, arg);
-
-	if (ret == -ENOTTY && (cmd == BLKROSET || cmd == BLKFLSBUF)) {
+	switch (cmd) {
+	case BLKFLSBUF:
+		if (tr->flush)
+			return tr->flush(dev);
 		/* The core code did the work, we had nothing to do. */
-		ret = 0;
+		return 0;
+	case HDIO_GETGEO:
+		if (tr->getgeo)
+			return tr->getgeo(dev, (struct hd_geometry *)arg);
+		/*FALLTHROUGH*/
+	default:
+		return -ENOTTY;
 	}
-	return ret;
 }
 
 struct block_device_operations mtd_blktrans_ops = {
--- 1.44/drivers/mtd/mtdblock.c	Wed May 28 17:01:04 2003
+++ edited/drivers/mtd/mtdblock.c	Sat Jun 21 20:24:42 2003
@@ -251,8 +251,7 @@
 	return do_cached_write(mtdblk, block<<9, 512, buf);
 }
 
-static int mtdblock_open(struct mtd_blktrans_dev *mbd, 
-			 struct inode *inode, struct file *file)
+static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 {
 	struct mtdblk_dev *mtdblk;
 	struct mtd_info *mtd = mbd->mtd;
@@ -293,17 +292,13 @@
 	return 0;
 }
 
-static int mtdblock_release(struct mtd_blktrans_dev *mbd,
-				  struct inode *inode, struct file *file)
+static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 {
-	int dev;
-	struct mtdblk_dev *mtdblk;
+	int dev = mbd->devnum;
+	struct mtdblk_dev *mtdblk = mtdblks[dev];
 
    	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
 
-	dev = minor(inode->i_rdev);
-	mtdblk = mtdblks[dev];
-
 	down(&mtdblk->cache_sem);
 	write_cached_data(mtdblk);
 	up(&mtdblk->cache_sem);
@@ -321,27 +316,18 @@
 	return 0;
 }  
 
-
-static int mtdblock_ioctl(struct mtd_blktrans_dev *dev, 
-			  struct inode * inode, struct file * file,
-			  unsigned int cmd, unsigned long arg)
+static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 {
-	struct mtdblk_dev *mtdblk;
-
-	mtdblk = mtdblks[minor(inode->i_rdev)];
+	struct mtd_info *mtd = dev->mtd;
+	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
 
-	switch (cmd) {
-	case BLKFLSBUF:
-		down(&mtdblk->cache_sem);
-		write_cached_data(mtdblk);
-		up(&mtdblk->cache_sem);
-		if (mtdblk->mtd->sync)
-			mtdblk->mtd->sync(mtdblk->mtd);
-		return 0;
+	down(&mtdblk->cache_sem);
+	write_cached_data(mtdblk);
+	up(&mtdblk->cache_sem);
 
-	default:
-		return -ENOTTY;
-	}
+	if (mtdblk->mtd->sync)
+		mtdblk->mtd->sync(mtdblk->mtd);
+	return 0;
 }
 
 static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
@@ -376,7 +362,7 @@
 	.major		= 31,
 	.part_bits	= 0,
 	.open		= mtdblock_open,
-	.ioctl		= mtdblock_ioctl,
+	.flush		= mtdblock_flush,
 	.release	= mtdblock_release,
 	.readsect	= mtdblock_readsect,
 	.writesect	= mtdblock_writesect,
--- 1.27/drivers/mtd/mtdblock_ro.c	Wed May 28 17:01:05 2003
+++ edited/drivers/mtd/mtdblock_ro.c	Sat Jun 21 20:26:45 2003
@@ -6,6 +6,7 @@
  * Simple read-only (writable only for RAM) mtdblock driver
  */
 
+#include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/blktrans.h>
--- 1.44/drivers/mtd/nftlcore.c	Wed May 28 17:01:05 2003
+++ edited/drivers/mtd/nftlcore.c	Sat Jun 21 20:29:25 2003
@@ -699,29 +699,19 @@
 	return 0;
 }
 
-static int nftl_ioctl(struct mtd_blktrans_dev *dev,
-		     struct inode * inode, struct file * file, 
-		     unsigned int cmd, unsigned long arg)
+static int nftl_getgeo(struct mtd_blktrans_dev *dev,  struct hd_geometry *geo)
 {
 	struct NFTLrecord *nftl = (void *)dev;
+	struct hd_geometry g;
 
-	switch (cmd) {
-	case HDIO_GETGEO: {
-		struct hd_geometry g;
+	g.heads = nftl->heads;
+	g.sectors = nftl->sectors;
+	g.cylinders = nftl->cylinders;
+	g.start = 0;
 
-		g.heads = nftl->heads;
-		g.sectors = nftl->sectors;
-		g.cylinders = nftl->cylinders;
-		g.start = 0;
-		return copy_to_user((void *)arg, &g, sizeof g) ? -EFAULT : 0;
-	}
-
-	default:
-		return -ENOTTY;
-	}
+	return copy_to_user(geo, &g, sizeof g) ? -EFAULT : 0;
 }
 
-
 /****************************************************************************
  *
  * Module stuff
@@ -733,7 +723,7 @@
 	.name		= "nftl",
 	.major		= NFTL_MAJOR,
 	.part_bits	= NFTL_PARTN_BITS,
-	.ioctl		= nftl_ioctl,
+	.getgeo		= nftl_getgeo,
 	.readsect	= nftl_readblock,
 #ifdef CONFIG_NFTL_RW
 	.writesect	= nftl_writeblock,
--- 1.1/include/linux/mtd/blktrans.h	Wed May 28 17:01:26 2003
+++ edited/include/linux/mtd/blktrans.h	Sat Jun 21 20:21:46 2003
@@ -12,6 +12,7 @@
 
 #include <asm/semaphore.h>
 
+struct hd_geometry;
 struct mtd_info;
 struct mtd_blktrans_ops;
 struct file;
@@ -42,17 +43,13 @@
 	int (*writesect)(struct mtd_blktrans_dev *dev,
 		     unsigned long block, char *buffer);
 
-	/* HDIO_GETGEO and HDIO_GETGEO_BIG are the only non-private
-	   ioctls which are expected to be passed through */
-	int (*ioctl)(struct mtd_blktrans_dev *dev,
-		     struct inode * inode, struct file * file, 
-		     unsigned int cmd, unsigned long arg);
+	/* Block layer ioctls */
+	int (*getgeo)(struct mtd_blktrans_dev *dev, struct hd_geometry *geo);
+	int (*flush)(struct mtd_blktrans_dev *dev);
 
 	/* Called with mtd_table_mutex held; no race with add/remove */
-	int (*open)(struct mtd_blktrans_dev *dev, 
-		 struct inode *i, struct file *f);
-	int (*release)(struct mtd_blktrans_dev *dev,
-		    struct inode *i, struct file *f);
+	int (*open)(struct mtd_blktrans_dev *dev);
+	int (*release)(struct mtd_blktrans_dev *dev);
 
 	/* Called on {de,}registration and on subsequent addition/removal
 	   of devices, with mtd_table_mutex held. */
