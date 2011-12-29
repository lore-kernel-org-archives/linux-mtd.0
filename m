Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFX-0004Rf-8V
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:12 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 20/27] mtd: introduce mtd_lock interface
Date: Thu, 29 Dec 2011 11:27:24 +0200
Message-Id: <1325150851-2805-21-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/maps/scb2_flash.c |    2 +-
 drivers/mtd/mtdchar.c         |    2 +-
 drivers/mtd/mtdconcat.c       |    2 +-
 drivers/mtd/mtdpart.c         |    2 +-
 include/linux/mtd/mtd.h       |    9 +++++++--
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index d88c842..01af347 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -205,7 +205,7 @@ scb2_flash_remove(struct pci_dev *dev)
 
 	/* disable flash writes */
 	if (scb2_mtd->lock)
-		scb2_mtd->lock(scb2_mtd, 0, scb2_mtd->size);
+		mtd_lock(scb2_mtd, 0, scb2_mtd->size);
 
 	mtd_device_unregister(scb2_mtd);
 	map_destroy(scb2_mtd);
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a96a353..ae03197 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -824,7 +824,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!mtd->lock)
 			ret = -EOPNOTSUPP;
 		else
-			ret = mtd->lock(mtd, einfo.start, einfo.length);
+			ret = mtd_lock(mtd, einfo.start, einfo.length);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index cc2336e..97d6360 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -556,7 +556,7 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			size = len;
 
 		if (subdev->lock) {
-			err = subdev->lock(subdev, ofs, size);
+			err = mtd_lock(subdev, ofs, size);
 			if (err)
 				break;
 		} else
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2b54505..a5e7a21 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -279,7 +279,7 @@ static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
 		return -EINVAL;
-	return part->master->lock(part->master, ofs + part->offset, len);
+	return mtd_lock(part->master, ofs + part->offset, len);
 }
 
 static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 47ea19c..167bac2e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -207,14 +207,13 @@ struct mtd_info {
 	int (*writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*sync) (struct mtd_info *mtd);
+	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/* Chip-supported device locking */
-	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
@@ -384,6 +383,12 @@ static inline void mtd_sync(struct mtd_info *mtd)
 	mtd->sync(mtd);
 }
 
+/* Chip-supported device locking */
+static inline int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return mtd->lock(mtd, ofs, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
