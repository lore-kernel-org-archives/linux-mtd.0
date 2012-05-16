Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZE-00028u-PR
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:15 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 9/9] UBI: get rid of dbg_err
Date: Wed, 16 May 2012 18:56:00 +0300
Message-Id: <1337183760-24417-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
References: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch removes the 'dbg_err()' macro and we now use 'ubi_err' instead.
The idea of 'dbg_err()' was to compile out some error message to make the
binary a bit smaller - but I think it was a bad idea.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    8 ++++----
 drivers/mtd/ubi/cdev.c  |   24 ++++++++++++------------
 drivers/mtd/ubi/debug.h |    2 --
 drivers/mtd/ubi/io.c    |   36 ++++++++++++++++++------------------
 drivers/mtd/ubi/kapi.c  |    2 +-
 drivers/mtd/ubi/scan.c  |   10 +++++-----
 drivers/mtd/ubi/vmt.c   |   18 +++++++++---------
 drivers/mtd/ubi/vtbl.c  |    6 +++---
 8 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0fde9fc..2d57282 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -881,7 +881,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		ubi = ubi_devices[i];
 		if (ubi && mtd->index == ubi->mtd->index) {
-			dbg_err("mtd%d is already attached to ubi%d",
+			ubi_err("mtd%d is already attached to ubi%d",
 				mtd->index, i);
 			return -EEXIST;
 		}
@@ -907,7 +907,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 			if (!ubi_devices[ubi_num])
 				break;
 		if (ubi_num == UBI_MAX_DEVICES) {
-			dbg_err("only %d UBI devices may be created",
+			ubi_err("only %d UBI devices may be created",
 				UBI_MAX_DEVICES);
 			return -ENFILE;
 		}
@@ -917,7 +917,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 
 		/* Make sure ubi_num is not busy */
 		if (ubi_devices[ubi_num]) {
-			dbg_err("ubi%d already exists", ubi_num);
+			ubi_err("ubi%d already exists", ubi_num);
 			return -EEXIST;
 		}
 	}
@@ -955,7 +955,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 
 	err = attach_by_scanning(ubi);
 	if (err) {
-		dbg_err("failed to attach by scanning, error %d", err);
+		ubi_err("failed to attach by scanning, error %d", err);
 		goto out_debugging;
 	}
 
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 633ac82..2364c00 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -63,7 +63,7 @@ static int get_exclusive(struct ubi_volume_desc *desc)
 	users = vol->readers + vol->writers + vol->exclusive;
 	ubi_assert(users > 0);
 	if (users > 1) {
-		dbg_err("%d users for volume %d", users, vol->vol_id);
+		ubi_err("%d users for volume %d", users, vol->vol_id);
 		err = -EBUSY;
 	} else {
 		vol->readers = vol->writers = 0;
@@ -159,7 +159,7 @@ static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 
 	if (vol->updating) {
 		/* Update is in progress, seeking is prohibited */
-		dbg_err("updating");
+		ubi_err("updating");
 		return -EBUSY;
 	}
 
@@ -178,7 +178,7 @@ static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 	}
 
 	if (new_offset < 0 || new_offset > vol->used_bytes) {
-		dbg_err("bad seek %lld", new_offset);
+		ubi_err("bad seek %lld", new_offset);
 		return -EINVAL;
 	}
 
@@ -216,11 +216,11 @@ static ssize_t vol_cdev_read(struct file *file, __user char *buf, size_t count,
 		count, *offp, vol->vol_id);
 
 	if (vol->updating) {
-		dbg_err("updating");
+		ubi_err("updating");
 		return -EBUSY;
 	}
 	if (vol->upd_marker) {
-		dbg_err("damaged volume, update marker is set");
+		ubi_err("damaged volume, update marker is set");
 		return -EBADF;
 	}
 	if (*offp == vol->used_bytes || count == 0)
@@ -300,7 +300,7 @@ static ssize_t vol_cdev_direct_write(struct file *file, const char __user *buf,
 
 	lnum = div_u64_rem(*offp, vol->usable_leb_size, &off);
 	if (off & (ubi->min_io_size - 1)) {
-		dbg_err("unaligned position");
+		ubi_err("unaligned position");
 		return -EINVAL;
 	}
 
@@ -309,7 +309,7 @@ static ssize_t vol_cdev_direct_write(struct file *file, const char __user *buf,
 
 	/* We can write only in fractions of the minimum I/O unit */
 	if (count & (ubi->min_io_size - 1)) {
-		dbg_err("unaligned write length");
+		ubi_err("unaligned write length");
 		return -EINVAL;
 	}
 
@@ -643,7 +643,7 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
 	return 0;
 
 bad:
-	dbg_err("bad volume creation request");
+	ubi_err("bad volume creation request");
 	ubi_dump_mkvol_req(req);
 	return err;
 }
@@ -709,12 +709,12 @@ static int rename_volumes(struct ubi_device *ubi,
 	for (i = 0; i < req->count - 1; i++) {
 		for (n = i + 1; n < req->count; n++) {
 			if (req->ents[i].vol_id == req->ents[n].vol_id) {
-				dbg_err("duplicated volume id %d",
+				ubi_err("duplicated volume id %d",
 					req->ents[i].vol_id);
 				return -EINVAL;
 			}
 			if (!strcmp(req->ents[i].name, req->ents[n].name)) {
-				dbg_err("duplicated volume name \"%s\"",
+				ubi_err("duplicated volume name \"%s\"",
 					req->ents[i].name);
 				return -EINVAL;
 			}
@@ -737,7 +737,7 @@ static int rename_volumes(struct ubi_device *ubi,
 		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_EXCLUSIVE);
 		if (IS_ERR(re->desc)) {
 			err = PTR_ERR(re->desc);
-			dbg_err("cannot open volume %d, error %d", vol_id, err);
+			ubi_err("cannot open volume %d, error %d", vol_id, err);
 			kfree(re);
 			goto out_free;
 		}
@@ -796,7 +796,7 @@ static int rename_volumes(struct ubi_device *ubi,
 				continue;
 
 			/* The volume exists but busy, or an error occurred */
-			dbg_err("cannot open volume \"%s\", error %d",
+			ubi_err("cannot open volume \"%s\", error %d",
 				re->new_name, err);
 			goto out_free;
 		}
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 3e5b60f..4499374 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -35,8 +35,6 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 	}                                                                    \
 } while (0)
 
-#define dbg_err(fmt, ...) ubi_err(fmt, ##__VA_ARGS__)
-
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  \
 		print_hex_dump(l, ps, pt, r, g, b, len, a)
 
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 6843264..8a83962 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -272,7 +272,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}
 
 	if (ubi_dbg_is_write_failure(ubi)) {
-		dbg_err("cannot write %d bytes to PEB %d:%d "
+		ubi_err("cannot write %d bytes to PEB %d:%d "
 			"(emulated)", len, pnum, offset);
 		dump_stack();
 		return -EIO;
@@ -387,7 +387,7 @@ retry:
 		return err;
 
 	if (ubi_dbg_is_erase_failure(ubi)) {
-		dbg_err("cannot erase PEB %d (emulated)", pnum);
+		ubi_err("cannot erase PEB %d (emulated)", pnum);
 		return -EIO;
 	}
 
@@ -895,40 +895,40 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 	int usable_leb_size = ubi->leb_size - data_pad;
 
 	if (copy_flag != 0 && copy_flag != 1) {
-		dbg_err("bad copy_flag");
+		ubi_err("bad copy_flag");
 		goto bad;
 	}
 
 	if (vol_id < 0 || lnum < 0 || data_size < 0 || used_ebs < 0 ||
 	    data_pad < 0) {
-		dbg_err("negative values");
+		ubi_err("negative values");
 		goto bad;
 	}
 
 	if (vol_id >= UBI_MAX_VOLUMES && vol_id < UBI_INTERNAL_VOL_START) {
-		dbg_err("bad vol_id");
+		ubi_err("bad vol_id");
 		goto bad;
 	}
 
 	if (vol_id < UBI_INTERNAL_VOL_START && compat != 0) {
-		dbg_err("bad compat");
+		ubi_err("bad compat");
 		goto bad;
 	}
 
 	if (vol_id >= UBI_INTERNAL_VOL_START && compat != UBI_COMPAT_DELETE &&
 	    compat != UBI_COMPAT_RO && compat != UBI_COMPAT_PRESERVE &&
 	    compat != UBI_COMPAT_REJECT) {
-		dbg_err("bad compat");
+		ubi_err("bad compat");
 		goto bad;
 	}
 
 	if (vol_type != UBI_VID_DYNAMIC && vol_type != UBI_VID_STATIC) {
-		dbg_err("bad vol_type");
+		ubi_err("bad vol_type");
 		goto bad;
 	}
 
 	if (data_pad >= ubi->leb_size / 2) {
-		dbg_err("bad data_pad");
+		ubi_err("bad data_pad");
 		goto bad;
 	}
 
@@ -940,45 +940,45 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 		 * mapped logical eraseblocks.
 		 */
 		if (used_ebs == 0) {
-			dbg_err("zero used_ebs");
+			ubi_err("zero used_ebs");
 			goto bad;
 		}
 		if (data_size == 0) {
-			dbg_err("zero data_size");
+			ubi_err("zero data_size");
 			goto bad;
 		}
 		if (lnum < used_ebs - 1) {
 			if (data_size != usable_leb_size) {
-				dbg_err("bad data_size");
+				ubi_err("bad data_size");
 				goto bad;
 			}
 		} else if (lnum == used_ebs - 1) {
 			if (data_size == 0) {
-				dbg_err("bad data_size at last LEB");
+				ubi_err("bad data_size at last LEB");
 				goto bad;
 			}
 		} else {
-			dbg_err("too high lnum");
+			ubi_err("too high lnum");
 			goto bad;
 		}
 	} else {
 		if (copy_flag == 0) {
 			if (data_crc != 0) {
-				dbg_err("non-zero data CRC");
+				ubi_err("non-zero data CRC");
 				goto bad;
 			}
 			if (data_size != 0) {
-				dbg_err("non-zero data_size");
+				ubi_err("non-zero data_size");
 				goto bad;
 			}
 		} else {
 			if (data_size == 0) {
-				dbg_err("zero data_size of copy");
+				ubi_err("zero data_size of copy");
 				goto bad;
 			}
 		}
 		if (used_ebs != 0) {
-			dbg_err("bad used_ebs");
+			ubi_err("bad used_ebs");
 			goto bad;
 		}
 	}
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 33ede23..d76fe47 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -221,7 +221,7 @@ out_free:
 	kfree(desc);
 out_put_ubi:
 	ubi_put_device(ubi);
-	dbg_err("cannot open device %d, volume %d, error %d",
+	ubi_err("cannot open device %d, volume %d, error %d",
 		ubi_num, vol_id, err);
 	return ERR_PTR(err);
 }
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 17fc6e5..dc7f9db 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -197,7 +197,7 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
 		 */
 
 		if (vol_id != sv->vol_id) {
-			dbg_err("inconsistent vol_id");
+			ubi_err("inconsistent vol_id");
 			goto bad;
 		}
 
@@ -207,17 +207,17 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
 			sv_vol_type = UBI_VID_DYNAMIC;
 
 		if (vol_type != sv_vol_type) {
-			dbg_err("inconsistent vol_type");
+			ubi_err("inconsistent vol_type");
 			goto bad;
 		}
 
 		if (used_ebs != sv->used_ebs) {
-			dbg_err("inconsistent used_ebs");
+			ubi_err("inconsistent used_ebs");
 			goto bad;
 		}
 
 		if (data_pad != sv->data_pad) {
-			dbg_err("inconsistent data_pad");
+			ubi_err("inconsistent data_pad");
 			goto bad;
 		}
 	}
@@ -369,7 +369,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 			if (err == UBI_IO_BITFLIPS)
 				bitflips = 1;
 			else {
-				dbg_err("VID of PEB %d header is bad, but it "
+				ubi_err("VID of PEB %d header is bad, but it "
 					"was OK earlier, err %d", pnum, err);
 				if (err > 0)
 					err = -EIO;
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 1bfd4b6..e4b897a 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -223,7 +223,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 			}
 
 		if (vol_id == UBI_VOL_NUM_AUTO) {
-			dbg_err("out of volume IDs");
+			ubi_err("out of volume IDs");
 			err = -ENFILE;
 			goto out_unlock;
 		}
@@ -237,7 +237,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	/* Ensure that this volume does not exist */
 	err = -EEXIST;
 	if (ubi->volumes[vol_id]) {
-		dbg_err("volume %d already exists", vol_id);
+		ubi_err("volume %d already exists", vol_id);
 		goto out_unlock;
 	}
 
@@ -246,7 +246,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		if (ubi->volumes[i] &&
 		    ubi->volumes[i]->name_len == req->name_len &&
 		    !strcmp(ubi->volumes[i]->name, req->name)) {
-			dbg_err("volume \"%s\" exists (ID %d)", req->name, i);
+			ubi_err("volume \"%s\" exists (ID %d)", req->name, i);
 			goto out_unlock;
 		}
 
@@ -257,9 +257,9 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 
 	/* Reserve physical eraseblocks */
 	if (vol->reserved_pebs > ubi->avail_pebs) {
-		dbg_err("not enough PEBs, only %d available", ubi->avail_pebs);
+		ubi_err("not enough PEBs, only %d available", ubi->avail_pebs);
 		if (ubi->corr_peb_count)
-			dbg_err("%d PEBs are corrupted and not used",
+			ubi_err("%d PEBs are corrupted and not used",
 				ubi->corr_peb_count);
 		err = -ENOSPC;
 		goto out_unlock;
@@ -495,7 +495,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 
 	if (vol->vol_type == UBI_STATIC_VOLUME &&
 	    reserved_pebs < vol->used_ebs) {
-		dbg_err("too small size %d, %d LEBs contain data",
+		ubi_err("too small size %d, %d LEBs contain data",
 			reserved_pebs, vol->used_ebs);
 		return -EINVAL;
 	}
@@ -524,10 +524,10 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	if (pebs > 0) {
 		spin_lock(&ubi->volumes_lock);
 		if (pebs > ubi->avail_pebs) {
-			dbg_err("not enough PEBs: requested %d, available %d",
+			ubi_err("not enough PEBs: requested %d, available %d",
 				pebs, ubi->avail_pebs);
 			if (ubi->corr_peb_count)
-				dbg_err("%d PEBs are corrupted and not used",
+				ubi_err("%d PEBs are corrupted and not used",
 					ubi->corr_peb_count);
 			spin_unlock(&ubi->volumes_lock);
 			err = -ENOSPC;
@@ -762,7 +762,7 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
 	}
 
 	if (vol->upd_marker && vol->corrupted) {
-		dbg_err("update marker and corrupted simultaneously");
+		ubi_err("update marker and corrupted simultaneously");
 		goto fail;
 	}
 
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index befe6f8..f3fbaa9 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -225,7 +225,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 
 		n = ubi->leb_size % alignment;
 		if (data_pad != n) {
-			dbg_err("bad data_pad, has to be %d", n);
+			ubi_err("bad data_pad, has to be %d", n);
 			err = 6;
 			goto bad;
 		}
@@ -241,7 +241,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 		}
 
 		if (reserved_pebs > ubi->good_peb_count) {
-			dbg_err("too large reserved_pebs %d, good PEBs %d",
+			ubi_err("too large reserved_pebs %d, good PEBs %d",
 				reserved_pebs, ubi->good_peb_count);
 			err = 9;
 			goto bad;
@@ -815,7 +815,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si)
 	} else {
 		if (sv->leb_count > UBI_LAYOUT_VOLUME_EBS) {
 			/* This must not happen with proper UBI images */
-			dbg_err("too many LEBs (%d) in layout volume",
+			ubi_err("too many LEBs (%d) in layout volume",
 				sv->leb_count);
 			return -EINVAL;
 		}
-- 
1.7.10
