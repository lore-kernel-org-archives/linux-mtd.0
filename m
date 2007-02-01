Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCZ9z-0001CU-7b
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 10:27:27 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Date: Thu, 01 Feb 2007 12:21:11 +0200
Message-Id: <20070201102111.15629.24289.sendpatchset@localhost.localdomain>
In-Reply-To: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
References: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
Subject: [RFC] [PATCH 1/1] [MTD] UBI: implement per-volume update
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 1 Feb 2007 12:01:02 +0200
Subject: [PATCH] [MTD] UBI: implement per-volume update

This patch removes the global update marker support and everything
related to it. Now we have per-volume update marker bit in the
volume table. This makes us incompatible with older UBI images but
this is not a big deal - UBI is not used so widely so far and we
can afford dropping legacy stuff now.

This patch is based on Alexander Schmidt's patch.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c    |    2 +-
 drivers/mtd/ubi/debug.c   |    1 +
 drivers/mtd/ubi/eba.c     |    8 +--
 drivers/mtd/ubi/eba.h     |    5 +-
 drivers/mtd/ubi/gluebi.c  |    3 +-
 drivers/mtd/ubi/misc.c    |   26 -----
 drivers/mtd/ubi/misc.h    |   11 --
 drivers/mtd/ubi/sysfs.c   |   25 +++++
 drivers/mtd/ubi/uif.c     |    2 +-
 drivers/mtd/ubi/upd.c     |  247 ++++++++-------------------------------------
 drivers/mtd/ubi/upd.h     |   24 +----
 drivers/mtd/ubi/volmgmt.c |    4 -
 drivers/mtd/ubi/vtbl.c    |  125 ++++++++++++++++-------
 drivers/mtd/ubi/vtbl.h    |   29 ++++--
 include/mtd/ubi-header.h  |  160 ++++++++++++-----------------
 15 files changed, 250 insertions(+), 422 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 1ca67a3..8a201aa 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1031,7 +1031,7 @@ static ssize_t vol_cdev_direct_write(struct file *file, const char __user *buf,
 			 len, vol_id, lnum, off);
 
 		err = ubi_eba_write_leb(ubi, vol_id, lnum, tbuf, off, len,
-					UBI_DATA_UNKNOWN, &written, NULL);
+					UBI_DATA_UNKNOWN, &written);
 		if (unlikely(err)) {
 			count -= written;
 			*offp += written;
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index c52716c..ec2e6ea 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -846,6 +846,7 @@ void ubi_dbg_dump_vol_tbl_record(const struct ubi_vol_tbl_record *r)
 	dump_msg("alignment       %d", ubi32_to_cpu(r->alignment));
 	dump_msg("data_pad        %d", ubi32_to_cpu(r->data_pad));
 	dump_msg("vol_type        %d", (int)r->vol_type);
+	dump_msg("upd_marker      %d", (int)r->upd_marker);
 	dump_msg("name_len        %zd", name_len);
 
 	if (r->name[0] == '\0') {
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 331897d..1999d79 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -503,8 +503,7 @@ out_unlock:
 
 int ubi_eba_write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
 		      const void *buf, int offset, size_t len,
-		      enum ubi_data_type dtype, size_t *written,
-		      const void *ivol_data)
+		      enum ubi_data_type dtype, size_t *written)
 {
 	int err, pnum, tries = 0;
 	uint32_t leb_ver;
@@ -573,11 +572,6 @@ retry:
 	vid_hdr->lnum = cpu_to_ubi32(lnum);
 	vid_hdr->compat = ubi_vtbl_get_compat(ubi, vol_id);
 	vid_hdr->data_pad = cpu_to_ubi32(vtr->data_pad);
-	if (ivol_data) {
-		ubi_assert(ubi_is_ivol(vol_id));
-		memcpy(&vid_hdr->ivol_data[0], ivol_data,
-		       UBI_VID_HDR_IVOL_DATA_SIZE);
-	}
 
 	pnum = ubi_wl_get_peb(ubi, dtype);
 	if (unlikely(pnum < 0)) {
diff --git a/drivers/mtd/ubi/eba.h b/drivers/mtd/ubi/eba.h
index d0e4c48..f58b5e6 100644
--- a/drivers/mtd/ubi/eba.h
+++ b/drivers/mtd/ubi/eba.h
@@ -138,8 +138,6 @@ int ubi_eba_read_leb(const struct ubi_info *ubi, int vol_id, int lnum,
  * @len: how many bytes to write
  * @dtype: data type
  * @written: how many bytes were actually written
- * @ivol_data: private data to put to the VID header (used only for internal
- * volumes)
  *
  * This function writes data to a logical eraseblock of a dynamic volume.
  * Returns zero in case of success and a negative error code in case of
@@ -148,8 +146,7 @@ int ubi_eba_read_leb(const struct ubi_info *ubi, int vol_id, int lnum,
  */
 int ubi_eba_write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
 		      const void *buf, int offset, size_t len,
-		      enum ubi_data_type dtype, size_t *written,
-		      const void *ivol_data);
+		      enum ubi_data_type dtype, size_t *written);
 
 /**
  * ubi_eba_write_leb_st - write data to a logical eraseblock of a static volume.
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 4250854..924e8f4 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -283,8 +283,7 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			   to_write, vol->vol_id, lnum, offs);
 
 		err = ubi_eba_write_leb(ubi, vol->vol_id, lnum, buf, offs,
-					to_write, UBI_DATA_UNKNOWN, retlen,
-					NULL);
+					to_write, UBI_DATA_UNKNOWN, retlen);
 		written += *retlen;
 		if (unlikely(err))
 			break;
diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index 49eb4fa..1a80fc2 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -26,7 +26,6 @@
 #include "debug.h"
 #include "eba.h"
 #include "alloc.h"
-#include "wl.h"
 #include "io.h"
 #include "account.h"
 #include "background.h"
@@ -103,31 +102,6 @@ int ubi_calc_data_len(const struct ubi_info *ubi, const uint8_t *buf,
 	return length;
 }
 
-int ubi_wipe_out_volume(const struct ubi_info *ubi, int vol_id)
-{
-	int i, err;
-	const struct ubi_vtbl_vtr *vtr;
-
-	ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
-
-	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
-	for (i = 0; i < vtr->reserved_pebs; i++) {
-		cond_resched();
-
-		err = ubi_eba_erase_leb(ubi, vol_id, i);
-		if (unlikely(err))
-			return err;
-	}
-
-	err = ubi_wl_erase_flush(ubi);
-	if (err)
-		return err;
-
-	ubi_vtbl_set_data_len(ubi, vol_id, 0);
-
-	return 0;
-}
-
 void ubi_ro_mode(const struct ubi_info *ubi)
 {
 	ubi_bgt_disable(ubi);
diff --git a/drivers/mtd/ubi/misc.h b/drivers/mtd/ubi/misc.h
index dc45b7b..f6f2ced 100644
--- a/drivers/mtd/ubi/misc.h
+++ b/drivers/mtd/ubi/misc.h
@@ -112,17 +112,6 @@ int ubi_calc_data_len(const struct ubi_info *ubi, const uint8_t *buf,
 		      size_t length);
 
 /**
- * ubi_wipe_out_volume - wipe out an UBI volume.
- *
- * @ubi: the UBI device description object
- * @vol_id: ID of the volume to free
- *
- * This function erases all the volume's eraseblocks. Returns zero in case of
- * success, and a negative error code in case of failure.
- */
-int ubi_wipe_out_volume(const struct ubi_info *ubi, int vol_id);
-
-/**
  * ubi_ro_mode - switch UBI to read-only mode.
  *
  * @ubi: the UBI device description object
diff --git a/drivers/mtd/ubi/sysfs.c b/drivers/mtd/ubi/sysfs.c
index 182d1c1..6ead635 100644
--- a/drivers/mtd/ubi/sysfs.c
+++ b/drivers/mtd/ubi/sysfs.c
@@ -205,6 +205,7 @@ static ssize_t vol_corrupted_show(struct class_device *dev, char *buf);
 static ssize_t vol_alignment_show(struct class_device *dev, char *buf);
 static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf);
 static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf);
+static ssize_t vol_upd_marker_show(struct class_device *dev, char *buf);
 
 /*
  * Class device attributes corresponding to files in
@@ -224,6 +225,8 @@ static struct class_device_attribute vol_usable_eb_size =
 	__ATTR(usable_eb_size, S_IRUGO, vol_usable_eb_size_show, NULL);
 static struct class_device_attribute vol_data_bytes =
 	__ATTR(data_bytes, S_IRUGO, vol_data_bytes_show, NULL);
+static struct class_device_attribute vol_upd_marker =
+	__ATTR(upd_marker, S_IRUGO, vol_upd_marker_show, NULL);
 
 /*
  * Note, this function does not free allocated resources in case of failure -
@@ -264,11 +267,15 @@ int ubi_sysfs_vol_init(const struct ubi_info *ubi, struct ubi_uif_volume *vol)
 	err = class_device_create_file(&vol->dev, &vol_data_bytes);
 	if (err)
 		return err;
+	err = class_device_create_file(&vol->dev, &vol_upd_marker);
+	if (err)
+		return err;
 	return 0;
 }
 
 void ubi_sysfs_vol_close(struct ubi_uif_volume *vol)
 {
+	class_device_remove_file(&vol->dev, &vol_upd_marker);
 	class_device_remove_file(&vol->dev, &vol_data_bytes);
 	class_device_remove_file(&vol->dev, &vol_usable_eb_size);
 	class_device_remove_file(&vol->dev, &vol_alignment);
@@ -549,3 +556,21 @@ static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf)
 	spin_unlock(&vol->vol_lock);
 	return ret;
 }
+
+static ssize_t vol_upd_marker_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		dbg_uif("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	ret = sprintf(buf, "%lld\n", vtr->upd_marker);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
diff --git a/drivers/mtd/ubi/uif.c b/drivers/mtd/ubi/uif.c
index bc0d6fe..6fa4945 100644
--- a/drivers/mtd/ubi/uif.c
+++ b/drivers/mtd/ubi/uif.c
@@ -462,7 +462,7 @@ int ubi_eraseblock_write(struct ubi_vol_desc *udesc, int lnum, const void *buf,
 	}
 
 	return ubi_eba_write_leb(ubi, vol_id, lnum, buf, offset, len, dtype,
-				 written, NULL);
+				 written);
 }
 EXPORT_SYMBOL_GPL(ubi_eraseblock_write);
 
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 55db023..0773b98 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -17,6 +17,8 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
  *
  * Author: Artem B. Bityutskiy
+ *
+ * Jan 2007: Alexander Schmidt, hacked per-volume update.
  */
 
 #include <linux/mutex.h>
@@ -25,7 +27,6 @@
 #include <linux/sched.h>
 #include <asm/uaccess.h>
 #include <asm/div64.h>
-#include <mtd/ubi-header.h>
 #include "ubi.h"
 #include "upd.h"
 #include "wl.h"
@@ -38,12 +39,11 @@
 #include "scan.h"
 #include "debug.h"
 
-static int put_marker(const struct ubi_info *ubi, int vol_id);
-static int finish_update(const struct ubi_info *ubi);
+static int ubi_wipe_out_volume(const struct ubi_info *ubi, int vol_id);
 
 int ubi_upd_start(const struct ubi_info *ubi, int vol_id, long long bytes)
 {
-	int err, rem, marker_present = 0;
+	int err, rem;
 	uint64_t tmp;
 	const struct ubi_vtbl_vtr *vtr;
 	struct ubi_upd_info *upd = ubi->upd;
@@ -57,45 +57,30 @@ int ubi_upd_start(const struct ubi_info *ubi, int vol_id, long long bytes)
 		   bytes <= vtr->usable_leb_size * vtr->reserved_pebs);
 
 	mutex_lock(&upd->mutex);
-	if (upd->vol_id != -1) {
-		/* Hmm, the update marker is busy */
-		err = -EBUSY;
-		if (upd->updating) {
-			dbg_upd("volume %d is being updated, update marker "
-				"busy", upd->vol_id);
-			goto out_unlock;
-		} else if (upd->vol_id != vol_id) {
-			dbg_upd("update was interrupted and the update marker "
-				"is held by volume %d",	upd->vol_id);
-			goto out_unlock;
-		}
 
-		/*
-		 * The update marker on the flash media corresponds to our
-		 * volume. Proceed with the update operation.
-		 */
-		marker_present = 1;
+	if (upd->updating == 1) {
+		dbg_err("volume %d is being updated", upd->vol_id);
+		mutex_unlock(&upd->mutex);
+		return -EBUSY;
 	}
 
 	upd->updating = 1;
 	upd->vol_id = vol_id;
 
-	if (!marker_present) {
-		err = put_marker(ubi, vol_id);
-		if (err)
-			goto out_unlock;
-	}
+	/* Set the update marker first */
+	err = ubi_vtbl_set_upd_marker(ubi, vol_id);
+	if (err)
+		goto out_unlock;
 
-	/* Before updating, we wipe out volume */
+	/* Before updating, we wipe out the volume */
 	err = ubi_wipe_out_volume(ubi, vol_id);
 	if (err)
 		goto out_unlock;
 
 	if (bytes == 0) {
 		/* Zero bytes means the volume just has to be erased */
-		err = finish_update(ubi);
-		if (err)
-			goto out_unlock;
+		err = ubi_vtbl_clear_upd_marker(ubi, vol_id, 0);
+		goto out_unlock;
 	}
 
 	tmp = bytes;
@@ -138,11 +123,8 @@ int ubi_upd_write_data(const struct ubi_info *ubi, int vol_id,
 
 	mutex_lock(&upd->mutex);
 
-	if (!upd->updating || upd->vol_id != vol_id) {
+	if (unlikely(!upd->updating || upd->vol_id != vol_id)) {
 		dbg_err("volume %d update was not started", vol_id);
-		if (upd->vol_id != -1)
-			dbg_err("update marker belongs to volume %d",
-				upd->vol_id);
 		err = -EINVAL;
 		goto out_unlock;
 	}
@@ -249,9 +231,11 @@ int ubi_upd_write_data(const struct ubi_info *ubi, int vol_id,
 
 	ubi_assert(upd->upd_received <= upd->upd_bytes);
 	if (upd->upd_received == upd->upd_bytes) {
-		 err = finish_update(ubi);
-		 if (err == 0)
-			 err = 1;
+		/* The update is finished, clear the update marker */
+		upd->updating = 0;
+		err = ubi_vtbl_clear_upd_marker(ubi, vol_id, upd->upd_bytes);
+		if (err == 0)
+			err = 1;
 	}
 
 out_unlock:
@@ -261,53 +245,28 @@ out_unlock:
 
 int ubi_upd_abort(const struct ubi_info *ubi, int vol_id)
 {
+	int err = 0;
 	struct ubi_upd_info *upd = ubi->upd;
 
 	mutex_lock(&upd->mutex);
-	if (upd->vol_id == vol_id) {
+	if (upd->updating && upd->vol_id == vol_id) {
 		dbg_upd("aborting volume %d update - it is damaged since now",
 			vol_id);
 		upd->updating = 0;
-	} else
+	} else {
 		dbg_upd("volume %d is not under update", vol_id);
+		err = -EINVAL;
+	}
 	mutex_unlock(&upd->mutex);
 
-	return 0;
-}
-
-static int remove_marker(const struct ubi_info *ubi);
-
-int ubi_upd_clean(const struct ubi_info *ubi, int vol_id)
-{
-	int err = 0;
-	struct ubi_upd_info *upd = ubi->upd;
-
-	mutex_lock(&upd->mutex);
-
-	if (!upd->updating || vol_id != upd->vol_id)
-		goto out_unlock;
-
-	dbg_upd("clean update marker for volume %d", vol_id);
-
-	err = remove_marker(ubi);
-	if (err)
-		goto out_unlock;
-
-	upd->vol_id = -1;
-
-out_unlock:
-	mutex_unlock(&upd->mutex);
-	return 0;
+	return err;
 }
 
 int ubi_upd_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
 {
 	int err;
-	struct ubi_scan_volume *sv;
-	struct ubi_vid_hdr *vid_hdr;
 	struct ubi_upd_info *upd;
 	const struct ubi_vtbl_vtr *vtr;
-	const struct ubi_scan_leb *seb;
 
 	dbg_upd("initialize the update unit");
 
@@ -323,85 +282,11 @@ int ubi_upd_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
 	}
 
 	mutex_init(&upd->mutex);
-	upd->vol_id = -1;
-
-	sv = ubi_scan_find_sv(si, UBI_UPDATE_VOL_ID);
-	if (!sv) {
-		dbg_upd("the update unit is initialized");
-		return 0;
-	}
-
-
-	/*
-	 * The update marker was found - a volume update operation was
-	 * interrupted.
-	 */
-
-	err = -EINVAL;
-	if (sv->leb_count > 1) {
-		/* There may be only one update marker */
-		dbg_err("too many update markers %d", sv->leb_count);
-		goto out_free_upd_buf;
-	}
-
-	seb = ubi_scan_find_seb(sv, 0);
-	if (!seb) {
-		dbg_err("bad update marker");
-		goto out_free_upd_buf;
-	}
-
-	vid_hdr = ubi_zalloc_vid_hdr(ubi);
-	if (!vid_hdr) {
-		err = -ENOMEM;
-		goto out_free_upd_buf;
-	}
-
-	err = ubi_io_read_vid_hdr(ubi, seb->pnum, vid_hdr, 1);
-	if (unlikely(err < 0))
-		goto out_vid_hdr;
-	else if (unlikely(err > 0) && err != UBI_IO_BITFLIPS) {
-		/*
-		 * Cannot read the update marker. But we read it earlier,
-		 * during scanning. No idea what happened. Don't erase it
-		 * anyway.
-		 */
-		err = -EIO;
-		goto out_vid_hdr;
-	}
-
-	memcpy(&upd->hdr_data, &vid_hdr->ivol_data[0],
-	       UBI_VID_HDR_IVOL_DATA_SIZE);
-	upd->vol_id = ubi32_to_cpu(upd->hdr_data.vol_id);
-	ubi_free_vid_hdr(ubi, vid_hdr);
-
-	/* Check sanity */
-	if (upd->vol_id < 0 || upd->vol_id >= ubi->acc->max_volumes) {
-		ubi_err("bad volume ID %d in update marker",
-			upd->vol_id);
-		goto out_free_upd_buf;
-	}
-
-	ubi_warn("volume %d update was interrupted", upd->vol_id);
-	vtr = ubi_vtbl_get_vtr(ubi, upd->vol_id);
-	if (IS_ERR(vtr)) {
-		/*
-		 * Update marker belongs to an non-existing volume. This may
-		 * happen if an unclean reboot happened during volume deletion.
-		 */
-
-		err = remove_marker(ubi);
-		if (err)
-			goto out_free_upd_buf;
-		upd->vol_id = -1;
-	}
 
 	dbg_upd("the update unit is initialized");
+
 	return 0;
 
-out_vid_hdr:
-	ubi_free_vid_hdr(ubi, vid_hdr);
-out_free_upd_buf:
-	ubi_kfree(upd->upd_buf);
 out_free_upd:
 	ubi_kfree(upd);
 	return err;
@@ -415,79 +300,35 @@ void ubi_upd_close(const struct ubi_info *ubi)
 }
 
 /**
- * put_marker - put update marker.
+ * ubi_wipe_out_volume - wipe out an UBI volume.
  *
  * @ubi: the UBI device description object
- * @vol_id: for which volume to put the update marker.
+ * @vol_id: ID of the volume to free
  *
- * This function returns zero in case of success, and a negative error code in
- * case of failure.
+ * This function erases all the volume's eraseblocks. Returns zero in case of
+ * success, and a negative error code in case of failure.
  */
-static int put_marker(const struct ubi_info *ubi, int vol_id)
+static int ubi_wipe_out_volume(const struct ubi_info *ubi, int vol_id)
 {
-	int err;
-	size_t written;
-	struct ubi_upd_info *upd = ubi->upd;
-
-	dbg_upd("put update marker for volume %d", vol_id);
-	upd->hdr_data.vol_id = cpu_to_ubi32(vol_id);
-	err = ubi_eba_write_leb(ubi, UBI_UPDATE_VOL_ID, 0,  NULL, 0, 0,
-				UBI_DATA_SHORTTERM, &written, &upd->hdr_data);
-
-	return err;
-}
+	int i, err;
+	const struct ubi_vtbl_vtr *vtr;
 
-/**
- * remove_marker - remove update marker.
- *
- * @ubi: the UBI device description object
- *
- * This function returns zero in case of success, and a negative error code in
- * case of failure.
- */
-static int remove_marker(const struct ubi_info *ubi)
-{
-	int err;
-	struct ubi_upd_info *upd = ubi->upd;
+	ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
 
-	dbg_upd("remove update marker for volume %d", upd->vol_id);
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	for (i = 0; i < vtr->reserved_pebs; i++) {
+		cond_resched();
 
-	err = ubi_eba_erase_leb(ubi, UBI_UPDATE_VOL_ID, 0);
-	if (err)
-		return err;
+		err = ubi_eba_erase_leb(ubi, vol_id, i);
+		if (unlikely(err))
+			return err;
+	}
 
 	err = ubi_wl_erase_flush(ubi);
 	return err;
 }
 
 /**
- * finish_update - finish volume update.
- *
- * @ubi: the UBI device description object
- *
- * This function removes the clean marker from the media and finishes the
- * ongoing update operation. Returns zero in case of success and a negative
- * error code in case of failure.
- */
-static int finish_update(const struct ubi_info *ubi)
-{
-	int err;
-	struct ubi_upd_info *upd = ubi->upd;
-
-	dbg_upd("finish volume %d update", upd->vol_id);
-
-	upd->updating = 0;
-
-	err = remove_marker(ubi);
-	if (err)
-		return err;
-
-	ubi_vtbl_set_data_len(ubi, upd->vol_id, upd->upd_bytes);
-	upd->vol_id = -1;
-	return 0;
-}
-
-/**
  * write_leb - write a portion of update data to a logical eraseblock.
  *
  * @ubi: the UBI device description object
@@ -539,7 +380,7 @@ static int write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
 				len - l, vol_id, lnum);
 
 		err = ubi_eba_write_leb(ubi, vol_id, lnum, buf, 0, l,
-					UBI_DATA_UNKNOWN, written, NULL);
+					UBI_DATA_UNKNOWN, written);
 	} else {
 		/*
 		 * When writing to static volumes, and this is the last logical
diff --git a/drivers/mtd/ubi/upd.h b/drivers/mtd/ubi/upd.h
index ba05e10..69a9e5e 100644
--- a/drivers/mtd/ubi/upd.h
+++ b/drivers/mtd/ubi/upd.h
@@ -31,6 +31,9 @@
  *
  * Note, in general it is possible to implement the update operation as a
  * transaction with a possibility to roll-back. But this is far more complex.
+ *
+ * This implementation does not support concurrent updates but it is not
+ * difficult to implement this.
  */
 
 #ifndef __UBI_UPD_H__
@@ -38,7 +41,6 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
-#include <mtd/ubi-header.h>
 
 struct ubi_info;
 struct ubi_scan_info;
@@ -92,21 +94,6 @@ int ubi_upd_write_data(const struct ubi_info *ubi, int vol_id,
 int ubi_upd_abort(const struct ubi_info *ubi, int vol_id);
 
 /**
- * ubi_upd_clean - clean the update marker.
- *
- * @ubi: the UBI device description object
- * @vol_id: ID of the volume to clean
- *
- * This function cleans the update state of volume @vol_id, i.e., if there is
- * an update marker belonging to this volume, the update marker is removed.
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- *
- * TODO: to be removed.
- */
-int ubi_upd_clean(const struct ubi_info *ubi, int vol_id);
-
-/**
  * ubi_upd_init_scan - initialize the update volume unit using scanning
  * information.
  *
@@ -129,14 +116,12 @@ void ubi_upd_close(const struct ubi_info *ubi);
  * struct ubi_upd_info - UBI update unit description data structure.
  *
  * @updating: if any volume is being updated at the moment
- * @vol_id: which volume utilizes the update marker at the moment (%-1 means
- * the update marker is not used)
+ * @vol_id: which volume utilizes the update marker at the moment
  * @upd_ebs: how many eraseblocks are going to be updated
  * @upd_received: how many bytes were already received by the update unit
  * @upd_bytes: how many more bytes are expected to be received
  * @upd_buf: a buffer which is used to collect update data during the update
  * operation
- * @hdr_data: data put to the VID header of the update marker eraseblock
  * @mutex: serializes access to the volume update capability
  */
 struct ubi_upd_info {
@@ -146,7 +131,6 @@ struct ubi_upd_info {
 	long long upd_received;              /* private */
 	long long upd_bytes;                 /* private */
 	void *upd_buf;                       /* private */
-	struct ubi_vid_hdr_upd_vol hdr_data; /* private */
 	struct mutex mutex;                  /* private */
 };
 
diff --git a/drivers/mtd/ubi/volmgmt.c b/drivers/mtd/ubi/volmgmt.c
index 8a9bcb1..bd1f709 100644
--- a/drivers/mtd/ubi/volmgmt.c
+++ b/drivers/mtd/ubi/volmgmt.c
@@ -151,10 +151,6 @@ int ubi_vmt_rmvol(const struct ubi_info *ubi, int vol_id)
 	if (err)
 		goto out_unlock;
 
-	err = ubi_upd_clean(ubi, vol_id);
-	if (err)
-		goto out_unlock;
-
 	err = ubi_eba_rmvol(ubi, vol_id);
 	if (err)
 		goto out_unlock;
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 6b38b0d..6e69c4c 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -126,37 +126,83 @@ int ubi_vtbl_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
 	return err;
 }
 
-int ubi_vtbl_set_data_len(const struct ubi_info *ubi, int vol_id,
-			  long long bytes)
+int ubi_vtbl_set_upd_marker(const struct ubi_info *ubi, int vol_id)
 {
 	int err;
-	struct ubi_vtbl_info *vtbl = ubi->vtbl;
-	struct ubi_vtbl_vtr *vtr = &vtbl->vt[vol_id];
+	struct ubi_vtbl_vtr vtr;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	dbg_vtbl("set update marker for volume %d", vol_id);
 
+	/* Input arguments sanity check */
 	ubi_assert(vol_id >= 0 && vol_id < vtbl->vt_slots);
-	ubi_assert(ubi->vtbl->vt[vol_id].reserved_pebs != 0);
+	ubi_assert(vtbl->vt[vol_id].reserved_pebs != 0);
 	ubi_assert(!ubi_is_ivol(vol_id));
-	ubi_assert(bytes >= 0 &&
-		   bytes <= vtr->usable_leb_size * vtr->reserved_pebs);
 
-	err = paranoid_check_vtr(ubi, vtr);
-	if (err)
-		return -EINVAL;
+	if (vtbl->vt[vol_id].upd_marker) {
+		dbg_vtbl("update marker is already set, do nothing");
+		return 0;
+	}
+
+	memcpy(&vtr, &vtbl->vt[vol_id], sizeof(struct ubi_vtbl_vtr));
+
+	vtr.name = strdup_len(vtbl->vt[vol_id].name,
+			      vtbl->vt[vol_id].name_len);
+	if (!vtr.name)
+		return -ENOMEM;
+	vtr.upd_marker = 1;
 
-	if (vtr->vol_type == UBI_DYNAMIC_VOLUME)
+	err = change_volume(ubi, vol_id, &vtr);
+	ubi_kfree(vtr.name);
+	return err;
+}
+
+int ubi_vtbl_clear_upd_marker(const struct ubi_info *ubi, int vol_id,
+			      long long bytes)
+{
+	int err;
+	struct ubi_vtbl_vtr vtr;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	dbg_vtbl("clear update marker for volume %d", vol_id);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0 && vol_id < vtbl->vt_slots);
+	ubi_assert(vtbl->vt[vol_id].reserved_pebs != 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+	ubi_assert(bytes >= 0 && bytes <= vtbl->vt[vol_id].usable_leb_size *
+				          vtbl->vt[vol_id].reserved_pebs);
+
+	if (!vtbl->vt[vol_id].upd_marker) {
+		dbg_vtbl("update marker is already cleared, do nothing");
 		return 0;
+	}
 
-	dbg_vtbl("set data length of static volume %d to %lld (was %lld)",
-		 vol_id, bytes, vtr->used_bytes);
-	vtr->used_bytes = bytes;
-	vtr->corrupted = 0;
-	fill_ram_only_fields(ubi, vtr);
+	memcpy(&vtr, &vtbl->vt[vol_id], sizeof(struct ubi_vtbl_vtr));
 
-	err = paranoid_check_vtr(ubi, vtr);
+	vtr.name = strdup_len(vtbl->vt[vol_id].name,
+			      vtbl->vt[vol_id].name_len);
+	if (!vtr.name)
+		return -ENOMEM;
+	vtr.upd_marker = 0;
+
+	if (vtbl->vt[vol_id].vol_type == UBI_STATIC_VOLUME) {
+		dbg_vtbl("set data length of static volume %d to %lld",
+			 vol_id, bytes);
+		vtr.used_bytes = bytes;
+		vtr.corrupted = 0;
+		fill_ram_only_fields(ubi, &vtr);
+	} else
+		ubi_assert(vtr.corrupted == 0);
+
+	err = paranoid_check_vtr(ubi, &vtbl->vt[vol_id]);
 	if (err)
-		return -EINVAL;
+		return err;
 
-	return 0;
+	err = change_volume(ubi, vol_id, &vtr);
+	ubi_kfree(vtr.name);
+
+	return err;
 }
 
 int ubi_vtbl_set_corrupted(const struct ubi_info *ubi, int vol_id)
@@ -173,6 +219,7 @@ int ubi_vtbl_set_corrupted(const struct ubi_info *ubi, int vol_id)
 		dbg_vtbl("mark static volume %d as corrupted", vol_id);
 		vtr->corrupted = 1;
 	}
+	/* TODO: should we have an asserd for dynamic volumes here? */
 
 	return 0;
 }
@@ -211,8 +258,6 @@ int ubi_vtbl_get_compat(const struct ubi_info *ubi, int vol_id)
 	switch (vol_id) {
 		case UBI_LAYOUT_VOL_ID:
 			return UBI_LAYOUT_VOLUME_COMPAT;
-		case UBI_UPDATE_VOL_ID:
-			return UBI_UPDATE_VOLUME_COMPAT;
 		default:
 			BUG();
 	}
@@ -385,6 +430,8 @@ static int change_volume(const struct ubi_info *ubi,
 	if (!vol_tbl)
 		return -ENOMEM;
 
+	mutex_lock(&vtbl->mutex);
+
 	/* Generate the on-flash volume table contents */
 	for (i = 0; i < vtbl->vt_slots; i++) {
 		uint32_t crc;
@@ -395,7 +442,7 @@ static int change_volume(const struct ubi_info *ubi,
 
 		err = paranoid_check_vtr(ubi, tmp_vtr);
 		if (unlikely(err))
-			goto out;
+			goto out_unlock;
 
 		if (unlikely(i == vol_id))
 			tmp_vtr = vtr;
@@ -409,6 +456,7 @@ static int change_volume(const struct ubi_info *ubi,
 		vol_tbl[i].reserved_pebs = cpu_to_ubi32(tmp_vtr->reserved_pebs);
 		vol_tbl[i].alignment = cpu_to_ubi32(tmp_vtr->alignment);
 		vol_tbl[i].data_pad = cpu_to_ubi32(tmp_vtr->data_pad);
+		vol_tbl[i].upd_marker = tmp_vtr->upd_marker;
 		if (tmp_vtr->vol_type == UBI_DYNAMIC_VOLUME)
 			vol_tbl[i].vol_type = UBI_VID_DYNAMIC;
 		else
@@ -423,9 +471,6 @@ static int change_volume(const struct ubi_info *ubi,
 		vol_tbl[i].crc = cpu_to_ubi32(crc);
 	}
 
-
-	mutex_lock(&vtbl->mutex);
-
 	/* Update both volume table copies */
 	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
 		size_t written;
@@ -442,7 +487,7 @@ static int change_volume(const struct ubi_info *ubi,
 
 		err = ubi_eba_write_leb(ubi, UBI_LAYOUT_VOL_ID, i, vol_tbl, 0,
 					vtbl->vt_size, UBI_DATA_LONGTERM,
-					&written, NULL);
+					&written);
 		if (unlikely(err))
 			goto out_unlock;
 	}
@@ -469,7 +514,7 @@ static int change_volume(const struct ubi_info *ubi,
 
 out_unlock:
 	mutex_unlock(&vtbl->mutex);
-out:
+
 	/*
 	 * The volume table is probably in an inconsistent state now, so switch
 	 * to read-only mode.
@@ -794,18 +839,6 @@ static void init_ivols(struct ubi_info *ubi)
 	vtr->used_ebs = vtr->reserved_pebs;
 	vtr->last_eb_bytes = vtr->reserved_pebs;
 	vtr->used_bytes = vtr->used_ebs * (io->leb_size - vtr->data_pad);
-
-	/* The update volume */
-	vtr = &vtbl->ivol_vtrs[1];
-	vtr->reserved_pebs = UBI_UPDATE_VOLUME_EBS;
-	vtr->alignment = 1;
-	vtr->vol_type = UBI_DYNAMIC_VOLUME;
-	vtr->name_len = sizeof(UBI_UPDATE_VOLUME_NAME) - 1;
-	vtr->name = UBI_UPDATE_VOLUME_NAME;
-	vtr->usable_leb_size = io->leb_size;
-	vtr->used_ebs = vtr->reserved_pebs;
-	vtr->last_eb_bytes = vtr->reserved_pebs;
-	vtr->used_bytes = vtr->used_ebs * (io->leb_size - vtr->data_pad);
 }
 
 /**
@@ -954,6 +987,7 @@ static int vol_tbl_check(const struct ubi_info *ubi,
 			 const struct ubi_vol_tbl_record *vol_tbl)
 {
 	int i, reserved_pebs, alignment, data_pad, vol_type, name_len;
+	int upd_marker;
 	const char *name;
 	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
 	const struct ubi_io_info *io = ubi->io;
@@ -967,6 +1001,7 @@ static int vol_tbl_check(const struct ubi_info *ubi,
 		reserved_pebs = ubi32_to_cpu(vol_tbl[i].reserved_pebs);
 		alignment = ubi32_to_cpu(vol_tbl[i].alignment);
 		data_pad = ubi32_to_cpu(vol_tbl[i].data_pad);
+		upd_marker = vol_tbl[i].upd_marker;
 		vol_type = vol_tbl[i].vol_type;
 		name_len = ubi16_to_cpu(vol_tbl[i].name_len);
 		name = &vol_tbl[i].name[0];
@@ -1028,6 +1063,11 @@ static int vol_tbl_check(const struct ubi_info *ubi,
 			goto bad;
 		}
 
+		if (unlikely(upd_marker != 0 && upd_marker != 1)) {
+			dbg_err("bad upd_marker");
+			goto bad;
+		}
+
 		if (unlikely(reserved_pebs > io->good_peb_count)) {
 			dbg_err("too large reserved_pebs");
 			goto bad;
@@ -1246,6 +1286,11 @@ static int paranoid_check_vtr(const struct ubi_info *ubi,
 		goto fail;
 	}
 
+	if (unlikely(vtr->upd_marker != 0 && vtr->upd_marker != 1)) {
+		ubi_err("zero upd_marker");
+		goto fail;
+	}
+
 	if (unlikely(vtr->reserved_pebs > io->good_peb_count)) {
 		ubi_err("too large reserved_pebs %d", vtr->reserved_pebs);
 		goto fail;
@@ -1274,7 +1319,7 @@ static int paranoid_check_vtr(const struct ubi_info *ubi,
 		goto fail;
 	}
 
-	/* Check data-related fields */
+	/* Check RAM-only fields */
 	n = vtr->used_ebs * vtr->usable_leb_size;
 	if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
 		if (unlikely(vtr->corrupted != 0)) {
diff --git a/drivers/mtd/ubi/vtbl.h b/drivers/mtd/ubi/vtbl.h
index 331886d..df7480c 100644
--- a/drivers/mtd/ubi/vtbl.h
+++ b/drivers/mtd/ubi/vtbl.h
@@ -123,19 +123,30 @@ int ubi_vtbl_rmvol(const struct ubi_info *ubi, int vol_id);
 int ubi_vtbl_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs);
 
 /**
- * ubi_vtbl_set_data_len - set new volume data length.
+ * ubi_vtbl_set_upd_marker - set the update marker flag.
  *
  * @ubi: the UBI device description object
- * @vol_id: ID of the volume to set data fields for
+ * @vol_id: ID of the volume
+ *
+ * This function sets the update marker flag for volumr @vol_id. Returns zero
+ * in case of success and a negative error code in case of failure.
+ */
+int ubi_vtbl_set_upd_marker(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_vtbl_clear_upd_marker - clear the update marker flag.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume
  * @bytes: new data size in bytes
  *
- * This function sets new volume data size and cleans the "corrupted" flag. As
- * UBI does not care about the contents of dynamic volume, this function just
- * returns in case of a dynamic volume. This function returns zero in case of
- * success and a negative error code in case of failure.
+ * This function clears the update marker for volume @vol_id, sets new volume
+ * data size and cleans the "corrupted" flag (static volume s only). This
+ * function returns zero in case of success and a negative error code in case
+ * of failure.
  */
-int ubi_vtbl_set_data_len(const struct ubi_info *ubi, int vol_id,
-			  long long bytes);
+int ubi_vtbl_clear_upd_marker(const struct ubi_info *ubi, int vol_id,
+			      long long bytes);
 
 /**
  * ubi_vtbl_set_corrupted - mark a volume as 'corrupted'.
@@ -199,7 +210,7 @@ static inline int ubi_is_ivol(int vol_id)
  */
 static inline int ubi_ivol_is_known(int vol_id)
 {
-	return vol_id == UBI_LAYOUT_VOL_ID || vol_id == UBI_UPDATE_VOL_ID;
+	return vol_id == UBI_LAYOUT_VOL_ID;
 }
 
 /**
diff --git a/include/mtd/ubi-header.h b/include/mtd/ubi-header.h
index 73add4d..88f025e 100644
--- a/include/mtd/ubi-header.h
+++ b/include/mtd/ubi-header.h
@@ -53,7 +53,7 @@ enum {
 };
 
 /*
- * Molume type constants used in volume identifier headers.
+ * Volume type constants used in the volume identifier header.
  *
  * @UBI_VID_DYNAMIC: dynamic volume
  * @UBI_VID_STATIC: static volume
@@ -97,8 +97,8 @@ typedef struct {
 } __attribute__ ((packed)) ubi64_t;
 
 /*
- * In this implementation UBI uses the big-endian format for on-flash integers.
- * The below are the corresponding endianess conversion macros.
+ * In this implementation of UBI uses the big-endian format for on-flash
+ * integers. The below are the corresponding conversion macros.
  */
 #define cpu_to_ubi16(x) ((ubi16_t){__cpu_to_be16(x)})
 #define ubi16_to_cpu(x) ((uint16_t)__be16_to_cpu((x).int16))
@@ -117,9 +117,6 @@ typedef struct {
 #define UBI_EC_HDR_SIZE_CRC  (UBI_EC_HDR_SIZE  - sizeof(ubi32_t))
 #define UBI_VID_HDR_SIZE_CRC (UBI_VID_HDR_SIZE - sizeof(ubi32_t))
 
-/* How much private data may internal volumes store in the VID header */
-#define UBI_VID_HDR_IVOL_DATA_SIZE 12
-
 /**
  * struct ubi_ec_hdr - UBI erase counter header.
  *
@@ -128,8 +125,8 @@ typedef struct {
  * UBI image (%UBI_VERSION)
  * @padding1: reserved for future, zeroes
  * @ec: the erase counter
- * @vid_hdr_offset: where the VID header begins
- * @data_offset: where the user data begins
+ * @vid_hdr_offset: where the VID header starts
+ * @data_offset: where the user data starts
  * @padding2: reserved for future, zeroes
  * @hdr_crc: the erase counter header CRC checksum
  *
@@ -137,7 +134,7 @@ typedef struct {
  * future usage. The unused fields are zeroed. The @version field is used to
  * indicate the version of UBI implementation which is supposed to be able to
  * work with this UBI image. If @version is greater then the current UBI
- * version, the image is rejecter. This may be useful in future if something
+ * version, the image is rejected. This may be useful in future if something
  * is changed radically. This field is duplicated in the volume identifier
  * header.
  *
@@ -167,68 +164,68 @@ struct ubi_ec_hdr {
  * means of copying an original physical eraseblock to ensure wear-leveling.
  * @compat: compatibility of this volume (%UBI_COMPAT_DELETE,
  * %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
- * @vol_id: volume ID
+ * @vol_id: ID of this volume
  * @lnum: logical eraseblock number
  * @leb_ver: eraseblock copy number
- * @data_size: how many bytes of data this eraseblock contains.
+ * @data_size: how many bytes of data this eraseblock contains
  * @used_ebs: total number of used logical eraseblocks in this volume
  * @data_pad: how many bytes at the end of this eraseblock are not used
- * @data_crc: CRC checksum of data containing in this eraseblock
+ * @data_crc: CRC checksum of the data stored in this eraseblock
  * @padding1: reserved for future, zeroes
- * @ivol_data: private data of internal volumes
  * @hdr_crc: volume identifier header CRC checksum
  *
  * The @leb_ver and the @copy_flag fields are used to distinguish between older
- * and newer copies of logical eraseblocks, as well as to guarantee robustness
- * to unclean reboots. As UBI erases logical eraseblocks asynchronously, it has
- * to distinguish between older and newer copies of eraseblocks. This is done
- * using the @version field. On the other hand, when UBI moves an eraseblock,
- * its version is also increased and the @copy_flag is set to 1. Additionally,
- * when moving eraseblocks, UBI calculates data CRC and stores it in the
- * @data_crc field, even for dynamic volumes.
+ * and newer copies of the logical eraseblock, as well as to guarantee
+ * robustness against unclean reboots. As UBI erases logical eraseblocks
+ * asynchronously, in background, it has to distinguish between older and newer
+ * copies of logical eraseblocks. This is done using the @version field. On the
+ * other hand, when UBI moves data of an eraseblock, its version is also
+ * increased and the @copy_flag is set to 1. Additionally, when moving data of
+ * eraseblocks, UBI calculates data CRC and stores it in the @data_crc field,
+ * even for dynamic volumes.
  *
- * Thus, if there are 2 eraseblocks of the same volume and logical number, UBI
- * uses the following algorithm to pick one of them. It first picks the one
- * with larger version (say, A). If @copy_flag is not set, then A is picked. If
- * @copy_flag is set, UBI checks the CRC of the eraseblock (@data_crc). This is
- * needed to ensure that copying was finished. If the CRC is all right, A is
- * picked. If not, the older eraseblock is picked.
+ * Thus, if there are 2 physical eraseblocks belonging to the logical
+ * eraseblock (same volume ID and logical eraseblock number), UBI uses the
+ * following algorithm to pick one of them. It first picks the one with larger
+ * version (say, A). If @copy_flag is not set, then A is picked. If @copy_flag
+ * is set, UBI checks the CRC of data of this physical eraseblock (@data_crc).
+ * This is needed to ensure that the copying was finished. If the CRC is all
+ * right, A is picked. If not, the older physical eraseblock is picked.
  *
- * Note, the @leb_ver field may overflow. Thus, if you have 2 versions A and B,
- * then A > B if abs(A-B) < 0x7FFFFFFF, and A < B otherwise.
+ * Note, the @leb_ver field may overflow. Thus, if you have 2 versions X and Y,
+ * then X > Y if abs(X-Y) < 0x7FFFFFFF, otherwise X < Y.
  *
  * There are 2 sorts of volumes in UBI: user volumes and internal volumes.
- * Internal volumes are not seen from outside and are used for different
- * internal UBI purposes. In this implementation there are only two internal
- * volumes: the layout volume and the update volume. Internal volumes are the
- * main mechanism of UBI extensions. For example, in future one may introduce a
- * journal internal volume.
+ * Internal volumes are not seen from outside and are used for various internal
+ * UBI purposes. In this implementation there is only one internal volume - the
+ * layout volume. Internal volumes are the main mechanism of UBI extensions.
+ * For example, in future one may introduce a journal internal volume. Internal
+ * volumes have their own reserved range of IDs.
  *
- * The @compat field is only used for internal volumes and contains the degree
- * of their compatibility. This field is always zero for user volumes. This
- * field provides a mechanism to introduce UBI extensions and to be still
- * compatible with older UBI binaries. For example, if someone introduced an
- * journal internal volume in future, he would probably use %UBI_COMPAT_DELETE
- * compatibility.  And in this case, older UBI binaries, which know nothing
- * about the journal volume, would just delete this and work perfectly fine.
- * This is somewhat similar to what Ext2fs does when it is fed by an Ext3fs
- * image - it just ignores the Ext3fs journal.
+ * The @compat field is only used for internal volumes and contains the "degree
+ * of their compatibility". It is always zero for user volumes. This field
+ * provides a mechanism to introduce UBI extensions and to be still compatible
+ * with older UBI binaries. For example, if someone introduced a journal in
+ * future, he would probably use %UBI_COMPAT_DELETE compatibility for the
+ * journal volume.  And in this case, older UBI binaries, which know nothing
+ * about the journal volume, would just delete this volume and work perfectly
+ * fine. This is somewhat similar to what Ext2fs does when it is fed by an
+ * Ext3fs image - it just ignores the Ext3fs journal.
  *
  * The @data_crc field contains the CRC checksum of the contents of the logical
- * eraseblock if this is a static volume.  In case of dynamic volumes, it does
+ * eraseblock if this is a static volume. In case of dynamic volumes, it does
  * not contain the CRC checksum as a rule. The only exception is when the
- * logical eraseblock was moved by the wear-leveling unit, then the
- * wear-leveling unit calculates the eraseblocks' CRC and stores it at
- * @data_crc.
+ * data of the physical eraseblock was moved by the wear-leveling unit, then
+ * the wear-leveling unit calculates the data CRC and stores it in the
+ * @data_crc field. And of course, the @copy_flag is %in this case.
  *
- * The @data_size field is always used for static volumes because we want to
- * know about how many bytes of data are stored in this eraseblock.  For
- * dynamic eraseblocks, this field usually contains zero. The only exception is
- * when the logical eraseblock is moved to another physical eraseblock due to
+ * The @data_size field is used only for static volumes because UBI has to know
+ * how many bytes of data are stored in this eraseblock. For dynamic volumes,
+ * this field usually contains zero. The only exception is when the data of the
+ * physical eraseblock was moved to another physical eraseblock for
  * wear-leveling reasons. In this case, UBI calculates CRC checksum of the
  * contents and uses both @data_crc and @data_size fields. In this case, the
- * @data_size field contains the size of logical eraseblock of this volume
- * (which may vary owing to @alignment).
+ * @data_size field contains data size.
  *
  * The @used_ebs field is used only for static volumes and indicates how many
  * eraseblocks the data of the volume takes. For dynamic volumes this field is
@@ -238,11 +235,6 @@ struct ubi_ec_hdr {
  * parameter. So, effectively, the @data_pad field reduces the size of logical
  * eraseblocks of this volume. This is very handy when one uses block-oriented
  * software (say, cramfs) on top of the UBI volume.
- *
- * The @ivol_data contains private data of internal volumes. This might be very
- * handy to store data in the VID header, not in the eraseblock's contents. For
- * example it may make life of simple boot-loaders easier. The @ivol_data field
- * contains zeroes for user volumes.
  */
 struct ubi_vid_hdr {
 	ubi32_t magic;
@@ -257,54 +249,31 @@ struct ubi_vid_hdr {
 	ubi32_t used_ebs;
 	ubi32_t data_pad;
 	ubi32_t data_crc;
-	uint8_t padding1[12];
-	uint8_t ivol_data[UBI_VID_HDR_IVOL_DATA_SIZE];
+	uint8_t padding1[24];
 	ubi32_t hdr_crc;
 } __attribute__ ((packed));
 
-/**
- * struct ubi_vid_hdr_upd_vol - private data of the update internal volume
- * stored in volume identifier headers.
- *
- * @vol_id: volume ID of the volume under update
- * @padding: zeroes
- */
-struct ubi_vid_hdr_upd_vol {
-	ubi32_t vol_id;
-	uint8_t padding[UBI_VID_HDR_IVOL_DATA_SIZE-4];
-} __attribute__ ((packed));
-
 /* Count of internal UBI volumes */
-#define UBI_INT_VOL_COUNT 2
+#define UBI_INT_VOL_COUNT 1
 
 /*
- * Internal volume IDs start from this digit. There is a reserved room for 4096
- * internal volumes.
+ * IDs of internal volumes start from this digit. There is a reserved room for
+ * 4096 internal volumes.
  */
 #define UBI_INTERNAL_VOL_START (0x7FFFFFFF - 4096)
 
 /*
- * enum ubi_internal_volume_numbers - volume IDs of internal UBI volumes.
+ * IDs of internal UBI volumes.
  *
- * %UBI_LAYOUT_VOL_ID: volume ID of the layout volume
- * %UBI_UPDATE_VOL_ID: volume ID of the update volume
+ * %UBI_LAYOUT_VOL_ID: layout volume ID
  */
 enum {
 	UBI_LAYOUT_VOL_ID = UBI_INTERNAL_VOL_START,
-	UBI_UPDATE_VOL_ID = UBI_INTERNAL_VOL_START + 1
 };
 
-/* Number of logical eraseblocks reserved for internal volumes */
-#define UBI_LAYOUT_VOLUME_EBS 2
-#define UBI_UPDATE_VOLUME_EBS 1
-
-/* Names of internal volumes */
-#define UBI_LAYOUT_VOLUME_NAME "The layout volume"
-#define UBI_UPDATE_VOLUME_NAME "The update volume"
-
-/* Compatibility flags of internal volumes */
+#define UBI_LAYOUT_VOLUME_EBS    2
+#define UBI_LAYOUT_VOLUME_NAME   "The layout volume"
 #define UBI_LAYOUT_VOLUME_COMPAT UBI_COMPAT_REJECT
-#define UBI_UPDATE_VOLUME_COMPAT UBI_COMPAT_REJECT
 
 /* The maximum number of volumes per one UBI device */
 #define UBI_MAX_VOLUMES 128
@@ -312,10 +281,10 @@ enum {
 /* The maximum volume name length */
 #define UBI_VOL_NAME_MAX 127
 
-/* Size of volume table records */
+/* Size of the volume table record */
 #define UBI_VTBL_RECORD_SIZE sizeof(struct ubi_vol_tbl_record)
 
-/* Size of volume table records without the ending CRC */
+/* Size of the volume table record without the ending CRC */
 #define UBI_VTBL_RECORD_SIZE_CRC (UBI_VTBL_RECORD_SIZE - sizeof(ubi32_t))
 
 /**
@@ -323,10 +292,10 @@ enum {
  *
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @alignment: volume alignment
- * @data_pad: how many bytes are not used at the end of the eraseblocks to
+ * @data_pad: how many bytes are unused at the end of the each eraseblock to
  * satisfy the requested alignment
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved, zeroes
+ * @upd_marker: the update marker flag
  * @name_len: the volume name length
  * @name: the volume name
  * @padding2: reserved, zeroes
@@ -338,9 +307,12 @@ enum {
  *
  * If the size of the logical eraseblock is large enough to fit
  * %UBI_MAX_VOLUMES, the volume table contains %UBI_MAX_VOLUMES records.
- * Otherwise, it contains as much records as can be fit (i.e., size of logical
+ * Otherwise, it contains as many records as it can fit (i.e., size of logical
  * eraseblock divided by sizeof(struct ubi_vol_tbl_record)).
  *
+ * The @upd_marker flag is used to implement volume update. It is set to %1
+ * before update and set to %0 after the update.
+ *
  * The @alignment field is specified when the volume is created and cannot be
  * later changed. It may be useful, for example, when a block-oriented file
  * system works on top of UBI. The @data_pad field is calculated using the
@@ -355,7 +327,7 @@ struct ubi_vol_tbl_record {
 	ubi32_t alignment;
 	ubi32_t data_pad;
 	uint8_t vol_type;
-	uint8_t padding1;
+	uint8_t upd_marker;
 	ubi16_t name_len;
 	uint8_t name[UBI_VOL_NAME_MAX+1];
 	uint8_t padding2[24];
-- 
1.4.4.2
