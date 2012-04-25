Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Xo-0004Gz-MK
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:06:29 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/7] mtd: expose ecc_strength through sysfs
Date: Wed, 25 Apr 2012 12:06:07 -0700
Message-Id: <1335380771-27805-4-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ecc_strength element of struct mtd_info is exposed as a read-only variable in
sysfs.  

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

This v2 is actually unchanged from the original set.

 Documentation/ABI/testing/sysfs-class-mtd |   12 ++++++++++++
 drivers/mtd/mtdcore.c                     |   10 ++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 4d55a18..43d1818 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -123,3 +123,15 @@ Description:
 		half page, or a quarter page).
 
 		In the case of ECC NOR, it is the ECC block size.
+
+What:		/sys/class/mtd/mtdX/ecc_strength
+Date:		April 2012
+KernelVersion:	3.4
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Maximum number of bit errors that the device is capable of
+		correcting within each region covering an ecc step.  This will
+		always be a non-negative integer.  Note that some devices will
+		have multiple ecc steps within each writesize region.
+
+		In the case of devices lacking any ECC capability, it is 0.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c837507..090e849 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -250,6 +250,15 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_ecc_strength_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_strength);
+}
+static DEVICE_ATTR(ecc_strength, S_IRUGO, mtd_ecc_strength_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -260,6 +269,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_ecc_strength.attr,
 	NULL,
 };
 
-- 
1.7.3.4
