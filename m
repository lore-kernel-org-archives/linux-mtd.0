Received: from mail-bn1bon0113.outbound.protection.outlook.com
 ([157.56.111.113] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZMeE9-0002oc-Jy
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:34:05 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <frank.li@freescale.com>,
 <han.xu@freescale.com>
Subject: [PATCH v4 05/10] mtd: spi-nor: fsl-quadspi: add i.mx6ul support
Date: Tue, 4 Aug 2015 10:25:47 -0500
Message-ID: <1438701947-27081-1-git-send-email-b45815@freescale.com>
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
Acked-by: Han xu <han.xu@freescale.com>
---
Change from v3 to v4:
add comma after the last entries

Change from v2 to v3:
Resend whole serial patch

 drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9abaa06..a327e2d 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -208,6 +208,7 @@ enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
 	FSL_QUADSPI_IMX7D,
+	FSL_QUADSPI_IMX6UL,
 };
 
 struct fsl_qspi_devtype_data {
@@ -243,6 +244,15 @@ static struct fsl_qspi_devtype_data imx7d_data = {
 		       | QUADSPI_QUIRK_4X_INT_CLK,
 };
 
+static struct fsl_qspi_devtype_data imx6ul_data = {
+	.devtype = FSL_QUADSPI_IMX6UL,
+	.rxfifo = 128,
+	.txfifo = 512,
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_TKT253890
+		       | QUADSPI_QUIRK_4X_INT_CLK,
+};
+
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
 	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
@@ -705,6 +715,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
 	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
 	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
+	{ .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
1.9.1
