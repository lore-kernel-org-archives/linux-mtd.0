Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JI3dD-0008TD-DZ
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 15:05:04 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 24 Jan 2008 18:54:58 +0200
Message-Id: <20080124165458.30169.15492.sendpatchset@golum>
In-Reply-To: <20080124165453.30169.40332.sendpatchset@golum>
References: <20080124165453.30169.40332.sendpatchset@golum>
Subject: [PATCH] UBI: implement atomic LEB change ioctl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 7e8210bd9165ba279ddacd0e4fb28891318b9b66 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 24 Jan 2008 18:48:21 +0200
Subject: [PATCH] UBI: implement atomic LEB change ioctl

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |   72 +++++++++++++++++++++++++++++------
 drivers/mtd/ubi/ubi.h  |   27 +++++++++++--
 drivers/mtd/ubi/upd.c  |   99 ++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 178 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 0c4044d..9d6aae5 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -132,8 +132,15 @@ static int vol_cdev_release(struct inode *inode, struct file *file)
 	if (vol->updating) {
 		ubi_warn("update of volume %d not finished, volume is damaged",
 			 vol->vol_id);
+		ubi_assert(!vol->changing_leb);
 		vol->updating = 0;
 		vfree(vol->upd_buf);
+	} else if (vol->changing_leb) {
+		dbg_msg("only %lld of %lld bytes received for atomic LEB change"
+			" for volume %d:%d, cancel", vol->upd_received,
+			vol->upd_bytes, vol->ubi->ubi_num, vol->vol_id);
+		vol->changing_leb = 0;
+		vfree(vol->upd_buf);
 	}
 
 	ubi_close_volume(desc);
@@ -351,24 +358,32 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 	struct ubi_volume *vol = desc->vol;
 	struct ubi_device *ubi = vol->ubi;
 
-	if (!vol->updating)
+	if (!vol->updating && !vol->changing_leb)
 		return vol_cdev_direct_write(file, buf, count, offp);
 
-	err = ubi_more_update_data(ubi, vol, buf, count);
+	if (vol->updating)
+		err = ubi_more_update_data(ubi, vol, buf, count);
+	else
+		err = ubi_more_leb_change_data(ubi, vol, buf, count);
+
 	if (err < 0) {
-		ubi_err("cannot write %zd bytes of update data, error %d",
+		ubi_err("cannot accept more %zd bytes of data, error %d",
 			count, err);
 		return err;
 	}
 
 	if (err) {
 		/*
-		 * Update is finished, @err contains number of actually written
-		 * bytes now.
+		 * The operation is finished, @err contains number of actually
+		 * written bytes.
 		 */
 		count = err;
 
-		vol->updating = 0;
+		if (vol->changing_leb) {
+			revoke_exclusive(desc, UBI_READWRITE);
+			return count;
+		}
+
 		err = ubi_check_volume(ubi, vol->vol_id);
 		if (err < 0)
 			return err;
@@ -433,6 +448,43 @@ static int vol_cdev_ioctl(struct inode *inode, struct file *file,
 		break;
 	}
 
+	/* Atomic logical eraseblock change command */
+	case UBI_IOCEBCH:
+	{
+		struct ubi_leb_change_req req;
+
+		err = copy_from_user(&req, argp,
+				     sizeof(struct ubi_leb_change_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (desc->mode == UBI_READONLY ||
+		    vol->vol_type == UBI_STATIC_VOLUME) {
+			err = -EROFS;
+			break;
+		}
+
+		/* Validate the request */
+		err = -EINVAL;
+		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
+		    req.bytes < 0 || req.lnum >= vol->usable_leb_size)
+			break;
+		if (req.dtype != UBI_LONGTERM && req.dtype != UBI_SHORTTERM &&
+		    req.dtype != UBI_UNKNOWN)
+			break;
+
+		err = get_exclusive(desc);
+		if (err < 0)
+			break;
+
+		err = ubi_start_leb_change(ubi, vol, &req);
+		if (req.bytes == 0)
+			revoke_exclusive(desc, UBI_READWRITE);
+		break;
+	}
+
 #ifdef CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
 	/* Logical eraseblock erasure command */
 	case UBI_IOCEBER:
@@ -445,7 +497,8 @@ static int vol_cdev_ioctl(struct inode *inode, struct file *file,
 			break;
 		}
 
-		if (desc->mode == UBI_READONLY) {
+		if (desc->mode == UBI_READONLY ||
+		    vol->vol_type == UBI_STATIC_VOLUME) {
 			err = -EROFS;
 			break;
 		}
@@ -455,11 +508,6 @@ static int vol_cdev_ioctl(struct inode *inode, struct file *file,
 			break;
 		}
 
-		if (vol->vol_type != UBI_DYNAMIC_VOLUME) {
-			err = -EROFS;
-			break;
-		}
-
 		dbg_msg("erase LEB %d:%d", vol->vol_id, lnum);
 		err = ubi_eba_unmap_leb(ubi, vol, lnum);
 		if (err)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 3a88cf1..4577106 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -158,15 +158,23 @@ struct ubi_volume_desc;
  * @name: volume name
  *
  * @upd_ebs: how many eraseblocks are expected to be updated
- * @upd_bytes: how many bytes are expected to be received
- * @upd_received: how many update bytes were already received
- * @upd_buf: update buffer which is used to collect update data
+ * @ch_lnum: LEB number which is being changing by the atomic LEB change
+ *           operation
+ * @ch_dtype: data persistency type which is being changing by the atomic LEB
+ *            change operation
+ * @upd_bytes: how many bytes are expected to be received for volume update or
+ *             atomic LEB change
+ * @upd_received: how many bytes were already received for volume update or
+ *                atomic LEB change
+ * @upd_buf: update buffer which is used to collect update data or data for
+ *           atomic LEB change
  *
  * @eba_tbl: EBA table of this volume (LEB->PEB mapping)
  * @checked: %1 if this static volume was checked
  * @corrupted: %1 if the volume is corrupted (static volumes only)
  * @upd_marker: %1 if the update marker is set for this volume
  * @updating: %1 if the volume is being updated
+ * @changing_leb: %1 if the atomic LEB change ioctl command is in progress
  *
  * @gluebi_desc: gluebi UBI volume descriptor
  * @gluebi_refcount: reference count of the gluebi MTD device
@@ -202,6 +210,8 @@ struct ubi_volume {
 	char name[UBI_VOL_NAME_MAX+1];
 
 	int upd_ebs;
+	int ch_lnum;
+	int ch_dtype;
 	long long upd_bytes;
 	long long upd_received;
 	void *upd_buf;
@@ -211,9 +221,14 @@ struct ubi_volume {
 	int corrupted:1;
 	int upd_marker:1;
 	int updating:1;
+	int changing_leb:1;
 
 #ifdef CONFIG_MTD_UBI_GLUEBI
-	/* Gluebi-related stuff may be compiled out */
+	/*
+	 * Gluebi-related stuff may be compiled out.
+	 * TODO: this should not be built into UBI but should be a separate
+	 * ubimtd driver which works on top of UBI and emulates MTD devices.
+	 */
 	struct ubi_volume_desc *gluebi_desc;
 	int gluebi_refcount;
 	struct mtd_info gluebi_mtd;
@@ -427,6 +442,10 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 		     long long bytes);
 int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 			 const void __user *buf, int count);
+int ubi_start_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
+			 const struct ubi_leb_change_req *req);
+int ubi_more_leb_change_data(struct ubi_device *ubi, struct ubi_volume *vol,
+			     const void __user *buf, int count);
 
 /* misc.c */
 int ubi_calc_data_len(const struct ubi_device *ubi, const void *buf, int length);
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 59c61ab..40f5c0e 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -22,7 +22,8 @@
  */
 
 /*
- * This file contains implementation of the volume update functionality.
+ * This file contains implementation of the volume update and atomic LEB change
+ * functionality.
  *
  * The update operation is based on the per-volume update marker which is
  * stored in the volume table. The update marker is set before the update
@@ -133,6 +134,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 	uint64_t tmp;
 
 	dbg_msg("start update of volume %d, %llu bytes", vol->vol_id, bytes);
+	ubi_assert(!vol->updating && !vol->changing_leb);
 	vol->updating = 1;
 
 	err = set_update_marker(ubi, vol);
@@ -168,6 +170,37 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 }
 
 /**
+ * ubi_start_leb_change - start atomic LEB change.
+ * @ubi: UBI device description object
+ * @vol: volume description object
+ * @req: operation request
+ *
+ * This function starts atomic LEB change operation. Returns zero in case of
+ * success and a negative error code in case of failure.
+ */
+int ubi_start_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
+			 const struct ubi_leb_change_req *req)
+{
+	ubi_assert(!vol->updating && !vol->changing_leb);
+
+	if (req->bytes == 0)
+		return ubi_eba_atomic_leb_change(ubi, vol, req->lnum, NULL, 0,
+						 req->dtype);
+
+	vol->upd_bytes = req->bytes;
+	vol->upd_received = 0;
+	vol->changing_leb = 1;
+	vol->ch_lnum = req->lnum;
+	vol->ch_dtype = req->dtype;
+
+	vol->upd_buf = vmalloc(req->bytes);
+	if (!vol->upd_buf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
  * write_leb - write update data.
  * @ubi: UBI device description object
  * @vol: volume description object
@@ -239,9 +272,9 @@ static int write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
  * @count: how much bytes to write
  *
  * This function writes more data to the volume which is being updated. It may
- * be called arbitrary number of times until all of the update data arrive.
- * This function returns %0 in case of success, number of bytes written during
- * the last call if the whole volume update was successfully finished, and a
+ * be called arbitrary number of times until all the update data arriveis. This
+ * function returns %0 in case of success, number of bytes written during the
+ * last call if the whole volume update has been successfully finished, and a
  * negative error code in case of failure.
  */
 int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
@@ -340,6 +373,7 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 			return err;
 		err = ubi_wl_flush(ubi);
 		if (err == 0) {
+			vol->updating = 0;
 			err = to_write;
 			vfree(vol->upd_buf);
 		}
@@ -347,3 +381,60 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	return err;
 }
+
+/**
+ * ubi_more_leb_change_data - accept more data for atomic LEB change.
+ * @vol: volume description object
+ * @buf: write data (user-space memory buffer)
+ * @count: how much bytes to write
+ *
+ * This function accepts more data to the volume which is being under the
+ * "atomic LEB change" operation. It may be called arbitrary number of times
+ * until all data arrives. This function returns %0 in case of success, number
+ * of bytes written during the last call if the whole "atomic LEB change"
+ * operation has been successfully finished, and a negative error code in case
+ * of failure.
+ */
+int ubi_more_leb_change_data(struct ubi_device *ubi, struct ubi_volume *vol,
+			     const void __user *buf, int count)
+{
+	int err;
+
+	dbg_msg("write %d of %lld bytes, %lld already passed",
+		count, vol->upd_bytes, vol->upd_received);
+
+	if (ubi->ro_mode)
+		return -EROFS;
+
+	if (vol->upd_received + count > vol->upd_bytes)
+		count = vol->upd_bytes - vol->upd_received;
+
+	err = copy_from_user(vol->upd_buf + vol->upd_received, buf, count);
+	if (err)
+		return -EFAULT;
+
+	if (vol->upd_received + count == vol->upd_bytes) {
+		int l;
+
+		l = ubi_calc_data_len(ubi, buf, vol->upd_bytes);
+		if (l != vol->upd_bytes)
+			dbg_msg("skip last %lld bytes (0xFF)",
+				vol->upd_bytes - l);
+		err = ubi_eba_atomic_leb_change(ubi, vol, vol->ch_lnum,
+						vol->upd_buf, l, UBI_UNKNOWN);
+		if (err)
+			return err;
+	}
+
+	vol->upd_received += count;
+	buf += count;
+
+	ubi_assert(vol->upd_received <= vol->upd_bytes);
+	if (vol->upd_received == vol->upd_bytes) {
+		vol->changing_leb = 0;
+		err = count;
+		vfree(vol->upd_buf);
+	}
+
+	return err;
+}
-- 
1.5.3.4
