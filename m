Received: from mail-by2on0116.outbound.protection.outlook.com
 ([207.46.100.116] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHeU8-00046A-2d
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:49:56 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH 3/7] mtd: spi-nor: fsl-quadspi: add i.mx6ul support
Date: Wed, 22 Jul 2015 03:39:55 +0800
Message-ID: <1437507599-25424-3-git-send-email-Frank.Li@freescale.com>
In-Reply-To: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
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

From: Frank Li <Frank.Li@freescale.com>

Add i.mx6ul chip support

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9c3e38d..921fba1 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -206,6 +206,7 @@ enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
 	FSL_QUADSPI_IMX7D,
+	FSL_QUADSPI_IMX6UL,
 };
 
 struct fsl_qspi_devtype_data {
@@ -241,6 +242,15 @@ static struct fsl_qspi_devtype_data imx7d_data = {
 		       | QUADSPI_QUIRK_4X_INT_CLK
 };
 
+static struct fsl_qspi_devtype_data imx6ul_data = {
+	.devtype = FSL_QUADSPI_IMX6UL,
+	.rxfifo = 128,
+	.txfifo = 512,
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_TKT253890
+		       | QUADSPI_QUIRK_4X_INT_CLK
+};
+
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
 	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
@@ -703,6 +713,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
 	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
 	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
+	{ .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
1.9.1
