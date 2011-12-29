Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIY4-0000g5-Et
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 16:09:45 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: kill dev_to_mtd helper
Date: Thu, 29 Dec 2011 18:11:32 +0200
Message-Id: <1325175092-7900-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

... since it is not needed because the generic 'dev_get_drvdata()' can be
used instead.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |   25 +++++++++++++------------
 include/linux/mtd/mtd.h |    5 -----
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 376fbfd..8bea2d0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -107,7 +107,8 @@ static LIST_HEAD(mtd_notifiers);
  */
 static void mtd_release(struct device *dev)
 {
-	dev_t index = MTD_DEVT(dev_to_mtd(dev)->index);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	dev_t index = MTD_DEVT(mtd->index);
 
 	/* remove /dev/mtdXro node if needed */
 	if (index)
@@ -116,7 +117,7 @@ static void mtd_release(struct device *dev)
 
 static int mtd_cls_suspend(struct device *dev, pm_message_t state)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	if (mtd && mtd->suspend)
 		return mtd_suspend(mtd);
@@ -126,7 +127,7 @@ static int mtd_cls_suspend(struct device *dev, pm_message_t state)
 
 static int mtd_cls_resume(struct device *dev)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 	
 	if (mtd && mtd->resume)
 		mtd_resume(mtd);
@@ -136,7 +137,7 @@ static int mtd_cls_resume(struct device *dev)
 static ssize_t mtd_type_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 	char *type;
 
 	switch (mtd->type) {
@@ -172,7 +173,7 @@ static DEVICE_ATTR(type, S_IRUGO, mtd_type_show, NULL);
 static ssize_t mtd_flags_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)mtd->flags);
 
@@ -182,7 +183,7 @@ static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
 static ssize_t mtd_size_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 		(unsigned long long)mtd->size);
@@ -193,7 +194,7 @@ static DEVICE_ATTR(size, S_IRUGO, mtd_size_show, NULL);
 static ssize_t mtd_erasesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->erasesize);
 
@@ -203,7 +204,7 @@ static DEVICE_ATTR(erasesize, S_IRUGO, mtd_erasesize_show, NULL);
 static ssize_t mtd_writesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->writesize);
 
@@ -213,7 +214,7 @@ static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
 static ssize_t mtd_subpagesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 	unsigned int subpagesize = mtd->writesize >> mtd->subpage_sft;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", subpagesize);
@@ -224,7 +225,7 @@ static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
 static ssize_t mtd_oobsize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->oobsize);
 
@@ -234,7 +235,7 @@ static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
 static ssize_t mtd_numeraseregions_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->numeraseregions);
 
@@ -245,7 +246,7 @@ static DEVICE_ATTR(numeraseregions, S_IRUGO, mtd_numeraseregions_show,
 static ssize_t mtd_name_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = dev_to_mtd(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a09077a..cb33cc1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -422,11 +422,6 @@ static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return mtd->block_markbad(mtd, ofs);
 }
 
-static inline struct mtd_info *dev_to_mtd(struct device *dev)
-{
-	return dev ? dev_get_drvdata(dev) : NULL;
-}
-
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
 {
 	if (mtd->erasesize_shift)
-- 
1.7.7.3
