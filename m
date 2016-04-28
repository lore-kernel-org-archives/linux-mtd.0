Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avqg7-0005Fv-PY
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 18:28:44 +0000
Received: by mail-pf0-x235.google.com with SMTP id y69so36919955pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 Apr 2016 11:28:22 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] UBI: Add ro-mode sysfs attribute
Date: Thu, 28 Apr 2016 15:28:07 -0300
Message-Id: <1461868087-681-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On certain situations, UBI may detect serious device corruption,
and switch to read-only mode to protect the data and allow debugging.
This commit exposes this ro-mode on sysfs, so it can be obtained
by userspace tools.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 22fd19c0c5d3..7091fca0fb44 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -149,6 +149,8 @@ static struct device_attribute dev_bgt_enabled =
 	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_ro_mode =
+	__ATTR(ro_mode, S_IRUGO, dev_attribute_show, NULL);
 
 /**
  * ubi_volume_notify - send a volume change notification.
@@ -385,6 +387,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi->thread_enabled);
 	else if (attr == &dev_mtd_num)
 		ret = sprintf(buf, "%d\n", ubi->mtd->index);
+	else if (attr == &dev_ro_mode)
+		ret = sprintf(buf, "%d\n", ubi->ro_mode);
 	else
 		ret = -EINVAL;
 
@@ -404,6 +408,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_min_io_size.attr,
 	&dev_bgt_enabled.attr,
 	&dev_mtd_num.attr,
+	&dev_ro_mode.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(ubi_dev);
-- 
2.7.0
