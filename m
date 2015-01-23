Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YESLn-0001Sj-8n
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 00:43:51 +0000
Received: by mail-qg0-f49.google.com with SMTP id i50so4004847qgf.8
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 16:43:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 1/3] mtd: fsl-quadspi: Fix the error paths
Date: Thu, 22 Jan 2015 22:43:05 -0200
Message-Id: <1421973787-3240-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Jumping to 'map_failed' label is not correct at these points, as it misses to
disable the clocks that were previously enabled.

Jump to 'irq_failed' label instead that will correctly disable the clocks.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index a46bea3..a733bd2 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -890,24 +890,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 		ret = of_modalias_node(np, modalias, sizeof(modalias));
 		if (ret < 0)
-			goto map_failed;
+			goto irq_failed;
 
 		ret = of_property_read_u32(np, "spi-max-frequency",
 				&q->clk_rate);
 		if (ret < 0)
-			goto map_failed;
+			goto irq_failed;
 
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
 
 		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
 		if (ret)
-			goto map_failed;
+			goto irq_failed;
 
 		ppdata.of_node = np;
 		ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
 		if (ret)
-			goto map_failed;
+			goto irq_failed;
 
 		/* Set the correct NOR size now. */
 		if (q->nor_size == 0) {
-- 
1.9.1
