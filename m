Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQy5q-0002In-Nz
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:58:36 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Date: Fri, 21 Mar 2014 08:57:41 -0300
Message-Id: <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This new sysfs device attribute allows to retrieve the ECC stats
by poking a sysfs file, which is much simpler than using the ioctl.

The output format is inspired in block device sysfs 'stat' file.
The ecc_stats struct fields are shown as ordered in the structure,
in a machine parseable format.

Here's a typical output showing 3 ECC-corrected and 8 bad blocks:
       3        0        8        0

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/mtdcore.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d201fee..c5e9943 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -298,6 +298,19 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 }
 static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
 
+static ssize_t mtd_ecc_stats_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
+
+	return snprintf(buf, PAGE_SIZE, "%8u %8u %8u %8u\n", ecc_stats->corrected,
+						ecc_stats->failed,
+						ecc_stats->badblocks,
+						ecc_stats->bbtblocks);
+}
+static DEVICE_ATTR(ecc_stats, S_IRUGO, mtd_ecc_stats_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -310,6 +323,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,
 	&dev_attr_ecc_step_size.attr,
+	&dev_attr_ecc_stats.attr,
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-- 
1.9.0
