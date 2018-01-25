Received: from mail-db5eur03on0626.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::626]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eebgs-0001Ed-63
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 07:11:20 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH] mtd: fsl-quadspi: add support for ls2080a/ls1080a
Date: Thu, 25 Jan 2018 12:39:57 +0530
Message-Id: <1516864197-31484-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

LS2080a/LS1088a supports Freescale Quad SPI controller.
Add fsl-quadspi driver support for ls2080a and ls1088a chip.

Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
Depends on
 https://patchwork.ozlabs.org/project/linux-mtd/list/?series=25286
 

 drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index c5863cf..11389d8 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -214,6 +214,7 @@ enum fsl_qspi_devtype {
 	FSL_QUADSPI_IMX7D,
 	FSL_QUADSPI_IMX6UL,
 	FSL_QUADSPI_LS1021A,
+	FSL_QUADSPI_LS2080A,
 };
 
 struct fsl_qspi_devtype_data {
@@ -267,6 +268,15 @@ struct fsl_qspi_devtype_data {
 	.driver_data = 0,
 };
 
+static struct fsl_qspi_devtype_data ls2080a_data = {
+	.devtype = FSL_QUADSPI_LS2080A,
+	.rxfifo = 128,
+	.txfifo = 64,
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_TKT253890,
+};
+
+
 #define FSL_QSPI_MAX_CHIP	4
 struct fsl_qspi {
 	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
@@ -806,6 +816,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
 	{ .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = (void *)&ls1021a_data, },
+	{ .compatible = "fsl,ls2080a-qspi", .data = (void *)&ls2080a_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
1.9.1
