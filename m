Received: from smtp18.mail.ru ([94.100.176.155])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVnq7-0002q2-HI
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 18:57:57 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 6/7] mtd: nand-gpio: Rename internal variables to match
 functionality
Date: Fri, 26 Apr 2013 22:57:27 +0400
Message-Id: <1367002648-8269-6-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
References: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
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

struct platform_device *dev => pdev
struct nand_chip *this => chip

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 60 ++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 312c285..6bf8f2e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -186,9 +186,9 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
-static int gpio_nand_remove(struct platform_device *dev)
+static int gpio_nand_remove(struct platform_device *pdev)
 {
-	struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
+	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
 
 	nand_release(&gpiomtd->mtd_info);
 
@@ -199,82 +199,82 @@ static int gpio_nand_remove(struct platform_device *dev)
 	return 0;
 }
 
-static int gpio_nand_probe(struct platform_device *dev)
+static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd;
-	struct nand_chip *this;
+	struct nand_chip *chip;
 	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
 	int ret = 0;
 
-	if (!dev->dev.of_node && !dev->dev.platform_data)
+	if (!pdev->dev.of_node && !pdev->dev.platform_data)
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(&dev->dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = devm_kzalloc(&pdev->dev, sizeof(*gpiomtd), GFP_KERNEL);
 	if (!gpiomtd) {
-		dev_err(&dev->dev, "failed to create NAND MTD\n");
+		dev_err(&pdev->dev, "failed to create NAND MTD\n");
 		return -ENOMEM;
 	}
 
-	this = &gpiomtd->nand_chip;
+	chip = &gpiomtd->nand_chip;
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	this->IO_ADDR_R = devm_ioremap_resource(&dev->dev, res);
-	if (IS_ERR(this->IO_ADDR_R))
-		return PTR_ERR(this->IO_ADDR_R);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(chip->IO_ADDR_R))
+		return PTR_ERR(chip->IO_ADDR_R);
 
-	res = gpio_nand_get_io_sync(dev);
+	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
-		gpiomtd->io_sync = devm_ioremap_resource(&dev->dev, res);
+		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(gpiomtd->io_sync))
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(&dev->dev, &gpiomtd->plat);
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
 	if (ret)
 		return ret;
 
-	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
+	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
 		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
-		ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_nwp,
+		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
 					"NAND NWP");
 		if (ret)
 			return ret;
 	}
 
-	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
+	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
 	if (ret)
 		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_ale, 0);
 
-	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
+	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
 	if (ret)
 		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
-		ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_rdy,
+		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_rdy,
 					"NAND RDY");
 		if (ret)
 			return ret;
 		gpio_direction_input(gpiomtd->plat.gpio_rdy);
-		this->dev_ready = gpio_nand_devready;
+		chip->dev_ready = gpio_nand_devready;
 	}
 
-	this->IO_ADDR_W  = this->IO_ADDR_R;
-	this->ecc.mode   = NAND_ECC_SOFT;
-	this->options    = gpiomtd->plat.options;
-	this->chip_delay = gpiomtd->plat.chip_delay;
-	this->cmd_ctrl   = gpio_nand_cmd_ctrl;
+	chip->IO_ADDR_W		= chip->IO_ADDR_R;
+	chip->ecc.mode		= NAND_ECC_SOFT;
+	chip->options		= gpiomtd->plat.options;
+	chip->chip_delay	= gpiomtd->plat.chip_delay;
+	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
 
-	gpiomtd->mtd_info.priv = this;
-	gpiomtd->mtd_info.owner = THIS_MODULE;
+	gpiomtd->mtd_info.priv	= chip;
+	gpiomtd->mtd_info.owner	= THIS_MODULE;
 
-	platform_set_drvdata(dev, gpiomtd);
+	platform_set_drvdata(pdev, gpiomtd);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
@@ -288,7 +288,7 @@ static int gpio_nand_probe(struct platform_device *dev)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
 					   gpiomtd->mtd_info.size);
 
-	ppdata.of_node = dev->dev.of_node;
+	ppdata.of_node = pdev->dev.of_node;
 	ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
 					gpiomtd->plat.parts,
 					gpiomtd->plat.num_parts);
-- 
1.8.1.5
