Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCJYi-0004J5-Qh
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2018 07:14:30 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: Fix the return value in case
 of error in 'cqspi_direct_read_execute()'
Date: Tue, 16 Oct 2018 09:13:46 +0200
Message-Id: <20181016071346.25383-1-christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We return 0 unconditionally in 'cqspi_direct_read_execute()'.
However, 'ret' is set to some error codes in several error handling paths.

Return 'ret' instead to propagate the error code.

Fixes: ffa639e069fb ("mtd: spi-nor: cadence-quadspi: Add DMA support for direct mode reads")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 8e714fbfa521..6e9cbd1a0b6d 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -996,7 +996,7 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
 err_unmap:
 	dma_unmap_single(nor->dev, dma_dst, len, DMA_DEV_TO_MEM);
 
-	return 0;
+	return ret;
 }
 
 static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
-- 
2.17.1
