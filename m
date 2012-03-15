Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8ERY-0003qq-QH
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 17:26:30 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] MTD: expose ecc_strength through sysfs
Date: Thu, 15 Mar 2012 10:25:51 -0700
Message-Id: <1331832353-15569-2-git-send-email-mikedunn@newsguy.com>
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

This patch exposes the struct mtd_info element ecc_strength as a read-only
variable through sysfs.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |   11 +++++++++++
 drivers/mtd/mtdcore.c                     |   10 ++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 4d55a18..6a218e6 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -123,3 +123,14 @@ Description:
 		half page, or a quarter page).
 
 		In the case of ECC NOR, it is the ECC block size.
+
+What:		/sys/class/mtd/mtdX/ecc_strength
+Date:		March 2012
+KernelVersion:	3.3.1
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Maximum number of bit errors that the device is capable of
+		correcting when reading a region of size writesize.  This will
+		always be a non-negative integer.
+
+		In the case of devices lacking any ECC capability, it is 0.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b274fdf..1573644 100644
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
