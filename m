Received: from mtagate8.de.ibm.com ([195.212.29.157])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBZov-0000X1-Ch
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 11:57:34 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id l0TGa6E9050532
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2007 16:36:06 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l0TGa6sp1577130
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2007 17:36:06 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l0TGa5N6020673
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2007 17:36:06 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: [MTD] UBI: Per volume update marker
Date: Mon, 29 Jan 2007 17:36:00 +0100
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
	<1170075745.9477.73.camel@sauron>
In-Reply-To: <1170075745.9477.73.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200701291736.01006.alexs@linux.vnet.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> May you please instead add something like
> 
> + * Jan 2006: Alexander Schmidt, implemented per-volume update.
> 
> which is what people usually do in these cases.

okay

> In the code, in comments you still call this flag update marker. I am
> not sure, but may be it makes sense to call this field 'upd_marker'
> instead? It looks more coherent to the comments, but on the other hand
> it does not look very self-documenting. Hmm... We need ask Andreas, he
> is a naming-expert :-)

Andreas agrees with you :-)

> AFAIU, in your implementation only one update at a time is possible, so
> I think it is better not to remove this attribute but export the ID of
> the volume which is currently being updated.

That's right, I re-added the sysfs entry.

> Please, do not utilize vmt unit from upd unit at all. Utilize vtbl unit
> directly.

I removed the function from vmt unit and moved the code for checking if the
update marker already has the given value to the vtbl unit.

Signed-off-by: Alexander Schmidt, <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/sysfs.c   |   26 ++++++
 drivers/mtd/ubi/upd.c     |  179 ++++------------------------------------------
 drivers/mtd/ubi/upd.h     |   22 ++---
 drivers/mtd/ubi/volmgmt.c |    6 +
 drivers/mtd/ubi/vtbl.c    |   71 ++++++++++++++----
 drivers/mtd/ubi/vtbl.h    |   29 +++++--
 include/mtd/ubi-header.h  |   22 +++--
 7 files changed, 153 insertions(+), 202 deletions(-)

--- ubi-2.6.orig/drivers/mtd/ubi/vtbl.h
+++ ubi-2.6/drivers/mtd/ubi/vtbl.h
@@ -17,6 +17,7 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
  *
  * Author: Artem B. Bityutskiy
+ * Jan 2007: Alexander Schmidt, implemented per-volume update
  */
 
 /*
@@ -59,11 +60,12 @@
  * eraseblocks went bad. So we cannot alarm the user about this sever
  * corruption.
  *
- * Also, in this UBI implementation we make use of so called update marker when
- * updating volumes. The update marker is global. This may cause quite
- * unpleasant UBI usability problems. What we could do is to implement
- * many-updates-at-a-time support by adding a per-volume "corrupted" flag to the
- * volume table. This flag would be set before update and cleared after update.
+ * The volume table record also contains a so called update marker, which
+ * indicates whether a volume is under update or not. The update marker is
+ * set and stored on flash on the beginning of an update and deleted afterwards.
+ * This makes UBI recognize aborted updates, which may happen because of
+ * power-offs during updates. Read operations on volumes with pending update
+ * markers get rejected.
  */
 
 #ifndef __UBI_VTBL_H__
@@ -133,6 +135,19 @@ int ubi_vtbl_set_data_len(const struct u
 			  long long bytes);
 
 /**
+ * ubi_vtbl_updvol - set update marker of the volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to set the update marker
+ * @upd_marker: new value for the upd_marker
+ *
+ * This function sets the update marker for a volume. The previously existing
+ * value is simply overwritten. This function returns zero in case of success
+ * and a negative error code in case of failure.
+ */
+int ubi_vtbl_updvol(const struct ubi_info *ubi, int vol_id, int upd_marker);
+
+/**
  * ubi_vtbl_set_corrupted - mark a volume as 'corrupted'.
  *
  * @ubi: the UBI device description object
@@ -193,7 +208,7 @@ static inline int ubi_is_ivol(int vol_id
  */
 static inline int ubi_ivol_is_known(int vol_id)
 {
-	return vol_id == UBI_LAYOUT_VOL_ID || vol_id == UBI_UPDATE_VOL_ID;
+	return vol_id == UBI_LAYOUT_VOL_ID;
 }
 
 /**
@@ -230,6 +245,7 @@ void ubi_vtbl_close(const struct ubi_inf
  * @last_eb_bytes: how many bytes are stored in the last logical eraseblock
  * @used_bytes: how many bytes of data this volume contains
  * @corrupted: non-zero if the data is corrupted
+ * @upd_marker: non-zero if volume is under update
  *
  * Note, the @usable_leb_size field is not stored on flash, as it is easily
  * calculated with help of the @data_pad field. But it is just very handy, so
@@ -250,6 +266,7 @@ struct ubi_vtbl_vtr {
 	int last_eb_bytes;
 	long long used_bytes;
 	int corrupted;
+	int upd_marker;
 };
 
 /**
--- ubi-2.6.orig/include/mtd/ubi-header.h
+++ ubi-2.6/include/mtd/ubi-header.h
@@ -64,6 +64,17 @@ enum {
 };
 
 /*
+ * Volume updating constants used in volume table records.
+ *
+ * @UBI_VOL_NOUPD: volume is not being updated
+ * @UBI_VOL_UPD: volume is being updated
+ */
+enum {
+	UBI_VOL_NOUPD = 0,
+	UBI_VOL_UPD = 1
+};
+
+/*
  * Compatibility constants used by internal volumes.
  *
  * @UBI_COMPAT_DELETE: delete this internal volume before anything is written
@@ -275,7 +286,7 @@ struct ubi_vid_hdr_upd_vol {
 } __attribute__ ((packed));
 
 /* Count of internal UBI volumes */
-#define UBI_INT_VOL_COUNT 2
+#define UBI_INT_VOL_COUNT 1
 
 /*
  * Internal volume IDs start from this digit. There is a reserved room for 4096
@@ -287,24 +298,19 @@ struct ubi_vid_hdr_upd_vol {
  * enum ubi_internal_volume_numbers - volume IDs of internal UBI volumes.
  *
  * %UBI_LAYOUT_VOL_ID: volume ID of the layout volume
- * %UBI_UPDATE_VOL_ID: volume ID of the update volume
  */
 enum {
 	UBI_LAYOUT_VOL_ID = UBI_INTERNAL_VOL_START,
-	UBI_UPDATE_VOL_ID = UBI_INTERNAL_VOL_START + 1
 };
 
 /* Number of logical eraseblocks reserved for internal volumes */
 #define UBI_LAYOUT_VOLUME_EBS 2
-#define UBI_UPDATE_VOLUME_EBS 1
 
 /* Names of internal volumes */
 #define UBI_LAYOUT_VOLUME_NAME "The layout volume"
-#define UBI_UPDATE_VOLUME_NAME "The update volume"
 
 /* Compatibility flags of internal volumes */
 #define UBI_LAYOUT_VOLUME_COMPAT UBI_COMPAT_REJECT
-#define UBI_UPDATE_VOLUME_COMPAT UBI_COMPAT_REJECT
 
 /* The maximum number of volumes per one UBI device */
 #define UBI_MAX_VOLUMES 128
@@ -326,7 +332,7 @@ enum {
  * @data_pad: how many bytes are not used at the end of the eraseblocks to
  * satisfy the requested alignment
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved, zeroes
+ * @upd_marker: the volume update marker
  * @name_len: the volume name length
  * @name: the volume name
  * @padding2: reserved, zeroes
@@ -355,7 +361,7 @@ struct ubi_vol_tbl_record {
 	ubi32_t alignment;
 	ubi32_t data_pad;
 	uint8_t vol_type;
-	uint8_t padding1;
+	uint8_t upd_marker;
 	ubi16_t name_len;
 	uint8_t name[UBI_VOL_NAME_MAX+1];
 	uint8_t padding2[24];
--- ubi-2.6.orig/drivers/mtd/ubi/sysfs.c
+++ ubi-2.6/drivers/mtd/ubi/sysfs.c
@@ -205,6 +205,7 @@ static ssize_t vol_corrupted_show(struct
 static ssize_t vol_alignment_show(struct class_device *dev, char *buf);
 static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf);
 static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf);
+static ssize_t vol_updating_show(struct class_device *dev, char *buf);
 
 /*
  * Class device attributes corresponding to files in
@@ -224,6 +225,8 @@ static struct class_device_attribute vol
 	__ATTR(usable_eb_size, S_IRUGO, vol_usable_eb_size_show, NULL);
 static struct class_device_attribute vol_data_bytes =
 	__ATTR(data_bytes, S_IRUGO, vol_data_bytes_show, NULL);
+static struct class_device_attribute vol_updating =
+	__ATTR(updating, S_IRUGO, vol_updating_show, NULL);
 
 /*
  * Note, this function does not free allocated resources in case of failure -
@@ -264,11 +267,15 @@ int ubi_sysfs_vol_init(const struct ubi_
 	err = class_device_create_file(&vol->dev, &vol_data_bytes);
 	if (err)
 		return err;
+	err = class_device_create_file(&vol->dev, &vol_updating);
+	if (err)
+		return err;
 	return 0;
 }
 
 void ubi_sysfs_vol_close(struct ubi_uif_volume *vol)
 {
+	class_device_remove_file(&vol->dev, &vol_updating);
 	class_device_remove_file(&vol->dev, &vol_data_bytes);
 	class_device_remove_file(&vol->dev, &vol_usable_eb_size);
 	class_device_remove_file(&vol->dev, &vol_alignment);
@@ -549,3 +556,22 @@ static ssize_t vol_data_bytes_show(struc
 	spin_unlock(&vol->vol_lock);
 	return ret;
 }
+
+static ssize_t vol_updating_show(struct class_device *dev, char *buf)
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
+	ret = sprintf(buf, "%d\n", vtr->upd_marker);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
--- ubi-2.6.orig/drivers/mtd/ubi/upd.c
+++ ubi-2.6/drivers/mtd/ubi/upd.c
@@ -38,12 +38,11 @@
 #include "scan.h"
 #include "debug.h"
 
-static int put_marker(const struct ubi_info *ubi, int vol_id);
 static int finish_update(const struct ubi_info *ubi);
 
 int ubi_upd_start(const struct ubi_info *ubi, int vol_id, long long bytes)
 {
-	int err, rem, marker_present = 0;
+	int err, rem;
 	uint64_t tmp;
 	const struct ubi_vtbl_vtr *vtr;
 	struct ubi_upd_info *upd = ubi->upd;
@@ -57,35 +56,19 @@ int ubi_upd_start(const struct ubi_info 
 		   bytes <= vtr->usable_leb_size * vtr->reserved_pebs);
 
 	mutex_lock(&upd->mutex);
-	if (upd->vol_id != -1) {
-		/* Hmm, the update marker is busy */
-		err = -EBUSY;
-		if (upd->updating) {
-			dbg_upd("volume %d is being updated, update marker "
+	if (upd->updating && upd->vol_id != vol_id) {
+		dbg_upd("volume %d is being updated, update marker "
 				"busy", upd->vol_id);
-			goto out_unlock;
-		} else if (upd->vol_id != vol_id) {
-			dbg_upd("update marker is held by corrupted volume %d",
-				upd->vol_id);
-			goto out_unlock;
-		}
-
-		/*
-		 * The update marker on the flash media corresponds to our
-		 * volume. Proceed with the update operation.
-		 */
-		marker_present = 1;
+		goto out_unlock;
 	}
 
 	upd->updating = 1;
 	upd->vol_id = vol_id;
 	ubi_vtbl_set_corrupted(ubi, vol_id);
 
-	if (!marker_present) {
-		err = put_marker(ubi, vol_id);
-		if (err)
-			goto out_unlock;
-	}
+	err = ubi_vtbl_updvol(ubi, vol_id, UBI_VOL_UPD);
+	if (err)
+		goto out_unlock;
 
 	/* Before updating, we wipe out volume */
 	err = ubi_wipe_out_volume(ubi, vol_id);
@@ -276,11 +259,8 @@ int ubi_upd_abort(const struct ubi_info 
 	return 0;
 }
 
-static int remove_marker(const struct ubi_info *ubi);
-
 int ubi_upd_clean(const struct ubi_info *ubi, int vol_id)
 {
-	int err = 0;
 	struct ubi_upd_info *upd = ubi->upd;
 
 	mutex_lock(&upd->mutex);
@@ -290,10 +270,7 @@ int ubi_upd_clean(const struct ubi_info 
 
 	dbg_upd("clean update marker for volume %d", vol_id);
 
-	err = remove_marker(ubi);
-	if (err)
-		goto out_unlock;
-
+	upd->updating = 0;
 	upd->vol_id = -1;
 
 out_unlock:
@@ -304,11 +281,7 @@ out_unlock:
 int ubi_upd_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
 {
 	int err;
-	struct ubi_scan_volume *sv;
-	struct ubi_vid_hdr *vid_hdr;
 	struct ubi_upd_info *upd;
-	const struct ubi_vtbl_vtr *vtr;
-	const struct ubi_scan_leb *seb;
 
 	dbg_upd("initialize the update unit");
 
@@ -320,92 +293,17 @@ int ubi_upd_init_scan(struct ubi_info *u
 	upd->upd_buf = ubi_kmalloc(ubi->io->leb_size);
 	if (!upd->upd_buf) {
 		err = -ENOMEM;
-		goto out_free_upd;
+		goto out;
 	}
 
 	mutex_init(&upd->mutex);
 	upd->vol_id = -1;
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
-	 * interrupted. We have to mark the corresponding volume as corrupted.
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
-		 * during scanning. No idea what happened. Don't erase this
-		 * physical eraseblock because some corrupted volume will then
-		 * be treated as good.
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
-	} else
-		ubi_vtbl_set_corrupted(ubi, upd->vol_id);
+	upd->updating = 0;
 
 	dbg_upd("the update unit is initialized");
 	return 0;
 
-out_vid_hdr:
-	ubi_free_vid_hdr(ubi, vid_hdr);
-out_free_upd_buf:
-	ubi_kfree(upd->upd_buf);
-out_free_upd:
+out:
 	ubi_kfree(upd);
 	return err;
 }
@@ -418,52 +316,6 @@ void ubi_upd_close(const struct ubi_info
 }
 
 /**
- * put_marker - put update marker.
- *
- * @ubi: the UBI device description object
- * @vol_id: for which volume to put the update marker.
- *
- * This function returns zero in case of success, and a negative error code in
- * case of failure.
- */
-static int put_marker(const struct ubi_info *ubi, int vol_id)
-{
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
-
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
-
-	dbg_upd("remove update marker for volume %d", upd->vol_id);
-
-	err = ubi_eba_erase_leb(ubi, UBI_UPDATE_VOL_ID, 0);
-	if (err)
-		return err;
-
-	err = ubi_wl_erase_flush(ubi);
-	return err;
-}
-
-/**
  * finish_update - finish volume update.
  *
  * @ubi: the UBI device description object
@@ -476,16 +328,23 @@ static int finish_update(const struct ub
 {
 	int err;
 	struct ubi_upd_info *upd = ubi->upd;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	struct ubi_vtbl_vtr *vtr = &vtbl->vt[upd->vol_id];
 
 	dbg_upd("finish volume %d update", upd->vol_id);
 
 	upd->updating = 0;
 
-	err = remove_marker(ubi);
+	err = ubi_vtbl_updvol(ubi, upd->vol_id, UBI_VOL_NOUPD);
 	if (err)
 		return err;
 
 	ubi_vtbl_set_data_len(ubi, upd->vol_id, upd->upd_bytes);
+
+	mutex_lock(&vtbl->mutex);
+	vtr->corrupted = 0;
+	mutex_unlock(&vtbl->mutex);
+
 	upd->vol_id = -1;
 	return 0;
 }
--- ubi-2.6.orig/drivers/mtd/ubi/vtbl.c
+++ ubi-2.6/drivers/mtd/ubi/vtbl.c
@@ -160,6 +160,44 @@ int ubi_vtbl_set_data_len(const struct u
 	return 0;
 }
 
+int ubi_vtbl_updvol(const struct ubi_info *ubi, int vol_id, int upd_marker)
+{
+	int err;
+	struct ubi_vtbl_vtr tmp_vtr;
+	struct ubi_vtbl_vtr *vtr;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	ubi_assert(vol_id >= 0 && vol_id < vtbl->vt_slots);
+	ubi_assert(upd_marker == UBI_VOL_NOUPD || upd_marker == UBI_VOL_UPD);
+	ubi_assert(!ubi_is_ivol(vol_id));
+
+	dbg_vtbl("set update marker for volume %d to %d", vol_id, upd_marker);
+
+	/* Ensure that this volume exists */
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	if (IS_ERR(vtr)) {
+		return PTR_ERR(vtr);
+	}
+
+	/* If the marker already has the given value, there is nothing to do */
+	if (upd_marker == vtr->upd_marker)
+		return 0;
+
+	memcpy(&tmp_vtr, &vtbl->vt[vol_id], sizeof(struct ubi_vtbl_vtr));
+
+	tmp_vtr.name = strdup_len(vtbl->vt[vol_id].name,
+			vtbl->vt[vol_id].name_len);
+	if (!tmp_vtr.name)
+		return -ENOMEM;
+
+	tmp_vtr.upd_marker = upd_marker;
+
+	err = change_volume(ubi, vol_id, &tmp_vtr);
+
+	ubi_kfree(tmp_vtr.name);
+	return err;
+}
+
 int ubi_vtbl_set_corrupted(const struct ubi_info *ubi, int vol_id)
 {
 	struct ubi_vtbl_info *vtbl = ubi->vtbl;
@@ -212,8 +250,6 @@ int ubi_vtbl_get_compat(const struct ubi
 	switch (vol_id) {
 		case UBI_LAYOUT_VOL_ID:
 			return UBI_LAYOUT_VOLUME_COMPAT;
-		case UBI_UPDATE_VOL_ID:
-			return UBI_UPDATE_VOLUME_COMPAT;
 		default:
 			BUG();
 	}
@@ -414,6 +450,7 @@ static int change_volume(const struct ub
 			vol_tbl[i].vol_type = UBI_VID_DYNAMIC;
 		else
 			vol_tbl[i].vol_type = UBI_VID_STATIC;
+		vol_tbl[i].upd_marker = tmp_vtr->upd_marker;
 		vol_tbl[i].name_len = cpu_to_ubi16((uint16_t)tmp_vtr->name_len);
 
 		memcpy(&vol_tbl[i].name, tmp_vtr->name, tmp_vtr->name_len);
@@ -793,18 +830,6 @@ static void init_ivols(struct ubi_info *
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
@@ -867,6 +892,7 @@ static int init_ram_vt(const struct ubi_
 		name_len = ubi16_to_cpu(vol_tbl[i].name_len);
 		vtr->name_len = name_len;
 		vtr->usable_leb_size = ubi->io->leb_size - vtr->data_pad;
+		vtr->upd_marker = vol_tbl[i].upd_marker;
 
 		vtr->name = ubi_kmalloc(name_len + 1);
 		if (unlikely(!vtr->name)) {
@@ -880,7 +906,12 @@ static int init_ram_vt(const struct ubi_
 
 		/* Initialize the data-related fields */
 
-		vtr->corrupted = 0;
+		if (vtr->upd_marker) {
+			ubi_warn("volume %d update was interrupted", i);
+			vtr->corrupted = 1;
+		}
+		else
+			vtr->corrupted = 0;
 
 		/*
 		 * In case of dynamic volume UBI knows nothing about how many
@@ -954,7 +985,8 @@ static void free_volume_info(const struc
 static int vol_tbl_check(const struct ubi_info *ubi,
 			 const struct ubi_vol_tbl_record *vol_tbl)
 {
-	int i, reserved_pebs, alignment, data_pad, vol_type, name_len;
+	int i, reserved_pebs, alignment, data_pad, vol_type, name_len,
+	    upd_marker;
 	const char *name;
 	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
 	const struct ubi_io_info *io = ubi->io;
@@ -969,6 +1001,7 @@ static int vol_tbl_check(const struct ub
 		alignment = ubi32_to_cpu(vol_tbl[i].alignment);
 		data_pad = ubi32_to_cpu(vol_tbl[i].data_pad);
 		vol_type = vol_tbl[i].vol_type;
+		upd_marker = vol_tbl[i].upd_marker;
 		name_len = ubi16_to_cpu(vol_tbl[i].name_len);
 		name = &vol_tbl[i].name[0];
 
@@ -1029,6 +1062,12 @@ static int vol_tbl_check(const struct ub
 			goto bad;
 		}
 
+		if (unlikely(upd_marker != UBI_VOL_NOUPD &&
+			     upd_marker != UBI_VOL_UPD)) {
+			dbg_err("bad update marker");
+			goto bad;
+		}
+
 		if (unlikely(reserved_pebs > io->good_peb_count)) {
 			dbg_err("too large reserved_pebs");
 			goto bad;
--- ubi-2.6.orig/drivers/mtd/ubi/volmgmt.c
+++ ubi-2.6/drivers/mtd/ubi/volmgmt.c
@@ -366,6 +366,12 @@ static int paranoid_check_vtr(const stru
 		goto bad;
 	}
 
+	if (unlikely(vtr->updating != UBI_VOL_NOUPD &&
+		     vtr->updating != UBI_VOL_UPD)) {
+		ubi_err("bad update marker");
+		goto bad;
+	}
+
 	if (unlikely(vtr->name_len > UBI_VOL_NAME_MAX)) {
 		ubi_err("too long volume name, max is %d", UBI_VOL_NAME_MAX);
 		goto bad;
--- ubi-2.6.orig/drivers/mtd/ubi/upd.h
+++ ubi-2.6/drivers/mtd/ubi/upd.h
@@ -17,6 +17,7 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
  *
  * Author: Artem B. Bityutskiy
+ * Jan 2007: Alexander Schmidt, implemented per-volume update
  */
 
 /*
@@ -24,25 +25,22 @@
  *
  * This unit implements the volume update operation. In the current
  * implementation we use an update marker for this. The update marker is
- * per-UBI device, not per-volume, so only one volume update at a time is
- * possible. The update marker is written to flash before the update starts,
+ * stored in the volume table. It is written to flash before the update starts,
  * and removed from flash after the update has been finished. So, if the update
  * was interrupted by an unclean re-boot, the update marker will be hit on and
  * we'll know that the volume is corrupted.
  *
- * The update marker is implemented as follows. We maintain an internal volume,
- * called "the update volume", which has only one logical eraseblock.  And this
- * logical eraseblock is effectively the update marker. Thus, to put the update
- * marker means to write to the only eraseblock of the update volume, and to
- * remove the update marker is to erase that eraseblock.
+ * The update marker is implemented as follows. When starting an update
+ * procedure, the update marker is set in the volume table record containing
+ * the volume to be updated. Removing the update marker after a successfull
+ * update is done by removing the update marker from the respective volume
+ * table record.
  *
  * Note, in general it is possible to implement the update operation as a
  * transaction with a possibility to roll-back. But this is far more complex.
- *
- * Note, if a volume update was interrupted, the update marker stays on flash,
- * and no other updates are possible. This may cause different usability
- * problems so it would make sense to implement per-volume update marker or
- * just use the volume table for these reasons (introduce an "updating" flag).
+ * In addition, it is not possible to perform concurrent updates, but it is
+ * possible to update volumes when updates on other volumes were interrupted
+ * previously.
  */
 
 #ifndef __UBI_UPD_H__
