Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8nuy-0003aO-O5
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 10:32:49 +0000
Received: by mail-vc0-f178.google.com with SMTP id hq11so353181vcb.23
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 02:32:26 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH v3 1/2] mtd: fsl-quadspi: Call fsl_qspi_set_base_addr after
 nor_size is set
Date: Wed,  7 Jan 2015 08:32:06 -0200
Message-Id: <1420626727-6929-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

fsl_qspi_set_base_addr() uses nor_size information, but it is called prior to
the initialization of nor_size.

Fix it by calling fsl_qspi_set_base_addr() after nor_size is configured.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v2:
- Newly introduced in this version

 drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 39763b9..20cffd2 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -897,9 +897,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		if (ret < 0)
 			goto map_failed;
 
-		/* set the chip address for READID */
-		fsl_qspi_set_base_addr(q, nor);
-
 		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
 		if (ret)
 			goto map_failed;
@@ -917,6 +914,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 			fsl_qspi_set_map_addr(q);
 		}
 
+		/* set the chip address for READID */
+		fsl_qspi_set_base_addr(q, nor);
+
 		/*
 		 * The TX FIFO is 64 bytes in the Vybrid, but the Page Program
 		 * may writes 265 bytes per time. The write is working in the
-- 
1.9.1
