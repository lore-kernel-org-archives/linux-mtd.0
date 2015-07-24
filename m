Received: from mail-bn1on0117.outbound.protection.outlook.com
 ([157.56.110.117] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIiST-0003LU-4o
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:16:37 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
Subject: [PATCH v3 2/8] mtd: spi-nor: fsl-quadspi: use quirk to distinguish
 different qspi version
Date: Sat, 25 Jul 2015 02:06:22 +0800
Message-ID: <1437761188-8179-3-git-send-email-Frank.Li@freescale.com>
In-Reply-To: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
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

From: Han Xu <b45815@freescale.com>

add several quirk to distinguish different version of qspi module.

Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index ac9d633..5f31bc7 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -28,6 +28,11 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 
+/* Controller needs driver to swap endian */
+#define QUADSPI_QUIRK_SWAP_ENDIAN	(1 << 0)
+/* Controller needs 4x internal clock */
+#define QUADSPI_QUIRK_4X_INT_CLK	(1 << 1)
+
 /* The registers */
 #define QUADSPI_MCR			0x00
 #define QUADSPI_MCR_RESERVED_SHIFT	16
@@ -202,20 +207,23 @@ struct fsl_qspi_devtype_data {
 	int rxfifo;
 	int txfifo;
 	int ahb_buf_size;
+	int driver_data;
 };
 
 static struct fsl_qspi_devtype_data vybrid_data = {
 	.devtype = FSL_QUADSPI_VYBRID,
 	.rxfifo = 128,
 	.txfifo = 64,
-	.ahb_buf_size = 1024
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_SWAP_ENDIAN
 };
 
 static struct fsl_qspi_devtype_data imx6sx_data = {
 	.devtype = FSL_QUADSPI_IMX6SX,
 	.rxfifo = 128,
 	.txfifo = 512,
-	.ahb_buf_size = 1024
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_4X_INT_CLK
 };
 
 #define FSL_QSPI_MAX_CHIP	4
@@ -239,14 +247,14 @@ struct fsl_qspi {
 	struct mutex lock;
 };
 
-static inline int is_vybrid_qspi(struct fsl_qspi *q)
+static inline int needs_swap_endian(struct fsl_qspi *q)
 {
-	return q->devtype_data->devtype == FSL_QUADSPI_VYBRID;
+	return q->devtype_data->driver_data & QUADSPI_QUIRK_SWAP_ENDIAN;
 }
 
-static inline int is_imx6sx_qspi(struct fsl_qspi *q)
+static inline int needs_4x_clock(struct fsl_qspi *q)
 {
-	return q->devtype_data->devtype == FSL_QUADSPI_IMX6SX;
+	return q->devtype_data->driver_data & QUADSPI_QUIRK_4X_INT_CLK;
 }
 
 /*
@@ -255,7 +263,7 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
  */
 static inline u32 fsl_qspi_endian_xchg(struct fsl_qspi *q, u32 a)
 {
-	return is_vybrid_qspi(q) ? __swab32(a) : a;
+	return needs_swap_endian(q) ? __swab32(a) : a;
 }
 
 static inline void fsl_qspi_unlock_lut(struct fsl_qspi *q)
@@ -650,7 +658,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	unsigned long rate = q->clk_rate;
 	int ret;
 
-	if (is_imx6sx_qspi(q))
+	if (needs_4x_clock(q))
 		rate *= 4;
 
 	ret = clk_set_rate(q->clk, rate);
-- 
1.9.1
