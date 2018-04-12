Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6cVU-0002Lb-Ja
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2018 13:43:23 +0000
Received: by mail-wm0-x244.google.com with SMTP id b127so11794870wmf.5
 for <linux-mtd@lists.infradead.org>; Thu, 12 Apr 2018 06:43:09 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Subject: [PATCH] mtdcore: add writeable attribute in sysfs
Date: Thu, 12 Apr 2018 15:42:32 +0200
Message-Id: <20180412134232.14006-1-charles-antoine.couret@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD devices read-write or read-only property could be set by the bootloader with
the mtdparts argument but there is no way to change this definition at runtime
on Linux. The flags can be read but can not be changed.

This patch adds the possibility to force a MTD device to be read-only or read-write
even if the bootloader requested something else. The purpose is to offer to
the user of a device to eventually change something that is not allowed
like updating the bootloader or change its environement.

Or to protect the device without using mtdro virtual device to read the content.
---
 drivers/mtd/mtdcore.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 807d17d863b3..3a9a7055ee53 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -158,6 +158,39 @@ static ssize_t mtd_flags_show(struct device *dev,
 }
 static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
 
+static ssize_t mtd_writeable_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	unsigned int writeable = mtd->flags & MTD_WRITEABLE ? 1 : 0;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", writeable);
+
+}
+
+static ssize_t mtd_writeable_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	unsigned int writeable;
+	int retval;
+
+
+	retval = kstrtouint(buf, 0, &writeable);
+	if (retval)
+		return retval;
+
+	if (writeable)
+		mtd->flags |= MTD_WRITEABLE;
+	else
+		mtd->flags &= ~MTD_WRITEABLE;
+
+	return count;
+}
+static DEVICE_ATTR(writeable, S_IRUGO | S_IWUSR, mtd_writeable_show,
+	mtd_writeable_store);
+
 static ssize_t mtd_size_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -322,6 +355,7 @@ static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
+	&dev_attr_writeable.attr,
 	&dev_attr_size.attr,
 	&dev_attr_erasesize.attr,
 	&dev_attr_writesize.attr,
-- 
2.17.0
