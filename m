Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sxl5Z-0001Tz-NL
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2012 20:36:47 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] drivers/mtd/devices/spear_smi.c: use devm_ functions
 consistently
Date: Sat,  4 Aug 2012 22:36:38 +0200
Message-Id: <1344112598-1051-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use devm_kzalloc for all calls to kzalloc and not just the first.  Use devm
functions for other allocations as well.

Move the call to platform_get_resource(pdev, IORESOURCE_MEM, 0) closer to
where its result is passed to devm_request_and_ioremap to make the lack of
need for a NULL test more evident.

The semantic match that finds the inconsistency is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

*devm_kzalloc(...)
...
*kzalloc(...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/spear_smi.c |   72 +++++++++-------------------------------
 1 file changed, 17 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index b85f183..f889fad 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -827,7 +827,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 	if (!flash_info)
 		return -ENODEV;
 
-	flash = kzalloc(sizeof(*flash), GFP_ATOMIC);
+	flash = devm_kzalloc(&pdev->dev, sizeof(*flash), GFP_ATOMIC);
 	if (!flash)
 		return -ENOMEM;
 	flash->bank = bank;
@@ -838,15 +838,13 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 	flash_index = spear_smi_probe_flash(dev, bank);
 	if (flash_index < 0) {
 		dev_info(&dev->pdev->dev, "smi-nor%d not found\n", bank);
-		ret = flash_index;
-		goto err_probe;
+		return flash_index;
 	}
 	/* map the memory for nor flash chip */
-	flash->base_addr = ioremap(flash_info->mem_base, flash_info->size);
-	if (!flash->base_addr) {
-		ret = -EIO;
-		goto err_probe;
-	}
+	flash->base_addr = devm_ioremap(&pdev->dev, flash_info->mem_base,
+					flash_info->size);
+	if (!flash->base_addr)
+		return -EIO;
 
 	dev->flash[bank] = flash;
 	flash->mtd.priv = dev;
@@ -888,17 +886,10 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 					count);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "Err MTD partition=%d\n", ret);
-		goto err_map;
+		return ret;
 	}
 
 	return 0;
-
-err_map:
-	iounmap(flash->base_addr);
-
-err_probe:
-	kfree(flash);
-	return ret;
 }
 
 /**
@@ -942,13 +933,6 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		}
 	}
 
-	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!smi_base) {
-		ret = -ENODEV;
-		dev_err(&pdev->dev, "invalid smi base address\n");
-		goto err;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
@@ -956,26 +940,20 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	dev = kzalloc(sizeof(*dev), GFP_ATOMIC);
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
 	if (!dev) {
 		ret = -ENOMEM;
 		dev_err(&pdev->dev, "mem alloc fail\n");
 		goto err;
 	}
 
-	smi_base = request_mem_region(smi_base->start, resource_size(smi_base),
-			pdev->name);
-	if (!smi_base) {
-		ret = -EBUSY;
-		dev_err(&pdev->dev, "request mem region fail\n");
-		goto err_mem;
-	}
+	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	dev->io_base = ioremap(smi_base->start, resource_size(smi_base));
+	dev->io_base = devm_request_and_ioremap(&pdev->dev, smi_base);
 	if (!dev->io_base) {
 		ret = -EIO;
-		dev_err(&pdev->dev, "ioremap fail\n");
-		goto err_ioremap;
+		dev_err(&pdev->dev, "devm_request_and_ioremap fail\n");
+		goto err;
 	}
 
 	dev->pdev = pdev;
@@ -991,17 +969,18 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		dev->num_flashes = MAX_NUM_FLASH_CHIP;
 	}
 
-	dev->clk = clk_get(&pdev->dev, NULL);
+	dev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
-		goto err_clk;
+		goto err;
 	}
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret)
-		goto err_clk_prepare_enable;
+		goto err;
 
-	ret = request_irq(irq, spear_smi_int_handler, 0, pdev->name, dev);
+	ret = devm_request_irq(&pdev->dev, irq, spear_smi_int_handler, 0,
+			       pdev->name, dev);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "SMI IRQ allocation failed\n");
 		goto err_irq;
@@ -1024,18 +1003,9 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 	return 0;
 
 err_bank_setup:
-	free_irq(irq, dev);
 	platform_set_drvdata(pdev, NULL);
 err_irq:
 	clk_disable_unprepare(dev->clk);
-err_clk_prepare_enable:
-	clk_put(dev->clk);
-err_clk:
-	iounmap(dev->io_base);
-err_ioremap:
-	release_mem_region(smi_base->start, resource_size(smi_base));
-err_mem:
-	kfree(dev);
 err:
 	return ret;
 }
@@ -1073,21 +1043,13 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 		ret = mtd_device_unregister(&flash->mtd);
 		if (ret)
 			dev_err(&pdev->dev, "error removing mtd\n");
-
-		iounmap(flash->base_addr);
-		kfree(flash);
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	free_irq(irq, dev);
 
 	clk_disable_unprepare(dev->clk);
-	clk_put(dev->clk);
-	iounmap(dev->io_base);
-	kfree(dev);
 
 	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(smi_base->start, resource_size(smi_base));
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
