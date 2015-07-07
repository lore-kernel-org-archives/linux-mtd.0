Received: from mail-bn1on0146.outbound.protection.outlook.com
 ([157.56.110.146] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTT-0000RZ-7H
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:31 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 2/8 v4] mtd: spi-nor: fsl-quadspi: Enable LS1021 support
Date: Tue, 7 Jul 2015 16:38:14 +0800
Message-ID: <1436258300-21261-2-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
References: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
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

Add LS1021 QSPI chip special information

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v4:
- Rebase with l2-mtd.git

Changes in v3:
- Rebase with l2-mtd.git

Changes in v2:
- Fix compile issue
- Add ahb_buf_size initialization
 drivers/mtd/spi-nor/fsl-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 7e74567..685ac97 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -195,6 +195,7 @@
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
+	FSL_QUADSPI_LS1,
 };
 
 struct fsl_qspi_devtype_data {
@@ -218,6 +219,13 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
 	.ahb_buf_size = 1024
 };
 
+static struct fsl_qspi_devtype_data ls1_data = {
+	.devtype = FSL_QUADSPI_LS1,
+	.rxfifo = 128,
+	.txfifo = 64,
+	.ahb_buf_size = 1024
+};
+
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
 	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
@@ -671,6 +679,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
 	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
+	{ .compatible = "fsl,ls1-qspi", .data = (void *)&ls1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.1.0.27.g96db324
