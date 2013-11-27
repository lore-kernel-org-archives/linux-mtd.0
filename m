Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlcLq-0006jl-01
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 10:28:10 +0000
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-sh@vger.kernel.org
Subject: [PATCH] mtd: sh_flctl: Use devm_* managed allocators
Date: Wed, 27 Nov 2013 11:27:44 +0100
Message-Id: <1385548064-27234-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This simplifies error and cleanup code paths.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/mtd/nand/sh_flctl.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 0f135cb..50f1cb9 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1094,38 +1094,32 @@ static int flctl_probe(struct platform_device *pdev)
 	struct mtd_info *flctl_mtd;
 	struct nand_chip *nand;
 	struct sh_flctl_platform_data *pdata;
-	int ret = -ENXIO;
+	int ret;
 	int irq;
 	struct mtd_part_parser_data ppdata = {};
 
-	flctl = kzalloc(sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
 	if (!flctl) {
 		dev_err(&pdev->dev, "failed to allocate driver data\n");
 		return -ENOMEM;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "failed to get I/O memory\n");
-		goto err_iomap;
-	}
-
-	flctl->reg = ioremap(res->start, resource_size(res));
-	if (flctl->reg == NULL) {
-		dev_err(&pdev->dev, "failed to remap I/O memory\n");
-		goto err_iomap;
-	}
+	flctl->reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(flctl->reg))
+		return PTR_ERR(flctl->reg);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "failed to get flste irq data\n");
-		goto err_flste;
+		return -ENXIO;
 	}
 
-	ret = request_irq(irq, flctl_handle_flste, IRQF_SHARED, "flste", flctl);
+	ret = devm_request_irq(&pdev->dev, irq, flctl_handle_flste, IRQF_SHARED,
+			       "flste", flctl);
 	if (ret) {
 		dev_err(&pdev->dev, "request interrupt failed.\n");
-		goto err_flste;
+		return ret;
 	}
 
 	if (pdev->dev.of_node)
@@ -1135,8 +1129,7 @@ static int flctl_probe(struct platform_device *pdev)
 
 	if (!pdata) {
 		dev_err(&pdev->dev, "no setup data defined\n");
-		ret = -EINVAL;
-		goto err_pdata;
+		return -EINVAL;
 	}
 
 	platform_set_drvdata(pdev, flctl);
@@ -1190,12 +1183,6 @@ static int flctl_probe(struct platform_device *pdev)
 err_chip:
 	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
-err_pdata:
-	free_irq(irq, flctl);
-err_flste:
-	iounmap(flctl->reg);
-err_iomap:
-	kfree(flctl);
 	return ret;
 }
 
@@ -1206,9 +1193,6 @@ static int flctl_remove(struct platform_device *pdev)
 	flctl_release_dma(flctl);
 	nand_release(&flctl->mtd);
 	pm_runtime_disable(&pdev->dev);
-	free_irq(platform_get_irq(pdev, 0), flctl);
-	iounmap(flctl->reg);
-	kfree(flctl);
 
 	return 0;
 }
-- 
1.8.3.2
