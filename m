Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5yL4-0002U9-Vh
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 12:22:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: comply with coding style
Date: Mon, 27 Aug 2012 15:22:53 +0300
Message-Id: <1346070174-17871-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Join all the split printk lines in order to stop checkpatch complaining.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/attach.c |   28 ++++++++---------
 drivers/mtd/ubi/build.c  |   22 ++++++-------
 drivers/mtd/ubi/cdev.c   |    9 +++---
 drivers/mtd/ubi/debug.c  |    4 +--
 drivers/mtd/ubi/eba.c    |   33 +++++++++-----------
 drivers/mtd/ubi/gluebi.c |   28 ++++++++---------
 drivers/mtd/ubi/io.c     |   78 ++++++++++++++++++++++------------------------
 drivers/mtd/ubi/misc.c   |    4 +--
 drivers/mtd/ubi/vtbl.c   |    8 ++---
 9 files changed, 101 insertions(+), 113 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index bd27cbb..8da4cff 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -378,8 +378,8 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 			if (err == UBI_IO_BITFLIPS)
 				bitflips = 1;
 			else {
-				ubi_err("VID of PEB %d header is bad, but it "
-					"was OK earlier, err %d", pnum, err);
+				ubi_err("VID of PEB %d header is bad, but it was OK earlier, err %d",
+					pnum, err);
 				if (err > 0)
 					err = -EIO;
 
@@ -790,9 +790,9 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	if (ubi_check_pattern(ubi->peb_buf, 0xFF, ubi->leb_size))
 		goto out_unlock;
 
-	ubi_err("PEB %d contains corrupted VID header, and the data does not "
-		"contain all 0xFF, this may be a non-UBI PEB or a severe VID "
-		"header corruption which requires manual inspection", pnum);
+	ubi_err("PEB %d contains corrupted VID header, and the data does not contain all 0xFF",
+		pnum);
+	ubi_err("this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection");
 	ubi_dump_vid_hdr(vid_hdr);
 	dbg_msg("hexdump of PEB %d offset %d, length %d",
 		pnum, ubi->leb_start, ubi->leb_size);
@@ -907,8 +907,8 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			ubi->image_seq = image_seq;
 		if (ubi->image_seq && image_seq &&
 		    ubi->image_seq != image_seq) {
-			ubi_err("bad image sequence number %d in PEB %d, "
-				"expected %d", image_seq, pnum, ubi->image_seq);
+			ubi_err("bad image sequence number %d in PEB %d, expected %d",
+				image_seq, pnum, ubi->image_seq);
 			ubi_dump_ec_hdr(ech);
 			return -EINVAL;
 		}
@@ -997,8 +997,8 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		/* Unsupported internal volume */
 		switch (vidh->compat) {
 		case UBI_COMPAT_DELETE:
-			ubi_msg("\"delete\" compatible internal volume %d:%d"
-				" found, will remove it", vol_id, lnum);
+			ubi_msg("\"delete\" compatible internal volume %d:%d found, will remove it",
+				vol_id, lnum);
 			err = add_to_list(ai, pnum, vol_id, lnum,
 					  ec, 1, &ai->erase);
 			if (err)
@@ -1006,15 +1006,14 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			return 0;
 
 		case UBI_COMPAT_RO:
-			ubi_msg("read-only compatible internal volume %d:%d"
-				" found, switch to read-only mode",
+			ubi_msg("read-only compatible internal volume %d:%d found, switch to read-only mode",
 				vol_id, lnum);
 			ubi->ro_mode = 1;
 			break;
 
 		case UBI_COMPAT_PRESERVE:
-			ubi_msg("\"preserve\" compatible internal volume %d:%d"
-				" found", vol_id, lnum);
+			ubi_msg("\"preserve\" compatible internal volume %d:%d found",
+				vol_id, lnum);
 			err = add_to_list(ai, pnum, vol_id, lnum,
 					  ec, 0, &ai->alien);
 			if (err)
@@ -1112,8 +1111,7 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			get_random_bytes(&ubi->image_seq,
 					 sizeof(ubi->image_seq));
 		} else {
-			ubi_err("MTD device is not UBI-formatted and possibly "
-				"contains non-UBI data - refusing it");
+			ubi_err("MTD device is not UBI-formatted and possibly contains non-UBI data - refusing it");
 			return -EINVAL;
 		}
 
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8966088..dd9bc0a 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -748,16 +748,15 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	 * read-only mode.
 	 */
 	if (ubi->vid_hdr_offset + UBI_VID_HDR_SIZE <= ubi->hdrs_min_io_size) {
-		ubi_warn("EC and VID headers are in the same minimal I/O unit, "
-			 "switch to read-only mode");
+		ubi_warn("EC and VID headers are in the same minimal I/O unit, switch to read-only mode");
 		ubi->ro_mode = 1;
 	}
 
 	ubi->leb_size = ubi->peb_size - ubi->leb_start;
 
 	if (!(ubi->mtd->flags & MTD_WRITEABLE)) {
-		ubi_msg("MTD device %d is write-protected, attach in "
-			"read-only mode", ubi->mtd->index);
+		ubi_msg("MTD device %d is write-protected, attach in read-only mode",
+			ubi->mtd->index);
 		ubi->ro_mode = 1;
 	}
 
@@ -892,8 +891,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		ubi_err("refuse attaching mtd%d - it is already emulated on "
-			"top of UBI", mtd->index);
+		ubi_err("refuse attaching mtd%d - it is already emulated on top of UBI",
+			mtd->index);
 		return -EINVAL;
 	}
 
@@ -1357,14 +1356,13 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 
 	len = strnlen(val, MTD_PARAM_LEN_MAX);
 	if (len == MTD_PARAM_LEN_MAX) {
-		printk(KERN_ERR "UBI error: parameter \"%s\" is too long, "
-		       "max. is %d\n", val, MTD_PARAM_LEN_MAX);
+		printk(KERN_ERR "UBI error: parameter \"%s\" is too long, max. is %d\n",
+		       val, MTD_PARAM_LEN_MAX);
 		return -EINVAL;
 	}
 
 	if (len == 0) {
-		printk(KERN_WARNING "UBI warning: empty 'mtd=' parameter - "
-		       "ignored\n");
+		printk(KERN_WARNING "UBI warning: empty 'mtd=' parameter - ignored\n");
 		return 0;
 	}
 
@@ -1396,8 +1394,8 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
 
 		if (err) {
-			printk(KERN_ERR "UBI error: bad value for "
-			       "max_beb_per1024 parameter: %s", tokens[2]);
+			printk(KERN_ERR "UBI error: bad value for max_beb_per1024 parameter: %s",
+			       tokens[2]);
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7885dc0..540d2db 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -140,9 +140,9 @@ static int vol_cdev_release(struct inode *inode, struct file *file)
 		vol->updating = 0;
 		vfree(vol->upd_buf);
 	} else if (vol->changing_leb) {
-		dbg_gen("only %lld of %lld bytes received for atomic LEB change"
-			" for volume %d:%d, cancel", vol->upd_received,
-			vol->upd_bytes, vol->ubi->ubi_num, vol->vol_id);
+		dbg_gen("only %lld of %lld bytes received for atomic LEB change for volume %d:%d, cancel",
+			vol->upd_received, vol->upd_bytes, vol->ubi->ubi_num,
+			vol->vol_id);
 		vol->changing_leb = 0;
 		vfree(vol->upd_buf);
 	}
@@ -189,7 +189,8 @@ static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 	return new_offset;
 }
 
-static int vol_cdev_fsync(struct file *file, loff_t start, loff_t end, int datasync)
+static int vol_cdev_fsync(struct file *file, loff_t start, loff_t end,
+			  int datasync)
 {
 	struct ubi_volume_desc *desc = file->private_data;
 	struct ubi_device *ubi = desc->vol->ubi;
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 7c13803..dd97324 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -43,8 +43,8 @@ void ubi_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len)
 		return;
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err && err != -EUCLEAN) {
-		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
-			"read %zd bytes", err, len, pnum, offset, read);
+		ubi_err("error %d while reading %d bytes from PEB %d:%d, read %zd bytes",
+			err, len, pnum, offset, read);
 		goto out;
 	}
 
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index b703ac7..a26d7d2 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -420,9 +420,8 @@ retry:
 				 */
 				if (err == UBI_IO_BAD_HDR_EBADMSG ||
 				    err == UBI_IO_BAD_HDR) {
-					ubi_warn("corrupted VID header at PEB "
-						 "%d, LEB %d:%d", pnum, vol_id,
-						 lnum);
+					ubi_warn("corrupted VID header at PEB %d, LEB %d:%d",
+						 pnum, vol_id, lnum);
 					err = -EBADMSG;
 				} else
 					ubi_ro_mode(ubi);
@@ -660,9 +659,8 @@ retry:
 	if (len) {
 		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
 		if (err) {
-			ubi_warn("failed to write %d bytes at offset %d of "
-				 "LEB %d:%d, PEB %d", len, offset, vol_id,
-				 lnum, pnum);
+			ubi_warn("failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
+				 len, offset, vol_id, lnum, pnum);
 			goto write_error;
 		}
 	}
@@ -1040,9 +1038,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	 * cancel it.
 	 */
 	if (vol->eba_tbl[lnum] != from) {
-		dbg_wl("LEB %d:%d is no longer mapped to PEB %d, mapped to "
-		       "PEB %d, cancel", vol_id, lnum, from,
-		       vol->eba_tbl[lnum]);
+		dbg_wl("LEB %d:%d is no longer mapped to PEB %d, mapped to PEB %d, cancel",
+		       vol_id, lnum, from, vol->eba_tbl[lnum]);
 		err = MOVE_CANCEL_RACE;
 		goto out_unlock_leb;
 	}
@@ -1107,8 +1104,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	err = ubi_io_read_vid_hdr(ubi, to, vid_hdr, 1);
 	if (err) {
 		if (err != UBI_IO_BITFLIPS) {
-			ubi_warn("error %d while reading VID header back from "
-				  "PEB %d", err, to);
+			ubi_warn("error %d while reading VID header back from PEB %d",
+				 err, to);
 			if (is_error_sane(err))
 				err = MOVE_TARGET_RD_ERR;
 		} else
@@ -1134,8 +1131,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		err = ubi_io_read_data(ubi, ubi->peb_buf, to, 0, aldata_size);
 		if (err) {
 			if (err != UBI_IO_BITFLIPS) {
-				ubi_warn("error %d while reading data back "
-					 "from PEB %d", err, to);
+				ubi_warn("error %d while reading data back from PEB %d",
+					 err, to);
 				if (is_error_sane(err))
 					err = MOVE_TARGET_RD_ERR;
 			} else
@@ -1146,8 +1143,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		cond_resched();
 
 		if (crc != crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size)) {
-			ubi_warn("read data back from PEB %d and it is "
-				 "different", to);
+			ubi_warn("read data back from PEB %d and it is different",
+				 to);
 			err = -EINVAL;
 			goto out_unlock_buf;
 		}
@@ -1197,11 +1194,11 @@ static void print_rsvd_warning(struct ubi_device *ubi,
 			return;
 	}
 
-	ubi_warn("cannot reserve enough PEBs for bad PEB handling, reserved %d,"
-		 " need %d", ubi->beb_rsvd_pebs, ubi->beb_rsvd_level);
+	ubi_warn("cannot reserve enough PEBs for bad PEB handling, reserved %d, need %d",
+		 ubi->beb_rsvd_pebs, ubi->beb_rsvd_level);
 	if (ubi->corr_peb_count)
 		ubi_warn("%d PEBs are corrupted and not used",
-			ubi->corr_peb_count);
+			 ubi->corr_peb_count);
 }
 
 /**
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 4e44bee..c25aa29 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -341,9 +341,8 @@ static int gluebi_create(struct ubi_device_info *di,
 	mutex_lock(&devices_mutex);
 	g = find_gluebi_nolock(vi->ubi_num, vi->vol_id);
 	if (g)
-		err_msg("gluebi MTD device %d form UBI device %d volume %d "
-			"already exists", g->mtd.index, vi->ubi_num,
-			vi->vol_id);
+		err_msg("gluebi MTD device %d form UBI device %d volume %d already exists",
+			g->mtd.index, vi->ubi_num, vi->vol_id);
 	mutex_unlock(&devices_mutex);
 
 	if (mtd_device_register(mtd, NULL, 0)) {
@@ -376,8 +375,8 @@ static int gluebi_remove(struct ubi_volume_info *vi)
 	mutex_lock(&devices_mutex);
 	gluebi = find_gluebi_nolock(vi->ubi_num, vi->vol_id);
 	if (!gluebi) {
-		err_msg("got remove notification for unknown UBI device %d "
-			"volume %d", vi->ubi_num, vi->vol_id);
+		err_msg("got remove notification for unknown UBI device %d volume %d",
+			vi->ubi_num, vi->vol_id);
 		err = -ENOENT;
 	} else if (gluebi->refcnt)
 		err = -EBUSY;
@@ -390,9 +389,8 @@ static int gluebi_remove(struct ubi_volume_info *vi)
 	mtd = &gluebi->mtd;
 	err = mtd_device_unregister(mtd);
 	if (err) {
-		err_msg("cannot remove fake MTD device %d, UBI device %d, "
-			"volume %d, error %d", mtd->index, gluebi->ubi_num,
-			gluebi->vol_id, err);
+		err_msg("cannot remove fake MTD device %d, UBI device %d, volume %d, error %d",
+			mtd->index, gluebi->ubi_num, gluebi->vol_id, err);
 		mutex_lock(&devices_mutex);
 		list_add_tail(&gluebi->list, &gluebi_devices);
 		mutex_unlock(&devices_mutex);
@@ -422,8 +420,8 @@ static int gluebi_updated(struct ubi_volume_info *vi)
 	gluebi = find_gluebi_nolock(vi->ubi_num, vi->vol_id);
 	if (!gluebi) {
 		mutex_unlock(&devices_mutex);
-		err_msg("got update notification for unknown UBI device %d "
-			"volume %d", vi->ubi_num, vi->vol_id);
+		err_msg("got update notification for unknown UBI device %d volume %d",
+			vi->ubi_num, vi->vol_id);
 		return -ENOENT;
 	}
 
@@ -449,8 +447,8 @@ static int gluebi_resized(struct ubi_volume_info *vi)
 	gluebi = find_gluebi_nolock(vi->ubi_num, vi->vol_id);
 	if (!gluebi) {
 		mutex_unlock(&devices_mutex);
-		err_msg("got update notification for unknown UBI device %d "
-			"volume %d", vi->ubi_num, vi->vol_id);
+		err_msg("got update notification for unknown UBI device %d volume %d",
+			vi->ubi_num, vi->vol_id);
 		return -ENOENT;
 	}
 	gluebi->mtd.size = vi->used_bytes;
@@ -507,9 +505,9 @@ static void __exit ubi_gluebi_exit(void)
 
 		err = mtd_device_unregister(mtd);
 		if (err)
-			err_msg("error %d while removing gluebi MTD device %d, "
-				"UBI device %d, volume %d - ignoring", err,
-				mtd->index, gluebi->ubi_num, gluebi->vol_id);
+			err_msg("error %d while removing gluebi MTD device %d, UBI device %d, volume %d - ignoring",
+				err, mtd->index, gluebi->ubi_num,
+				gluebi->vol_id);
 		kfree(mtd->name);
 		kfree(gluebi);
 	}
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a8d5237..3215411 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -183,15 +183,14 @@ retry:
 		}
 
 		if (retries++ < UBI_IO_RETRIES) {
-			ubi_warn("error %d%s while reading %d bytes from PEB "
-				 "%d:%d, read only %zd bytes, retry",
+			ubi_warn("error %d%s while reading %d bytes from PEB %d:%d, read only %zd bytes, retry",
 				 err, errstr, len, pnum, offset, read);
 			yield();
 			goto retry;
 		}
 
-		ubi_err("error %d%s while reading %d bytes from PEB %d:%d, "
-			"read %zd bytes", err, errstr, len, pnum, offset, read);
+		ubi_err("error %d%s while reading %d bytes from PEB %d:%d, read %zd bytes",
+			err, errstr, len, pnum, offset, read);
 		dump_stack();
 
 		/*
@@ -274,8 +273,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}
 
 	if (ubi_dbg_is_write_failure(ubi)) {
-		ubi_err("cannot write %d bytes to PEB %d:%d "
-			"(emulated)", len, pnum, offset);
+		ubi_err("cannot write %d bytes to PEB %d:%d (emulated)",
+			len, pnum, offset);
 		dump_stack();
 		return -EIO;
 	}
@@ -283,8 +282,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 	err = mtd_write(ubi->mtd, addr, len, &written, buf);
 	if (err) {
-		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
-			"%zd bytes", err, len, pnum, offset, written);
+		ubi_err("error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
+			err, len, pnum, offset, written);
 		dump_stack();
 		ubi_dump_flash(ubi, pnum, offset, len);
 	} else
@@ -685,8 +684,7 @@ static int validate_ec_hdr(const struct ubi_device *ubi,
 	leb_start = be32_to_cpu(ec_hdr->data_offset);
 
 	if (ec_hdr->version != UBI_VERSION) {
-		ubi_err("node with incompatible UBI version found: "
-			"this UBI version is %d, image version is %d",
+		ubi_err("node with incompatible UBI version found: this UBI version is %d, image version is %d",
 			UBI_VERSION, (int)ec_hdr->version);
 		goto bad;
 	}
@@ -777,10 +775,10 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		if (ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)) {
 			/* The physical eraseblock is supposedly empty */
 			if (verbose)
-				ubi_warn("no EC header found at PEB %d, "
-					 "only 0xFF bytes", pnum);
-			dbg_bld("no EC header found at PEB %d, "
-				"only 0xFF bytes", pnum);
+				ubi_warn("no EC header found at PEB %d, only 0xFF bytes",
+					 pnum);
+			dbg_bld("no EC header found at PEB %d, only 0xFF bytes",
+				pnum);
 			if (!read_err)
 				return UBI_IO_FF;
 			else
@@ -792,12 +790,12 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		 * 0xFF bytes. Report that the header is corrupted.
 		 */
 		if (verbose) {
-			ubi_warn("bad magic number at PEB %d: %08x instead of "
-				 "%08x", pnum, magic, UBI_EC_HDR_MAGIC);
+			ubi_warn("bad magic number at PEB %d: %08x instead of %08x",
+				 pnum, magic, UBI_EC_HDR_MAGIC);
 			ubi_dump_ec_hdr(ec_hdr);
 		}
-		dbg_bld("bad magic number at PEB %d: %08x instead of "
-			"%08x", pnum, magic, UBI_EC_HDR_MAGIC);
+		dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
+			pnum, magic, UBI_EC_HDR_MAGIC);
 		return UBI_IO_BAD_HDR;
 	}
 
@@ -806,12 +804,12 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 
 	if (hdr_crc != crc) {
 		if (verbose) {
-			ubi_warn("bad EC header CRC at PEB %d, calculated "
-				 "%#08x, read %#08x", pnum, crc, hdr_crc);
+			ubi_warn("bad EC header CRC at PEB %d, calculated %#08x, read %#08x",
+				 pnum, crc, hdr_crc);
 			ubi_dump_ec_hdr(ec_hdr);
 		}
-		dbg_bld("bad EC header CRC at PEB %d, calculated "
-			"%#08x, read %#08x", pnum, crc, hdr_crc);
+		dbg_bld("bad EC header CRC at PEB %d, calculated %#08x, read %#08x",
+			pnum, crc, hdr_crc);
 
 		if (!read_err)
 			return UBI_IO_BAD_HDR;
@@ -1032,10 +1030,10 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 
 		if (ubi_check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
 			if (verbose)
-				ubi_warn("no VID header found at PEB %d, "
-					 "only 0xFF bytes", pnum);
-			dbg_bld("no VID header found at PEB %d, "
-				"only 0xFF bytes", pnum);
+				ubi_warn("no VID header found at PEB %d, only 0xFF bytes",
+					 pnum);
+			dbg_bld("no VID header found at PEB %d, only 0xFF bytes",
+				pnum);
 			if (!read_err)
 				return UBI_IO_FF;
 			else
@@ -1043,12 +1041,12 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		}
 
 		if (verbose) {
-			ubi_warn("bad magic number at PEB %d: %08x instead of "
-				 "%08x", pnum, magic, UBI_VID_HDR_MAGIC);
+			ubi_warn("bad magic number at PEB %d: %08x instead of %08x",
+				 pnum, magic, UBI_VID_HDR_MAGIC);
 			ubi_dump_vid_hdr(vid_hdr);
 		}
-		dbg_bld("bad magic number at PEB %d: %08x instead of "
-			"%08x", pnum, magic, UBI_VID_HDR_MAGIC);
+		dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
+			pnum, magic, UBI_VID_HDR_MAGIC);
 		return UBI_IO_BAD_HDR;
 	}
 
@@ -1057,12 +1055,12 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	if (hdr_crc != crc) {
 		if (verbose) {
-			ubi_warn("bad CRC at PEB %d, calculated %#08x, "
-				 "read %#08x", pnum, crc, hdr_crc);
+			ubi_warn("bad CRC at PEB %d, calculated %#08x, read %#08x",
+				 pnum, crc, hdr_crc);
 			ubi_dump_vid_hdr(vid_hdr);
 		}
-		dbg_bld("bad CRC at PEB %d, calculated %#08x, "
-			"read %#08x", pnum, crc, hdr_crc);
+		dbg_bld("bad CRC at PEB %d, calculated %#08x, read %#08x",
+			pnum, crc, hdr_crc);
 		if (!read_err)
 			return UBI_IO_BAD_HDR;
 		else
@@ -1300,8 +1298,8 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
 	hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
 	if (hdr_crc != crc) {
-		ubi_err("bad VID header CRC at PEB %d, calculated %#08x, "
-			"read %#08x", pnum, crc, hdr_crc);
+		ubi_err("bad VID header CRC at PEB %d, calculated %#08x, read %#08x",
+			pnum, crc, hdr_crc);
 		ubi_err("self-check failed for PEB %d", pnum);
 		ubi_dump_vid_hdr(vid_hdr);
 		dump_stack();
@@ -1411,15 +1409,15 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err && !mtd_is_bitflip(err)) {
-		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
-			"read %zd bytes", err, len, pnum, offset, read);
+		ubi_err("error %d while reading %d bytes from PEB %d:%d, read %zd bytes",
+			err, len, pnum, offset, read);
 		goto error;
 	}
 
 	err = ubi_check_pattern(buf, 0xFF, len);
 	if (err == 0) {
-		ubi_err("flash region at PEB %d:%d, length %d does not "
-			"contain all 0xFF bytes", pnum, offset, len);
+		ubi_err("flash region at PEB %d:%d, length %d does not contain all 0xFF bytes",
+			pnum, offset, len);
 		goto fail;
 	}
 
diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index d089df0..f913d70 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -128,9 +128,7 @@ void ubi_calculate_reserved(struct ubi_device *ubi)
 	ubi->beb_rsvd_level = ubi->bad_peb_limit - ubi->bad_peb_count;
 	if (ubi->beb_rsvd_level < 0) {
 		ubi->beb_rsvd_level = 0;
-		ubi_warn("number of bad PEBs (%d) is above the expected limit "
-			 "(%d), not reserving any PEBs for bad PEB handling, "
-			 "will use available PEBs (if any)",
+		ubi_warn("number of bad PEBs (%d) is above the expected limit (%d), not reserving any PEBs for bad PEB handling, will use available PEBs (if any)",
 			 ubi->bad_peb_count, ubi->bad_peb_limit);
 	}
 }
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 437bc19..7e7c201 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -270,8 +270,8 @@ static int vtbl_check(const struct ubi_device *ubi,
 
 			if (len1 > 0 && len1 == len2 &&
 			    !strncmp(vtbl[i].name, vtbl[n].name, len1)) {
-				ubi_err("volumes %d and %d have the same name"
-					" \"%s\"", i, n, vtbl[i].name);
+				ubi_err("volumes %d and %d have the same name \"%s\"",
+					i, n, vtbl[i].name);
 				ubi_dump_vtbl_record(&vtbl[i], i);
 				ubi_dump_vtbl_record(&vtbl[n], n);
 				return -EINVAL;
@@ -562,8 +562,8 @@ static int init_volumes(struct ubi_device *ubi,
 		if (vtbl[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
 			/* Auto re-size flag may be set only for one volume */
 			if (ubi->autoresize_vol_id != -1) {
-				ubi_err("more than one auto-resize volume (%d "
-					"and %d)", ubi->autoresize_vol_id, i);
+				ubi_err("more than one auto-resize volume (%d and %d)",
+					ubi->autoresize_vol_id, i);
 				kfree(vol);
 				return -EINVAL;
 			}
-- 
1.7.10.4
