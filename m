Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnrSH-00062Z-UZ
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 11:46:31 +0000
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 94119186DEC6
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 12:46:27 +0100 (CET)
Received: from localhost (p4FE3D9F7.dip.t-dialin.net [79.227.217.247])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA id C0E2B1C000F3
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 12:46:27 +0100 (CET)
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: export mtd->writebufsize attribute over sysfs
Date: Fri, 11 Feb 2011 12:46:29 +0100
Message-Id: <1297424789-4144-1-git-send-email-agust@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also allow to change mtd->writebufsize for MTD ram test
device dynamicaly.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/mtdcore.c |   52 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b177e75..282ad41 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -230,12 +230,40 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_writebufsize_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%lu\n",
+			(unsigned long)mtd->writebufsize);
+}
+
+static ssize_t mtd_writebufsize_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+	unsigned long value;
+	int ret;
+
+	ret = strict_strtoul(buf, 0, &value);
+	if (ret < 0)
+		return ret;
+
+	mtd->writebufsize = value;
+	return size;
+}
+static DEVICE_ATTR(writebufsize, S_IRUGO, mtd_writebufsize_show,
+		   mtd_writebufsize_store);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
 	&dev_attr_size.attr,
 	&dev_attr_erasesize.attr,
 	&dev_attr_writesize.attr,
+	&dev_attr_writebufsize.attr,
 	&dev_attr_subpagesize.attr,
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
@@ -258,6 +286,28 @@ static struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
+/*
+ * Make attributes of the mtdram test device writable.
+ * Useful for testing different UBIFS images.
+ */
+static inline void mtd_fixup_attr(struct mtd_info *mtd)
+{
+	struct attribute *attr = mtd_attrs[0];
+	int i = 0;
+
+	if (mtd->type != MTD_RAM)
+		return;
+
+	for (i = 0; mtd_attrs[i]; i++) {
+		attr = mtd_attrs[i];
+		if (!strcmp(attr->name, "writebufsize")) {
+			sysfs_chmod_file(&mtd->dev.kobj, attr,
+					 S_IRUGO | S_IWUSR | S_IWGRP);
+			break;
+		}
+	}
+}
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -339,6 +389,8 @@ int add_mtd_device(struct mtd_info *mtd)
 						MTD_DEVT(i) + 1,
 						NULL, "mtd%dro", i);
 
+			mtd_fixup_attr(mtd);
+
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
-- 
1.7.4
