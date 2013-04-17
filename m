Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNM-0000xa-6E
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:29 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/7] mtd: nand: pxa3xx: Use devm_ioremap_resource
Date: Wed, 17 Apr 2013 13:38:10 -0300
Message-Id: <1366216694-2365-4-git-send-email-ezequiel.garcia@free-electrons.com>
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

Using the new devm_ioremap_resource() we can greatly
simplify resource handling.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2f698e7..37d7a8b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1108,30 +1108,16 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (r == NULL) {
-		dev_err(&pdev->dev, "no IO memory resource defined\n");
-		ret = -ENODEV;
+	info->mmio_base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(info->mmio_base)) {
+		ret = PTR_ERR(info->mmio_base);
 		goto fail_put_clk;
 	}
-
-	r = request_mem_region(r->start, resource_size(r), pdev->name);
-	if (r == NULL) {
-		dev_err(&pdev->dev, "failed to request memory resource\n");
-		ret = -EBUSY;
-		goto fail_put_clk;
-	}
-
-	info->mmio_base = ioremap(r->start, resource_size(r));
-	if (info->mmio_base == NULL) {
-		dev_err(&pdev->dev, "ioremap() failed\n");
-		ret = -ENODEV;
-		goto fail_free_res;
-	}
 	info->mmio_phys = r->start;
 
 	ret = pxa3xx_nand_init_buff(info);
 	if (ret)
-		goto fail_free_io;
+		goto fail_put_clk;
 
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
@@ -1155,10 +1141,6 @@ fail_free_buf:
 			info->data_buff, info->data_buff_phys);
 	} else
 		kfree(info->data_buff);
-fail_free_io:
-	iounmap(info->mmio_base);
-fail_free_res:
-	release_mem_region(r->start, resource_size(r));
 fail_put_clk:
 	clk_disable(info->clk);
 	clk_put(info->clk);
@@ -1169,7 +1151,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
 	struct pxa3xx_nand_platform_data *pdata;
-	struct resource *r;
 	int irq, cs;
 
 	if (!info)
@@ -1188,10 +1169,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	} else
 		kfree(info->data_buff);
 
-	iounmap(info->mmio_base);
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(r->start, resource_size(r));
-
 	clk_disable(info->clk);
 	clk_put(info->clk);
 
-- 
1.8.1.5
