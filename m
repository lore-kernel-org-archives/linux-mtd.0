Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFb-0004RG-Ob
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:20 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 24/27] mtd: introduce mtd_resume interface
Date: Thu, 29 Dec 2011 11:27:28 +0200
Message-Id: <1325150851-2805-25-git-send-email-dedekind1@gmail.com>
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
 include/linux/mtd/mtd.h           |    9 ++++++---
 11 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index b7f0cd1..d94cc62 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -192,7 +192,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
 		if (info->mtd[i]->suspend && info->mtd[i]->resume)
 			if (mtd_suspend(info->mtd[i]) == 0)
-				info->mtd[i]->resume(info->mtd[i]);
+				mtd_resume(info->mtd[i]);
 }
 #else
 #define physmap_flash_shutdown NULL
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 9cb4273..436d121 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -126,7 +126,7 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
 
 	if (info && mtd_suspend(info->mtd) == 0)
-		info->mtd->resume(info->mtd);
+		mtd_resume(info->mtd);
 }
 #else
 #define pxa2xx_flash_shutdown NULL
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 5856aa2..7176283 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -121,7 +121,7 @@ static void rbtx4939_flash_shutdown(struct platform_device *dev)
 
 	if (info->mtd->suspend && info->mtd->resume)
 		if (mtd_suspend(info->mtd) == 0)
-			info->mtd->resume(info->mtd);
+			mtd_resume(info->mtd);
 }
 #else
 #define rbtx4939_flash_shutdown NULL
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 20944f0..5028219 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -378,7 +378,7 @@ static void sa1100_mtd_shutdown(struct platform_device *dev)
 {
 	struct sa_info *info = platform_get_drvdata(dev);
 	if (info && mtd_suspend(info->mtd) == 0)
-		info->mtd->resume(info->mtd);
+		mtd_resume(info->mtd);
 }
 #else
 #define sa1100_mtd_shutdown NULL
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 36bb1c9..4b7f825 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -644,7 +644,7 @@ static void concat_resume(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		subdev->resume(subdev);
+		mtd_resume(subdev);
 	}
 }
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0db455d..376fbfd 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -129,7 +129,7 @@ static int mtd_cls_resume(struct device *dev)
 	struct mtd_info *mtd = dev_to_mtd(dev);
 	
 	if (mtd && mtd->resume)
-		mtd->resume(mtd);
+		mtd_resume(mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c5e556a..8610750 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -313,7 +313,7 @@ static int part_suspend(struct mtd_info *mtd)
 static void part_resume(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	part->master->resume(part->master);
+	mtd_resume(part->master);
 }
 
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
index 9461bab..a86aa81 100644
--- a/drivers/mtd/nand/nomadik_nand.c
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -209,7 +209,7 @@ static int nomadik_nand_resume(struct device *dev)
 {
 	struct nomadik_nand_host *host = dev_get_drvdata(dev);
 	if (host)
-		host->mtd.resume(&host->mtd);
+		mtd_resume(&host->mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 7a028cf..8544d6b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1291,7 +1291,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 	nand_writel(info, NDSR, NDSR_MASK);
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		mtd = info->host[cs]->mtd;
-		mtd->resume(mtd);
+		mtd_resume(mtd);
 	}
 
 	return 0;
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 5d0c7fb..a031c3f 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -515,7 +515,7 @@ static int tmio_resume(struct platform_device *dev)
 	tmio_hw_init(dev, platform_get_drvdata(dev));
 
 	if (cell->resume)
-		cell->resume(dev);
+		mtd_resume(dev);
 
 	return 0;
 }
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8e01bad..d6b4aa1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -211,15 +211,13 @@ struct mtd_info {
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*suspend) (struct mtd_info *mtd);
+	void (*resume) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/* Power Management functions */
-	void (*resume) (struct mtd_info *mtd);
-
 	/* Bad block management functions */
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
@@ -403,6 +401,11 @@ static inline int mtd_suspend(struct mtd_info *mtd)
 	return mtd->suspend(mtd);
 }
 
+static inline void mtd_resume(struct mtd_info *mtd)
+{
+	mtd->resume(mtd);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
