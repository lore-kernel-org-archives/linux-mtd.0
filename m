Received: from mail-bn1bbn0108.outbound.protection.outlook.com
 ([157.56.111.108] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMeFI-0001Rr-Ne
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:35:29 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <frank.li@freescale.com>,
 <han.xu@freescale.com>
Subject: [PATCH v4 09/10] mtd: spi-nor: fsl-quadspi: reset the module in the
 probe
Date: Tue, 4 Aug 2015 10:26:10 -0500
Message-ID: <1438701970-27245-1-git-send-email-b45815@freescale.com>
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

The uboot may run the QuadSpi controler with command:
    #sf probe

So we should reset the module in the probe.
This patch also clear the pending interrupts which arised by the uboot
code.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index c8e0eb6..d09fb28 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -716,6 +716,11 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	if (ret)
 		return ret;
 
+	/* Reset the module */
+	writel(QUADSPI_MCR_SWRSTSD_MASK | QUADSPI_MCR_SWRSTHD_MASK,
+		base + QUADSPI_MCR);
+	udelay(1);
+
 	/* Init the LUT table. */
 	fsl_qspi_init_lut(q);
 
@@ -733,6 +738,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
 			base + QUADSPI_MCR);
 
+	/* clear all interrupt status */
+	writel(0xffffffff, q->iobase + QUADSPI_FR);
+
 	/* enable the interrupt */
 	writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
 
-- 
1.9.1
