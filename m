Received: from smtp41.i.mail.ru ([94.100.177.101])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZLs8-0004ll-5u
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 13:54:41 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH v2 1/7] mtd: nand-gpio: Convert driver to using
 resource-managed functions
Date: Mon,  6 May 2013 17:53:48 +0400
Message-Id: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
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

Patch converts driver to using resource-managed functions.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 130 ++++++++++++++----------------------------------
 1 file changed, 38 insertions(+), 92 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 89065dd..c35f46e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -233,119 +234,81 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 static int gpio_nand_remove(struct platform_device *dev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
-	struct resource *res;
 
 	nand_release(&gpiomtd->mtd_info);
 
-	res = gpio_nand_get_io_sync(dev);
-	iounmap(gpiomtd->io_sync);
-	if (res)
-		release_mem_region(res->start, resource_size(res));
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
-	release_mem_region(res->start, resource_size(res));
-
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
 	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
 
-	gpio_free(gpiomtd->plat.gpio_cle);
-	gpio_free(gpiomtd->plat.gpio_ale);
-	gpio_free(gpiomtd->plat.gpio_nce);
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_free(gpiomtd->plat.gpio_nwp);
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
-		gpio_free(gpiomtd->plat.gpio_rdy);
-
 	return 0;
 }
 
-static void __iomem *request_and_remap(struct resource *res, size_t size,
-					const char *name, int *err)
-{
-	void __iomem *ptr;
-
-	if (!request_mem_region(res->start, resource_size(res), name)) {
-		*err = -EBUSY;
-		return NULL;
-	}
-
-	ptr = ioremap(res->start, size);
-	if (!ptr) {
-		release_mem_region(res->start, resource_size(res));
-		*err = -ENOMEM;
-	}
-	return ptr;
-}
-
 static int gpio_nand_probe(struct platform_device *dev)
 {
 	struct gpiomtd *gpiomtd;
 	struct nand_chip *this;
-	struct resource *res0, *res1;
+	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
 	int ret = 0;
 
 	if (!dev->dev.of_node && !dev->dev.platform_data)
 		return -EINVAL;
 
-	res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res0)
-		return -EINVAL;
-
 	gpiomtd = devm_kzalloc(&dev->dev, sizeof(*gpiomtd), GFP_KERNEL);
-	if (gpiomtd == NULL) {
+	if (!gpiomtd) {
 		dev_err(&dev->dev, "failed to create NAND MTD\n");
 		return -ENOMEM;
 	}
 
 	this = &gpiomtd->nand_chip;
-	this->IO_ADDR_R = request_and_remap(res0, 2, "NAND", &ret);
-	if (!this->IO_ADDR_R) {
-		dev_err(&dev->dev, "unable to map NAND\n");
-		goto err_map;
-	}
 
-	res1 = gpio_nand_get_io_sync(dev);
-	if (res1) {
-		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
-		if (!gpiomtd->io_sync) {
-			dev_err(&dev->dev, "unable to map sync NAND\n");
-			goto err_sync;
-		}
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	this->IO_ADDR_R = devm_ioremap_resource(&dev->dev, res);
+	if (IS_ERR(this->IO_ADDR_R))
+		return PTR_ERR(this->IO_ADDR_R);
+
+	res = gpio_nand_get_io_sync(dev);
+	if (res) {
+		gpiomtd->io_sync = devm_ioremap_resource(&dev->dev, res);
+		if (IS_ERR(gpiomtd->io_sync))
+			return PTR_ERR(gpiomtd->io_sync);
 	}
 
 	ret = gpio_nand_get_config(&dev->dev, &gpiomtd->plat);
 	if (ret)
-		goto err_nce;
+		return ret;
 
-	ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
+	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
-		goto err_nce;
+		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
+
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
-		ret = gpio_request(gpiomtd->plat.gpio_nwp, "NAND NWP");
+		ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_nwp,
+					"NAND NWP");
 		if (ret)
-			goto err_nwp;
-		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
+			return ret;
 	}
-	ret = gpio_request(gpiomtd->plat.gpio_ale, "NAND ALE");
+
+	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
 	if (ret)
-		goto err_ale;
+		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_ale, 0);
-	ret = gpio_request(gpiomtd->plat.gpio_cle, "NAND CLE");
+
+	ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
 	if (ret)
-		goto err_cle;
+		return ret;
 	gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
+
 	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
-		ret = gpio_request(gpiomtd->plat.gpio_rdy, "NAND RDY");
+		ret = devm_gpio_request(&dev->dev, gpiomtd->plat.gpio_rdy,
+					"NAND RDY");
 		if (ret)
-			goto err_rdy;
+			return ret;
 		gpio_direction_input(gpiomtd->plat.gpio_rdy);
 	}
 
-
 	this->IO_ADDR_W  = this->IO_ADDR_R;
 	this->ecc.mode   = NAND_ECC_SOFT;
 	this->options    = gpiomtd->plat.options;
@@ -367,8 +330,12 @@ static int gpio_nand_probe(struct platform_device *dev)
 	gpiomtd->mtd_info.priv = this;
 	gpiomtd->mtd_info.owner = THIS_MODULE;
 
+	platform_set_drvdata(dev, gpiomtd);
+
+	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
+		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
+
 	if (nand_scan(&gpiomtd->mtd_info, 1)) {
-		dev_err(&dev->dev, "no nand chips found?\n");
 		ret = -ENXIO;
 		goto err_wp;
 	}
@@ -381,34 +348,13 @@ static int gpio_nand_probe(struct platform_device *dev)
 	ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
 					gpiomtd->plat.parts,
 					gpiomtd->plat.num_parts);
-	if (ret)
-		goto err_wp;
-	platform_set_drvdata(dev, gpiomtd);
-
-	return 0;
+	if (!ret)
+		return 0;
 
 err_wp:
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
-		gpio_free(gpiomtd->plat.gpio_rdy);
-err_rdy:
-	gpio_free(gpiomtd->plat.gpio_cle);
-err_cle:
-	gpio_free(gpiomtd->plat.gpio_ale);
-err_ale:
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_free(gpiomtd->plat.gpio_nwp);
-err_nwp:
-	gpio_free(gpiomtd->plat.gpio_nce);
-err_nce:
-	iounmap(gpiomtd->io_sync);
-	if (res1)
-		release_mem_region(res1->start, resource_size(res1));
-err_sync:
-	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
-	release_mem_region(res0->start, resource_size(res0));
-err_map:
+
 	return ret;
 }
 
-- 
1.8.1.5
