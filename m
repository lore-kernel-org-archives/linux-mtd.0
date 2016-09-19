Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blulj-00060K-SN
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 09:21:45 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH] mtd: nand: pxa3xx_nand: write exactly one message on probe
 failure
Date: Mon, 19 Sep 2016 11:21:18 +0200
Message-Id: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some error paths alloc_nand_resource() emitted an error message, for
others it didn't. Make it consistently print a message including the
error code where it's not constant and drop the hardly helpful
additional message printed by the caller of alloc_nand_resource.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 436dd6dc11f4..052e9725cf12 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1774,8 +1774,11 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	int ret, irq, cs;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata->num_cs <= 0)
+	if (pdata->num_cs <= 0) {
+		dev_err(&pdev->dev, "broken number of chip selects\n");
 		return -ENODEV;
+	}
+
 	info = devm_kzalloc(&pdev->dev,
 			    sizeof(*info) + sizeof(*host) * pdata->num_cs,
 			    GFP_KERNEL);
@@ -1814,8 +1817,9 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	init_waitqueue_head(&chip->controller->wq);
 	info->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk)) {
-		dev_err(&pdev->dev, "failed to get nand clock\n");
-		return PTR_ERR(info->clk);
+		ret = PTR_ERR(info->clk);
+		dev_err(&pdev->dev, "failed to get nand clock (%d)\n", ret);
+		return ret;
 	}
 	ret = clk_prepare_enable(info->clk);
 	if (ret < 0)
@@ -1843,6 +1847,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	info->mmio_base = devm_ioremap_resource(&pdev->dev, r);
 	if (IS_ERR(info->mmio_base)) {
 		ret = PTR_ERR(info->mmio_base);
+		dev_err(&pdev->dev, "failed to map register space (%d)\n", ret);
 		goto fail_disable_clk;
 	}
 	info->mmio_phys = r->start;
@@ -1862,7 +1867,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 				   pxa3xx_nand_irq_thread, IRQF_ONESHOT,
 				   pdev->name, info);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ\n");
+		dev_err(&pdev->dev, "failed to request IRQ (%d)\n", ret);
 		goto fail_free_buf;
 	}
 
@@ -1961,10 +1966,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	}
 
 	ret = alloc_nand_resource(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "alloc nand resource failed\n");
+	if (ret)
 		return ret;
-	}
 
 	info = platform_get_drvdata(pdev);
 	probe_success = 0;
-- 
2.8.1
