Received: from mail-by2on0102.outbound.protection.outlook.com
 ([207.46.100.102] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB5R1-0001IH-De
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 17:39:20 +0000
From: <Frank.Li@freescale.com>
To: <computersforpeace@gmail.com>, <shijie8@gmail.com>, <lznuaa@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] mtd: fsl-quadspi: improve read performance by increase
 AHB transfer size
Date: Wed, 14 Jan 2015 00:28:56 +0800
Message-ID: <1421166536-13601-1-git-send-email-Frank.Li@freescale.com>
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

Set AHB transfer size to 1K which improved the read performance.

Add ahb_buf_size field in fsl_qspi_devtype_data to denote the size for
different SoC.

Before:

root@imx6qdlsolo:~# dd if=/dev/mtd1 of=/dev/null bs=1M count=16
16+0 records in
16+0 records out
16777216 bytes (17 MB) copied, 0.472183 s, 25.1 MB/s

After:

root@imx6qdlsolo:~# dd if=/dev/mtd1 of=/dev/null bs=1M count=16
16+0 records in
16+0 records out
16777216 bytes (17 MB) copied, 0.369439 s, 29.5 MB/s

Signed-off-by: Allen Xu <b45815@freescale.com>
Signed-off-by: Huang Shijie <shijie8@gmail.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9d608007..75d6898 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -57,7 +57,9 @@
 
 #define QUADSPI_BUF3CR			0x1c
 #define QUADSPI_BUF3CR_ALLMST_SHIFT	31
-#define QUADSPI_BUF3CR_ALLMST		(1 << QUADSPI_BUF3CR_ALLMST_SHIFT)
+#define QUADSPI_BUF3CR_ALLMST_MASK	(1 << QUADSPI_BUF3CR_ALLMST_SHIFT)
+#define QUADSPI_BUF3CR_ADATSZ_SHIFT		8
+#define QUADSPI_BUF3CR_ADATSZ_MASK	(0xFF << QUADSPI_BUF3CR_ADATSZ_SHIFT)
 
 #define QUADSPI_BFGENCR			0x20
 #define QUADSPI_BFGENCR_PAR_EN_SHIFT	16
@@ -198,18 +200,21 @@ struct fsl_qspi_devtype_data {
 	enum fsl_qspi_devtype devtype;
 	int rxfifo;
 	int txfifo;
+	int ahb_buf_size;
 };
 
 static struct fsl_qspi_devtype_data vybrid_data = {
 	.devtype = FSL_QUADSPI_VYBRID,
 	.rxfifo = 128,
-	.txfifo = 64
+	.txfifo = 64,
+	.ahb_buf_size = 1024
 };
 
 static struct fsl_qspi_devtype_data imx6sx_data = {
 	.devtype = FSL_QUADSPI_IMX6SX,
 	.rxfifo = 128,
-	.txfifo = 512
+	.txfifo = 512,
+	.ahb_buf_size = 1024
 };
 
 #define FSL_QSPI_MAX_CHIP	4
@@ -583,7 +588,12 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
 	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);
 	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF1CR);
 	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);
-	writel(QUADSPI_BUF3CR_ALLMST, base + QUADSPI_BUF3CR);
+	/*
+	 * Set ADATSZ with the maximum AHB buffer size to improve the
+	 * read performance.
+	 */
+	writel(QUADSPI_BUF3CR_ALLMST_MASK | ((q->devtype_data->ahb_buf_size / 8)
+			<< QUADSPI_BUF3CR_ADATSZ_SHIFT), base + QUADSPI_BUF3CR);
 
 	/* We only use the buffer3 */
 	writel(0, base + QUADSPI_BUF0IND);
-- 
1.9.1
