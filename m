Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YESLt-0001Sw-GM
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 00:43:58 +0000
Received: by mail-qg0-f44.google.com with SMTP id l89so4027846qgf.3
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 16:43:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 3/3] mtd: fsl-quadspi: Remove unnecessary 'map_failed' label
Date: Thu, 22 Jan 2015 22:43:07 -0200
Message-Id: <1421973787-3240-3-git-send-email-festevam@gmail.com>
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

There is no need to keep the 'map_failed' label. We can simply return the error
code directly and let the code shorter and cleaner.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 1c0572a..b1cc182 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -798,37 +798,30 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	/* find the resources */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "QuadSPI");
 	q->iobase = devm_ioremap_resource(dev, res);
-	if (IS_ERR(q->iobase)) {
-		ret = PTR_ERR(q->iobase);
-		goto map_failed;
-	}
+	if (IS_ERR(q->iobase))
+		return PTR_ERR(q->iobase);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					"QuadSPI-memory");
 	q->ahb_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(q->ahb_base)) {
-		ret = PTR_ERR(q->ahb_base);
-		goto map_failed;
-	}
+	if (IS_ERR(q->ahb_base))
+		return PTR_ERR(q->ahb_base);
+
 	q->memmap_phy = res->start;
 
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
-	if (IS_ERR(q->clk_en)) {
-		ret = PTR_ERR(q->clk_en);
-		goto map_failed;
-	}
+	if (IS_ERR(q->clk_en))
+		return PTR_ERR(q->clk_en);
 
 	q->clk = devm_clk_get(dev, "qspi");
-	if (IS_ERR(q->clk)) {
-		ret = PTR_ERR(q->clk);
-		goto map_failed;
-	}
+	if (IS_ERR(q->clk))
+		return PTR_ERR(q->clk);
 
 	ret = clk_prepare_enable(q->clk_en);
 	if (ret) {
 		dev_err(dev, "can not enable the qspi_en clock\n");
-		goto map_failed;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(q->clk);
@@ -952,7 +945,6 @@ irq_failed:
 	clk_disable_unprepare(q->clk);
 clk_failed:
 	clk_disable_unprepare(q->clk_en);
-map_failed:
 	return ret;
 }
 
-- 
1.9.1
