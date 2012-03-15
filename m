Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8ERb-0003rG-7L
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 17:26:31 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] MTD: bitflip_threshold added to mtd_info and sysfs
Date: Thu, 15 Mar 2012 10:25:52 -0700
Message-Id: <1331832353-15569-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The element 'bitflip_threshold' is added to struct mtd_info.  If the driver
leaves this uninitialized, mtd sets it to ecc_strength when the device or
partition is registered.  This element is also exposed for reading and writing
from userspace through sysfs.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |   31 +++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c                     |   33 +++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h                   |    9 ++++++++
 3 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 6a218e6..e2f24c8 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -134,3 +134,34 @@ Description:
 		always be a non-negative integer.
 
 		In the case of devices lacking any ECC capability, it is 0.
+
+What:		/sys/class/mtd/mtdX/bitflip_threshold
+Date:		March 2012
+KernelVersion:	3.3.1
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		This allows the user to examine and adjust the criteria by which
+		mtd returns -EUCLEAN from mtd_read() and mtd_read_oob().  If the
+		maximum number of bit errors that were corrected on any single
+		writesize region (as reported by the driver) equals or exceeds
+		this value, -EUCLEAN is returned.  Otherwise, absent an error, 0
+		is returned.  Higher layers (e.g., UBI) use this return code as
+		an indication that an erase block may be degrading and should be
+		scrutinized as a candidate for being marked as bad.
+
+		The initial value may be specified by the flash device driver.
+		If not, then the default value is ecc_strength.  Users who wish
+		to be more paranoid about data integrity can lower the value.
+		If the value exceeds ecc_strength, -EUCLEAN is never returned by
+		the read functions.
+
+		Note that the introduction of this feature brings a subtle
+		change to the meaning of the -EUCLEAN return code.  Previously,
+		it was interpreted to mean simply "one or more bit errors were
+		corrected".  Its new interpretation can be phrased as "a
+		dangerously high number of bit errors were corrected on one or
+		more writesize regions".  The precise definition of "dangerously
+		high" can be adjusted by the user with bitflip_threshold.
+
+		This is generally applicable only to NAND flash devices with ECC
+		capability.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1573644..7e20335 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -259,6 +259,34 @@ static ssize_t mtd_ecc_strength_show(struct device *dev,
 }
 static DEVICE_ATTR(ecc_strength, S_IRUGO, mtd_ecc_strength_show, NULL);
 
+static ssize_t mtd_bitflip_threshold_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->bitflip_threshold);
+}
+
+static ssize_t mtd_bitflip_threshold_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	unsigned int bitflip_threshold;
+	int retval;
+
+	retval = kstrtouint(buf, 0, &bitflip_threshold);
+	if (retval)
+		return retval;
+
+	mtd->bitflip_threshold = bitflip_threshold;
+	return count;
+}
+static DEVICE_ATTR(bitflip_threshold, S_IRUGO | S_IWUSR,
+		   mtd_bitflip_threshold_show,
+		   mtd_bitflip_threshold_store);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -270,6 +298,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,
+	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
 
@@ -332,6 +361,10 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->index = i;
 	mtd->usecount = 0;
 
+	/* default value if not set by driver */
+	if (mtd->bitflip_threshold == 0)
+		mtd->bitflip_threshold = mtd->ecc_strength;
+
 	if (is_power_of_2(mtd->erasesize))
 		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
 	else
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cf5ea8c..1c3706e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -157,6 +157,15 @@ struct mtd_info {
 	unsigned int erasesize_mask;
 	unsigned int writesize_mask;
 
+	/*
+	 * read ops return -EUCLEAN if max number of bitflips corrected on any
+	 * one writesize region equals or exceeds this value.  Settable by
+	 * driver, else defaults to ecc_strength.  User can override in sysfs.
+	 * N.B. The meaning of the -EUCLEAN return code has changed; see
+	 * Documentation/ABI/testing/sysfs-class-mtd for more detail.
+	 */
+	unsigned int bitflip_threshold;
+
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
-- 
1.7.3.4
