Received: from atlantis.8hz.com ([212.129.237.78])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrLFD-0001c3-AA
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 23:30:03 +0000
Date: Sat, 18 Oct 2008 23:12:29 +0000
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Implement discard in RFD FTL
Message-ID: <20081018231228.GA86325@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that discard is supported implement it in RFD FTL. Stop writing to
flash once an error has been detected and various other cleanups.

Signed-off-by: Sean Young <sean@mess.org>
-- 
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index e538c0a..724a0d1 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -1,7 +1,7 @@
 /*
  * rfd_ftl.c -- resident flash disk (flash translation layer)
  *
- * Copyright (C) 2005  Sean Young <sean@mess.org>
+ * Copyright (C) 2005, 2008  Sean Young <sean@mess.org>
  *
  * This type of flash translation layer (FTL) is used by the Embedded BIOS
  * by General Software. It is known as the Resident Flash Disk (RFD), see:
@@ -241,7 +241,7 @@ err:
 
 static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	u_long addr;
 	size_t retlen;
 	int rc;
@@ -293,6 +293,7 @@ static void erase_callback(struct erase_info *erase)
 		part->blocks[i].used_sectors = 0;
 
 		kfree(erase);
+		part->errors++;
 
 		return;
 	}
@@ -317,6 +318,7 @@ static void erase_callback(struct erase_info *erase)
 				part->mbd.mtd->name,
 				part->blocks[i].offset);
 		part->blocks[i].state = BLOCK_FAILED;
+		part->errors++;
 	}
 	else
 		part->blocks[i].state = BLOCK_OK;
@@ -349,6 +351,7 @@ static int erase_block(struct partition *part, int block)
 				"failed\n", erase->addr, erase->len,
 				part->mbd.mtd->name);
 		kfree(erase);
+		part->errors++;
 	}
 
 err:
@@ -383,7 +386,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 		printk(KERN_ERR PREFIX "error reading '%s' at "
 			"0x%lx\n", part->mbd.mtd->name,
 			part->blocks[block_no].offset);
-
+		part->errors++;
 		goto err;
 	}
 
@@ -423,7 +426,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 			printk(KERN_ERR PREFIX "'%s': Unable to "
 				"read sector for relocation\n",
 				part->mbd.mtd->name);
-
+			part->errors++;
 			goto err;
 		}
 
@@ -604,9 +607,10 @@ static int mark_sector_deleted(struct partition *part, u_long old_addr)
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at "
 			"0x%lx\n", part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		part->errors++;
+		goto err;
 	}
+
 	if (block == part->current_block)
 		part->header_cache[offset + HEADER_MAP_OFFSET] = del;
 
@@ -639,9 +643,9 @@ static int find_free_sector(const struct partition *part, const struct block *bl
 	return -1;
 }
 
-static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf, ulong *old_addr)
+static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf, u_long *old_addr)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	struct block *block;
 	u_long addr;
 	int i;
@@ -677,8 +681,8 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		part->errors++;
+		goto err;
 	}
 
 	part->sector_map[sector] = addr;
@@ -697,8 +701,8 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		part->errors++;
+		goto err;
 	}
 	block->used_sectors++;
 	block->free_sectors--;
@@ -709,14 +713,14 @@ err:
 
 static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	u_long old_addr;
 	int i;
 	int rc = 0;
 
 	pr_debug("rfd_ftl_writesect(sector=0x%lx)\n", sector);
 
-	if (part->reserved_block == -1) {
+	if (part->reserved_block == -1 || part->errors) {
 		rc = -EACCES;
 		goto err;
 	}
@@ -750,7 +754,7 @@ err:
 
 static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 
 	geo->heads = 1;
 	geo->sectors = SECTORS_PER_TRACK;
@@ -759,6 +763,30 @@ static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 	return 0;
 }
 
+static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev, u_long sector, 
+								uint nr_sects)
+{
+	struct partition *part = container_of(dev, struct partition, mbd);
+	u_long addr;
+	int rc;
+
+	if (part->errors)
+		return -EACCES;
+
+	for (rc = 0; nr_sects && rc == 0; sector++, nr_sects--) {
+		if (sector >= part->sector_count)
+			return -EIO;
+
+		addr = part->sector_map[sector];
+		part->sector_map[sector] = -1;
+
+		if (addr != -1)
+			rc = mark_sector_deleted(part, addr);
+	}
+
+	return rc;
+}
+
 static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	struct partition *part;
@@ -806,7 +834,7 @@ out:
 
 static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	int i;
 
 	for (i=0; i<part->total_blocks; i++) {
@@ -829,6 +857,7 @@ static struct mtd_blktrans_ops rfd_ftl_tr = {
 
 	.readsect	= rfd_ftl_readsect,
 	.writesect	= rfd_ftl_writesect,
+	.discard	= rfd_ftl_discardsect,
 	.getgeo		= rfd_ftl_getgeo,
 	.add_mtd	= rfd_ftl_add_mtd,
 	.remove_dev	= rfd_ftl_remove_dev,
