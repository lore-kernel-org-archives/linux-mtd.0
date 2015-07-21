Received: from mail-by2on0102.outbound.protection.outlook.com
 ([207.46.100.102] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHUid-0007yT-Er
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 10:24:16 +0000
From: Zhiqiang Hou <B48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
CC: <b21284@freescale.com>, Hou Zhiqiang <B48286@freescale.com>
Subject: [PATCH] mtd: m25p80: Add Power Management support
Date: Tue, 21 Jul 2015 18:18:53 +0800
Message-ID: <1437473933-11983-1-git-send-email-B48286@freescale.com>
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

From: Hou Zhiqiang <B48286@freescale.com>

Add the rescanning and initialization of SPI flash, to make the SPI
flash in the correct state. Because if the Power Management system
truns off power supply for SPI flash when system suspending, the SPI
flash will return to the reset state after system resume.

Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
---
 drivers/mtd/devices/m25p80.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d313f948b..f9d2b2e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -248,6 +248,39 @@ static int m25p_remove(struct spi_device *spi)
 	return mtd_device_unregister(&flash->mtd);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int m25p_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int m25p_resume(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+	struct spi_device *spi = flash->spi;
+	struct spi_nor *nor = &flash->spi_nor;
+	enum read_mode mode = SPI_NOR_NORMAL;
+	struct flash_platform_data *data;
+	char *flash_name = NULL;
+
+	if (spi->mode & SPI_RX_QUAD)
+		mode = SPI_NOR_QUAD;
+	else if (spi->mode & SPI_RX_DUAL)
+		mode = SPI_NOR_DUAL;
+
+	data = dev_get_platdata(&spi->dev);
+	if (data && data->type)
+		flash_name = data->type;
+	else if (!strcmp(spi->modalias, "spi-nor"))
+		flash_name = NULL; /* auto-detect */
+	else
+		flash_name = spi->modalias;
+
+	return spi_nor_scan(nor, flash_name, mode);
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
 /*
  * Do NOT add to this array without reading the following:
  *
@@ -302,6 +335,7 @@ static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
 		.owner	= THIS_MODULE,
+		.pm	= &m25p_pm_ops,
 	},
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
-- 
2.1.0.27.g96db324
