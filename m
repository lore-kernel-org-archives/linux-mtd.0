Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RcDY8-0001Cr-TT
 for linux-mtd@lists.infradead.org; Sun, 18 Dec 2011 10:00:58 +0000
Received: by wera10 with SMTP id a10so1121681wer.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Dec 2011 02:00:53 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: gpio-nand: add device tree bindings
Date: Sun, 18 Dec 2011 10:00:49 +0000
Message-Id: <1324202449-13820-1-git-send-email-jamie@jamieiles.com>
Cc: Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@secretlab.ca>,
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

v7:	- restore runtime device tree/non device tree detection
v6:	- convert to mtd_device_parse_register()
v5:	- fold dt config helpers into a single gpio_nand_of_get_config()
v4:	- get io sync address from gpio-control-nand,io-sync-reg
	  property rather than a resource
	- clarified a few details in the binding
v3:	- remove redundant cast and a couple of whitespace/naming
	  changes
v2:	- add CONFIG_OF guards for non-dt platforms
	- compatible becomes gpio-control-nand
	- clarify some binding details

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |   44 ++++++++
 drivers/mtd/nand/gpio.c                            |  115 ++++++++++++++++++--
 2 files changed, 152 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
new file mode 100644
index 0000000..719f4dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -0,0 +1,44 @@
+GPIO assisted NAND flash
+
+The GPIO assisted NAND flash uses a memory mapped interface to
+read/write the NAND commands and data and GPIO pins for the control
+signals.
+
+Required properties:
+- compatible : "gpio-control-nand"
+- reg : should specify localbus chip select and size used for the chip.  The
+  resource describes the data bus connected to the NAND flash and all accesses
+  are made in native endianness.
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- gpios : specifies the gpio pins to control the NAND device.  nwp is an
+  optional gpio and may be set to 0 if not present.
+
+Optional properties:
+- bank-width : Width (in bytes) of the device.  If not present, the width
+  defaults to 1 byte.
+- chip-delay : chip dependent delay for transferring data from array to
+  read registers (tR).  If not present then a default of 20us is used.
+- gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
+  location used to guard against bus reordering with regards to accesses to
+  the GPIO's and the NAND flash data bus.  If present, then after changing
+  GPIO state and before and after command byte writes, this register will be
+  read to ensure that the GPIO accesses have completed.
+
+Examples:
+
+gpio-nand@1,0 {
+	compatible = "gpio-control-nand";
+	reg = <1 0x0000 0x2>;
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
index 2c2060b..d4b5609 100644
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
@@ -171,6 +174,96 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 	return gpio_get_value(gpiomtd->plat.gpio_rdy);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_nand_id_table[] = {
+	{ .compatible = "gpio-control-nand" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
+
+static int gpio_nand_get_config_of(const struct device *dev,
+				   struct gpio_nand_platdata *plat)
+{
+	u32 val;
+
+	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
+		if (val == 2) {
+			plat->options |= NAND_BUSWIDTH_16;
+		} else if (val != 1) {
+			dev_err(dev, "invalid bank-width %u\n", val);
+			return -EINVAL;
+		}
+	}
+
+	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
+	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
+	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
+	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
+	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
+
+	if (!of_property_read_u32(dev->of_node, "chip-delay", &val))
+		plat->chip_delay = val;
+
+	return 0;
+}
+
+static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
+{
+	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
+	u64 addr;
+
+	if (!r || of_property_read_u64(pdev->dev.of_node,
+				       "gpio-control-nand,io-sync-reg", &addr))
+		return NULL;
+
+	r->start = addr;
+	r->end = r->start + 0x3;
+	r->flags = IORESOURCE_MEM;
+
+	return r;
+}
+#else /* CONFIG_OF */
+#define gpio_nand_id_table NULL
+static inline int gpio_nand_get_config_of(const struct device *dev,
+					  struct gpio_nand_platdata *plat)
+{
+	return -ENOSYS;
+}
+
+static inline struct resource *
+gpio_nand_get_io_sync_of(struct platform_device *pdev)
+{
+	return NULL
+}
+#endif /* CONFIG_OF */
+
+static inline int gpio_nand_get_config(const struct device *dev,
+				       struct gpio_nand_platdata *plat)
+{
+	int ret = gpio_nand_get_config_of(dev, plat);
+
+	if (!ret)
+		return ret;
+
+	if (dev->platform_data) {
+		memcpy(plat, dev->platform_data, sizeof(*plat));
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static inline struct resource *
+gpio_nand_get_io_sync(struct platform_device *pdev)
+{
+	struct resource *r = gpio_nand_get_io_sync_of(pdev);
+
+	if (r)
+		return r;
+
+	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
+}
+
 static int __devexit gpio_nand_remove(struct platform_device *dev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
@@ -178,7 +271,7 @@ static int __devexit gpio_nand_remove(struct platform_device *dev)
 
 	nand_release(&gpiomtd->mtd_info);
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	res = gpio_nand_get_io_sync(dev);
 	iounmap(gpiomtd->io_sync);
 	if (res)
 		release_mem_region(res->start, resource_size(res));
@@ -226,9 +319,10 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 	struct gpiomtd *gpiomtd;
 	struct nand_chip *this;
 	struct resource *res0, *res1;
-	int ret;
+	struct mtd_part_parser_data ppdata = {};
+	int ret = 0;
 
-	if (!dev->dev.platform_data)
+	if (!dev->dev.of_node && !dev->dev.platform_data)
 		return -EINVAL;
 
 	res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
@@ -248,7 +342,7 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		goto err_map;
 	}
 
-	res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	res1 = gpio_nand_get_io_sync(dev);
 	if (res1) {
 		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
 		if (!gpiomtd->io_sync) {
@@ -257,7 +351,9 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		}
 	}
 
-	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
+	ret = gpio_nand_get_config(&dev->dev, &gpiomtd->plat);
+	if (ret)
+		goto err_nce;
 
 	ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
@@ -316,8 +412,12 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
 					   gpiomtd->mtd_info.size);
 
-	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
-			    gpiomtd->plat.num_parts);
+	ppdata.of_node = dev->dev.of_node;
+	ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
+					gpiomtd->plat.parts,
+					gpiomtd->plat.num_parts);
+	if (ret)
+		goto err_wp;
 	platform_set_drvdata(dev, gpiomtd);
 
 	return 0;
@@ -352,6 +452,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove		= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
+		.of_match_table = gpio_nand_id_table,
 	},
 };
 
-- 
1.7.5.4
