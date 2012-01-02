Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqw-0003V8-It
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:19:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/17] mtd: do not use mtd->suspend and mtd->resume directly
Date: Mon,  2 Jan 2012 14:20:44 +0200
Message-Id: <1325506847-23470-15-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Just call the 'mtd_suspend()' and 'mtd_resume()' - they will do nothing
if the operation is not defined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/maps/physmap.c        |    5 ++---
 drivers/mtd/maps/rbtx4939-flash.c |    5 ++---
 drivers/mtd/mtdcore.c             |    5 +----
 include/linux/mtd/mtd.h           |    5 ++++-
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d94cc62..abc5626 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -190,9 +190,8 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (info->mtd[i]->suspend && info->mtd[i]->resume)
-			if (mtd_suspend(info->mtd[i]) == 0)
-				mtd_resume(info->mtd[i]);
+		if (mtd_suspend(info->mtd[i]) == 0)
+			mtd_resume(info->mtd[i]);
 }
 #else
 #define physmap_flash_shutdown NULL
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 7176283..3da63fc 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -119,9 +119,8 @@ static void rbtx4939_flash_shutdown(struct platform_device *dev)
 {
 	struct rbtx4939_flash_info *info = platform_get_drvdata(dev);
 
-	if (info->mtd->suspend && info->mtd->resume)
-		if (mtd_suspend(info->mtd) == 0)
-			mtd_resume(info->mtd);
+	if (mtd_suspend(info->mtd) == 0)
+		mtd_resume(info->mtd);
 }
 #else
 #define rbtx4939_flash_shutdown NULL
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66494ee..6ae9ca0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -119,10 +119,7 @@ static int mtd_cls_suspend(struct device *dev, pm_message_t state)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	if (mtd && mtd->suspend)
-		return mtd_suspend(mtd);
-	else
-		return 0;
+	return mtd_suspend(mtd);
 }
 
 static int mtd_cls_resume(struct device *dev)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 6c91ba5..0893707 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -427,12 +427,15 @@ static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
+	if (!mtd->suspend)
+		return -EOPNOTSUPP;
 	return mtd->suspend(mtd);
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
 {
-	mtd->resume(mtd);
+	if (mtd->resume)
+		mtd->resume(mtd);
 }
 
 static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
-- 
1.7.7.3
