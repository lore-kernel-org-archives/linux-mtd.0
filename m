Received: from smtp39.i.mail.ru ([94.100.177.99])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyGvo-000429-0A
 for linux-mtd@lists.infradead.org; Wed, 01 Jan 2014 08:13:37 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: gpio: Determine bus width automatically
Date: Wed,  1 Jan 2014 12:13:03 +0400
Message-Id: <1388563983-23479-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch replaces the indication of bus width for NAND IC with
automatic bus width from the NAND core driver.
if the bus width is not specified explicitly.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |  2 --
 drivers/mtd/nand/gpio.c                            | 23 ++++++++++------------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..3c35617 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -15,8 +15,6 @@ Required properties:
   optional gpio and may be set to 0 if not present.
 
 Optional properties:
-- bank-width : Width (in bytes) of the device.  If not present, the width
-  defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e826f89..bc2219a 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -109,15 +109,6 @@ static int gpio_nand_get_config_of(const struct device *dev,
 	if (!dev->of_node)
 		return -ENODEV;
 
-	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
-		if (val == 2) {
-			plat->options |= NAND_BUSWIDTH_16;
-		} else if (val != 1) {
-			dev_err(dev, "invalid bank-width %u\n", val);
-			return -EINVAL;
-		}
-	}
-
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
 	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
 	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
@@ -223,6 +214,16 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->IO_ADDR_R))
 		return PTR_ERR(chip->IO_ADDR_R);
 
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
+	if (ret)
+		return ret;
+
+	/* Strip bus width options */
+	gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 | NAND_BUSWIDTH_AUTO);
+	/* Use auto bus width for more than 8-bit memory window */
+	if (resource_size(res) > 1)
+		gpiomtd->plat.options |= NAND_BUSWIDTH_AUTO;
+
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
 		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
@@ -230,10 +231,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
-	if (ret)
-		return ret;
-
 	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
 		return ret;
-- 
1.8.3.2
