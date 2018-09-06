Received: from scopuli.esotechnik.de ([79.143.188.15] helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwvZ-0002py-Ip
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 16:14:45 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: linux-mtd@lists.infradead.org
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: [PATCH 3/3] mtd: mtdconcat: add dt driver for concat devices
Date: Thu,  6 Sep 2018 18:14:13 +0200
Message-Id: <20180906161413.6335-4-kernel@nospam.obeliks.de>
In-Reply-To: <20180906161413.6335-1-kernel@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some mtd drivers like physmap variants have support for concatenating
multiple mtd devices, but there is no generic way to define such a
concat device from within the device tree.

This commit adds a driver for creating virtual mtd-concat devices. They
must have a compatible = "mtd-concat" line, and define a list of
devices to concat in the 'devices' property, for example:

flash {
  compatible = "mtd-concat";

  devices = <&flash0 &flash1>;
};

The driver is added to the very end of the mtd Makefile to increase the
likelyhood of all child devices already being loaded at the time of
probing, preventing unnecessary deferred probes.

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
---
 drivers/mtd/Kconfig                 |   2 +
 drivers/mtd/Makefile                |   3 +
 drivers/mtd/composite/Kconfig       |  12 +++
 drivers/mtd/composite/Makefile      |   7 ++
 drivers/mtd/composite/virt_concat.c | 123 ++++++++++++++++++++++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 drivers/mtd/composite/Kconfig
 create mode 100644 drivers/mtd/composite/Makefile
 create mode 100644 drivers/mtd/composite/virt_concat.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c77f537323ec..6345d886d458 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -339,4 +339,6 @@ source "drivers/mtd/spi-nor/Kconfig"
 
 source "drivers/mtd/ubi/Kconfig"
 
+source "drivers/mtd/composite/Kconfig"
+
 endif # MTD
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 93473d215a38..57af7190b063 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -36,3 +36,6 @@ obj-y		+= chips/ lpddr/ maps/ devices/ nand/ tests/
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor/
 obj-$(CONFIG_MTD_UBI)		+= ubi/
+
+# Composite drivers must be loaded last
+obj-y		+= composite/
diff --git a/drivers/mtd/composite/Kconfig b/drivers/mtd/composite/Kconfig
new file mode 100644
index 000000000000..0490fc0284bb
--- /dev/null
+++ b/drivers/mtd/composite/Kconfig
@@ -0,0 +1,12 @@
+menu "Composite MTD device drivers"
+	depends on MTD!=n
+
+config MTD_VIRT_CONCAT
+	tristate "Virtual concat MTD device"
+	help
+	  This driver allows creation of a virtual MTD concat device, which
+	  concatenates multiple underlying MTD devices to a single device.
+	  This is required by some SoC boards where multiple memory banks are
+	  used as one device with partitions spanning across device boundaries.
+
+endmenu
diff --git a/drivers/mtd/composite/Makefile b/drivers/mtd/composite/Makefile
new file mode 100644
index 000000000000..7f4bdeee0e0a
--- /dev/null
+++ b/drivers/mtd/composite/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# linux/drivers/mtd/composite/Makefile
+#
+
+obj-$(CONFIG_MTD_VIRT_CONCAT)   += virt_concat.o
+
diff --git a/drivers/mtd/composite/virt_concat.c b/drivers/mtd/composite/virt_concat.c
new file mode 100644
index 000000000000..239c7cdd8bca
--- /dev/null
+++ b/drivers/mtd/composite/virt_concat.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Virtual concat MTD device driver
+ *
+ * Copyright (C) 2018 Bernhard Frauendienst
+ * Author: Bernhard Frauendienst, kernel@nospam.obeliks.de
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/mtd/concat.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+struct of_virt_concat {
+	struct mtd_info	 *cmtd;
+	int num_devices;
+	struct mtd_info	 **devices;
+};
+
+static int virt_concat_remove(struct platform_device *pdev)
+{
+	struct of_virt_concat *info;
+	int i;
+
+	info = platform_get_drvdata(pdev);
+	if (!info)
+		return 0;
+	platform_set_drvdata(pdev, NULL);
+
+	if (info->cmtd) {
+		mtd_device_unregister(info->cmtd);
+		mtd_concat_destroy(info->cmtd);
+	}
+
+	if (info->devices) {
+		for (i = 0; i < info->num_devices; i++)
+			put_mtd_device(info->devices[i]);
+
+		kfree(info->devices);
+	}
+
+	return 0;
+}
+
+static int virt_concat_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct of_phandle_iterator it;
+	int err, count;
+	struct of_virt_concat *info;
+	struct mtd_info *mtd;
+
+	count = of_count_phandle_with_args(node, "devices", NULL);
+	if (count <= 0)
+		return -EINVAL;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+	err = -ENOMEM;
+	info->devices = kcalloc(count, sizeof(*(info->devices)), GFP_KERNEL);
+	if (!info->devices)
+		goto err_remove;
+
+	platform_set_drvdata(pdev, info);
+
+	of_for_each_phandle(&it, err, node, "devices", NULL, 0) {
+		mtd = get_mtd_device_by_node(it.node);
+		if (IS_ERR(mtd)) {
+			of_node_put(it.node);
+			err = -EPROBE_DEFER;
+			goto err_remove;
+		}
+
+		info->devices[info->num_devices++] = mtd;
+	}
+
+	err = -ENXIO;
+	info->cmtd = mtd_concat_create(info->devices, info->num_devices,
+		dev_name(&pdev->dev));
+	if (!info->cmtd)
+		goto err_remove;
+
+	info->cmtd->dev.parent = &pdev->dev;
+	mtd_set_of_node(info->cmtd, node);
+	mtd_device_register(info->cmtd, NULL, 0);
+
+	return 0;
+
+err_remove:
+	virt_concat_remove(pdev);
+
+	return err;
+}
+
+static const struct of_device_id virt_concat_of_match[] = {
+	{ .compatible = "mtd-concat", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, virt_concat_of_match);
+
+static struct platform_driver virt_concat_driver = {
+	.probe = virt_concat_probe,
+	.remove = virt_concat_remove,
+	.driver	 = {
+		.name   = "virt-mtdconcat",
+		.of_match_table = virt_concat_of_match,
+	},
+};
+
+module_platform_driver(virt_concat_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Bernhard Frauendienst <kernel@nospam.obeliks.de>");
+MODULE_DESCRIPTION("Virtual concat MTD device driver");
-- 
2.17.1
