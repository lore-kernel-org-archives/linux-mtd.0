Subject: Re: [PATCH v3] MTD: expose subpage size via sysfs
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1239982072.14298.1.camel@localhost.localdomain>
References: <1239981096.3390.300.camel@localhost.localdomain>
	<1239982072.14298.1.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Apr 2009 12:29:42 +0300
Message-Id: <1240046982.14298.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

And yet another version. Make subpage file name "subpagesize",
not "subpage_size", just for consistency, because we already
have "erasesize" and "writesize" files.
--

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH v3] MTD: expose subpage size via sysfs

MTD has got sysfs support in 2.6.30-rc1. But subpage size is not
exposed there - do this.

UBI utilities badly need this parameter. At the moment there is
no way to get subpage size - ioctls do not return it. And we
just got sysfs support, so we can easilly extend it with this
additional parameter.

This can be merged late in the development cycle because:
1. sysfs support has been just added - there are no users for
   it so far, even.
2. UBI utilities really need this parameter, and it is better
   not to delay this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdcore.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index fdd6ae8..68e3846 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -132,6 +132,17 @@ static ssize_t mtd_writesize_show(struct device *dev,
 }
 static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
 
+static ssize_t mtd_subpagesize_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+	unsigned int subpagesize = mtd->writesize >> mtd->subpage_sft;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", subpagesize);
+
+}
+static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
+
 static ssize_t mtd_oobsize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -169,6 +180,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_size.attr,
 	&dev_attr_erasesize.attr,
 	&dev_attr_writesize.attr,
+	&dev_attr_subpagesize.attr,
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
