Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1KH-0003g3-8L
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:50:21 +0000
Received: by pdbfa8 with SMTP id fa8so24216811pdb.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 15:50:00 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
Date: Thu, 13 Aug 2015 15:46:02 -0700
Message-Id: <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't really need the flash information from the device tree here.
Let's stick with autodetection here instead.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d32b7e04ccca..2a17ec6269ff 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1006,8 +1006,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
-		char modalias[40];
-
 		/* skip the holes */
 		if (!q->has_second_chip)
 			i *= 2;
@@ -1030,10 +1028,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		nor->prepare = fsl_qspi_prep;
 		nor->unprepare = fsl_qspi_unprep;
 
-		ret = of_modalias_node(np, modalias, sizeof(modalias));
-		if (ret < 0)
-			goto mutex_failed;
-
 		ret = of_property_read_u32(np, "spi-max-frequency",
 				&q->clk_rate);
 		if (ret < 0)
@@ -1042,7 +1036,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
 
-		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
+		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
 		if (ret)
 			goto mutex_failed;
 
-- 
2.5.0.276.gf5e568e
