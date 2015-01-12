Received: from mail-bn1bon0113.outbound.protection.outlook.com
 ([157.56.111.113] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAmdh-0007sx-0Z
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 21:35:09 +0000
From: <Frank.Li@freescale.com>
To: <computersforpeace@gmail.com>, <shijie8@gmail.com>, <lznuaa@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] mtd: spi-nor: fsl-qspi: support DSM fro imx6 sx chip
Date: Tue, 13 Jan 2015 04:24:48 +0800
Message-ID: <1421094288-24750-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Allen Xu <b45815@freescale.com>, Frank Li <Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Allen Xu <b45815@freescale.com>

i.mx6 sx support turn off fastmix and megamix power.
qpsi controller status will lost when suspen/resume.
add suspend/resume functions and reset qspi controller
when resume.

Signed-off-by: Allen Xu <b45815@freescale.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 39763b9..9d608007 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -972,6 +972,22 @@ static int fsl_qspi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int fsl_qspi_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	return 0;
+}
+
+static int fsl_qspi_resume(struct platform_device *pdev)
+{
+	struct fsl_qspi *q = platform_get_drvdata(pdev);
+
+	fsl_qspi_nor_setup(q);
+	fsl_qspi_set_map_addr(q);
+	fsl_qspi_nor_setup_last(q);
+
+	return 0;
+}
+
 static struct platform_driver fsl_qspi_driver = {
 	.driver = {
 		.name	= "fsl-quadspi",
@@ -980,6 +996,8 @@ static struct platform_driver fsl_qspi_driver = {
 	},
 	.probe          = fsl_qspi_probe,
 	.remove		= fsl_qspi_remove,
+	.suspend	= fsl_qspi_suspend,
+	.resume		= fsl_qspi_resume,
 };
 module_platform_driver(fsl_qspi_driver);
 
-- 
1.9.1
