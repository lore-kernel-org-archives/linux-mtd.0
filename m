Received: from smtp5-g21.free.fr ([212.27.42.5])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciRvT-0007SI-Vt
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:29:45 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alban Bedel <albeu@free.fr>
Subject: [PATCH 2/3] mtd: Add support for reading device data out of MTD
 devices
Date: Mon, 27 Feb 2017 21:28:11 +0100
Message-Id: <1488227292-18906-3-git-send-email-albeu@free.fr>
In-Reply-To: <1488227292-18906-1-git-send-email-albeu@free.fr>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alban Bedel <albeu@free.fr>

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/mtd/Kconfig   |  9 +++++++
 drivers/mtd/Makefile  |  1 +
 drivers/mtd/devdata.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/mtd/devdata.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index e83a279..b08a1c0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -322,6 +322,15 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_DEVDATA
+	tristate "Read device data from MTD device"
+	default y
+	depends on DEVDATA
+	help
+	  This provides support for reading device data from MTD devices.
+	  This is can be used by drivers to read device specific data such as
+	  MAC address or calibration results.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1..7d99768 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
+obj-$(CONFIG_MTD_DEVDATA)	+= devdata.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
diff --git a/drivers/mtd/devdata.c b/drivers/mtd/devdata.c
new file mode 100644
index 0000000..68412b1e
--- /dev/null
+++ b/drivers/mtd/devdata.c
@@ -0,0 +1,70 @@
+/*
+ * Copyright (C) 2015 Alban Bedel <albeu@free.fr>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/devdata.h>
+#include <linux/of.h>
+
+int mtd_devdata_provider_read(struct device *dev, void *buffer,
+			loff_t offset, size_t size)
+{
+	struct mtd_info *mtd = container_of(dev, struct mtd_info, dev);
+	size_t retlen;
+	int err;
+
+	err = mtd_read(mtd, offset, size, &retlen, buffer);
+	if (err && err != -EUCLEAN)
+		return err;
+	return retlen == size ? 0 : -EIO;
+}
+
+static void mtd_devdata_provider_add(struct mtd_info *mtd)
+{
+	struct device *dev = &mtd->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct devdata_provider *p;
+
+	/* OF devices have to provide the data-provider node */
+	if (np && !of_property_read_bool(np, "data-provider"))
+		return;
+
+	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
+	p->dev = dev;
+	p->read = mtd_devdata_provider_read;
+
+	if (devm_devdata_provider_register(dev, p))
+		dev_warn(dev, "Failed to register as devdata provider\n");
+}
+
+static void mtd_devdata_provider_remove(struct mtd_info *mtd)
+{
+}
+
+static struct mtd_notifier mtd_devdata_provider_notifier = {
+	.add = mtd_devdata_provider_add,
+	.remove = mtd_devdata_provider_remove,
+};
+
+static int __init mtd_devdata_init(void)
+{
+	register_mtd_user(&mtd_devdata_provider_notifier);
+	return 0;
+}
+module_init(mtd_devdata_init);
+
+static void __exit mtd_devdata_exit(void)
+{
+	unregister_mtd_user(&mtd_devdata_provider_notifier);
+}
+module_exit(mtd_devdata_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alban Bedel <albeu@free.fr>");
+MODULE_DESCRIPTION("Driver to read device data from MTD devices");
-- 
2.7.4
