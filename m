Received: from mail-bn1on0147.outbound.protection.outlook.com
 ([157.56.110.147] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIiSf-0003Ld-3z
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:16:50 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>, Huang Shijie <shijie8@gmail.com>
Subject: [PATCH v3 7/8] mtd: spi-nor: fsl-quadspi: reset the module in the
 probe
Date: Sat, 25 Jul 2015 02:06:27 +0800
Message-ID: <1437761188-8179-8-git-send-email-Frank.Li@freescale.com>
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
index 0ddc2d1..0f3f22d 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -715,6 +715,11 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	if (ret)
 		return ret;
 
+	/* Reset the module */
+	writel(QUADSPI_MCR_SWRSTSD_MASK | QUADSPI_MCR_SWRSTHD_MASK,
+		base + QUADSPI_MCR);
+	udelay(1);
+
 	/* Init the LUT table. */
 	fsl_qspi_init_lut(q);
 
@@ -732,6 +737,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
 			base + QUADSPI_MCR);
 
+	/* clear all interrupt status */
+	writel(0xffffffff, q->iobase + QUADSPI_FR);
+
 	/* enable the interrupt */
 	writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
 
-- 
1.9.1
