Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1KL-0004Ju-CH
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:50:26 +0000
Received: by pabyb7 with SMTP id yb7so46163338pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 15:50:04 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFT PATCH 4/4] mtd: spi-nor: embed struct mtd_info within struct
 spi_nor
Date: Thu, 13 Aug 2015 15:46:05 -0700
Message-Id: <1439505965-134748-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reflects the proper layering, so let's do it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c      | 10 ++++------
 drivers/mtd/spi-nor/fsl-quadspi.c | 10 ++++------
 drivers/mtd/spi-nor/nxp-spifi.c   |  6 ++----
 drivers/mtd/spi-nor/spi-nor.c     |  8 ++++----
 include/linux/mtd/spi-nor.h       |  2 +-
 5 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 24965ae9f7aa..b6bc9a2a5f87 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -31,7 +31,6 @@
 struct m25p {
 	struct spi_device	*spi;
 	struct spi_nor		spi_nor;
-	struct mtd_info		mtd;
 	u8			command[MAX_CMD_SIZE];
 };
 
@@ -159,7 +158,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 	struct m25p *flash = nor->priv;
 
 	dev_dbg(nor->dev, "%dKiB at 0x%08x\n",
-		flash->mtd.erasesize / 1024, (u32)offset);
+		flash->spi_nor.mtd.erasesize / 1024, (u32)offset);
 
 	/* Set up command buffer. */
 	flash->command[0] = nor->erase_opcode;
@@ -201,7 +200,6 @@ static int m25p_probe(struct spi_device *spi)
 	nor->read_reg = m25p80_read_reg;
 
 	nor->dev = &spi->dev;
-	nor->mtd = &flash->mtd;
 	nor->priv = flash;
 
 	spi_set_drvdata(spi, flash);
@@ -213,7 +211,7 @@ static int m25p_probe(struct spi_device *spi)
 		mode = SPI_NOR_DUAL;
 
 	if (data && data->name)
-		flash->mtd.name = data->name;
+		nor->mtd.name = data->name;
 
 	/* For some (historical?) reason many platforms provide two different
 	 * names in flash_platform_data: "name" and "type". Quite often name is
@@ -231,7 +229,7 @@ static int m25p_probe(struct spi_device *spi)
 
 	ppdata.of_node = spi->dev.of_node;
 
-	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
+	return mtd_device_parse_register(&nor->mtd, NULL, &ppdata,
 			data ? data->parts : NULL,
 			data ? data->nr_parts : 0);
 }
@@ -242,7 +240,7 @@ static int m25p_remove(struct spi_device *spi)
 	struct m25p	*flash = spi_get_drvdata(spi);
 
 	/* Clean up MTD stuff. */
-	return mtd_device_unregister(&flash->mtd);
+	return mtd_device_unregister(&flash->spi_nor.mtd);
 }
 
 /*
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index cefc9636e551..f28dcc1cd63f 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -259,7 +259,6 @@ static struct fsl_qspi_devtype_data imx6ul_data = {
 
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
-	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
 	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -888,7 +887,7 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
 	int ret;
 
 	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
-		nor->mtd->erasesize / 1024, q->chip_base_addr, (u32)offs);
+		nor->mtd.erasesize / 1024, q->chip_base_addr, (u32)offs);
 
 	ret = fsl_qspi_runcmd(q, nor->erase_opcode, offs, 0);
 	if (ret)
@@ -1011,9 +1010,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 			i *= 2;
 
 		nor = &q->nor[i];
-		mtd = &q->mtd[i];
+		mtd = &nor->mtd;
 
-		nor->mtd = mtd;
 		nor->dev = dev;
 		nor->priv = q;
 
@@ -1080,7 +1078,7 @@ last_init_failed:
 		/* skip the holes */
 		if (!q->has_second_chip)
 			i *= 2;
-		mtd_device_unregister(&q->mtd[i]);
+		mtd_device_unregister(&q->nor[i].mtd);
 	}
 mutex_failed:
 	mutex_destroy(&q->lock);
@@ -1100,7 +1098,7 @@ static int fsl_qspi_remove(struct platform_device *pdev)
 		/* skip the holes */
 		if (!q->has_second_chip)
 			i *= 2;
-		mtd_device_unregister(&q->mtd[i]);
+		mtd_device_unregister(&q->nor[i].mtd);
 	}
 
 	/* disable the hardware */
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index ce6a478a02a5..0f6b452574bd 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -60,7 +60,6 @@ struct nxp_spifi {
 	struct clk *clk_reg;
 	void __iomem *io_base;
 	void __iomem *flash_base;
-	struct mtd_info mtd;
 	struct spi_nor nor;
 	bool memory_mode;
 	u32 mcmd;
@@ -331,7 +330,6 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 
 	writel(ctrl, spifi->io_base + SPIFI_CTRL);
 
-	spifi->nor.mtd   = &spifi->mtd;
 	spifi->nor.dev   = spifi->dev;
 	spifi->nor.priv  = spifi;
 	spifi->nor.read  = nxp_spifi_read;
@@ -364,7 +362,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 	}
 
 	ppdata.of_node = np;
-	ret = mtd_device_parse_register(&spifi->mtd, NULL, &ppdata, NULL, 0);
+	ret = mtd_device_parse_register(&spifi->nor.mtd, NULL, &ppdata, NULL, 0);
 	if (ret) {
 		dev_err(spifi->dev, "mtd device parse failed\n");
 		return ret;
@@ -453,7 +451,7 @@ static int nxp_spifi_remove(struct platform_device *pdev)
 {
 	struct nxp_spifi *spifi = platform_get_drvdata(pdev);
 
-	mtd_device_unregister(&spifi->mtd);
+	mtd_device_unregister(&spifi->nor.mtd);
 	clk_disable_unprepare(spifi->clk_spifi);
 	clk_disable_unprepare(spifi->clk_reg);
 
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cba513373d5e..f911be6eadcd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -263,7 +263,7 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
  */
 static int erase_chip(struct spi_nor *nor)
 {
-	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
+	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
 }
@@ -371,7 +371,7 @@ erase_err:
 
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
-	struct mtd_info *mtd = nor->mtd;
+	struct mtd_info *mtd = &nor->mtd;
 	uint32_t offset = ofs;
 	uint8_t status_old, status_new;
 	int ret = 0;
@@ -405,7 +405,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
-	struct mtd_info *mtd = nor->mtd;
+	struct mtd_info *mtd = &nor->mtd;
 	uint32_t offset = ofs;
 	uint8_t status_old, status_new;
 	int ret = 0;
@@ -1006,7 +1006,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	const struct spi_device_id	*id = NULL;
 	struct flash_info		*info;
 	struct device *dev = nor->dev;
-	struct mtd_info *mtd = nor->mtd;
+	struct mtd_info *mtd = &nor->mtd;
 	struct device_node *np = dev->of_node;
 	int ret;
 	int i;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 85a24baea093..495433d3f56d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -162,7 +162,7 @@ struct mtd_info;
  * @priv:		the private data
  */
 struct spi_nor {
-	struct mtd_info		*mtd;
+	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
 	u32			page_size;
-- 
2.5.0.276.gf5e568e
