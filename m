Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nl6Ue-0007XL-O5
	for linux-mtd@lists.infradead.org; Fri, 26 Feb 2010 20:09:05 +0000
Received: by fg-out-1718.google.com with SMTP id e12so105728fga.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Feb 2010 12:08:58 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Few follow up cleanups for Smartmedia/xD support
Date: Fri, 26 Feb 2010 22:08:40 +0200
Message-Id: <1267214920-4751-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Test results of few functions that were declared with __must_check
* Fix bogus gcc warning about uinitialized variable 'ret'
* Remove unused variable from mtdblock_remove_dev
* Don't use deprecated DMA_32BIT_MASK

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    6 ++++--
 drivers/mtd/mtdblock.c    |    1 -
 drivers/mtd/nand/r852.c   |    6 ++++--
 drivers/mtd/sm_ftl.c      |   17 ++++++++++-------
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 9dd23d6..e32c49c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -380,9 +380,11 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	add_disk(gd);
 
-	if (new->disk_attributes)
-		sysfs_create_group(&disk_to_dev(gd)->kobj,
+	if (new->disk_attributes) {
+		ret = sysfs_create_group(&disk_to_dev(gd)->kobj,
 					new->disk_attributes);
+		WARN_ON(ret);
+	}
 	return 0;
 error4:
 	module_put(tr->owner);
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 7ce30a2..e6edbec 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -354,7 +354,6 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 {
-	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
 	del_mtd_blktrans_dev(dev);
 }
 
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 5c718ff..06824dc 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -654,7 +654,9 @@ int r852_register_nand_device(struct r852_device *dev)
 	if (sm_register_device(dev->mtd))
 		goto error2;
 
-	device_create_file(&dev->mtd->dev, &dev_attr_media_type);
+	if (device_create_file(&dev->mtd->dev, &dev_attr_media_type))
+		message("can't create media type sysfs attribute");
+
 	dev->card_registred = 1;
 	return 0;
 error2:
@@ -838,7 +840,7 @@ int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	pci_set_master(pci_dev);
 
-	error = pci_set_dma_mask(pci_dev, DMA_32BIT_MASK);
+	error = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
 	if (error)
 		goto error2;
 
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index c2a409f..3d63b67 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -228,7 +228,7 @@ static int sm_read_sector(struct sm_ftl *ftl,
 	struct mtd_info *mtd = ftl->trans->mtd;
 	struct mtd_oob_ops ops;
 	struct sm_oob tmp_oob;
-	int ret;
+	int ret = -EIO;
 	int try = 0;
 
 	/* FTL can contain -1 entries that are by default filled with bits */
@@ -753,6 +753,7 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 	u16 block;
 	int lba;
 	int i = 0;
+	int len;
 
 	dbg("initializing zone %d", zone_num);
 
@@ -856,7 +857,9 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 	i %= (kfifo_len(&zone->free_sectors) / 2);
 
 	while (i--) {
-		kfifo_out(&zone->free_sectors, (unsigned char *)&block, 2);
+		len = kfifo_out(&zone->free_sectors,
+					(unsigned char *)&block, 2);
+		WARN_ON(len != 2);
 		kfifo_in(&zone->free_sectors, (const unsigned char *)&block, 2);
 	}
 	return 0;
@@ -947,17 +950,17 @@ restart:
 
 	if (ftl->unstable)
 		return -EIO;
-	/* No spare blocks */
-	/* We could still continue by erasing the current block,
+
+	/* If there are no spare blocks, */
+	/* we could still continue by erasing/writing the current block,
 		but for such worn out media it doesn't worth the trouble,
 			and the dangers */
-
-	if (!kfifo_len(&zone->free_sectors)) {
+	if (kfifo_out(&zone->free_sectors,
+				(unsigned char *)&write_sector, 2) != 2) {
 		dbg("no free sectors for write!");
 		return -EIO;
 	}
 
-	kfifo_out(&zone->free_sectors, (unsigned char *)&write_sector, 2);
 
 	if (sm_write_block(ftl, ftl->cache_data, zone_num, write_sector,
 		ftl->cache_block, ftl->cache_data_invalid_bitmap))
-- 
1.6.3.3
