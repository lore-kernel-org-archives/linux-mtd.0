Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdMml-0006bu-BR
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 04:09:56 -0400
Subject: [PATCH] Allow variable block sizes in mtd_blkdevs
From: Richard Purdie <rpurdie@openedhand.com>
To: Linux mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Fri, 27 Oct 2006 09:09:33 +0100
Message-Id: <1161936573.5019.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, mtd_blkdevs enforces a block size of 512, even if the drivers
can seemingly request a different size. This patch fixes mtd_blkdevs so
block sizes other than 512 work correctly.

Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

---
 drivers/mtd/ftl.c            |    3 ++-
 drivers/mtd/inftlcore.c      |    3 ++-
 drivers/mtd/mtd_blkdevs.c    |   15 +++++++++------
 drivers/mtd/mtdblock.c       |    3 ++-
 drivers/mtd/mtdblock_ro.c    |    3 ++-
 drivers/mtd/nftlcore.c       |    3 ++-
 drivers/mtd/rfd_ftl.c        |    3 ++-
 include/linux/mtd/blktrans.h |    3 ++-
 8 files changed, 23 insertions(+), 13 deletions(-)

Index: linux-2.6.19-rc3/drivers/mtd/mtd_blkdevs.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/mtd_blkdevs.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/mtd_blkdevs.c	2006-10-26 13:50:30.000000000 +0100
@@ -42,19 +42,20 @@ static int do_blktrans_request(struct mt
 	unsigned long block, nsect;
 	char *buf;
 
-	block = req->sector;
-	nsect = req->current_nr_sectors;
+	block = req->sector << 9 >> tr->blkshift;
+	nsect = req->current_nr_sectors << 9 >> tr->blkshift;
+
 	buf = req->buffer;
 
 	if (!blk_fs_request(req))
 		return 0;
 
-	if (block + nsect > get_capacity(req->rq_disk))
+	if (req->sector + req->current_nr_sectors > get_capacity(req->rq_disk))
 		return 0;
 
 	switch(rq_data_dir(req)) {
 	case READ:
-		for (; nsect > 0; nsect--, block++, buf += 512)
+		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
 			if (tr->readsect(dev, block, buf))
 				return 0;
 		return 1;
@@ -63,7 +64,7 @@ static int do_blktrans_request(struct mt
 		if (!tr->writesect)
 			return 0;
 
-		for (; nsect > 0; nsect--, block++, buf += 512)
+		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
 			if (tr->writesect(dev, block, buf))
 				return 0;
 		return 1;
@@ -297,7 +298,7 @@ int add_mtd_blktrans_dev(struct mtd_blkt
 
 	/* 2.5 has capacity in units of 512 bytes while still
 	   having BLOCK_SIZE_BITS set to 10. Just to keep us amused. */
-	set_capacity(gd, (new->size * new->blksize) >> 9);
+	set_capacity(gd, (new->size * tr->blksize) >> 9);
 
 	gd->private_data = new;
 	new->blkcore_priv = gd;
@@ -401,6 +402,8 @@ int register_mtd_blktrans(struct mtd_blk
 	}
 
 	tr->blkcore_priv->rq->queuedata = tr;
+	blk_queue_hardsect_size(tr->blkcore_priv->rq, tr->blksize);
+	tr->blkshift = ffs(tr->blksize) - 1;
 
 	ret = kernel_thread(mtd_blktrans_thread, tr, CLONE_KERNEL);
 	if (ret < 0) {
Index: linux-2.6.19-rc3/drivers/mtd/ftl.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/ftl.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/ftl.c	2006-10-26 13:50:30.000000000 +0100
@@ -1054,7 +1054,7 @@ static void ftl_add_mtd(struct mtd_blktr
 		       le32_to_cpu(partition->header.FormattedSize) >> 10);
 #endif
 		partition->mbd.size = le32_to_cpu(partition->header.FormattedSize) >> 9;
-		partition->mbd.blksize = SECTOR_SIZE;
+
 		partition->mbd.tr = tr;
 		partition->mbd.devnum = -1;
 		if (!add_mtd_blktrans_dev((void *)partition))
@@ -1076,6 +1076,7 @@ struct mtd_blktrans_ops ftl_tr = {
 	.name		= "ftl",
 	.major		= FTL_MAJOR,
 	.part_bits	= PART_BITS,
+	.blksize 	= SECTOR_SIZE,
 	.readsect	= ftl_readsect,
 	.writesect	= ftl_writesect,
 	.getgeo		= ftl_getgeo,
Index: linux-2.6.19-rc3/drivers/mtd/inftlcore.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/inftlcore.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/inftlcore.c	2006-10-26 13:50:30.000000000 +0100
@@ -77,7 +77,7 @@ static void inftl_add_mtd(struct mtd_blk
 
 	inftl->mbd.mtd = mtd;
 	inftl->mbd.devnum = -1;
-	inftl->mbd.blksize = 512;
+
 	inftl->mbd.tr = tr;
 
 	if (INFTL_mount(inftl) < 0) {
@@ -945,6 +945,7 @@ static struct mtd_blktrans_ops inftl_tr 
 	.name		= "inftl",
 	.major		= INFTL_MAJOR,
 	.part_bits	= INFTL_PARTN_BITS,
+	.blksize 	= 512,
 	.getgeo		= inftl_getgeo,
 	.readsect	= inftl_readblock,
 	.writesect	= inftl_writeblock,
Index: linux-2.6.19-rc3/drivers/mtd/mtdblock.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/mtdblock.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/mtdblock.c	2006-10-26 13:50:30.000000000 +0100
@@ -348,7 +348,7 @@ static void mtdblock_add_mtd(struct mtd_
 
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
-	dev->blksize = 512;
+
 	dev->size = mtd->size >> 9;
 	dev->tr = tr;
 
@@ -368,6 +368,7 @@ static struct mtd_blktrans_ops mtdblock_
 	.name		= "mtdblock",
 	.major		= 31,
 	.part_bits	= 0,
+	.blksize 	= 512,
 	.open		= mtdblock_open,
 	.flush		= mtdblock_flush,
 	.release	= mtdblock_release,
Index: linux-2.6.19-rc3/drivers/mtd/mtdblock_ro.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/mtdblock_ro.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/mtdblock_ro.c	2006-10-26 13:50:30.000000000 +0100
@@ -42,7 +42,7 @@ static void mtdblock_add_mtd(struct mtd_
 
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
-	dev->blksize = 512;
+
 	dev->size = mtd->size >> 9;
 	dev->tr = tr;
 	dev->readonly = 1;
@@ -60,6 +60,7 @@ static struct mtd_blktrans_ops mtdblock_
 	.name		= "mtdblock",
 	.major		= 31,
 	.part_bits	= 0,
+	.blksize 	= 512,
 	.readsect	= mtdblock_readsect,
 	.writesect	= mtdblock_writesect,
 	.add_mtd	= mtdblock_add_mtd,
Index: linux-2.6.19-rc3/drivers/mtd/nftlcore.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/nftlcore.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/nftlcore.c	2006-10-26 13:50:30.000000000 +0100
@@ -67,7 +67,7 @@ static void nftl_add_mtd(struct mtd_blkt
 
 	nftl->mbd.mtd = mtd;
 	nftl->mbd.devnum = -1;
-	nftl->mbd.blksize = 512;
+
 	nftl->mbd.tr = tr;
 
         if (NFTL_mount(nftl) < 0) {
@@ -797,6 +797,7 @@ static struct mtd_blktrans_ops nftl_tr =
 	.name		= "nftl",
 	.major		= NFTL_MAJOR,
 	.part_bits	= NFTL_PARTN_BITS,
+	.blksize 	= 512,
 	.getgeo		= nftl_getgeo,
 	.readsect	= nftl_readblock,
 #ifdef CONFIG_NFTL_RW
Index: linux-2.6.19-rc3/drivers/mtd/rfd_ftl.c
===================================================================
--- linux-2.6.19-rc3.orig/drivers/mtd/rfd_ftl.c	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/drivers/mtd/rfd_ftl.c	2006-10-26 13:50:30.000000000 +0100
@@ -787,7 +787,6 @@ static void rfd_ftl_add_mtd(struct mtd_b
 
 	if (scan_header(part) == 0) {
 		part->mbd.size = part->sector_count;
-		part->mbd.blksize = SECTOR_SIZE;
 		part->mbd.tr = tr;
 		part->mbd.devnum = -1;
 		if (!(mtd->flags & MTD_WRITEABLE))
@@ -829,6 +828,8 @@ struct mtd_blktrans_ops rfd_ftl_tr = {
 	.name		= "rfd",
 	.major		= RFD_FTL_MAJOR,
 	.part_bits	= PART_BITS,
+	.blksize 	= SECTOR_SIZE,
+
 	.readsect	= rfd_ftl_readsect,
 	.writesect	= rfd_ftl_writesect,
 	.getgeo		= rfd_ftl_getgeo,
Index: linux-2.6.19-rc3/include/linux/mtd/blktrans.h
===================================================================
--- linux-2.6.19-rc3.orig/include/linux/mtd/blktrans.h	2006-10-26 13:49:41.000000000 +0100
+++ linux-2.6.19-rc3/include/linux/mtd/blktrans.h	2006-10-26 13:50:30.000000000 +0100
@@ -24,7 +24,6 @@ struct mtd_blktrans_dev {
 	struct mtd_info *mtd;
 	struct mutex lock;
 	int devnum;
-	int blksize;
 	unsigned long size;
 	int readonly;
 	void *blkcore_priv; /* gendisk in 2.5, devfs_handle in 2.4 */
@@ -36,6 +35,8 @@ struct mtd_blktrans_ops {
 	char *name;
 	int major;
 	int part_bits;
+	int blksize;
+	int blkshift;
 
 	/* Access functions */
 	int (*readsect)(struct mtd_blktrans_dev *dev,
