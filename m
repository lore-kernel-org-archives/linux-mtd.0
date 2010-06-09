Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMLug-0005D2-ED
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 14:05:51 +0000
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
	by mailout1.w1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3R00A5935MU0@mailout1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
	by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPA id <0L3R000ZX35LW0@spt1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Date: Wed, 09 Jun 2010 16:05:31 +0200
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] OneNAND: Introduce chip_probe function
In-reply-to: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <1276092335-3245-2-git-send-email-m.szyprowski@samsung.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN
Content-transfer-encoding: 7BIT
References: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
Cc: kyungmin.park@samsung.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch splits OneNAND probe operation into chip and interface probe
operations. This way the code can be restructured to be more readable on
chips that require special workarounds during probe operation (like
OneNAND chip on Samsung S5PC110).

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

---
 drivers/mtd/onenand/onenand_base.c |   44 ++++++++++++++++++++++++++---------
 include/linux/mtd/onenand.h        |    1 +
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 26caf25..fc91c4a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3730,17 +3730,16 @@ out:
 }
 
 /**
- * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * onenand_chip_probe - [OneNAND Interface] Probe the OneNAND device
  * @param mtd		MTD device structure
  *
  * OneNAND detection method:
  *   Compare the values from command with ones from register
  */
-static int onenand_probe(struct mtd_info *mtd)
+static int onenand_chip_probe(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
-	int bram_maf_id, bram_dev_id, maf_id, dev_id, ver_id;
-	int density;
+	int bram_maf_id, bram_dev_id, maf_id, dev_id;
 	int syscfg;
 
 	/* Save system configuration 1 */
@@ -3763,12 +3762,6 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* Restore system configuration 1 */
 	this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
 
-	/* Workaround */
-	if (syscfg & ONENAND_SYS_CFG1_SYNC_WRITE) {
-		bram_maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
-		bram_dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
-	}
-
 	/* Check manufacturer ID */
 	if (onenand_check_maf(bram_maf_id))
 		return -ENXIO;
@@ -3776,13 +3769,37 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* Read manufacturer and device IDs from Register */
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
-	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
-	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/* Check OneNAND device */
 	if (maf_id != bram_maf_id || dev_id != bram_dev_id)
 		return -ENXIO;
 
+	return 0;
+}
+
+/**
+ * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * @param mtd		MTD device structure
+ *
+ * Probe OneNAND chip
+ */
+static int onenand_probe(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	int maf_id, dev_id, ver_id;
+	int density;
+	int ret;
+
+	ret = this->chip_probe(mtd);
+	if (ret)
+		return ret;
+
+	/* Read manufacturer and device IDs from Register */
+	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
+	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
+	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
+
 	/* Flash device information */
 	onenand_print_device_info(dev_id, ver_id);
 	this->device_id = dev_id;
@@ -3909,6 +3926,9 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->unlock_all)
 		this->unlock_all = onenand_unlock_all;
 
+	if (!this->chip_probe)
+		this->chip_probe = onenand_chip_probe;
+
 	if (!this->read_bufferram)
 		this->read_bufferram = onenand_read_bufferram;
 	if (!this->write_bufferram)
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index c26ff86..57c3bb4 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -114,6 +114,7 @@ struct onenand_chip {
 	unsigned short (*read_word)(void __iomem *addr);
 	void (*write_word)(unsigned short value, void __iomem *addr);
 	void (*mmcontrol)(struct mtd_info *mtd, int sync_read);
+	int (*chip_probe)(struct mtd_info *mtd);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	int (*scan_bbt)(struct mtd_info *mtd);
 
-- 
1.6.4
