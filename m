Received: from marmot.wormnet.eu ([2a03:9800:10:2d:3203:b3a5:8bdc:5b68])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJWcJ-0006MP-Mk
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 22:08:49 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: plat_nand: add further DT bindings and documentation
Date: Sat, 23 Mar 2013 22:06:43 +0000
Message-Id: <1364076403-9006-1-git-send-email-alex@digriz.org.uk>
Cc: linux-mtd@lists.infradead.org, Alexander Clouter <alex@digriz.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes the lack of plat-nand DT documentation as well as including some
much needed additional properties (bank-width, chip-delay, bbt-use-flash,
and nr-chips).

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 .../devicetree/bindings/mtd/plat-nand.txt          |   93 ++++++++++++++++++++
 drivers/mtd/nand/plat_nand.c                       |   53 ++++++++---
 2 files changed, 134 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/plat-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/plat-nand.txt b/Documentation/devicetree/bindings/mtd/plat-nand.txt
new file mode 100644
index 0000000..d534bfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/plat-nand.txt
@@ -0,0 +1,93 @@
+NAND support for Generic NAND driver
+
+Required properties:
+- compatible : "gen_nand"
+- reg : Array of base physical addresses of the NAND and the length of memory
+	mapped regions.  You *should* have a "nand_data" reg which is the
+	data io region (if not named, then the first reg is used for
+	IO_ADDR_R/IO_ADDR_W), additional regs are platform defined
+- nr-chips : Number of physical chips
+
+Optional properties:
+- reg-name : "nand_data" *should* be defined, additional ones are platform
+		defined
+- bank-width : Width in bytes of the device. Default is 1 (8bit), 2 (16bit)
+		implies NAND_BUSWIDTH_16 and any other value is invalid
+- chip-delay : Chip dependent delay for transferring data from array to read
+		registers in usecs
+- bbt-use-flash : Use a flash based bad block table.  Default, OOB identifier
+		is saved in OOB area
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+nand@800 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ts,nand", "gen_nand";
+	reg =   <0x800 0x04>,
+		<0x804 0x04>;
+	reg-names = "nand_ctrl", "nand_data";
+	nr-chips = <1>;
+	chip-delay = <15>;
+	bbt-use-flash;
+
+	partition@0 {
+		label = "mbr";
+		reg = <0x00000000 0x20000>;
+		read-only;
+	};
+
+	partition@20000 {
+		label = "kernel";
+		reg = <0x00020000 0x400000>;
+	};
+
+	partition@420000 {
+		label = "initrd";
+		reg = <0x00420000 0x400000>;
+	};
+
+	partition@820000 {
+		label = "rootfs";
+		reg = <0x00820000 0x1f7e0000>;
+	};
+};
+
+N.B. to use the plat-nand driver, the platform board code does still need to
+	setup platform_nand_data and hook it into the platform_device so
+	the callbacks (for at least .cmd_ctrl and .dev_ready) are available.
+
+Example:
+
+static struct platform_nand_data ts7800_nand_data = {
+        .ctrl   = {
+                .cmd_ctrl               = ts7800_nand_cmd_ctrl,
+                .dev_ready              = ts7800_nand_dev_ready,
+        },
+};
+
+static int ts7800_platform_notifier(struct notifier_block *nb,
+                                  unsigned long event, void *__dev)
+{
+        struct device *dev = __dev;
+
+        if (event != BUS_NOTIFY_ADD_DEVICE)
+                return NOTIFY_DONE;
+
+        if (of_device_is_compatible(dev->of_node, "ts,nand"))
+                dev->platform_data = &ts7800_nand_data;
+
+        return NOTIFY_OK;
+}
+
+static struct notifier_block ts7800_platform_nb = {
+        .notifier_call = ts7800_platform_notifier,
+};
+
+void __init ts7800_init(void)
+{
+        bus_register_notifier(&platform_bus_type, &ts7800_platform_nb);
+}
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index c004566..1407db5 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
@@ -23,7 +24,7 @@ struct plat_nand_data {
 	void __iomem		*io_base;
 };
 
-static const char *part_probe_types[] = { "cmdlinepart", NULL };
+static const char *part_probe_types[] = { "cmdlinepart", "ofpart", NULL };
 
 /*
  * Probe for the NAND device.
@@ -42,14 +43,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (pdata->chip.nr_chips < 1) {
-		dev_err(&pdev->dev, "invalid number of chips specified\n");
-		return -EINVAL;
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
 	if (!res)
-		return -ENXIO;
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return -ENXIO;
 
 	/* Allocate memory for the device structure (and zero it) */
 	data = kzalloc(sizeof(struct plat_nand_data), GFP_KERNEL);
@@ -79,15 +77,40 @@ static int plat_nand_probe(struct platform_device *pdev)
 
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;
+
+	if (pdev->dev.of_node) {
+		int i;
+
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"nr-chips", &i))
+			data->chip.numchips = i;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"chip-delay", &i))
+			data->chip.chip_delay = (u8)i;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"bank-width", &i)) {
+			if (i == 2)
+				data->chip.options |= NAND_BUSWIDTH_16;
+			else if (i != 1) {
+				dev_warn(&pdev->dev,
+					"%d bit bus width out of range\n", i);
+			}
+		}
+		if (of_get_property(pdev->dev.of_node, "bbt-use-flash", &i))
+			data->chip.bbt_options |= NAND_BBT_USE_FLASH;
+	} else {
+		data->chip.numchips = pdata->chip.nr_chips;
+		data->chip.chip_delay = pdata->chip.chip_delay;
+		data->chip.options |= pdata->chip.options;
+		data->chip.bbt_options |= pdata->chip.bbt_options;
+	}
+
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
 	data->chip.write_buf = pdata->ctrl.write_buf;
 	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.read_byte = pdata->ctrl.read_byte;
-	data->chip.chip_delay = pdata->chip.chip_delay;
-	data->chip.options |= pdata->chip.options;
-	data->chip.bbt_options |= pdata->chip.bbt_options;
 
 	data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
 	data->chip.ecc.layout = pdata->chip.ecclayout;
@@ -102,8 +125,14 @@ static int plat_nand_probe(struct platform_device *pdev)
 			goto out;
 	}
 
+	if (data->chip.numchips < 1) {
+		dev_err(&pdev->dev, "invalid number of chips specified\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	/* Scan to find existence of the device */
-	if (nand_scan(&data->mtd, pdata->chip.nr_chips)) {
+	if (nand_scan(&data->mtd, data->chip.numchips)) {
 		err = -ENXIO;
 		goto out;
 	}
-- 
1.7.10.4
