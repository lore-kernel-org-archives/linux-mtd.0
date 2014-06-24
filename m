Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzRDc-0003oI-Rh
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 13:57:06 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 1/3] mtd: Add sysfs attributes to expose the ECC stats
 fields
Date: Tue, 24 Jun 2014 10:55:50 -0300
Message-Id: <1403618152-4515-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
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
 Documentation/ABI/testing/sysfs-class-mtd | 38 ++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c                     | 45 +++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 1399bb2..176cf02 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -184,3 +184,41 @@ Description:
 
 		It will always be a non-negative integer.  In the case of
 		devices lacking any ECC capability, it is 0.
+
+What:		/sys/class/mtd/mtdX/ecc_failures
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of failures reported by this device's ECC. Typically,
+		this failures are associated to failed read operations.
+
+		It will always be a non-negative integer.  In the case of
+		devices lacking any ECC capability, it is 0.
+
+What:		/sys/class/mtd/mtdX/corrected_bits
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of bits that have been corrected by means of the
+		device's ECC.
+
+		It will always be a non-negative integer.  In the case of
+		devices lacking any ECC capability, it is 0.
+
+What:		/sys/class/mtd/mtdX/bad_blocks
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of blocks marked as bad, is any, in this partition.
+
+What:		/sys/class/mtd/mtdX/bbt_blocks
+Date:		June 2014
+KernelVersion:	3.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The number of blocks that are marked as reserved, if any, in
+		this partition. These are typically used to store the in-flash
+		bad block table.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d201fee..11857fa 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -298,6 +298,47 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
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
+static DEVICE_ATTR(ecc_failures, S_IRUGO, mtd_ecc_stats_errors_show, NULL);
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
@@ -310,6 +351,10 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,
 	&dev_attr_ecc_step_size.attr,
+	&dev_attr_corrected_bits.attr,
+	&dev_attr_ecc_failures.attr,
+	&dev_attr_bad_blocks.attr,
+	&dev_attr_bbt_blocks.attr,
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-- 
1.9.1
