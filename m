Received: from smtp46.i.mail.ru ([94.100.177.106])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47kq-0002Oc-F5
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 11:06:13 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/4] mtd: nand: gpio: Determine bus width automatically
Date: Tue, 30 Jul 2013 15:05:24 +0400
Message-Id: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, Alexander Shiyan <shc_work@mail.ru>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch provide automatically determine of NAND bus width if
"bank-width" parameter is ommited.
Patch depends on "mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices".

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt         |  4 ++--
 drivers/mtd/nand/gpio.c                                   | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..2ac14d8 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -15,8 +15,8 @@ Required properties:
   optional gpio and may be set to 0 if not present.
 
 Optional properties:
-- bank-width : Width (in bytes) of the device.  If not present, the width
-  defaults to 1 byte.
+- bank-width : Width (in bytes) of the device. If not present, the bus width
+  of the device is determined automatically.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..674a790 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -116,7 +116,8 @@ static int gpio_nand_get_config_of(const struct device *dev,
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
-	}
+	} else
+		plat->options |= NAND_BUSWIDTH_AUTO;
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
 	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
@@ -223,6 +224,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->IO_ADDR_R))
 		return PTR_ERR(chip->IO_ADDR_R);
 
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
+	if (ret)
+		return ret;
+
+	if (resource_size(res) < 2)
+		gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 |
+					   NAND_BUSWIDTH_AUTO);
+
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
 		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
@@ -230,10 +239,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
