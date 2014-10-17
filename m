Received: from mail-yk0-x233.google.com ([2607:f8b0:4002:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfDv7-0003U9-FK
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 20:14:41 +0000
Received: by mail-yk0-f179.google.com with SMTP id 200so661192ykr.10
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 13:14:19 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd : fsl-quadspi: Let the clocks error path be clearer
Date: Fri, 17 Oct 2014 17:14:01 -0300
Message-Id: <1413576841-5707-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

When clk_prepare_enable(q->clk) fails it is clearer to disable the previous
acquired clock (q->clk_en) in the error path rather than doing it locally.

So disable q->clk_en in the error path only.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index e1c517d..8006f26 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -843,9 +843,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(q->clk);
 	if (ret) {
-		clk_disable_unprepare(q->clk_en);
 		dev_err(dev, "can not enable the qspi clock\n");
-		goto map_failed;
+		goto clk_failed;
 	}
 
 	/* find the irq */
@@ -966,6 +965,7 @@ last_init_failed:
 
 irq_failed:
 	clk_disable_unprepare(q->clk);
+clk_failed:
 	clk_disable_unprepare(q->clk_en);
 map_failed:
 	dev_err(dev, "Freescale QuadSPI probe failed\n");
-- 
1.9.1
