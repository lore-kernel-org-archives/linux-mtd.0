Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOB-0006OZ-Rs
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 23/39] mtd: nand: denali_dt: use pdev instead of ofdev for
 platform_device
Date: Sun, 27 Nov 2016 03:06:09 +0900
Message-Id: <1480183585-592-24-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"pdev" is much more often used for platform_device, so this will
help the driver code look consistent across the kernel.

While we are here, fix "line over 80 characters" coding style
violations.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali_dt.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 6a486a7..f085626 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -40,7 +40,7 @@ static const struct of_device_id denali_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
-static int denali_dt_probe(struct platform_device *ofdev)
+static int denali_dt_probe(struct platform_device *pdev)
 {
 	struct resource *denali_reg, *nand_data;
 	struct denali_dt *dt;
@@ -48,38 +48,40 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	struct denali_nand_info *denali;
 	int ret;
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = devm_kzalloc(&pdev->dev, sizeof(*dt), GFP_KERNEL);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->denali;
 
-	data = of_device_get_match_data(&ofdev->dev);
+	data = of_device_get_match_data(&pdev->dev);
 	if (data)
 		denali->caps = data->caps;
 
 	denali->caps |= DENALI_CAPS_HW_ECC_FIXUP;
 
 	denali->platform = DT;
-	denali->dev = &ofdev->dev;
-	denali->irq = platform_get_irq(ofdev, 0);
+	denali->dev = &pdev->dev;
+	denali->irq = platform_get_irq(pdev, 0);
 	if (denali->irq < 0) {
-		dev_err(&ofdev->dev, "no irq defined\n");
+		dev_err(&pdev->dev, "no irq defined\n");
 		return denali->irq;
 	}
 
-	denali_reg = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "denali_reg");
-	denali->flash_reg = devm_ioremap_resource(&ofdev->dev, denali_reg);
+	denali_reg = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						  "denali_reg");
+	denali->flash_reg = devm_ioremap_resource(&pdev->dev, denali_reg);
 	if (IS_ERR(denali->flash_reg))
 		return PTR_ERR(denali->flash_reg);
 
-	nand_data = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand_data");
-	denali->flash_mem = devm_ioremap_resource(&ofdev->dev, nand_data);
+	nand_data = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						 "nand_data");
+	denali->flash_mem = devm_ioremap_resource(&pdev->dev, nand_data);
 	if (IS_ERR(denali->flash_mem))
 		return PTR_ERR(denali->flash_mem);
 
-	dt->clk = devm_clk_get(&ofdev->dev, NULL);
+	dt->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
-		dev_err(&ofdev->dev, "no clk available\n");
+		dev_err(&pdev->dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
 	}
 	clk_prepare_enable(dt->clk);
@@ -88,7 +90,7 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	if (ret)
 		goto out_disable_clk;
 
-	platform_set_drvdata(ofdev, dt);
+	platform_set_drvdata(pdev, dt);
 	return 0;
 
 out_disable_clk:
@@ -97,9 +99,9 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int denali_dt_remove(struct platform_device *ofdev)
+static int denali_dt_remove(struct platform_device *pdev)
 {
-	struct denali_dt *dt = platform_get_drvdata(ofdev);
+	struct denali_dt *dt = platform_get_drvdata(pdev);
 
 	denali_remove(&dt->denali);
 	clk_disable_unprepare(dt->clk);
-- 
2.7.4
