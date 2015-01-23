Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YESLq-0001St-Ac
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 00:43:54 +0000
Received: by mail-qg0-f54.google.com with SMTP id q108so3998156qgd.13
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 16:43:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 2/3] mtd: fsl-quadspi: Remove unneeded success/error messages
Date: Thu, 22 Jan 2015 22:43:06 -0200
Message-Id: <1421973787-3240-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1421973787-3240-1-git-send-email-festevam@gmail.com>
References: <1421973787-3240-1-git-send-email-festevam@gmail.com>
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

When the driver successfully probe we already have messages like:

[    1.140989] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)               
[    1.150902] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)

Or in case of error:

[    1.175920] fsl-quadspi: probe of 21e4000.qspi failed with error -12

, so remove the unneeded success/error messages.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index a733bd2..1c0572a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -939,7 +939,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	clk_disable(q->clk);
 	clk_disable(q->clk_en);
-	dev_info(dev, "QuadSPI SPI NOR flash driver\n");
 	return 0;
 
 last_init_failed:
@@ -954,7 +953,6 @@ irq_failed:
 clk_failed:
 	clk_disable_unprepare(q->clk_en);
 map_failed:
-	dev_err(dev, "Freescale QuadSPI probe failed\n");
 	return ret;
 }
 
-- 
1.9.1
