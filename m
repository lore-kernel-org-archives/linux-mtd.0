Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNP-0000y3-GQ
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] mtd: nand: pxa3xx: Use devm_clk_get
Date: Wed, 17 Apr 2013 13:38:11 -0300
Message-Id: <1366216694-2365-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Eric Miao <eric.miao@linaro.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replacing clk_get by managed devm_clk_get, the error path
can be greatly simplified.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 37d7a8b..b8af7b4 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1067,7 +1067,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 
 	spin_lock_init(&chip->controller->lock);
 	init_waitqueue_head(&chip->controller->wq);
-	info->clk = clk_get(&pdev->dev, NULL);
+	info->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk)) {
 		dev_err(&pdev->dev, "failed to get nand clock\n");
 		return PTR_ERR(info->clk);
@@ -1087,7 +1087,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		if (r == NULL) {
 			dev_err(&pdev->dev, "no resource defined for data DMA\n");
 			ret = -ENXIO;
-			goto fail_put_clk;
+			goto fail_disable_clk;
 		}
 		info->drcmr_dat = r->start;
 
@@ -1095,7 +1095,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		if (r == NULL) {
 			dev_err(&pdev->dev, "no resource defined for command DMA\n");
 			ret = -ENXIO;
-			goto fail_put_clk;
+			goto fail_disable_clk;
 		}
 		info->drcmr_cmd = r->start;
 	}
@@ -1104,20 +1104,20 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	if (irq < 0) {
 		dev_err(&pdev->dev, "no IRQ resource defined\n");
 		ret = -ENXIO;
-		goto fail_put_clk;
+		goto fail_disable_clk;
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	info->mmio_base = devm_ioremap_resource(&pdev->dev, r);
 	if (IS_ERR(info->mmio_base)) {
 		ret = PTR_ERR(info->mmio_base);
-		goto fail_put_clk;
+		goto fail_disable_clk;
 	}
 	info->mmio_phys = r->start;
 
 	ret = pxa3xx_nand_init_buff(info);
 	if (ret)
-		goto fail_put_clk;
+		goto fail_disable_clk;
 
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
@@ -1141,9 +1141,8 @@ fail_free_buf:
 			info->data_buff, info->data_buff_phys);
 	} else
 		kfree(info->data_buff);
-fail_put_clk:
+fail_disable_clk:
 	clk_disable(info->clk);
-	clk_put(info->clk);
 	return ret;
 }
 
@@ -1170,7 +1169,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 		kfree(info->data_buff);
 
 	clk_disable(info->clk);
-	clk_put(info->clk);
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
 		nand_release(info->host[cs]->mtd);
-- 
1.8.1.5
