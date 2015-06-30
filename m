Received: from mail-bl2on0775.outbound.protection.outlook.com
 ([2a01:111:f400:fc09::775] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9rvC-0001Gx-2J
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 09:33:43 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <linux-mtd@lists.infradead.org>, <han.xu@freescale.com>
Subject: [PATCH 1/5 v1] mtd: spi-nor: fsl-quadspi: Add a variable in
 'fsl_qspi_devtype_data' to enable platform specail feature
Date: Tue, 30 Jun 2015 17:28:34 +0800
Message-ID: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 Haikun Wang <haikun.wang@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a variable in struct fsl_qspi_devtype_data.
Add big endian registers flag.
Enable big endian registers flag for LS1021A.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 6cd14e4..40c7953 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -191,6 +191,9 @@
 #define SEQID_EN4B		10
 #define SEQID_BRWR		11
 
+/* Controller needs swap endian when access registers */
+#define QUADSPI_QUIRK_REGMAP_BE    (1 << 5)
+
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
@@ -202,6 +205,7 @@ struct fsl_qspi_devtype_data {
 	int rxfifo;
 	int txfifo;
 	int ahb_buf_size;
+	int driver_data;
 };
 
 static struct fsl_qspi_devtype_data vybrid_data = {
@@ -222,7 +226,8 @@ static struct fsl_qspi_devtype_data ls1_data = {
 	.devtype = FSL_QUADSPI_LS1,
 	.rxfifo = 128,
 	.txfifo = 64,
-	.ahb_buf_size = 1024
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_REGMAP_BE
 };
 
 #define FSL_QSPI_MAX_CHIP	4
-- 
2.1.0.27.g96db324
