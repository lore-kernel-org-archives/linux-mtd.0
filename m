Received: from mail-bn1on0137.outbound.protection.outlook.com
 ([157.56.110.137] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBtrI-00017M-Jp
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 23:29:49 +0000
From: Han Xu <han.xu@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] mtd: fsl-quadspi: Access multiple chips simultaneously
Date: Fri, 16 Jan 2015 07:26:55 +0800
Message-ID: <1421364415-13865-1-git-send-email-han.xu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, shijie8@gmail.com,
 Han Xu <han.xu@freescale.com>
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

Signed-off-by: Han Xu <han.xu@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 39763b9..7964511 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/mutex.h>
 
 /* The registers */
 #define QUADSPI_MCR			0x00
@@ -227,6 +228,7 @@ struct fsl_qspi {
 	u32 nor_num;
 	u32 clk_rate;
 	unsigned int chip_base_addr; /* We may support two chips. */
+	struct mutex lock;
 };
 
 static inline int is_vybrid_qspi(struct fsl_qspi *q)
@@ -751,6 +753,8 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	struct fsl_qspi *q = nor->priv;
 	int ret;
 
+	mutex_lock(&q->lock);
+
 	ret = clk_enable(q->clk_en);
 	if (ret)
 		return ret;
@@ -771,6 +775,7 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 	clk_disable(q->clk);
 	clk_disable(q->clk_en);
+	mutex_unlock(&q->lock);
 }
 
 static int fsl_qspi_probe(struct platform_device *pdev)
@@ -862,6 +867,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
 		has_second_chip = true;
 
+	mutex_init(&q->lock);
+
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
 		char modalias[40];
-- 
1.7.8
