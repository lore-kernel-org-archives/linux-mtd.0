Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAax0-00052r-QY
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2015 09:38:35 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Han Xu <han.xu@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fsl-quadspi: Actually clear TX FIFO upon write
Date: Thu,  2 Jul 2015 11:37:56 +0200
Message-Id: <1435829876-18149-1-git-send-email-alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QUADSPI_MCR_CLR_TXF_MASK is the correct mask for clearing the TX FIFO.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5d5d362..d8349cd 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -537,7 +537,7 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 
 	/* clear the TX FIFO. */
 	tmp = readl(q->iobase + QUADSPI_MCR);
-	writel(tmp | QUADSPI_MCR_CLR_RXF_MASK, q->iobase + QUADSPI_MCR);
+	writel(tmp | QUADSPI_MCR_CLR_TXF_MASK, q->iobase + QUADSPI_MCR);
 
 	/* fill the TX data to the FIFO */
 	for (j = 0, i = ((count + 3) / 4); j < i; j++) {
-- 
2.3.6
