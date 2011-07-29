Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qmkah-0006ON-B9
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2011 10:46:52 +0000
Received: by wyf23 with SMTP id 23so536030wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jul 2011 03:46:48 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2] mtd: gpio-nand: add device tree bindings
Date: Fri, 29 Jul 2011 11:46:31 +0100
Message-Id: <1311936391-20127-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add device tree bindings so that the gpio-nand driver may be
instantiated from the device tree.  This also allows the partitions
to be specified in the device tree.

v2:
	- add CONFIG_OF guards for non-dt platforms
	- compatible becomes gpio-control-nand
	- clarify some binding details

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |   40 ++++++++
 drivers/mtd/nand/gpio.c                            |  100 ++++++++++++++++++--
 2 files changed, 132 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
new file mode 100644
index 0000000..2dc52de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -0,0 +1,40 @@
+GPIO assisted NAND flash
+
+The GPIO assisted NAND flash uses a memory mapped interface to
+read/write the NAND commands and data and GPIO pins for the control
+signals.
+
+Required properties:
+- compatible : "gpio-control-nand"
+- reg : should specify localbus chip select and size used for the chip.  For
+  ARM platforms where a dummy read is needed to provide synchronisation with
+  regards to bus reordering, an optional second resource describes the
+  location to read from.
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.  In this case, both #address-cells and #size-cells
+  must be equal to 1.
+- gpios : specifies the gpio pins to control the NAND device.  nwp is an
+  optional gpio and may be set to 0 if not present.
+
+Optional properties:
+- bank-width : Width (in bytes) of the device.
+- chip-delay : chip dependent delay for transferring data from array to
+  read registers (tR).
+
+Examples:
+
+gpio-nand@1,0 {
+	compatible = "gpio-control-nand";
+	reg = <1 0x0000 0x1000>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	gpios = <&banka 1 0	/* rdy */
+		 &banka 2 0 	/* nce */
+		 &banka 3 0 	/* ale */
+		 &banka 4 0 	/* cle */
+		 0		/* nwp */>;
+
+	partition@0 {
+	...
+	};
+};
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 2c2060b..1373eab 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -27,6 +27,9 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/nand-gpio.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
 
 struct gpiomtd {
 	void __iomem		*io_sync;
@@ -221,14 +224,79 @@ static void __iomem *request_and_remap(struct resource *res, size_t size,
 	return ptr;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_nand_id_table[] = {
+	{ .compatible = "gpio-control-nand" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
+
+static int gpio_nand_of_get_options(struct device *dev,
+				    struct gpio_nand_platdata *plat)
+{
+	u32 width;
+
+	if (!of_property_read_u32(dev->of_node, "bank-width", &width)) {
+		if (width == 2) {
+			plat->options |= NAND_BUSWIDTH_16;
+		} else if (width != 1) {
+			dev_err(dev, "invalid bank-width %u\n", width);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void gpio_nand_of_get_gpio(struct device *dev,
+				  struct gpio_nand_platdata *plat)
+{
+	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
+	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
+	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
+	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
+	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
+}
+
+static void gpio_nand_of_get_chip_delay(struct device *dev,
+					struct gpio_nand_platdata *plat)
+{
+	u32 chip_delay;
+
+	if (!of_property_read_u32(dev->of_node, "chip-delay", &chip_delay))
+		plat->chip_delay = (int)chip_delay;
+}
+
+static int gpio_nand_of_get_config(struct device *dev,
+				   struct gpio_nand_platdata *plat)
+{
+	int ret = gpio_nand_of_get_options(dev, plat);
+
+	if (ret < 0)
+		return ret;
+
+	gpio_nand_of_get_gpio(dev, plat);
+	gpio_nand_of_get_chip_delay(dev, plat);
+
+	return 0;
+}
+#else /* CONFIG_OF */
+#define gpio_nand_id_table NULL
+static inline int gpio_nand_of_get_config(struct device *dev,
+					  struct gpio_nand_platdata *plat)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_OF */
+
 static int __devinit gpio_nand_probe(struct platform_device *dev)
 {
 	struct gpiomtd *gpiomtd;
 	struct nand_chip *this;
 	struct resource *res0, *res1;
-	int ret;
+	int ret = 0;
 
-	if (!dev->dev.platform_data)
+	if (!dev->dev.of_node && !dev->dev.platform_data)
 		return -EINVAL;
 
 	res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
@@ -257,11 +325,17 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		}
 	}
 
-	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
+	if (dev->dev.platform_data)
+		memcpy(&gpiomtd->plat, dev->dev.platform_data,
+		       sizeof(gpiomtd->plat));
+	else
+		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
+	if (ret)
+		goto err_config;
 
 	ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
-		goto err_nce;
+		goto err_config;
 	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
 		ret = gpio_request(gpiomtd->plat.gpio_nwp, "NAND NWP");
@@ -312,12 +386,21 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		goto err_wp;
 	}
 
-	if (gpiomtd->plat.adjust_parts)
-		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
-					   gpiomtd->mtd_info.size);
+	if (dev->dev.platform_data) {
+		if (gpiomtd->plat.adjust_parts)
+			gpiomtd->plat.adjust_parts(&gpiomtd->plat,
+						   gpiomtd->mtd_info.size);
+	} else {
+		ret = of_mtd_parse_partitions(&dev->dev, dev->dev.of_node,
+					      &gpiomtd->plat.parts);
+		if (ret < 0)
+			goto err_wp;
 
+		gpiomtd->plat.num_parts = (unsigned int)ret;
+	}
 	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
 			    gpiomtd->plat.num_parts);
+
 	platform_set_drvdata(dev, gpiomtd);
 
 	return 0;
@@ -335,7 +418,7 @@ err_ale:
 		gpio_free(gpiomtd->plat.gpio_nwp);
 err_nwp:
 	gpio_free(gpiomtd->plat.gpio_nce);
-err_nce:
+err_config:
 	iounmap(gpiomtd->io_sync);
 	if (res1)
 		release_mem_region(res1->start, resource_size(res1));
@@ -352,6 +435,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove		= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
+		.of_match_table = gpio_nand_id_table,
 	},
 };
 
-- 
1.7.4.1
