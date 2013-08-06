Received: from smtp31.i.mail.ru ([94.100.177.91])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6d7B-0006oR-Mo
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 08:59:40 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/4] mtd: nand: gpio: Use devm_gpio_request_one() where
 possible
Date: Tue,  6 Aug 2013 12:59:03 +0400
Message-Id: <1375779544-510-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1375779544-510-1-git-send-email-shc_work@mail.ru>
References: <1375779544-510-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index c75f92e..203db72 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -190,14 +190,20 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_set_wp(struct gpiomtd *gpiomtd, int val)
+{
+	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
+		gpio_set_value(gpiomtd->plat.gpio_nwp, val);
+}
+
 static int gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
 
 	nand_release(&gpiomtd->mtd_info);
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
+	gpio_nand_set_wp(gpiomtd, 0);
+
 	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
 
 	return 0;
@@ -242,34 +248,33 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nce,
+				    GPIOF_OUT_INIT_HIGH, "NAND NCE");
 	if (ret)
 		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
-		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
-					"NAND NWP");
+		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nwp,
+					    GPIOF_OUT_INIT_LOW, "NAND NWP");
 		if (ret)
 			return ret;
 	}
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_ale,
+				    GPIOF_OUT_INIT_LOW, "NAND ALE");
 	if (ret)
 		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_ale, 0);
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_cle,
+				    GPIOF_OUT_INIT_LOW, "NAND CLE");
 	if (ret)
 		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
-		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_rdy,
-					"NAND RDY");
+		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_rdy,
+					    GPIOF_IN, "NAND RDY");
 		if (ret)
 			return ret;
-		gpio_direction_input(gpiomtd->plat.gpio_rdy);
 		chip->dev_ready = gpio_nand_devready;
 	}
 
@@ -284,8 +289,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpiomtd);
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
+	gpio_nand_set_wp(gpiomtd, 1);
 
 	if (nand_scan(&gpiomtd->mtd_info, 1)) {
 		ret = -ENXIO;
@@ -304,8 +308,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return 0;
 
 err_wp:
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
+	gpio_nand_set_wp(gpiomtd, 0);
 
 	return ret;
 }
-- 
1.8.1.5
