Received: from mail-bl2on0127.outbound.protection.outlook.com ([65.55.169.127]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHeUG-00047y-1g
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:50:05 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH 5/7] mtd: spi-nor: fsl-quadspi: workaround qspi can't wakeup
 from wait mode
Date: Wed, 22 Jul 2015 03:39:57 +0800
Message-ID: <1437507599-25424-5-git-send-email-Frank.Li@freescale.com>
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

QSPI1 cannot wake up CCM from WAIT mode on SX ARD board, add pmqos to
let PM NOT enter WAIT mode when accessing QSPI1, refer to TKT245618.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
Signed-off-by: Allen Xu <b45815@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 1419f1f..10a2c23 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -27,6 +27,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/pm_qos.h>
 
 /* Controller needs driver to swap endian */
 #define QUADSPI_QUIRK_SWAP_ENDIAN	(1 << 0)
@@ -37,6 +38,8 @@
  * trigger data transfer even though extern data will not transferred.
  */
 #define QUADSPI_QUIRK_TKT253890		(1 << 2)
+/* Controller cannot wake up from wait mode, TKT245618 */
+#define QUADSPI_QUIRK_TKT245618         (1 << 3)
 
 /* The registers */
 #define QUADSPI_MCR			0x00
@@ -231,6 +234,7 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
 	.txfifo = 512,
 	.ahb_buf_size = 1024,
 	.driver_data = QUADSPI_QUIRK_4X_INT_CLK
+		       | QUADSPI_QUIRK_TKT245618
 };
 
 static struct fsl_qspi_devtype_data imx7d_data = {
@@ -270,6 +274,7 @@ struct fsl_qspi {
 	unsigned int chip_base_addr; /* We may support two chips. */
 	bool has_second_chip;
 	struct mutex lock;
+	struct pm_qos_request pm_qos_req;
 };
 
 static inline int needs_swap_endian(struct fsl_qspi *q)
@@ -287,6 +292,11 @@ static inline int needs_fill_txfifo(struct fsl_qspi *q)
 	return q->devtype_data->driver_data & QUADSPI_QUIRK_TKT253890;
 }
 
+static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
+{
+	return q->devtype_data->driver_data & QUADSPI_QUIRK_TKT245618;
+}
+
 /*
  * An IC bug makes us to re-arrange the 32-bit data.
  * The following chips, such as IMX6SLX, have fixed this bug.
@@ -668,12 +678,18 @@ static int fsl_qspi_clk_prep_enable(struct fsl_qspi *q)
 		return ret;
 	}
 
+	if (needs_wakeup_wait_mode(q))
+		pm_qos_add_request(&q->pm_qos_req, PM_QOS_CPU_DMA_LATENCY, 0);
+
 	return 0;
 }
 
 /* This function was used to disable and unprepare QSPI clock */
 static void fsl_qspi_clk_disable_unprep(struct fsl_qspi *q)
 {
+	if (needs_wakeup_wait_mode(q))
+		pm_qos_remove_request(&q->pm_qos_req);
+
 	clk_disable_unprepare(q->clk);
 	clk_disable_unprepare(q->clk_en);
 
@@ -925,6 +941,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->nor_num || q->nor_num > FSL_QSPI_MAX_CHIP)
 		return -ENODEV;
 
+	q->dev = dev;
+	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
+	platform_set_drvdata(pdev, q);
+
 	/* find the resources */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "QuadSPI");
 	q->iobase = devm_ioremap_resource(dev, res);
@@ -964,10 +984,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		goto irq_failed;
 	}
 
-	q->dev = dev;
-	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
-	platform_set_drvdata(pdev, q);
-
 	ret = fsl_qspi_nor_setup(q);
 	if (ret)
 		goto irq_failed;
-- 
1.9.1
