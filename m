Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELhc-0004Yo-Uj
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:14:47 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 1/8] MTD: xway: convert to normal platform driver
Date: Sat, 18 Jun 2016 21:14:05 +0200
Message-Id: <1466277252-13867-2-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of hacking this into the plat_nand driver just make this a
normal nand driver.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/Kconfig     |   1 -
 drivers/mtd/nand/xway_nand.c | 119 ++++++++++++++++++++++++++++++-------------
 2 files changed, 84 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f05e0e9..d7de2c97 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -539,7 +539,6 @@ config MTD_NAND_FSMC
 config MTD_NAND_XWAY
 	tristate "Support for NAND on Lantiq XWAY SoC"
 	depends on LANTIQ && SOC_TYPE_XWAY
-	select MTD_NAND_PLATFORM
 	help
 	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
 	  to the External Bus Unit (EBU).
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 0cf0ac0..867a636 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -4,6 +4,7 @@
  *  by the Free Software Foundation.
  *
  *  Copyright © 2012 John Crispin <blogic@openwrt.org>
+ *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
 #include <linux/mtd/nand.h>
@@ -54,6 +55,10 @@
 #define NAND_CON_CSMUX		(1 << 1)
 #define NAND_CON_NANDM		1
 
+struct xway_nand_data {
+	struct nand_chip	chip;
+};
+
 static void xway_reset_chip(struct nand_chip *chip)
 {
 	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
@@ -130,14 +135,50 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	return ret;
 }
 
+/*
+ * Probe for the NAND device.
+ */
 static int xway_nand_probe(struct platform_device *pdev)
 {
-	struct nand_chip *this = platform_get_drvdata(pdev);
-	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-	const __be32 *cs = of_get_property(pdev->dev.of_node,
-					"lantiq,cs", NULL);
+	struct xway_nand_data *data;
+	struct mtd_info *mtd;
+	struct resource *res;
+	int err = 0;
+	void __iomem *nandaddr;
+	const __be32 *cs;
 	u32 cs_flag = 0;
 
+	/* Allocate memory for the device structure (and zero it) */
+	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nandaddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nandaddr))
+		return PTR_ERR(nandaddr);
+
+	nand_set_flash_node(&data->chip, pdev->dev.of_node);
+	mtd = nand_to_mtd(&data->chip);
+	mtd->dev.parent = &pdev->dev;
+
+	data->chip.IO_ADDR_R = nandaddr;
+	data->chip.IO_ADDR_W = nandaddr;
+	data->chip.cmd_ctrl = xway_cmd_ctrl;
+	data->chip.dev_ready = xway_dev_ready;
+	data->chip.select_chip = xway_select_chip;
+	data->chip.read_byte = xway_read_byte;
+	data->chip.chip_delay = 30;
+
+	data->chip.ecc.mode = NAND_ECC_SOFT;
+	data->chip.ecc.algo = NAND_ECC_HAMMING;
+
+	platform_set_drvdata(pdev, data);
+	nand_set_controller_data(&data->chip, data);
+
+	cs = of_get_property(pdev->dev.of_node, "lantiq,cs", NULL);
+
 	/* load our CS from the DT. Either we find a valid 1 or default to 0 */
 	if (cs && (*cs == 1))
 		cs_flag = NAND_CON_IN_CS1 | NAND_CON_OUT_CS1;
@@ -155,43 +196,51 @@ static int xway_nand_probe(struct platform_device *pdev)
 		| cs_flag, EBU_NAND_CON);
 
 	/* finish with a reset */
-	xway_reset_chip(this);
-
-	return 0;
-}
+	xway_reset_chip(&data->chip);
 
-static struct platform_nand_data xway_nand_data = {
-	.chip = {
-		.nr_chips		= 1,
-		.chip_delay		= 30,
-	},
-	.ctrl = {
-		.probe		= xway_nand_probe,
-		.cmd_ctrl	= xway_cmd_ctrl,
-		.dev_ready	= xway_dev_ready,
-		.select_chip	= xway_select_chip,
-		.read_byte	= xway_read_byte,
+	/* Scan to find existence of the device */
+	if (nand_scan(mtd, 1)) {
+		err = -ENXIO;
+		goto out;
 	}
-};
+
+	err = mtd_device_register(mtd, NULL, 0);
+
+	if (!err)
+		return 0;
+
+	nand_release(mtd);
+out:
+	return err;
+}
 
 /*
- * Try to find the node inside the DT. If it is available attach out
- * platform_nand_data
+ * Remove a NAND device.
  */
-static int __init xway_register_nand(void)
+static int xway_nand_remove(struct platform_device *pdev)
 {
-	struct device_node *node;
-	struct platform_device *pdev;
-
-	node = of_find_compatible_node(NULL, NULL, "lantiq,nand-xway");
-	if (!node)
-		return -ENOENT;
-	pdev = of_find_device_by_node(node);
-	if (!pdev)
-		return -EINVAL;
-	pdev->dev.platform_data = &xway_nand_data;
-	of_node_put(node);
+	struct xway_nand_data *data = platform_get_drvdata(pdev);
+
+	nand_release(nand_to_mtd(&data->chip));
+
 	return 0;
 }
 
-subsys_initcall(xway_register_nand);
+static const struct of_device_id xway_nand_match[] = {
+	{ .compatible = "lantiq,nand-xway" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, xway_nand_match);
+
+static struct platform_driver xway_nand_driver = {
+	.probe	= xway_nand_probe,
+	.remove	= xway_nand_remove,
+	.driver	= {
+		.name		= "lantiq,nand-xway",
+		.of_match_table = xway_nand_match,
+	},
+};
+
+module_platform_driver(xway_nand_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.8.1
