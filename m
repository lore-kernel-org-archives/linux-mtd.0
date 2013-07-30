Received: from smtp25.mail.ru ([94.100.176.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47lL-0002Qi-Os
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 11:06:45 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/4] mtd: nand: gpio: Use devm_gpio_request_one() where
 possible
Date: Tue, 30 Jul 2013 15:06:15 +0400
Message-Id: <1375182376-30043-1-git-send-email-shc_work@mail.ru>
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
index 674a790..e432f1d 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -187,14 +187,20 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
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
@@ -239,34 +245,33 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
 
@@ -281,8 +286,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpiomtd);
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
+	gpio_nand_set_wp(gpiomtd, 1);
 
 	if (nand_scan(&gpiomtd->mtd_info, 1)) {
 		ret = -ENXIO;
@@ -301,8 +305,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return 0;
 
 err_wp:
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
+	gpio_nand_set_wp(gpiomtd, 0);
 
 	return ret;
 }
-- 
1.8.1.5
