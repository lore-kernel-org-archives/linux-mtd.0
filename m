Received: from mail-yh0-x22e.google.com ([2607:f8b0:4002:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfCJg-0004yR-SC
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 18:31:57 +0000
Received: by mail-yh0-f46.google.com with SMTP id f73so608167yha.33
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 11:31:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 1/2] mtd: fsl-quadspi: Propagate the error from
 of_modalias_node()
Date: Fri, 17 Oct 2014 15:31:08 -0300
Message-Id: <1413570669-30738-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 b45815@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

The 'map_failed' label will return 'ret', so we need to assign the error
code to 'ret', otherwise the probe function will return success.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 8d659a2..c5d10c3 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -906,7 +906,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		nor->prepare = fsl_qspi_prep;
 		nor->unprepare = fsl_qspi_unprep;
 
-		if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
+		ret = of_modalias_node(np, modalias, sizeof(modalias));
+		if (ret < 0)
 			goto map_failed;
 
 		id = spi_nor_match_id(modalias);
-- 
1.9.1
