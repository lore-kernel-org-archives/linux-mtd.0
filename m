Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Ue6-0002Ut-C0
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 10:44:31 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] MTD: Add device-tree support to spear_smi
Date: Fri, 16 Mar 2012 11:42:11 +0100
Message-Id: <1331894531-21411-1-git-send-email-sr@denx.de>
Cc: Viresh Kumar <viresh.kumar@st.com>, devicetree-discuss@ozlabs.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support to configure the SPEAr SMI driver via
device-tree instead of platform_data.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Viresh Kumar <viresh.kumar@st.com>
---
 .../devicetree/bindings/mtd/spear_smi.txt          |   31 ++++++
 drivers/mtd/devices/spear_smi.c                    |  111 +++++++++++++++++---
 include/linux/mtd/spear_smi.h                      |    5 +
 3 files changed, 135 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/spear_smi.txt

diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
new file mode 100644
index 0000000..7248aad
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spear_smi.txt
@@ -0,0 +1,31 @@
+* SPEAr SMI
+
+Required properties:
+- compatible : "st,spear600-smi"
+- reg : Address range of the mtd chip
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device
+- interrupts: Should contain the STMMAC interrupts
+- clock-rate : Functional clock rate of SMI in Hz
+
+Optional properties:
+- st,smi-fast-mode : Flash supports read in fast mode
+
+Example:
+
+	smi: flash@fc000000 {
+		compatible = "st,spear600-smi";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0xfc000000 0x1000>;
+		interrupt-parent = <&vic1>;
+		interrupts = <12>;
+		clock-rate = <50000000>;	/* 50MHz */
+
+		flash@f8000000 {
+			st,smi-fast-mode;
+			...
+		};
+	};
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 94c5cd9..bebce11 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -35,9 +35,8 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
-
-/* max possible slots for serial-nor flash chip in the SMI controller */
-#define MAX_NUM_FLASH_CHIP	4
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 /* SMI clock rate */
 #define SMI_MAX_CLOCK_FREQ	50000000 /* 50 MHz */
@@ -750,9 +749,63 @@ err_probe:
 	return ret;
 }
 
-static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
+
+#ifdef CONFIG_OF
+static int __devinit spear_smi_probe_config_dt(struct platform_device *pdev,
+					       struct device_node *np)
+{
+	struct spear_smi_plat_data *pdata = dev_get_platdata(&pdev->dev);
+	struct device_node *pp = NULL;
+	const __be32 *addr;
+	u32 val;
+	int len;
+	int i = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	of_property_read_u32(np, "clock-rate", &val);
+	pdata->clk_rate = val;
+
+	pdata->board_flash_info = devm_kzalloc(&pdev->dev,
+					       sizeof(*pdata->board_flash_info),
+					       GFP_KERNEL);
+
+	/* Fill structs for each subnode (flash device) */
+	while ((pp = of_get_next_child(np, pp))) {
+		struct spear_smi_flash_info *flash_info;
+
+		flash_info = &pdata->board_flash_info[i];
+		pdata->np[i] = pp;
+
+		/* Read base-addr and size from DT */
+		addr = of_get_property(pp, "reg", &len);
+		pdata->board_flash_info->mem_base = be32_to_cpup(&addr[0]);
+		pdata->board_flash_info->size = be32_to_cpup(&addr[1]);
+
+		if (of_get_property(pp, "st,smi-fast-mode", NULL))
+			pdata->board_flash_info->fast_mode = 1;
+
+		i++;
+	}
+
+	pdata->num_flashes = i;
+
+	return 0;
+}
+#else
+static int __devinit spear_smi_probe_config_dt(struct platform_device *pdev,
+					       struct device_node *np)
+{
+	return -ENOSYS;
+}
+#endif
+
+static int spear_smi_setup_banks(struct platform_device *pdev,
+				 u32 bank, struct device_node *np)
 {
 	struct spear_smi *dev = platform_get_drvdata(pdev);
+	struct mtd_part_parser_data ppdata = {};
 	struct spear_smi_flash_info *flash_info;
 	struct spear_smi_plat_data *pdata;
 	struct spear_snor_flash *flash;
@@ -818,11 +871,16 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 	dev_info(&dev->pdev->dev, ".erasesize = 0x%x(%uK)\n",
 			flash->mtd.erasesize, flash->mtd.erasesize / 1024);
 
+#ifndef CONFIG_OF
 	if (flash_info->partitions) {
 		parts = flash_info->partitions;
 		count = flash_info->nr_partitions;
 	}
-	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL, parts, count);
+#endif
+	ppdata.of_node = np;
+
+	ret = mtd_device_parse_register(&flash->mtd, NULL, &ppdata, parts,
+					count);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "Err MTD partition=%d\n", ret);
 		goto err_map;
@@ -849,17 +907,34 @@ err_probe:
  */
 static int __devinit spear_smi_probe(struct platform_device *pdev)
 {
-	struct spear_smi_plat_data *pdata;
+	struct device_node *np = pdev->dev.of_node;
+	struct spear_smi_plat_data *pdata = NULL;
 	struct spear_smi *dev;
 	struct resource *smi_base;
 	int irq, ret = 0;
 	int i;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata < 0) {
-		ret = -ENODEV;
-		dev_err(&pdev->dev, "no platform data\n");
-		goto err;
+	if (np) {
+		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata) {
+			pr_err("%s: ERROR: no memory", __func__);
+			ret = -ENOMEM;
+			goto err;
+		}
+		pdev->dev.platform_data = pdata;
+		ret = spear_smi_probe_config_dt(pdev, np);
+		if (ret) {
+			ret = -ENODEV;
+			dev_err(&pdev->dev, "no platform data\n");
+			goto err;
+		}
+	} else {
+		pdata = dev_get_platdata(&pdev->dev);
+		if (pdata < 0) {
+			ret = -ENODEV;
+			dev_err(&pdev->dev, "no platform data\n");
+			goto err;
+		}
 	}
 
 	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -934,7 +1009,7 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 
 	/* loop for each serial nor-flash which is connected to smi */
 	for (i = 0; i < dev->num_flashes; i++) {
-		ret = spear_smi_setup_banks(pdev, i);
+		ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "bank setup failed\n");
 			goto err_bank_setup;
@@ -969,6 +1044,7 @@ err:
 static int __devexit spear_smi_remove(struct platform_device *pdev)
 {
 	struct spear_smi *dev;
+	struct spear_smi_plat_data *pdata;
 	struct spear_snor_flash *flash;
 	struct resource *smi_base;
 	int ret;
@@ -980,6 +1056,8 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	pdata = dev_get_platdata(&pdev->dev);
+
 	/* clean up for all nor flash */
 	for (i = 0; i < dev->num_flashes; i++) {
 		flash = dev->flash[i];
@@ -1033,11 +1111,20 @@ int spear_smi_resume(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id spear_smi_id_table[] = {
+	{ .compatible = "st,spear600-smi" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, spear_smi_id_table);
+#endif
+
 static struct platform_driver spear_smi_driver = {
 	.driver = {
 		.name = "smi",
 		.bus = &platform_bus_type,
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(spear_smi_id_table),
 	},
 	.probe = spear_smi_probe,
 	.remove = __devexit_p(spear_smi_remove),
diff --git a/include/linux/mtd/spear_smi.h b/include/linux/mtd/spear_smi.h
index a2ed4be..447ff60 100644
--- a/include/linux/mtd/spear_smi.h
+++ b/include/linux/mtd/spear_smi.h
@@ -16,6 +16,10 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
+
+/* max possible slots for serial-nor flash chip in the SMI controller */
+#define MAX_NUM_FLASH_CHIP	4
 
 /* macro to define partitions for flash devices */
 #define DEFINE_PARTS(n, of, s)		\
@@ -57,6 +61,7 @@ struct spear_smi_plat_data {
 	unsigned long clk_rate;
 	int num_flashes;
 	struct spear_smi_flash_info *board_flash_info;
+	struct device_node *np[MAX_NUM_FLASH_CHIP];
 };
 
 #endif /* __MTD_SPEAR_SMI_H */
-- 
1.7.9.2
