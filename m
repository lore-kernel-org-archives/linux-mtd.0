Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdnOp-00029o-GJ
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 22:15:44 +0000
Received: by igcau2 with SMTP id au2so88284582igc.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 15:15:22 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 2/3] mtd: part: Add sysfs variable for offset of partition
Date: Thu,  2 Apr 2015 15:15:11 -0700
Message-Id: <1428012912-17551-3-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1428012912-17551-1-git-send-email-dehrenberg@chromium.org>
References: <1428012912-17551-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes a sysfs variable called 'offset' on each partition
which contains the offset in bytes from the beginning of the master
device that the partition starts.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-mtd | 10 ++++++++++
 drivers/mtd/mtdpart.c                     | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 76ee192..3b5c3bc 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -222,3 +222,13 @@ Description:
 		The number of blocks that are marked as reserved, if any, in
 		this partition. These are typically used to store the in-flash
 		bad block table (BBT).
+
+What:		/sys/class/mtd/mtdX/offset
+Date:		March 2015
+KernelVersion:	4.1
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		For a partition, the offset of that partition from the start
+		of the master device in bytes. This attribute is absent on
+		main devices, so it can be used to distinguish between
+		partitions and devices that aren't partitions.
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a19ec5a..be80340 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -554,6 +554,30 @@ out_register:
 	return slave;
 }
 
+static ssize_t mtd_partition_offset_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_part *part = PART(mtd);
+	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
+}
+
+static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
+
+static const struct attribute *mtd_partition_attrs[] = {
+	&dev_attr_offset.attr,
+	NULL
+};
+
+static int mtd_add_partition_attrs(struct mtd_part *new)
+{
+	int ret = sysfs_create_files(&new->mtd.dev.kobj, mtd_partition_attrs);
+	if (ret)
+		printk(KERN_WARNING
+		       "mtd: failed to create partition attrs, err=%d\n", ret);
+	return ret;
+}
+
 int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length)
 {
@@ -603,6 +627,8 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 
 	add_mtd_device(&new->mtd);
 
+	mtd_add_partition_attrs(new);
+
 	return ret;
 err_inv:
 	mutex_unlock(&mtd_partitions_mutex);
@@ -620,6 +646,8 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->master == master) &&
 		    (slave->mtd.index == partno)) {
+			sysfs_remove_files(&slave->mtd.dev.kobj,
+					   mtd_partition_attrs);
 			ret = del_mtd_device(&slave->mtd);
 			if (ret < 0)
 				break;
@@ -663,6 +691,7 @@ int add_mtd_partitions(struct mtd_info *master,
 		mutex_unlock(&mtd_partitions_mutex);
 
 		add_mtd_device(&slave->mtd);
+		mtd_add_partition_attrs(slave);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
-- 
2.2.0.rc0.207.ga3a616c
