Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Na9fr-00040N-7F
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 15:19:23 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0RFJECK015807
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 09:19:18 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] UBI: simplify debugging return codes
Date: Wed, 27 Jan 2010 17:18:59 +0200
Message-Id: <1264605540-13144-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
References: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

UBI debugging functions were a little bit over-engineered and
returned more error codes than needed, and the callers had to
do useless checks. Simplify the return codes.

Impact: only debugging code is affected, which means that for
        non-developers this is a no-op patch.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c   |   50 ++++++++++++++++++++++++------------------------
 drivers/mtd/ubi/scan.c |   11 +++------
 drivers/mtd/ubi/wl.c   |   17 +++++++--------
 3 files changed, 37 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 8aa51e7..a250129 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -143,7 +143,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 	err = paranoid_check_not_bad(ubi, pnum);
 	if (err)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
@@ -236,12 +236,12 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 
 	err = paranoid_check_not_bad(ubi, pnum);
 	if (err)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	/* The area we are writing to has to contain all 0xFF bytes */
 	err = ubi_dbg_check_all_ff(ubi, pnum, offset, len);
 	if (err)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	if (offset >= ubi->leb_start) {
 		/*
@@ -250,10 +250,10 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 */
 		err = paranoid_check_peb_ec_hdr(ubi, pnum);
 		if (err)
-			return err > 0 ? -EINVAL : err;
+			return err;
 		err = paranoid_check_peb_vid_hdr(ubi, pnum);
 		if (err)
-			return err > 0 ? -EINVAL : err;
+			return err;
 	}
 
 	if (ubi_dbg_is_write_failure()) {
@@ -348,7 +348,7 @@ retry:
 
 	err = ubi_dbg_check_all_ff(ubi, pnum, 0, ubi->peb_size);
 	if (err)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	if (ubi_dbg_is_erase_failure() && !err) {
 		dbg_err("cannot erase PEB %d (emulated)", pnum);
@@ -542,7 +542,7 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 
 	err = paranoid_check_not_bad(ubi, pnum);
 	if (err != 0)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	if (ubi->ro_mode) {
 		ubi_err("read-only mode");
@@ -819,7 +819,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 
 	err = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
 	if (err)
-		return -EINVAL;
+		return err;
 
 	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
 	return err;
@@ -1083,7 +1083,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	err = paranoid_check_peb_ec_hdr(ubi, pnum);
 	if (err)
-		return err > 0 ? -EINVAL : err;
+		return err;
 
 	vid_hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
 	vid_hdr->version = UBI_VERSION;
@@ -1092,7 +1092,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	err = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
 	if (err)
-		return -EINVAL;
+		return err;
 
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
@@ -1107,8 +1107,8 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number to check
  *
- * This function returns zero if the physical eraseblock is good, a positive
- * number if it is bad and a negative error code if an error occurred.
+ * This function returns zero if the physical eraseblock is good, %-EINVAL if
+ * it is bad and a negative error code if an error occurred.
  */
 static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
 {
@@ -1120,7 +1120,7 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
 
 	ubi_err("paranoid check failed for PEB %d", pnum);
 	ubi_dbg_dump_stack();
-	return err;
+	return err > 0 ? -EINVAL : err;
 }
 
 /**
@@ -1130,7 +1130,7 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
  * @ec_hdr: the erase counter header to check
  *
  * This function returns zero if the erase counter header contains valid
- * values, and %1 if not.
+ * values, and %-EINVAL if not.
  */
 static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 				 const struct ubi_ec_hdr *ec_hdr)
@@ -1156,7 +1156,7 @@ static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 fail:
 	ubi_dbg_dump_ec_hdr(ec_hdr);
 	ubi_dbg_dump_stack();
-	return 1;
+	return -EINVAL;
 }
 
 /**
@@ -1164,8 +1164,8 @@ fail:
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
  *
- * This function returns zero if the erase counter header is all right, %1 if
- * not, and a negative error code if an error occurred.
+ * This function returns zero if the erase counter header is all right and and
+ * a negative error code if not or if an error occurred.
  */
 static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 {
@@ -1188,7 +1188,7 @@ static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 		ubi_err("paranoid check failed for PEB %d", pnum);
 		ubi_dbg_dump_ec_hdr(ec_hdr);
 		ubi_dbg_dump_stack();
-		err = 1;
+		err = -EINVAL;
 		goto exit;
 	}
 
@@ -1206,7 +1206,7 @@ exit:
  * @vid_hdr: the volume identifier header to check
  *
  * This function returns zero if the volume identifier header is all right, and
- * %1 if not.
+ * %-EINVAL if not.
  */
 static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 				  const struct ubi_vid_hdr *vid_hdr)
@@ -1233,7 +1233,7 @@ fail:
 	ubi_err("paranoid check failed for PEB %d", pnum);
 	ubi_dbg_dump_vid_hdr(vid_hdr);
 	ubi_dbg_dump_stack();
-	return 1;
+	return -EINVAL;
 
 }
 
@@ -1243,7 +1243,7 @@ fail:
  * @pnum: the physical eraseblock number to check
  *
  * This function returns zero if the volume identifier header is all right,
- * %1 if not, and a negative error code if an error occurred.
+ * and a negative error code if not or if an error occurred.
  */
 static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 {
@@ -1270,7 +1270,7 @@ static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 		ubi_err("paranoid check failed for PEB %d", pnum);
 		ubi_dbg_dump_vid_hdr(vid_hdr);
 		ubi_dbg_dump_stack();
-		err = 1;
+		err = -EINVAL;
 		goto exit;
 	}
 
@@ -1289,8 +1289,8 @@ exit:
  * @len: the length of the region to check
  *
  * This function returns zero if only 0xFF bytes are present at offset
- * @offset of the physical eraseblock @pnum, %1 if not, and a negative error
- * code if an error occurred.
+ * @offset of the physical eraseblock @pnum, and a negative error code if not
+ * or if an error occurred.
  */
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 {
@@ -1321,7 +1321,7 @@ fail:
 	ubi_msg("hex dump of the %d-%d region", offset, offset + len);
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 		       ubi->dbg_peb_buf, len, 1);
-	err = 1;
+	err = -EINVAL;
 error:
 	ubi_dbg_dump_stack();
 	mutex_unlock(&ubi->dbg_buf_mutex);
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 90af61a..594184b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -974,11 +974,8 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 			seb->ec = si->mean_ec;
 
 	err = paranoid_check_si(ubi, si);
-	if (err) {
-		if (err > 0)
-			err = -EINVAL;
+	if (err)
 		goto out_vidh;
-	}
 
 	ubi_free_vid_hdr(ubi, vidh);
 	kfree(ech);
@@ -1086,8 +1083,8 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
  * @ubi: UBI device description object
  * @si: scanning information
  *
- * This function returns zero if the scanning information is all right, %1 if
- * not and a negative error code if an error occurred.
+ * This function returns zero if the scanning information is all right, and a
+ * negative error code if not or if an error occurred.
  */
 static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
@@ -1346,7 +1343,7 @@ bad_vid_hdr:
 
 out:
 	ubi_dbg_dump_stack();
-	return 1;
+	return -EINVAL;
 }
 
 #endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 600c722..f64ddab 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -464,7 +464,7 @@ retry:
 				   ubi->peb_size - ubi->vid_hdr_aloffset);
 	if (err) {
 		ubi_err("new PEB %d does not contain all 0xFF bytes", e->pnum);
-		return err > 0 ? -EINVAL : err;
+		return err;
 	}
 
 	return e->pnum;
@@ -513,7 +513,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
 
 	err = paranoid_check_ec(ubi, e->pnum, e->ec);
-	if (err > 0)
+	if (err)
 		return -EINVAL;
 
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
@@ -1572,8 +1572,7 @@ void ubi_wl_close(struct ubi_device *ubi)
  * @ec: the erase counter to check
  *
  * This function returns zero if the erase counter of physical eraseblock @pnum
- * is equivalent to @ec, %1 if not, and a negative error code if an error
- * occurred.
+ * is equivalent to @ec, and a negative error code if not or if an error occurred.
  */
 static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
 {
@@ -1611,8 +1610,8 @@ out_free:
  * @e: the wear-leveling entry to check
  * @root: the root of the tree
  *
- * This function returns zero if @e is in the @root RB-tree and %1 if it is
- * not.
+ * This function returns zero if @e is in the @root RB-tree and %-EINVAL if it
+ * is not.
  */
 static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 				     struct rb_root *root)
@@ -1623,7 +1622,7 @@ static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 	ubi_err("paranoid check failed for PEB %d, EC %d, RB-tree %p ",
 		e->pnum, e->ec, root);
 	ubi_dbg_dump_stack();
-	return 1;
+	return -EINVAL;
 }
 
 /**
@@ -1632,7 +1631,7 @@ static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
  * @ubi: UBI device description object
  * @e: the wear-leveling entry to check
  *
- * This function returns zero if @e is in @ubi->pq and %1 if it is not.
+ * This function returns zero if @e is in @ubi->pq and %-EINVAL if it is not.
  */
 static int paranoid_check_in_pq(struct ubi_device *ubi, struct ubi_wl_entry *e)
 {
@@ -1647,6 +1646,6 @@ static int paranoid_check_in_pq(struct ubi_device *ubi, struct ubi_wl_entry *e)
 	ubi_err("paranoid check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
 	ubi_dbg_dump_stack();
-	return 1;
+	return -EINVAL;
 }
 #endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
-- 
1.6.6
