Received: from mail-bn1bbn0105.outbound.protection.outlook.com
 ([157.56.111.105] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMXvr-0002PS-3P
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 09:23:03 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <jteki@openedev.com>, <marex@denx.de>
CC: <Mingkai.Hu@freescale.com>, Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
Subject: [PATCHv3 1/2] mtd: spi-nor: Add SPI NOR layer PM support
Date: Fri, 22 Jan 2016 17:14:26 +0800
Message-ID: <1453454067-32534-1-git-send-email-Zhiqiang.Hou@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>

Add the Power Management API in SPI NOR framework.
The Power Management system will turn off power supply to SPI flash
when system suspending, and then the SPI flash will be in the reset
state after system resuming. As a result, the status&configurations
of SPI flash driver will mismatch with its current hardware state.
So reinitialize SPI flash to make sure it is resumed to the correct
state.
And the SPI NOR layer just do common configuration depending on the
records in structure spi_nor.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
---
Tested on T1042D4RDB.

V3:
 - Remove the condition #ifdef CONFIG_PM_SLEEP
 - Define the spi_nor_unprotect_on_powerup() to make it reuseable.

 drivers/mtd/spi-nor/spi-nor.c | 73 ++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |  9 ++++++
 2 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed0c19c..7e416fb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1179,6 +1179,26 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
+/*
+ * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
+ * with the software protection bits set
+ */
+static int spi_nor_unprotect_on_powerup(struct spi_nor *nor)
+{
+	const struct flash_info *info = NULL;
+	int ret = 0;
+
+	info = spi_nor_read_id(nor);
+	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_SST) {
+		write_enable(nor);
+		ret = write_sr(nor, 0);
+	}
+
+	return ret;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 {
 	const struct flash_info *info = NULL;
@@ -1226,17 +1246,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	mutex_init(&nor->lock);
 
-	/*
-	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
-	 * with the software protection bits set
-	 */
-
-	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST) {
-		write_enable(nor);
-		write_sr(nor, 0);
-	}
+	ret = spi_nor_unprotect_on_powerup(nor);
+	if (ret)
+		return ret;
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
@@ -1402,6 +1414,45 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
+static int spi_nor_hw_reinit(struct spi_nor *nor)
+{
+	const struct flash_info *info = NULL;
+	struct device *dev = nor->dev;
+	int ret;
+
+	info = spi_nor_read_id(nor);
+
+	ret = spi_nor_unprotect_on_powerup(nor);
+	if (ret)
+		return ret;
+
+	if (nor->flash_read == SPI_NOR_QUAD) {
+		ret = set_quad_mode(nor, info);
+		if (ret) {
+			dev_err(dev, "quad mode not supported\n");
+			return ret;
+		}
+	}
+
+	if (nor->addr_width == 4 &&
+			JEDEC_MFR(info) != SNOR_MFR_SPANSION)
+		set_4byte(nor, info, 1);
+
+	return 0;
+}
+
+int spi_nor_suspend(struct spi_nor *nor)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nor_suspend);
+
+int spi_nor_resume(struct spi_nor *nor)
+{
+	return spi_nor_hw_reinit(nor);
+}
+EXPORT_SYMBOL_GPL(spi_nor_resume);
+
 static const struct flash_info *spi_nor_match_id(const char *name)
 {
 	const struct flash_info *id = spi_nor_ids;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 62356d5..32f12cc 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -210,4 +210,13 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
  */
 int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode);
 
+/**
+ * spi_nor_suspend/resume() - the SPI NOR layer PM API
+ * @nor:	the spi_nor structure
+ *
+ * Return: 0 for success, others for failure.
+ */
+int spi_nor_suspend(struct spi_nor *nor);
+int spi_nor_resume(struct spi_nor *nor);
+
 #endif
-- 
2.1.0.27.g96db324
