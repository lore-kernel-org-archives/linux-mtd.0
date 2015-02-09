Received: from mail-bl2on0108.outbound.protection.outlook.com ([65.55.169.108]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKn8B-00024J-OD
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 12:08:00 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] mtd: fsl-quadspi: Print the error value
Date: Mon, 9 Feb 2015 10:07:19 -0200
Message-ID: <1423483639-4305-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When displaying dev_err() messages it is useful to print the error value.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 1c7308c..78b1b33 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -830,27 +830,27 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(q->clk_en);
 	if (ret) {
-		dev_err(dev, "can not enable the qspi_en clock\n");
+		dev_err(dev, "can not enable the qspi_en clock: %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(q->clk);
 	if (ret) {
-		dev_err(dev, "can not enable the qspi clock\n");
+		dev_err(dev, "can not enable the qspi clock: %d\n", ret);
 		goto clk_failed;
 	}
 
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0) {
-		dev_err(dev, "failed to get the irq\n");
+		dev_err(dev, "failed to get the irq: %d\n", ret);
 		goto irq_failed;
 	}
 
 	ret = devm_request_irq(dev, ret,
 			fsl_qspi_irq_handler, 0, pdev->name, q);
 	if (ret) {
-		dev_err(dev, "failed to request irq.\n");
+		dev_err(dev, "failed to request irq: %d\n", ret);
 		goto irq_failed;
 	}
 
-- 
1.9.1
