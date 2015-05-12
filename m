Received: from mail-bn1on0135.outbound.protection.outlook.com
 ([157.56.110.135] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsIjU-0001BZ-1n
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 22:33:00 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>, <shijie.huang@intel.com>
Subject: [PATCH V2] mtd: fsl-quadspi: Access multiple chips simultaneously
Date: Tue, 12 May 2015 17:27:44 -0500
Message-ID: <1431469664-20084-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add supports for simultaneous access to multiple chips. Need to lock
the mutex before any quad spi operations and unlock the mutex after
operations complete.

Rebase to latest l2-mtd code and resend.

Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 52a872f..93c1cde 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/mutex.h>
 
 /* The registers */
 #define QUADSPI_MCR			0x00
@@ -233,6 +234,7 @@ struct fsl_qspi {
 	u32 clk_rate;
 	unsigned int chip_base_addr; /* We may support two chips. */
 	bool has_second_chip;
+	struct mutex lock;
 };
 
 static inline int is_vybrid_qspi(struct fsl_qspi *q)
@@ -761,6 +763,7 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	struct fsl_qspi *q = nor->priv;
 	int ret;
 
+	mutex_lock(&q->lock);
 	ret = clk_enable(q->clk_en);
 	if (ret)
 		return ret;
@@ -781,6 +784,7 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 	clk_disable(q->clk);
 	clk_disable(q->clk_en);
+	mutex_unlock(&q->lock);
 }
 
 static int fsl_qspi_probe(struct platform_device *pdev)
@@ -864,6 +868,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
 		q->has_second_chip = true;
 
+	mutex_init(&q->lock);
+
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
 		char modalias[40];
-- 
1.9.1
