Subject: [PATCH 1/3] MTD: add sysfs file which tells if bad blocks are allowed
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1240306101.19218.2.camel@localhost.localdomain>
References: <1240306101.19218.2.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Apr 2009 12:30:20 +0300
Message-Id: <1240306220.19218.3.camel@localhost.localdomain>
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

Add a per-mtd device 'bb_allowed' sysfs file which contains 0
if bad blocks are not allowed, and 1 if they are allowed.

This is useful for userspace.

Cc: David Brownell <david-b@pacbell.net>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdcore.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index bccb4b1..c46f1a9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -174,6 +174,16 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_bb_allowed_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", !!mtd->block_markbad);
+
+}
+static DEVICE_ATTR(bb_allowed, S_IRUGO, mtd_bb_allowed_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -184,6 +194,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_bb_allowed.attr,
 	NULL,
 };
 
-- 
1.6.0.6


-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
