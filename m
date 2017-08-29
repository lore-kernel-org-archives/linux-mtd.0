Received: from ch3vs04.rockwellcollins.com ([205.175.226.52])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmmUI-00049P-DX
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 19:47:53 +0000
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, arnd@arndb.de,
 Sanjay Tandel <sanjay.tandel@rockwellcollins.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>
Subject: [PATCH v2] mtd: map: new driver for NXP IFC
Date: Tue, 29 Aug 2017 14:47:27 -0500
Message-Id: <1504036047-38848-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>

This patch adds map driver for parallel flash chips interfaced over
a NXP Integrated Flash Controller (IFC). This driver allows either
8-bit or 16-bit accesses, depending on bank-width, to parallel flash
chips(like Everspin MR0A16A), which are physically mapped to CPU's
memory space. For unaligned accesses, it performs read-modify-write
operations to keep access size same as bank-width.

Signed-off-by: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Changes
v1 -> v2
 - Refactored driver to be custom for the IFC bus controllder
  (Suggested by Boris)
 - Updated patch name
 - Cleaned up description to be specific about issue and behavior
 - Version 1 - https://patchwork.ozlabs.org/patch/797787/
---
 Documentation/devicetree/bindings/mtd/ifc-mram.txt |  34 ++
 drivers/mtd/maps/Kconfig                           |  13 +
 drivers/mtd/maps/Makefile                          |   1 +
 drivers/mtd/maps/ifc_mram.c                        | 343 +++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ifc-mram.txt
 create mode 100644 drivers/mtd/maps/ifc_mram.c

diff --git a/Documentation/devicetree/bindings/mtd/ifc-mram.txt b/Documentation/devicetree/bindings/mtd/ifc-mram.txt
new file mode 100644
index 0000000..c5c3210
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ifc-mram.txt
@@ -0,0 +1,34 @@
+Integrated Flash Controller based physically-mapped parallel MRAM,
+NOR flash, MTD-RAM (NVRAM...)
+
+ - compatible : should contain the specific model of mtd chip(s)
+   used, if known, followed by "ifc-mram".
+ - reg : Address range(s) of the mtd chip(s)
+   It's possible to (optionally) define multiple "reg" tuples so that
+   non-identical chips can be described in one node.
+ - bank-width : Width (in bytes) of the bank.  Equal to the
+   device width times the number of interleaved chips.
+ - device-width : (optional) Width of a single mtd chip.  If
+   omitted, assumed to be equal to 'bank-width'.
+ - #address-cells, #size-cells : Must be present if the device has
+   sub-nodes representing partitions (see below).  In this case
+   both #address-cells and #size-cells must be equal to 1.
+ - linux,mtd-name: allow to specify the mtd name.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+        mram@1,0 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+                compatible = "everspin,mram", "ifc-mram";
+                reg = <0x1 0x0 0x10000 0x1 0x10000 0x10000>;
+                bank-width = <2>;
+
+                partition@0 {
+                        reg = <0 0x00020000>;
+                        label = "MRAM Data 0";
+                };
+        };
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 542fdf8..95bd44e 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -419,4 +419,17 @@ config MTD_LATCH_ADDR
 
           If compiled as a module, it will be called latch-addr-flash.
 
+config MTD_IFC_MRAM
+	tristate "Map driver for Integrated Flash Controller"
+	depends on MTD_COMPLEX_MAPPINGS
+	help
+	  Map driver for chips connected parallely to Integrated Flash
+	  Controller. This driver allows either 8-bit or 16-bit accesses,
+	  depending on bank-width, to parallel flash chips, which are
+	  physically mapped to CPU's memory space. For unaligned accesses,
+	  it does read-modify-write.
+	  Example: Everspin MR0A16A.
+
+	  If compiled as a module, it will be called ifc-mram.
+
 endmenu
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 5a09a72..0ab793e 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -47,3 +47,4 @@ obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
 obj-$(CONFIG_MTD_LATCH_ADDR)	+= latch-addr-flash.o
 obj-$(CONFIG_MTD_LANTIQ)	+= lantiq-flash.o
+obj-$(CONFIG_MTD_IFC_MRAM)	+= ifc_mram.o
diff --git a/drivers/mtd/maps/ifc_mram.c b/drivers/mtd/maps/ifc_mram.c
new file mode 100644
index 0000000..1341e0a
--- /dev/null
+++ b/drivers/mtd/maps/ifc_mram.c
@@ -0,0 +1,343 @@
+/*
+ * Integrated Flash Controlller Map Driver
+ *
+ * Copyright 2017 Rockwell Collins
+ *
+ * Aug 18 2017  Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
+ *
+ * Based on:
+ * Flash mappings described by the OF (or flattened) device tree
+ *
+ * Copyright (C) 2006 MontaVista Software Inc.
+ * Author: Vitaly Wool <vwool@ru.mvista.com>
+ *
+ * Revised to handle newer style flash binding by:
+ *   Copyright (C) 2007 David Gibson, IBM Corporation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+static const struct of_device_id ifc_mram_match[] = {
+	{
+		.compatible	= "ifc-mram",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, ifc_mram_match);
+struct ifc_mram_list {
+	struct mtd_info *mtd;
+	struct map_info map;
+	struct resource *res;
+};
+
+struct ifc_mram {
+	struct mtd_info		*cmtd;
+	int list_size; /* number of elements in ifc_mram_list */
+	struct ifc_mram_list	list[0];
+};
+
+
+static void ifc_mram_copy_from8(void *to, void __iomem *from, size_t count)
+{
+	u8 *t = to;
+
+	while (count > 0) {
+		*t = (u8)readb_relaxed(from);
+		t++;
+		from++;
+		count--;
+	}
+}
+
+static void ifc_mram_copy_from16(void *to, void __iomem *from, size_t count)
+{
+	u8 *t = to;
+
+	if (!(IS_ALIGNED((unsigned long)from, 2))) {
+		from = (void __iomem *)ALIGN((unsigned long)from, 2) - 2;
+		*(u8 *)t = (u8)((cpu_to_le16(readw_relaxed(from)) & 0xff00)
+									>> 8);
+		count--;
+		t++;
+		from += 2;
+	}
+	while (count >= 2) {
+		*(u16 *)t = cpu_to_le16(readw_relaxed(from));
+		count -= 2;
+		t += 2;
+		from += 2;
+	};
+	while (count > 0) {
+		*(u8 *)t = (u8)(cpu_to_le16(readw_relaxed(from)) & 0x00ff);
+		count--;
+		t++;
+		from++;
+	}
+}
+
+static void ifc_mram_copy_from(struct map_info *map, void *to,
+					unsigned long from, ssize_t len)
+{
+	if (map->cached)
+		memcpy(to, (char *)map->cached + from, len);
+	else if (map_bankwidth_is_1(map))
+		ifc_mram_copy_from8(to, map->virt + from, len);
+	else if (map_bankwidth_is_2(map))
+		ifc_mram_copy_from16(to, map->virt + from, len);
+	else
+		memcpy_fromio(to, map->virt + from, len);
+}
+
+static void ifc_mram_copy_to8(void __iomem *to, const void *from, size_t count)
+{
+	const unsigned char *f = from;
+
+	while (count > 0) {
+		writeb_relaxed(*f, to);
+		count--;
+		to++;
+		f++;
+	}
+}
+
+static void ifc_mram_copy_to16(void __iomem *to, const void *from, size_t count)
+{
+	const unsigned char *f = from;
+	u16 d;
+
+	if (!(IS_ALIGNED((unsigned long)to, 2))) {
+		to = (void __iomem *)ALIGN((unsigned long)to, 2) - 2;
+		d = (cpu_to_le16(readw_relaxed(to)) & 0x00ff)
+					| ((u16)(*(const u8 *)f) << 8);
+		writew_relaxed(le16_to_cpu(d), to);
+		count--;
+		to += 2;
+		f++;
+	}
+	while (count >= 2) {
+		writew_relaxed(le16_to_cpu(*(const u16 *)f), to);
+		count -= 2;
+		to += 2;
+		f += 2;
+	};
+	while (count > 0) {
+		d = (cpu_to_le16(readw_relaxed(to)) & 0xff00)
+					| (u16)(*(const u8 *)f);
+		writew_relaxed(le16_to_cpu(d), to);
+		count--;
+		to++;
+		f++;
+	}
+}
+
+static void ifc_mram_copy_to(struct map_info *map, unsigned long to,
+					const void *from, ssize_t len)
+{
+	if (map_bankwidth_is_1(map))
+		ifc_mram_copy_to8(map->virt + to, from, len);
+	else if (map_bankwidth_is_2(map))
+		ifc_mram_copy_to16(map->virt + to, from, len);
+	else
+		memcpy_toio(map->virt + to, from, len);
+}
+static int ifc_mram_remove(struct platform_device *dev)
+{
+	struct ifc_mram *info;
+	int i;
+
+	info = dev_get_drvdata(&dev->dev);
+	if (!info)
+		return 0;
+	dev_set_drvdata(&dev->dev, NULL);
+
+	if (info->cmtd) {
+		mtd_device_unregister(info->cmtd);
+		if (info->cmtd != info->list[0].mtd)
+			mtd_concat_destroy(info->cmtd);
+	}
+
+	for (i = 0; i < info->list_size; i++) {
+		if (info->list[i].mtd)
+			map_destroy(info->list[i].mtd);
+
+		if (info->list[i].map.virt)
+			iounmap(info->list[i].map.virt);
+
+		if (info->list[i].res) {
+			release_resource(info->list[i].res);
+			kfree(info->list[i].res);
+		}
+	}
+	return 0;
+}
+
+static int ifc_mram_probe(struct platform_device *dev)
+{
+	const struct of_device_id *match;
+	struct device_node *dp = dev->dev.of_node;
+	struct resource res;
+	struct ifc_mram *info;
+	const __be32 *width;
+	int err;
+	int i;
+	int count;
+	const __be32 *p;
+	int reg_tuple_size;
+	struct mtd_info **mtd_list = NULL;
+	resource_size_t res_size;
+	struct mtd_part_parser_data ppdata;
+	bool map_indirect;
+	const char *mtd_name = NULL;
+
+	match = of_match_device(ifc_mram_match, &dev->dev);
+	if (!match) {
+		pr_info("%s: compatible string not matched\n", __func__);
+		return -EINVAL;
+	}
+	reg_tuple_size =
+		(of_n_addr_cells(dp) + of_n_size_cells(dp)) * sizeof(u32);
+
+	of_property_read_string(dp, "linux,mtd-name", &mtd_name);
+
+	p = of_get_property(dp, "reg", &count);
+	if (count % reg_tuple_size != 0) {
+		dev_err(&dev->dev, "Malformed reg property on %s\n",
+				dev->dev.of_node->full_name);
+		err = -EINVAL;
+		goto err_flash_remove;
+	}
+	count /= reg_tuple_size;
+
+	err = -ENOMEM;
+	info = devm_kzalloc(&dev->dev,
+			    sizeof(struct ifc_mram) +
+			    sizeof(struct ifc_mram_list) * count, GFP_KERNEL);
+	if (!info)
+		goto err_flash_remove;
+
+	dev_set_drvdata(&dev->dev, info);
+
+	mtd_list = kcalloc(count, sizeof(*mtd_list), GFP_KERNEL);
+	if (!mtd_list)
+		goto err_flash_remove;
+
+	for (i = 0; i < count; i++) {
+		err = -ENXIO;
+		if (of_address_to_resource(dp, i, &res)) {
+			/*
+			 * Continue with next register tuple if this
+			 * one is not mappable
+			 */
+			continue;
+		}
+
+		dev_dbg(&dev->dev, "ifc_mram device: %pR\n", &res);
+
+		err = -EBUSY;
+		res_size = resource_size(&res);
+		info->list[i].res = request_mem_region(res.start, res_size,
+						       dev_name(&dev->dev));
+		if (!info->list[i].res)
+			goto err_out;
+
+		err = -ENXIO;
+		width = of_get_property(dp, "bank-width", NULL);
+		if (!width) {
+			dev_err(&dev->dev,
+				"Can't get bank width from device tree\n");
+			goto err_out;
+		}
+
+		info->list[i].map.name = mtd_name ?: dev_name(&dev->dev);
+		info->list[i].map.phys = res.start;
+		info->list[i].map.size = res_size;
+		info->list[i].map.bankwidth = be32_to_cpup(width);
+		info->list[i].map.device_node = dp;
+
+		err = -ENOMEM;
+		info->list[i].map.virt = ioremap(info->list[i].map.phys,
+						 info->list[i].map.size);
+		if (!info->list[i].map.virt) {
+			dev_err(&dev->dev,
+				"Failed to ioremap() flash region\n");
+			goto err_out;
+		}
+
+		simple_map_init(&info->list[i].map);
+#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
+		info->list[i].map.copy_from = ifc_mram_copy_from;
+		info->list[i].map.copy_to = ifc_mram_copy_to;
+#endif
+
+
+		info->list[i].mtd = do_map_probe("map_ram",
+							 &info->list[i].map);
+		mtd_list[i] = info->list[i].mtd;
+
+		err = -ENXIO;
+		if (!info->list[i].mtd) {
+			dev_err(&dev->dev, "do_map_probe() failed\n");
+			goto err_out;
+		} else {
+			info->list_size++;
+		}
+		info->list[i].mtd->owner = THIS_MODULE;
+		info->list[i].mtd->dev.parent = &dev->dev;
+	}
+
+	err = 0;
+	info->cmtd = NULL;
+	if (info->list_size == 1) {
+		info->cmtd = info->list[0].mtd;
+	} else if (info->list_size > 1) {
+		/*
+		 * We detected multiple devices. Concatenate them together.
+		 */
+		info->cmtd = mtd_concat_create(mtd_list, info->list_size,
+					       dev_name(&dev->dev));
+	}
+	if (info->cmtd == NULL)
+		err = -ENXIO;
+
+	if (err)
+		goto err_out;
+
+	ppdata.of_node = dp;
+	mtd_device_parse_register(info->cmtd, NULL, &ppdata, NULL, 0);
+	kfree(mtd_list);
+	return 0;
+
+err_out:
+	kfree(mtd_list);
+err_flash_remove:
+	ifc_mram_remove(dev);
+
+	return err;
+}
+
+
+static struct platform_driver ifc_mram_driver = {
+	.driver = {
+		.name = "ifc-mram",
+		.of_match_table = ifc_mram_match,
+	},
+	.probe		= ifc_mram_probe,
+	.remove		= ifc_mram_remove,
+};
+
+module_platform_driver(ifc_mram_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Sanjay Tandel");
+MODULE_DESCRIPTION("IFC MRAM Map Driver");
-- 
1.9.1
