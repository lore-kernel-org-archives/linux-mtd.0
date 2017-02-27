Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciRv7-00049Y-91
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:29:24 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/3] drivers: Add an API to read device specific config data
Date: Mon, 27 Feb 2017 21:28:10 +0100
Message-Id: <1488227292-18906-2-git-send-email-albeu@free.fr>
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

Some device need configuration data that is specific to this
particular device instance, for example some calibration results,
or a MAC address. Most often this data is stored in some EEPROM
or MTD device.

This API follow the usual provider/consumer pattern to give device
drivers a simple way to read such config data. Storage devices can
register themself as data provider and the platform code, or DT,
define the mapping betwen the devices and their data. Device drivers
can then read the data with a simple read call with a connection ID,
offset and size.

Currently the lookup first attempts to read the data from the
filesystem in /etc/devices/<DEVNAME>/<CONNECTION_ID>. This allow the
users to override the board data if they need to.

If the filesystem lookup fails it then fallback on DT. The consumer
device's OF node should have a property named <CONNECTION_ID>-data
that contains a phandle to the device, or partition, providing the
data. The phandle can have one argument that give the base offset
used to access this particular data.

If the OF lookup fails it then fallback on registrations from platform
code, here both the consumer and provider are just matched on device
name.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/base/Kconfig    |   6 ++
 drivers/base/Makefile   |   1 +
 drivers/base/devdata.c  | 204 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/devdata.h |  79 +++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 drivers/base/devdata.c
 create mode 100644 include/linux/devdata.h

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index d718ae4..b7defd0 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -165,6 +165,12 @@ config FW_LOADER_USER_HELPER_FALLBACK
 
 	  If you are unsure about this, say N here.
 
+config DEVDATA
+	bool
+	help
+	  Drivers should "select" this option if they need to load device
+	  specific data.
+
 config WANT_DEV_COREDUMP
 	bool
 	help
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index f2816f6..cd8fbc5 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_SOC_BUS) += soc.o
 obj-$(CONFIG_PINCTRL) += pinctrl.o
 obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
 obj-$(CONFIG_GENERIC_MSI_IRQ_DOMAIN) += platform-msi.o
+obj-$(CONFIG_DEVDATA) += devdata.o
 
 obj-y			+= test/
 
diff --git a/drivers/base/devdata.c b/drivers/base/devdata.c
new file mode 100644
index 0000000..7d3b42f
--- /dev/null
+++ b/drivers/base/devdata.c
@@ -0,0 +1,204 @@
+/*
+ * Copyright (C) 2015 Alban Bedel <albeu@free.fr>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/devdata.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/of.h>
+
+static DEFINE_MUTEX(devdata_provider_list_mutex);
+static LIST_HEAD(devdata_provider_list);
+
+static DEFINE_MUTEX(devdata_lookup_list_mutex);
+static LIST_HEAD(devdata_lookup_list);
+
+void devdata_provider_register(struct devdata_provider *provider)
+{
+	mutex_lock(&devdata_provider_list_mutex);
+	list_add_tail(&provider->list, &devdata_provider_list);
+	mutex_unlock(&devdata_provider_list_mutex);
+}
+
+void devdata_provider_unregister(struct devdata_provider *provider)
+{
+	mutex_lock(&devdata_provider_list_mutex);
+	list_del(&provider->list);
+	mutex_unlock(&devdata_provider_list_mutex);
+}
+
+static void __devdata_provider_unregister(void *provider)
+{
+	devdata_provider_unregister(provider);
+}
+
+int devm_devdata_provider_register(struct device *dev,
+				struct devdata_provider *provider)
+{
+	int err;
+
+	devdata_provider_register(provider);
+	err = devm_add_action(
+		dev, __devdata_provider_unregister, provider);
+	if (err)
+		devdata_provider_unregister(provider);
+	return err;
+}
+
+void devm_devdata_provider_unregister(struct device *dev,
+				struct devdata_provider *provider)
+{
+	devm_remove_action(dev, __devdata_provider_unregister, provider);
+	devdata_provider_unregister(provider);
+}
+
+static int devdata_fs_read(struct device *dev, const char *id,
+			loff_t offset, void *buffer, size_t size)
+{
+	struct file *fp;
+	char *path;
+	int len;
+
+	path = __getname();
+	if (!path)
+		return -ENOMEM;
+
+	len = snprintf(path, PATH_MAX, "/etc/devices/%s/%s",
+		dev_name(dev), id);
+	if (len >= PATH_MAX) {
+		__putname(path);
+		return -ENAMETOOLONG;
+	}
+
+	fp = filp_open(path, O_RDONLY, 0);
+	__putname(path);
+	if (IS_ERR(fp))
+		return PTR_ERR(fp);
+
+	len = kernel_read(fp, offset, buffer, size);
+	fput(fp);
+
+	return len == size ? 0 : -EIO;
+}
+
+static int devdata_of_read(struct device *dev, const char *id,
+			loff_t offset, void *buffer, size_t size)
+{
+	struct of_phandle_args args;
+	struct devdata_provider *p;
+	int err, base = 0;
+	char prop[64];
+
+	snprintf(prop, sizeof(prop), "%s-data", id);
+	if (!of_find_property(dev->of_node, prop, NULL))
+		return -ENOENT;
+
+	err = of_parse_phandle_with_args(dev->of_node, prop,
+					"#data-provider-cells", 0, &args);
+	if (err)
+		return err;
+
+	switch (args.args_count) {
+	case 0:
+		break;
+	case 1:
+		base = args.args[0];
+		break;
+	default:
+		dev_err(dev, "Unsupported data provider cells count\n");
+		return -EINVAL;
+	}
+
+	err = -EPROBE_DEFER;
+	mutex_lock(&devdata_provider_list_mutex);
+	list_for_each_entry(p, &devdata_provider_list, list) {
+		if (p->dev->of_node != args.np)
+			continue;
+
+		err = p->read(p->dev, buffer, base + offset, size);
+		break;
+	}
+	mutex_unlock(&devdata_provider_list_mutex);
+
+	return err;
+}
+
+static int devdata_platform_read(struct device *dev, const char *id,
+				loff_t offset, void *buffer, size_t size)
+{
+	struct devdata_provider *p;
+	struct devdata_lookup *l;
+	int err = -EPROBE_DEFER;
+	bool found = false;
+
+	mutex_lock(&devdata_lookup_list_mutex);
+	list_for_each_entry(l, &devdata_lookup_list, list) {
+		if (strcmp(dev_name(dev), l->dev_id))
+			continue;
+		if (strcmp(id, l->con_id))
+			continue;
+		found = true;
+		break;
+	}
+
+	if (!found) {
+		mutex_unlock(&devdata_lookup_list_mutex);
+		return -ENOENT;
+	}
+
+	mutex_lock(&devdata_provider_list_mutex);
+	list_for_each_entry(p, &devdata_provider_list, list) {
+		if (strcmp(dev_name(p->dev), l->provider))
+			continue;
+
+		err = p->read(p->dev, buffer, l->offset + offset, size);
+		break;
+	}
+	mutex_unlock(&devdata_provider_list_mutex);
+	mutex_unlock(&devdata_lookup_list_mutex);
+
+	return err;
+}
+
+int devdata_read(struct device *dev, const char *id, loff_t offset,
+		void *buffer, size_t size)
+{
+	int err;
+
+	if (!dev || !id || !buffer)
+		return -EINVAL;
+
+	err = devdata_fs_read(dev, id, offset, buffer, size);
+
+	if (err == -ENOENT)
+		err = devdata_of_read(dev, id, offset, buffer, size);
+
+	if (err == -ENOENT)
+		err = devdata_platform_read(dev, id, offset, buffer, size);
+
+	return err;
+}
+
+void devdata_lookup_register(struct devdata_lookup *lookup, size_t num)
+{
+	mutex_lock(&devdata_lookup_list_mutex);
+	while (num--)
+		list_add_tail(&lookup->list, &devdata_lookup_list);
+	mutex_unlock(&devdata_lookup_list_mutex);
+}
+
+void devdata_lookup_unregister(struct devdata_lookup *lookup, size_t num)
+{
+	mutex_lock(&devdata_lookup_list_mutex);
+	while (num--)
+		list_del(&lookup->list);
+	mutex_unlock(&devdata_lookup_list_mutex);
+}
diff --git a/include/linux/devdata.h b/include/linux/devdata.h
new file mode 100644
index 0000000..70275e6
--- /dev/null
+++ b/include/linux/devdata.h
@@ -0,0 +1,79 @@
+/*
+ * Copyright (C) 2015 Alban Bedel <albeu@free.fr>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __LINUX_DEVDATA_H
+#define __LINUX_DEVDATA_H
+
+#include <linux/list.h>
+
+struct device;
+
+struct devdata_lookup {
+	struct list_head list;
+	const char *dev_id;
+	const char *con_id;
+	const char *provider;
+	unsigned int offset;
+};
+
+struct devdata_provider {
+	struct list_head list;
+	struct device *dev;
+
+	int (*read)(struct device *dev, void *buffer,
+		loff_t offset, size_t size);
+};
+
+#ifdef CONFIG_DEVDATA
+
+void devdata_provider_register(struct devdata_provider *provider);
+void devdata_provider_unregister(struct devdata_provider *provider);
+
+int devm_devdata_provider_register(struct device *dev,
+				struct devdata_provider *provider);
+void devm_devdata_provider_unregister(struct device *dev,
+				struct devdata_provider *provider);
+
+int devdata_read(struct device *dev, const char *id,
+		loff_t offset, void *buffer, size_t size);
+
+void devdata_lookup_register(struct devdata_lookup *lookup, size_t num);
+void devdata_lookup_unregister(struct devdata_lookup *lookup, size_t num);
+
+#else
+
+static inline void devdata_provider_register(
+	struct devdata_provider *provider){}
+
+static inline void devdata_provider_unregister(
+	struct devdata_provider *provider){}
+
+static inline int devm_devdata_provider_register(
+	struct device *dev, struct devdata_provider *provider)
+{
+	return 0;
+}
+
+static inline void devm_devdata_provider_unregister(
+	struct device *dev, struct devdata_provider *provider){}
+
+static inline int devdata_read(struct device *dev, const char *id,
+			loff_t offset, void *buffer, size_t size)
+{
+	return -ENOENT;
+}
+
+static inline void devdata_lookup_register(
+	struct devdata_lookup *lookup, size_t num){}
+static inline void devdata_lookup_unregister(
+	struct devdata_lookup *lookup, size_t num){}
+
+#endif /* CONFIG_DEVDATA */
+
+#endif /* __LINUX_DEVDATA_H */
-- 
2.7.4
