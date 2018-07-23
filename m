Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhcvl-0007FZ-Ry
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 15:39:27 +0000
From: Per Forlin <per.forlin@axis.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, derosier@gmail.com,
 Per Forlin <perfn@axis.com>
Subject: [PATCH v2] UBI: Add volume read and write statistics
Date: Mon, 23 Jul 2018 17:39:02 +0200
Message-Id: <1532360342-52055-1-git-send-email-perfn@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simple read and write statistics.
* Number of reads
* Number of writes
* Bytes read
* Bytes written

This is useful to find out how the storage is being utilized.
For block devices this already exists here:
/sys/class/block/<device>/stat

For UBI it now exists here:
/sys/class/ubi/<volume>/stat

Example:
/sys/class/ubi/ubi0_21/stat
864 0 3106756 0 1057 0 2144256 0 0 0 0

The output format is same as for block devices
except that not all metrics are supported yet.
Unsupported values are set to 0.
---
Changelog:

v2
* Question: Translate bytes to sectors? iostats format expects sector unit.
* Align with iostats format
* Only count successful reads and writes

 drivers/mtd/ubi/eba.c | 11 ++++++++++-
 drivers/mtd/ubi/ubi.h | 19 +++++++++++++++++++
 drivers/mtd/ubi/vmt.c |  8 ++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index b98481b..c9a88b2 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -731,6 +731,11 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		}
 	}
 
+	if (!err) {
+		vol->stat.rcount++;
+		vol->stat.rbytes += len;
+	}
+
 	if (scrub)
 		err = ubi_wl_scrub_peb(ubi, pnum);
 
@@ -1091,8 +1096,12 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	ubi_free_vid_buf(vidb);
 
 out:
-	if (err)
+	if (err) {
 		ubi_ro_mode(ubi);
+	} else {
+		vol->stat.wcount++;
+		vol->stat.wbytes += len;
+	}
 
 	leb_write_unlock(ubi, vol_id, lnum);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f5ba97c..0cb00f0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -293,6 +293,23 @@ struct ubi_eba_leb_desc {
 };
 
 /**
+ * struct ubi_volume_stat - Volume statistics
+ * @rbytes: the number of bytes read
+ * @wbytes: the number of bytes written
+ * @rcount: the number of read requests
+ * @wcount: the number of write requests
+ *
+ * This structure contains read and write statistics.
+ *
+ */
+struct ubi_volume_stat {
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
+	struct ubi_volume_stat stat;
 };
 
 /**
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 0be5167..69b5375 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -51,6 +51,8 @@ static struct device_attribute attr_vol_data_bytes =
 	__ATTR(data_bytes, S_IRUGO, vol_attribute_show, NULL);
 static struct device_attribute attr_vol_upd_marker =
 	__ATTR(upd_marker, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute attr_vol_stat =
+	__ATTR(stat, S_IRUGO, vol_attribute_show, NULL);
 
 /*
  * "Show" method for files in '/<sysfs>/class/ubi/ubiX_Y/'.
@@ -107,6 +109,11 @@ static ssize_t vol_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%lld\n", vol->used_bytes);
 	else if (attr == &attr_vol_upd_marker)
 		ret = sprintf(buf, "%d\n", vol->upd_marker);
+	else if (attr == &attr_vol_stat)
+		/* Format conforming to Documentation/iostats.txt */
+		ret = sprintf(buf, "%u 0 %llu 0 %u 0 %llu 0 0 0 0\n",
+			      vol->stat.rcount, vol->stat.rbytes,
+			      vol->stat.wcount, vol->stat.wbytes);
 	else
 		/* This must be a bug */
 		ret = -EINVAL;
@@ -129,6 +136,7 @@ static struct attribute *volume_dev_attrs[] = {
 	&attr_vol_usable_eb_size.attr,
 	&attr_vol_data_bytes.attr,
 	&attr_vol_upd_marker.attr,
+	&attr_vol_stat.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(volume_dev);
-- 
2.1.4
