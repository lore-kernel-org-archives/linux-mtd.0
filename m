Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6rAG-0003VL-6e
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 22:22:57 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] MTD: euclean_threshold added to mtd_info and sysfs
Date: Sun, 11 Mar 2012 14:21:12 -0700
Message-Id: <1331500873-9792-4-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The element 'euclean_threshold' is added to struct mtd_info.  If the driver
leaves this uninitialized, mtd sets it to ecc_strength when the device or
partition is registered.  This element is also exposed for reading and writing
from userspace through sysfs.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

An afterthought... ecc_strength should probably also be exposed through syfs as
a r/o value.  Ioctls for querying both these values could also be added to
mtdchar.

 Documentation/ABI/testing/sysfs-class-mtd |   23 ++++++++++++++++++++
 drivers/mtd/mtdcore.c                     |   33 +++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h                   |    7 ++++++
 3 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 4d55a18..896a671 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -123,3 +123,26 @@ Description:
 		half page, or a quarter page).
 
 		In the case of ECC NOR, it is the ECC block size.
+
+What:		/sys/class/mtd/mtdX/euclean_threshold
+Date:		March 2012
+KernelVersion:	3.3.1
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		This allows the user to examine and adjust the criteria by which
+		mtd returns -EUCLEAN from mtd_read() and mtd_read_oob().  If the
+		maximum number of bit errors corrected on any single writesize
+		during the read operation (as reported by the driver) equals or
+		exceeds this value, -EUCLEAN is returned.  Otherwise, absent an
+		error, 0 is returned.  Higher layers (e.g., UBI) use this return
+		code as an indication that an erase block may be degrading and
+		should be scrutinized as a candidate for being marked as bad.
+
+		The initial value may be set by the flash device driver.  If
+		not, then it is equal to the maximum number of bit errors that
+		the device's ECC facility is capable of correcting per
+		writesize.  Users who wish to be more paranoid about data
+		integrity can lower the value.
+
+		This is generally applicable only to NAND flash devices with
+		ECC capability.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b274fdf..5bbd717 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -250,6 +250,34 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_euclean_threshold_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->euclean_threshold);
+}
+
+static ssize_t mtd_euclean_threshold_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	unsigned int euclean_threshold;
+	int retval;
+
+	retval = kstrtouint(buf, 0, &euclean_threshold);
+	if (retval)
+		return retval;
+
+	mtd->euclean_threshold = euclean_threshold;
+	return count;
+}
+static DEVICE_ATTR(euclean_threshold, S_IRUGO | S_IWUSR,
+		   mtd_euclean_threshold_show,
+		   mtd_euclean_threshold_store);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -260,6 +288,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_euclean_threshold.attr,
 	NULL,
 };
 
@@ -322,6 +351,10 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->index = i;
 	mtd->usecount = 0;
 
+	/* default value if not set by driver */
+	if (mtd->euclean_threshold == 0)
+		mtd->euclean_threshold = mtd->ecc_strength;
+
 	if (is_power_of_2(mtd->erasesize))
 		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
 	else
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cf5ea8c..20b5c40 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -157,6 +157,13 @@ struct mtd_info {
 	unsigned int erasesize_mask;
 	unsigned int writesize_mask;
 
+	/*
+	 * read ops return -EUCLEAN if max number of bitflips corrected on any
+	 * one writesize region equals or exceeds this value.  Settable by
+	 * driver, else defaults to ecc_strength.  User can override in sysfs.
+	 */
+	unsigned int euclean_threshold;
+
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
-- 
1.7.3.4
