Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvT7-0008DW-2A
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:06:05 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 12/17] UBI: simplify LEB write and atomic LEB change code
Date: Mon,  5 Sep 2016 17:05:03 +0200
Message-Id: <1473087908-27862-13-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_eba_write_leb(), ubi_eba_write_leb_st() and
ubi_eba_atomic_leb_change() are using a convoluted retry/exit path.
Add the try_write_vid_and_data() function to simplify the retry logic
and make sure we have a single exit path instead of manually releasing
the resources in each error path.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/eba.c | 285 ++++++++++++++++++++------------------------------
 1 file changed, 115 insertions(+), 170 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0a5fa519b8dd..9242b90489d0 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -684,6 +684,69 @@ static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
 }
 
 /**
+ * try_write_vid_and_data - try to write VID header and data to a new PEB.
+ * @vol: volume description object
+ * @lnum: logical eraseblock number
+ * @vid_hdr: VID header to write
+ * @buf: buffer containing the data
+ * @offset: where to start writing data
+ * @len: how many bytes should be written
+ *
+ * This function tries to write VID header and data belonging to logical
+ * eraseblock @lnum of volume @vol to a new physical eraseblock. Returns zero
+ * in case of success and a negative error code in case of failure.
+ * In case of error, it is possible that something was still written to the
+ * flash media, but may be some garbage.
+ */
+static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
+				  struct ubi_vid_hdr *vid_hdr, const void *buf,
+				  int offset, int len)
+{
+	struct ubi_device *ubi = vol->ubi;
+	int pnum, opnum, err, vol_id = vol->vol_id;
+
+	pnum = ubi_wl_get_peb(ubi);
+	if (pnum < 0) {
+		err = pnum;
+		goto out_put;
+	}
+
+	opnum = vol->eba_tbl[lnum];
+
+	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
+		len, offset, vol_id, lnum, pnum);
+
+	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+	if (err) {
+		ubi_warn(ubi, "failed to write VID header to LEB %d:%d, PEB %d",
+			 vol_id, lnum, pnum);
+		goto out_put;
+	}
+
+	if (len) {
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
+		if (err) {
+			ubi_warn(ubi,
+				 "failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
+				 len, offset, vol_id, lnum, pnum);
+			goto out_put;
+		}
+	}
+
+	vol->eba_tbl[lnum] = pnum;
+
+out_put:
+	up_read(&ubi->fm_eba_sem);
+
+	if (err && pnum >= 0)
+		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+	else if (!err && opnum >= 0)
+		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
+
+	return err;
+}
+
+/**
  * ubi_eba_write_leb - write data to dynamic volume.
  * @ubi: UBI device description object
  * @vol: volume description object
@@ -696,11 +759,12 @@ static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
  * @vol. Returns zero in case of success and a negative error code in case
  * of failure. In case of error, it is possible that something was still
  * written to the flash media, but may be some garbage.
+ * This function retries %UBI_IO_RETRIES times before giving up.
  */
 int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		      const void *buf, int offset, int len)
 {
-	int err, pnum, tries = 0, vol_id = vol->vol_id;
+	int err, pnum, tries, vol_id = vol->vol_id;
 	struct ubi_vid_hdr *vid_hdr;
 
 	if (ubi->ro_mode)
@@ -721,11 +785,9 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 			if (err == -EIO && ubi->bad_allowed)
 				err = recover_peb(ubi, pnum, vol_id, lnum, buf,
 						  offset, len);
-			if (err)
-				ubi_ro_mode(ubi);
 		}
-		leb_write_unlock(ubi, vol_id, lnum);
-		return err;
+
+		goto out;
 	}
 
 	/*
@@ -745,67 +807,31 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
 	vid_hdr->data_pad = cpu_to_be32(vol->data_pad);
 
-retry:
-	pnum = ubi_wl_get_peb(ubi);
-	if (pnum < 0) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		leb_write_unlock(ubi, vol_id, lnum);
-		up_read(&ubi->fm_eba_sem);
-		return pnum;
-	}
-
-	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
-		len, offset, vol_id, lnum, pnum);
-
-	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
-	if (err) {
-		ubi_warn(ubi, "failed to write VID header to LEB %d:%d, PEB %d",
-			 vol_id, lnum, pnum);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
-	}
+	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
+		err = try_write_vid_and_data(vol, lnum, vid_hdr, buf, offset,
+					     len);
+		if (err != -EIO || !ubi->bad_allowed)
+			break;
 
-	if (len) {
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
-		if (err) {
-			ubi_warn(ubi, "failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
-				 len, offset, vol_id, lnum, pnum);
-			up_read(&ubi->fm_eba_sem);
-			goto write_error;
-		}
+		/*
+		 * Fortunately, this is the first write operation to this
+		 * physical eraseblock, so just put it and request a new one.
+		 * We assume that if this physical eraseblock went bad, the
+		 * erase code will handle that.
+		 */
+		vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
+		ubi_msg(ubi, "try another PEB");
 	}
 
-	vol->eba_tbl[lnum] = pnum;
-	up_read(&ubi->fm_eba_sem);
-
-	leb_write_unlock(ubi, vol_id, lnum);
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	return 0;
 
-write_error:
-	if (err != -EIO || !ubi->bad_allowed) {
+out:
+	if (err)
 		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
 
-	/*
-	 * Fortunately, this is the first write operation to this physical
-	 * eraseblock, so just put it and request a new one. We assume that if
-	 * this physical eraseblock went bad, the erase code will handle that.
-	 */
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	if (err || ++tries > UBI_IO_RETRIES) {
-		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
+	leb_write_unlock(ubi, vol_id, lnum);
 
-	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
-	ubi_msg(ubi, "try another PEB");
-	goto retry;
+	return err;
 }
 
 /**
@@ -833,7 +859,7 @@ write_error:
 int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 			 int lnum, const void *buf, int len, int used_ebs)
 {
-	int err, pnum, tries = 0, data_size = len, vol_id = vol->vol_id;
+	int err, tries, data_size = len, vol_id = vol->vol_id;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t crc;
 
@@ -851,10 +877,8 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 		return -ENOMEM;
 
 	err = leb_write_lock(ubi, vol_id, lnum);
-	if (err) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
+	if (err)
+		goto out;
 
 	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
@@ -868,66 +892,26 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 	vid_hdr->used_ebs = cpu_to_be32(used_ebs);
 	vid_hdr->data_crc = cpu_to_be32(crc);
 
-retry:
-	pnum = ubi_wl_get_peb(ubi);
-	if (pnum < 0) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		leb_write_unlock(ubi, vol_id, lnum);
-		up_read(&ubi->fm_eba_sem);
-		return pnum;
-	}
-
-	dbg_eba("write VID hdr and %d bytes at LEB %d:%d, PEB %d, used_ebs %d",
-		len, vol_id, lnum, pnum, used_ebs);
+	ubi_assert(vol->eba_tbl[lnum] < 0);
 
-	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
-	if (err) {
-		ubi_warn(ubi, "failed to write VID header to LEB %d:%d, PEB %d",
-			 vol_id, lnum, pnum);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
-	}
+	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
+		err = try_write_vid_and_data(vol, lnum, vid_hdr, buf, 0, len);
+		if (err != -EIO || !ubi->bad_allowed)
+			break;
 
-	err = ubi_io_write_data(ubi, buf, pnum, 0, len);
-	if (err) {
-		ubi_warn(ubi, "failed to write %d bytes of data to PEB %d",
-			 len, pnum);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
+		vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
+		ubi_msg(ubi, "try another PEB");
 	}
 
-	ubi_assert(vol->eba_tbl[lnum] < 0);
-	vol->eba_tbl[lnum] = pnum;
-	up_read(&ubi->fm_eba_sem);
+	if (err)
+		ubi_ro_mode(ubi);
 
 	leb_write_unlock(ubi, vol_id, lnum);
-	ubi_free_vid_hdr(ubi, vid_hdr);
-	return 0;
-
-write_error:
-	if (err != -EIO || !ubi->bad_allowed) {
-		/*
-		 * This flash device does not admit of bad eraseblocks or
-		 * something nasty and unexpected happened. Switch to read-only
-		 * mode just in case.
-		 */
-		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
 
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	if (err || ++tries > UBI_IO_RETRIES) {
-		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
+out:
+	ubi_free_vid_hdr(ubi, vid_hdr);
 
-	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
-	ubi_msg(ubi, "try another PEB");
-	goto retry;
+	return err;
 }
 
 /*
@@ -950,7 +934,7 @@ write_error:
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len)
 {
-	int err, pnum, old_pnum, tries = 0, vol_id = vol->vol_id;
+	int err, tries, vol_id = vol->vol_id;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t crc;
 
@@ -989,70 +973,31 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 	vid_hdr->copy_flag = 1;
 	vid_hdr->data_crc = cpu_to_be32(crc);
 
-retry:
-	pnum = ubi_wl_get_peb(ubi);
-	if (pnum < 0) {
-		err = pnum;
-		up_read(&ubi->fm_eba_sem);
-		goto out_leb_unlock;
-	}
-
-	dbg_eba("change LEB %d:%d, PEB %d, write VID hdr to PEB %d",
-		vol_id, lnum, vol->eba_tbl[lnum], pnum);
+	dbg_eba("change LEB %d:%d", vol_id, lnum);
 
-	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
-	if (err) {
-		ubi_warn(ubi, "failed to write VID header to LEB %d:%d, PEB %d",
-			 vol_id, lnum, pnum);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
-	}
+	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
+		err = try_write_vid_and_data(vol, lnum, vid_hdr, buf, 0, len);
+		if (err != -EIO || !ubi->bad_allowed)
+			break;
 
-	err = ubi_io_write_data(ubi, buf, pnum, 0, len);
-	if (err) {
-		ubi_warn(ubi, "failed to write %d bytes of data to PEB %d",
-			 len, pnum);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
+		vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
+		ubi_msg(ubi, "try another PEB");
 	}
 
-	old_pnum = vol->eba_tbl[lnum];
-	vol->eba_tbl[lnum] = pnum;
-	up_read(&ubi->fm_eba_sem);
-
-	if (old_pnum >= 0) {
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, old_pnum, 0);
-		if (err)
-			goto out_leb_unlock;
-	}
+	/*
+	 * This flash device does not admit of bad eraseblocks or
+	 * something nasty and unexpected happened. Switch to read-only
+	 * mode just in case.
+	 */
+	if (err)
+		ubi_ro_mode(ubi);
 
-out_leb_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
+
 out_mutex:
 	mutex_unlock(&ubi->alc_mutex);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
-
-write_error:
-	if (err != -EIO || !ubi->bad_allowed) {
-		/*
-		 * This flash device does not admit of bad eraseblocks or
-		 * something nasty and unexpected happened. Switch to read-only
-		 * mode just in case.
-		 */
-		ubi_ro_mode(ubi);
-		goto out_leb_unlock;
-	}
-
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	if (err || ++tries > UBI_IO_RETRIES) {
-		ubi_ro_mode(ubi);
-		goto out_leb_unlock;
-	}
-
-	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
-	ubi_msg(ubi, "try another PEB");
-	goto retry;
 }
 
 /**
-- 
2.7.4
