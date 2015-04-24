Received: from mail-bn1on0147.outbound.protection.outlook.com
 ([157.56.110.147] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ylasf-0001jQ-Bf
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 10:30:46 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2 v1] mtd: spi-nor: fsl-quadspi: Enable LS1021 support
Date: Fri, 24 Apr 2015 18:26:54 +0800
Message-ID: <1429871214-44560-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, han.xu@freescale.com,
 Haikun Wang <haikun.wang@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add LS1021 QSPI chip special information

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5d5d362..1742de9 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -194,6 +194,7 @@
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
+	FSL_QUADSPI_LS1,
 };
 
 struct fsl_qspi_devtype_data {
@@ -217,6 +218,12 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
 	.ahb_buf_size = 1024
 };
 
+static struct fsl_qspi_devtype_data ls1_data = {
+	.devtype = FSL_QUADSPI_LS1,
+	.rxfifo = 128,
+	.txfifo = 64;
+};
+
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
 	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
@@ -665,6 +672,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 static struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
 	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
+	{ .compatible = "fsl,ls1-qspi", .data = (void *)&ls1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.1.0.27.g96db324
