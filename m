Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnEfM-0007la-VT
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 22:07:18 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 1/3] mtd: Add sysfs attributes to expose the ECC stats
 fields
Date: Wed, 21 May 2014 19:06:11 -0300
Message-Id: <1400709973-7991-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These new sysfs device attributes allows to retrieve the ECC
and bad block stats by poking a sysfs file, which is often more convenient
than using the ioctl.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/mtdcore.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 21ce0f4..d4dcc45 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -298,6 +298,48 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 }
 static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
 
+static ssize_t mtd_ecc_stats_corrected_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->corrected);
+}
+static DEVICE_ATTR(corrected_bits, S_IRUGO,
+		   mtd_ecc_stats_corrected_show, NULL);
+
+static ssize_t mtd_ecc_stats_errors_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->failed);
+}
+static DEVICE_ATTR(uncorrectable_errors, S_IRUGO,
+		   mtd_ecc_stats_errors_show, NULL);
+
+static ssize_t mtd_badblocks_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->badblocks);
+}
+static DEVICE_ATTR(bad_blocks, S_IRUGO, mtd_badblocks_show, NULL);
+
+static ssize_t mtd_bbtblocks_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->bbtblocks);
+}
+static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -310,6 +352,10 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,
 	&dev_attr_ecc_step_size.attr,
+	&dev_attr_corrected_bits.attr,
+	&dev_attr_uncorrectable_errors.attr,
+	&dev_attr_bad_blocks.attr,
+	&dev_attr_bbt_blocks.attr,
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-- 
1.9.1
