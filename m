Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OHouv-00047r-7f
	for linux-mtd@lists.infradead.org; Fri, 28 May 2010 02:03:22 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3300BEUXPGV8@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 28 May 2010 11:03:16 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L330007RXPGLO@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 28 May 2010 11:03:16 +0900 (KST)
Date: Fri, 28 May 2010 11:03:11 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] OneNAND: Introduce chip_probe function
To: linux-mtd@lists.infradead.org
Message-id: <20100528020311.GA1608@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samsung SoCs use the own OneNAND controler and detect OneNAND chip at power on.
To use this feature, introduce the chip_probe function.

Also remove workaround for Samsung SoCs.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 26caf25..0b12102 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3730,17 +3730,16 @@ out:
 }
 
 /**
- * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * onenand_chip_probe - [OneNAND Interface] The generic chip probe
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
@@ -3776,13 +3769,35 @@ static int onenand_probe(struct mtd_info *mtd)
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
@@ -3909,6 +3924,9 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->unlock_all)
 		this->unlock_all = onenand_unlock_all;
 
+	if (!this->chip_probe)
+		this->chip_probe = onenand_chip_probe;
+
 	if (!this->read_bufferram)
 		this->read_bufferram = onenand_read_bufferram;
 	if (!this->write_bufferram)
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index c26ff86..0c8815b 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -68,6 +68,7 @@ struct onenand_bufferram {
  * @write_word:		[REPLACEABLE] hardware specific function for write
  *			register of OneNAND
  * @mmcontrol:		sync burst read function
+ * @chip_probe:		[REPLACEABLE] hardware specific function for chip probe
  * @block_markbad:	function to mark a block as bad
  * @scan_bbt:		[REPLACEALBE] hardware specific function for scanning
  *			Bad block Table
@@ -114,6 +115,7 @@ struct onenand_chip {
 	unsigned short (*read_word)(void __iomem *addr);
 	void (*write_word)(unsigned short value, void __iomem *addr);
 	void (*mmcontrol)(struct mtd_info *mtd, int sync_read);
+	int (*chip_probe)(struct mtd_info *mtd);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	int (*scan_bbt)(struct mtd_info *mtd);
 
