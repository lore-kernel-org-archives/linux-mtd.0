Received: from fallback5.mail.ru ([94.100.176.59])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6d7k-0006sf-70
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 09:00:13 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/4] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Tue,  6 Aug 2013 12:57:38 +0400
Message-Id: <1375779459-32549-1-git-send-email-shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, Alexander Shiyan <shc_work@mail.ru>,
 Grant Likely <grant.likely@linaro.org>,
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

This patch adds a property to automatically determine the NAND
bus width. This property works if the bus width is not specified
explicitly.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt        |  2 ++
 drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..91070d0 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -19,6 +19,8 @@ Optional properties:
   defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
+- gpio-control-nand,bank-width-auto : Device bus width is determined
+  automatically if "bank-width" is omitted (Boolean).
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
   location used to guard against bus reordering with regards to accesses to
   the GPIO's and the NAND flash data bus.  If present, then after changing
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..c75f92e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -116,6 +116,10 @@ static int gpio_nand_get_config_of(const struct device *dev,
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
+	} else {
+		if (of_get_property(dev->of_node,
+				    "gpio-control-nand,bank-width-auto", NULL))
+			plat->options |= NAND_BUSWIDTH_AUTO;
 	}
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
@@ -223,6 +227,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
@@ -230,10 +242,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
