Received: from smtp39.i.mail.ru ([94.100.177.99])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1bi8-0000RR-O4
 for linux-mtd@lists.infradead.org; Tue, 23 Jul 2013 12:29:07 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
Date: Tue, 23 Jul 2013 16:28:16 +0400
Message-Id: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
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

This patch provide automatically determine of bus width. If resource size,
supplied to the driver more than 1 byte, the NAND_BUSWIDTH_AUTO option
will be used in the MTD core.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |  5 ++---
 drivers/mtd/nand/gpio.c                            | 23 +++++++++++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..287b8b8 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -8,15 +8,14 @@ Required properties:
 - compatible : "gpio-control-nand"
 - reg : should specify localbus chip select and size used for the chip.  The
   resource describes the data bus connected to the NAND flash and all accesses
-  are made in native endianness.
+  are made in native endianness. Bus width of the device is determined
+  automatically if size > 1. If size = 1, 8 bit bus width will be used.
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
 - gpios : specifies the gpio pins to control the NAND device.  nwp is an
   optional gpio and may be set to 0 if not present.
 
 Optional properties:
-- bank-width : Width (in bytes) of the device.  If not present, the width
-  defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..f144b80 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -109,14 +109,9 @@ static int gpio_nand_get_config_of(const struct device *dev,
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
+	/* Deprecated since 3.11-rc2 */
+	if (of_find_property(dev->of_node, "bank-width", NULL))
+		dev_notice(dev, "Property \"bank-width\" is deprecated");
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
 	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
@@ -223,6 +218,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->IO_ADDR_R))
 		return PTR_ERR(chip->IO_ADDR_R);
 
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
+	if (ret)
+		return ret;
+
+	gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 | NAND_BUSWIDTH_AUTO);
+	if (resource_size(res) > 1)
+		gpiomtd->plat.options |= NAND_BUSWIDTH_AUTO;
+
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
 		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
@@ -230,10 +233,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
1.8.1.5
