Subject: [PATCH 3/3] MTD: remove the 'flags' sysfs file
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1240306101.19218.2.camel@localhost.localdomain>
References: <1240306101.19218.2.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Apr 2009 12:32:35 +0300
Message-Id: <1240306355.19218.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is bad idea to export the MTD flags via sysfs. It is much
cleaner to create a per-flag sysfs file which contains 0 or
1. It is difficult for users to parse '0x400'. We have ioctls
which return the flags, no need to add this to sysfs.

Cc: David Brownell <david-b@pacbell.net>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdcore.c |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 07105a8..8067d0c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -91,16 +91,6 @@ static ssize_t mtd_type_show(struct device *dev,
 }
 static DEVICE_ATTR(type, S_IRUGO, mtd_type_show, NULL);
 
-static ssize_t mtd_flags_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct mtd_info *mtd = dev_to_mtd(dev);
-
-	return snprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)mtd->flags);
-
-}
-static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
-
 static ssize_t mtd_size_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -196,7 +186,6 @@ static DEVICE_ATTR(writable, S_IRUGO, mtd_writable_show, NULL);
 
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
-	&dev_attr_flags.attr,
 	&dev_attr_size.attr,
 	&dev_attr_erasesize.attr,
 	&dev_attr_writesize.attr,
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
