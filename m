Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffNGi-0008RG-0M
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 10:31:47 +0000
From: Per Forlin <per.forlin@axis.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Per Forlin <perfn@axis.com>
Subject: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 12:30:19 +0200
Message-Id: <1531823419-8665-1-git-send-email-perfn@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simple read and write statistics.
* Bytes read
* Bytes written
* Number of reads
* Number of writes

This is useful to find out how the storage is being utilized.
For block devices this already exists via /proc/diskstats.
The intention of this patch is to add similar stats
for UBI as well.
---
 drivers/mtd/ubi/eba.c |  6 ++++++
 drivers/mtd/ubi/ubi.h | 19 +++++++++++++++++++
 drivers/mtd/ubi/vmt.c |  8 ++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index b98481b..8d708c4 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -618,6 +618,9 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	if (err)
 		return err;
 
+	vol->stats.rcount++;
+	vol->stats.rbytes += len;
+
 	pnum = vol->eba_tbl->entries[lnum].pnum;
 	if (pnum >= 0) {
 		err = check_mapping(ubi, vol, lnum, &pnum);
@@ -1032,6 +1035,9 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	if (err)
 		return err;
 
+	vol->stats.wcount++;
+	vol->stats.wbytes += len;
+
 	pnum = vol->eba_tbl->entries[lnum].pnum;
 	if (pnum >= 0) {
 		err = check_mapping(ubi, vol, lnum, &pnum);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f5ba97c..08a313fe 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -293,6 +293,23 @@ struct ubi_eba_leb_desc {
 };
 
 /**
+ * struct ubi_volume_stats - Volume statistics
+ * @rbytes: the number of bytes read
+ * @wbytes: the number of bytes written
+ * @rcount: the number of read requests
+ * @wcount: the number of write requests
+ *
+ * This structure contains read and write statistics.
+ *
+ */
+struct ubi_volume_stats {
+	u64 rbytes;
+	u64 wbytes;
+	u32 rcount;
+	u32 wcount;
+};
+
+/**
  * struct ubi_volume - UBI volume description data structure.
  * @dev: device object to make use of the the Linux device model
  * @cdev: character device object to create character device
@@ -384,6 +401,8 @@ struct ubi_volume {
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	unsigned long *checkmap;
 #endif
+
+	struct ubi_volume_stats stats;
 };
 
 /**
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 0be5167..021de10 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -51,6 +51,8 @@ static struct device_attribute attr_vol_data_bytes =
 	__ATTR(data_bytes, S_IRUGO, vol_attribute_show, NULL);
 static struct device_attribute attr_vol_upd_marker =
 	__ATTR(upd_marker, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute attr_vol_stats =
+	__ATTR(stats, S_IRUGO, vol_attribute_show, NULL);
 
 /*
  * "Show" method for files in '/<sysfs>/class/ubi/ubiX_Y/'.
@@ -107,6 +109,11 @@ static ssize_t vol_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%lld\n", vol->used_bytes);
 	else if (attr == &attr_vol_upd_marker)
 		ret = sprintf(buf, "%d\n", vol->upd_marker);
+	else if (attr == &attr_vol_stats)
+		ret = sprintf(buf, "rbytes wbytes rcount wcount:\n"
+			      "%llu %llu %u %u\n",
+			      vol->stats.rbytes, vol->stats.wbytes,
+			      vol->stats.rcount, vol->stats.wcount);
 	else
 		/* This must be a bug */
 		ret = -EINVAL;
@@ -129,6 +136,7 @@ static struct attribute *volume_dev_attrs[] = {
 	&attr_vol_usable_eb_size.attr,
 	&attr_vol_data_bytes.attr,
 	&attr_vol_upd_marker.attr,
+	&attr_vol_stats.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(volume_dev);
-- 
2.1.4
