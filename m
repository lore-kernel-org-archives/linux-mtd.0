Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFa-0004RA-Ad
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:17 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 23/27] mtd: introduce mtd_suspend interface
Date: Thu, 29 Dec 2011 11:27:27 +0200
Message-Id: <1325150851-2805-24-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/maps/physmap.c        |    2 +-
 drivers/mtd/maps/pxa2xx-flash.c   |    2 +-
 drivers/mtd/maps/rbtx4939-flash.c |    2 +-
 drivers/mtd/maps/sa1100-flash.c   |    2 +-
 drivers/mtd/mtdconcat.c           |    2 +-
 drivers/mtd/mtdcore.c             |    2 +-
 drivers/mtd/mtdpart.c             |    2 +-
 drivers/mtd/nand/nomadik_nand.c   |    2 +-
 drivers/mtd/nand/pxa3xx_nand.c    |    2 +-
 drivers/mtd/nand/tmio_nand.c      |    2 +-
 include/linux/mtd/mtd.h           |    7 ++++++-
 11 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 1f749d58..b7f0cd1 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -191,7 +191,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
 		if (info->mtd[i]->suspend && info->mtd[i]->resume)
-			if (info->mtd[i]->suspend(info->mtd[i]) == 0)
+			if (mtd_suspend(info->mtd[i]) == 0)
 				info->mtd[i]->resume(info->mtd[i]);
 }
 #else
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 274e399..9cb4273 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -125,7 +125,7 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
 
-	if (info && info->mtd->suspend(info->mtd) == 0)
+	if (info && mtd_suspend(info->mtd) == 0)
 		info->mtd->resume(info->mtd);
 }
 #else
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index bb7d204..5856aa2 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -120,7 +120,7 @@ static void rbtx4939_flash_shutdown(struct platform_device *dev)
 	struct rbtx4939_flash_info *info = platform_get_drvdata(dev);
 
 	if (info->mtd->suspend && info->mtd->resume)
-		if (info->mtd->suspend(info->mtd) == 0)
+		if (mtd_suspend(info->mtd) == 0)
 			info->mtd->resume(info->mtd);
 }
 #else
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index ac3a290..20944f0 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -377,7 +377,7 @@ static int __exit sa1100_mtd_remove(struct platform_device *pdev)
 static void sa1100_mtd_shutdown(struct platform_device *dev)
 {
 	struct sa_info *info = platform_get_drvdata(dev);
-	if (info && info->mtd->suspend(info->mtd) == 0)
+	if (info && mtd_suspend(info->mtd) == 0)
 		info->mtd->resume(info->mtd);
 }
 #else
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 272ebc0..36bb1c9 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -631,7 +631,7 @@ static int concat_suspend(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		if ((rc = subdev->suspend(subdev)) < 0)
+		if ((rc = mtd_suspend(subdev)) < 0)
 			return rc;
 	}
 	return rc;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 4a21557..0db455d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -119,7 +119,7 @@ static int mtd_cls_suspend(struct device *dev, pm_message_t state)
 	struct mtd_info *mtd = dev_to_mtd(dev);
 
 	if (mtd && mtd->suspend)
-		return mtd->suspend(mtd);
+		return mtd_suspend(mtd);
 	else
 		return 0;
 }
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ad487fc..c5e556a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -307,7 +307,7 @@ static void part_sync(struct mtd_info *mtd)
 static int part_suspend(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->suspend(part->master);
+	return mtd_suspend(part->master);
 }
 
 static void part_resume(struct mtd_info *mtd)
diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
index 673dc6c..9461bab 100644
--- a/drivers/mtd/nand/nomadik_nand.c
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -201,7 +201,7 @@ static int nomadik_nand_suspend(struct device *dev)
 	struct nomadik_nand_host *host = dev_get_drvdata(dev);
 	int ret = 0;
 	if (host)
-		ret = host->mtd.suspend(&host->mtd);
+		ret = mtd_suspend(&host->mtd);
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 90d6016..7a028cf 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1258,7 +1258,7 @@ static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
 
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		mtd = info->host[cs]->mtd;
-		mtd->suspend(mtd);
+		mtd_suspend(mtd);
 	}
 
 	return 0;
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 6caa0cd..5d0c7fb 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -499,7 +499,7 @@ static int tmio_suspend(struct platform_device *dev, pm_message_t state)
 	const struct mfd_cell *cell = mfd_get_cell(dev);
 
 	if (cell->suspend)
-		cell->suspend(dev);
+		mtd_suspend(dev);
 
 	tmio_hw_stop(dev, platform_get_drvdata(dev));
 	return 0;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8b99019..8e01bad 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -210,6 +210,7 @@ struct mtd_info {
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*suspend) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -217,7 +218,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 	/* Power Management functions */
-	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
 
 	/* Bad block management functions */
@@ -398,6 +398,11 @@ static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return mtd->is_locked(mtd, ofs, len);
 }
 
+static inline int mtd_suspend(struct mtd_info *mtd)
+{
+	return mtd->suspend(mtd);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
