Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsZ-0006Av-NH
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:32:21 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 5/6] UBI: io: support SLC mode accesses
Date: Mon,  5 Sep 2016 17:31:26 +0200
Message-Id: <1473089487-29285-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MLC and TLC NANDs are bringing new constraints, one of them is the concept
of "page pairing".

In MLC NANDs pages are grouped together to form what is usually called a
"pair". These pages are actually using the same cells, and when you program
the second page of a pair and this operation is interrupted, you will not
only corrupt the content of the page you were programming, but also the
content of the page paired with it.
The same goes for TLC NANDs, except that you will have 3 pages grouped
together instead of 2.

In order to overcome this problem, we introduce a new programming/reading
mode, called SLC mode. In this mode only the first page of each pair is
programmed, so that, when a power-cut occurs, only the page that was being
programmed at that time is corrupted. Which is what UBI users expect.

The patch only introduces the new I/O methods, but does not use them yet.
In order to efficiently use them we will need to store/extract the
'programming mode' information from somewhere (VID header).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c  |   5 +-
 drivers/mtd/ubi/build.c   |   1 +
 drivers/mtd/ubi/eba.c     |  21 +++--
 drivers/mtd/ubi/fastmap.c |   9 +-
 drivers/mtd/ubi/io.c      | 218 +++++++++++++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/ubi.h     |  36 ++++++--
 drivers/mtd/ubi/vtbl.c    |   7 +-
 7 files changed, 243 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 48b6f3f8eb40..aa82ff23e1d6 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -523,7 +523,8 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 	len = be32_to_cpu(vid_hdr->data_size);
 
 	mutex_lock(&ubi->buf_mutex);
-	err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, len);
+	err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, len,
+			       UBI_IO_MODE_NORMAL);
 	if (err && err != UBI_IO_BITFLIPS && !mtd_is_eccerr(err))
 		goto out_unlock;
 
@@ -891,7 +892,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	memset(ubi->peb_buf, 0x00, ubi->leb_size);
 
 	err = ubi_io_read(ubi, ubi->peb_buf, pnum, ubi->leb_start,
-			  ubi->leb_size);
+			  ubi->leb_size, UBI_IO_MODE_NORMAL);
 	if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err)) {
 		/*
 		 * Bit-flips or integrity errors while reading the data area.
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5b12fa92a695..c0bf26e6f856 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -654,6 +654,7 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 
 	ubi->peb_size   = ubi->mtd->erasesize;
 	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
+	ubi->max_lebs_per_peb = mtd_pairing_groups_per_eb(ubi->mtd);
 	ubi->flash_size = ubi->mtd->size;
 
 	if (mtd_can_have_bb(ubi->mtd)) {
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 71c35149175f..4424af7ea9ac 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -601,7 +601,8 @@ retry:
 		ubi_free_vid_buf(vidb);
 	}
 
-	err = ubi_io_read_data(ubi, buf, pnum, offset, len);
+	err = ubi_io_read_data(ubi, buf, pnum, offset, len,
+			       UBI_IO_MODE_NORMAL);
 	if (err) {
 		if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
@@ -743,7 +744,8 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 
 	/* Read everything before the area where the write failure happened */
 	if (offset > 0) {
-		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset);
+		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset,
+				       UBI_IO_MODE_NORMAL);
 		if (err && err != UBI_IO_BITFLIPS)
 			goto out_unlock;
 	}
@@ -760,7 +762,8 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 	if (err)
 		goto out_unlock;
 
-	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
+	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size,
+				UBI_IO_MODE_NORMAL);
 
 out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
@@ -867,7 +870,8 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 	}
 
 	if (len) {
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len,
+					UBI_IO_MODE_NORMAL);
 		if (err) {
 			ubi_warn(ubi,
 				 "failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
@@ -923,7 +927,8 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);
 
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len,
+					UBI_IO_MODE_NORMAL);
 		if (err) {
 			ubi_warn(ubi, "failed to write data to PEB %d", pnum);
 			if (err == -EIO && ubi->bad_allowed)
@@ -1269,7 +1274,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	 */
 	mutex_lock(&ubi->buf_mutex);
 	dbg_wl("read %d bytes of data", aldata_size);
-	err = ubi_io_read_data(ubi, ubi->peb_buf, from, 0, aldata_size);
+	err = ubi_io_read_data(ubi, ubi->peb_buf, from, 0, aldata_size,
+			       UBI_IO_MODE_NORMAL);
 	if (err && err != UBI_IO_BITFLIPS) {
 		ubi_warn(ubi, "error %d while reading data from PEB %d",
 			 err, from);
@@ -1331,7 +1337,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	if (data_size > 0) {
-		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size);
+		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size,
+					UBI_IO_MODE_NORMAL);
 		if (err) {
 			if (err == -EIO)
 				err = MOVE_TARGET_WR_ERR;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4adffb893376..c44cdfdf130f 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -876,7 +876,8 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		goto out;
 	}
 
-	ret = ubi_io_read_data(ubi, fmsb, fm_anchor, 0, sizeof(*fmsb));
+	ret = ubi_io_read_data(ubi, fmsb, fm_anchor, 0, sizeof(*fmsb),
+			       UBI_IO_MODE_NORMAL);
 	if (ret && ret != UBI_IO_BITFLIPS)
 		goto free_fm_sb;
 	else if (ret == UBI_IO_BITFLIPS)
@@ -997,7 +998,8 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			sqnum = be64_to_cpu(vh->sqnum);
 
 		ret = ubi_io_read_data(ubi, ubi->fm_buf + (ubi->leb_size * i),
-				       pnum, 0, ubi->leb_size);
+				       pnum, 0, ubi->leb_size,
+				       UBI_IO_MODE_NORMAL);
 		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err(ubi, "unable to read fastmap block# %i (PEB: %i, "
 				"err: %i)", i, pnum, ret);
@@ -1320,7 +1322,8 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 
 	for (i = 0; i < new_fm->used_blocks; i++) {
 		ret = ubi_io_write_data(ubi, fm_raw + (i * ubi->leb_size),
-					new_fm->e[i]->pnum, 0, ubi->leb_size);
+					new_fm->e[i]->pnum, 0, ubi->leb_size,
+					UBI_IO_MODE_NORMAL);
 		if (ret) {
 			ubi_err(ubi, "unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 6676c21c406b..329ad430473b 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -99,15 +99,85 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum);
 static int self_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 			      const struct ubi_vid_hdr *vid_hdr);
 static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
-			    int offset, int len);
+			    int offset, int len, enum ubi_io_mode mode);
+
 
 /**
- * ubi_io_read - read data from a physical eraseblock.
+ * ubi_io_mtd_read - wrapper around mtd_read() to support normal and SLC reads.
  * @ubi: UBI device description object
  * @buf: buffer where to store the read data
  * @pnum: physical eraseblock number to read from
  * @offset: offset within the physical eraseblock from where to read
  * @len: how many bytes to read
+ * @read: number of bytes successfully read from the underlying MTD device
+ * @mode: I/O mode
+ *
+ * This function is a simple wrapper around mtd_read().
+ * When operating in normal mode, mtd_read() is called directly.
+ * When operating in SLC mode, the offset is adapted, and only the first page
+ * each pair is read.
+ */
+static int ubi_io_mtd_read(const struct ubi_device *ubi, void *buf, int pnum,
+			   int offset, int len, size_t *read,
+			   enum ubi_io_mode mode)
+{
+	loff_t addr = (loff_t)pnum * ubi->peb_size;
+	int wunitoffs, chunklen, err = 0, end = offset + len;
+	struct mtd_pairing_info info;
+
+	/*
+	 * Call mtd_read() directly if we're doing non-SLC read or interacting
+	 * with an SLC chip.
+	 */
+	if (mode == UBI_IO_MODE_NORMAL || ubi->max_lebs_per_peb == 1)
+		return mtd_read(ubi->mtd, addr + offset, len, read, buf);
+
+	wunitoffs = offset % ubi->mtd->writesize;
+	info.pair = offset / ubi->mtd->writesize;
+	info.group = 0;
+	*read = 0;
+
+	while (offset < end) {
+		int realoffs, ret;
+		size_t chunkread = 0;
+
+		chunklen = min_t(int, ubi->mtd->writesize - wunitoffs,
+				 end - offset);
+		realoffs = mtd_pairing_info_to_wunit(ubi->mtd, &info);
+		realoffs *= ubi->mtd->writesize;
+		realoffs += wunitoffs;
+		ret = mtd_read(ubi->mtd, addr + realoffs, chunklen,
+			       &chunkread, buf);
+		*read += chunkread;
+		if (mtd_is_bitflip(ret)) {
+			if (!err)
+				err = -EUCLEAN;
+		} else if (mtd_is_eccerr(ret)) {
+			err = -EBADMSG;
+		} else if (ret) {
+			return ret;
+		}
+
+		offset += chunklen;
+		buf += chunklen;
+		info.pair++;
+
+		if (wunitoffs)
+			wunitoffs = 0;
+	}
+
+	return err;
+}
+
+/**
+ * ubi_io_read - read data from a physical eraseblock
+ * @ubi: UBI device description object
+ * @buf: buffer where to store the read data
+ * @pnum: physical eraseblock number to read from
+ * @offset: offset within the physical eraseblock from where to read
+ * @len: how many bytes to read
+ * @mode: I/O mode to use for this read. Only supports %UBI_IO_MODE_NORMAL and
+ *	  %UBI_IO_MODE_SLC for now.
  *
  * This function reads data from offset @offset of physical eraseblock @pnum
  * and stores the read data in the @buf buffer. The following return codes are
@@ -124,16 +194,19 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
  * o other negative error codes in case of other errors.
  */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
-		int len)
+		int len, enum ubi_io_mode mode)
 {
-	int err, retries = 0;
+	int err, max_size, retries = 0;
 	size_t read;
-	loff_t addr;
+
+	max_size = ubi->peb_size;
+	if (mode == UBI_IO_MODE_SLC)
+		max_size /= ubi->max_lebs_per_peb;
 
 	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
-	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
+	ubi_assert(offset >= 0 && offset + len <= max_size);
 	ubi_assert(len > 0);
 
 	err = self_check_not_bad(ubi, pnum);
@@ -162,9 +235,8 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	 */
 	*((uint8_t *)buf) ^= 0xFF;
 
-	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
-	err = mtd_read(ubi->mtd, addr, len, &read, buf);
+	err = ubi_io_mtd_read(ubi, buf, pnum, offset, len, &read, mode);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -216,12 +288,68 @@ retry:
 }
 
 /**
- * ubi_io_write - write data to a physical eraseblock.
+ * ubi_io_mtd_write - wrapper around mtd_write() to support normal and SLC
+ *		      modes.
  * @ubi: UBI device description object
  * @buf: buffer with the data to write
  * @pnum: physical eraseblock number to write to
  * @offset: offset within the physical eraseblock where to write
  * @len: how many bytes to write
+ * @mode: I/O mode
+ *
+ * This function is a simple wrapper around mtd_write().
+ * When operating in normal mode, mtd_write() is called directly.
+ * When operating in SLC mode, the offset is adapted, and only the first page
+ * each pair is written, so that a power-cut happening in the middle of a write
+ * operation can only corrupt a single page (the one being written). This is
+ * what we call SLC mode (it's actually emulating the SLC NAND behavior).
+ */
+static int ubi_io_mtd_write(struct ubi_device *ubi, const void *buf, int pnum,
+			    int offset, int len, size_t *written,
+			    enum ubi_io_mode mode)
+{
+	loff_t addr = (loff_t)pnum * ubi->peb_size;
+	int chunklen, err = 0, end = offset + len;
+	struct mtd_pairing_info info;
+
+	if (mode == UBI_IO_MODE_NORMAL || ubi->max_lebs_per_peb == 1)
+		return mtd_write(ubi->mtd, addr + offset, len, written, buf);
+
+	info.pair = offset / ubi->mtd->writesize;
+	info.group = 0;
+	*written = 0;
+
+	while (offset < end) {
+		int realoffs;
+		size_t chunkwritten = 0;
+
+		chunklen = min_t(int, ubi->mtd->writesize,
+				 end - offset);
+		realoffs = mtd_pairing_info_to_wunit(ubi->mtd, &info);
+		realoffs *= ubi->mtd->writesize;
+		err = mtd_write(ubi->mtd, addr + realoffs, chunklen,
+				&chunkwritten, buf);
+		*written += chunkwritten;
+		if (err && !mtd_is_bitflip(err))
+			return err;
+
+		offset += chunklen;
+		buf += chunklen;
+		info.pair++;
+	}
+
+	return err;
+}
+
+/**
+ * ubi_io_write - write data to a physical eraseblock
+ * @ubi: UBI device description object
+ * @buf: buffer with the data to write
+ * @pnum: physical eraseblock number to write to
+ * @offset: offset within the physical eraseblock where to write
+ * @len: how many bytes to write
+ * mode: I/O mode to use for this write. Only supports %UBI_IO_MODE_NORMAL and
+ *	 %UBI_IO_MODE_SLC for now.
  *
  * This function writes @len bytes of data from buffer @buf to offset @offset
  * of physical eraseblock @pnum. If all the data were successfully written,
@@ -233,16 +361,20 @@ retry:
  * to the flash media, but may be some garbage.
  */
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
-		 int len)
+		 int len, enum ubi_io_mode mode)
 {
+	int max_size, rawoffs = offset, rawlen = len;
 	int err;
 	size_t written;
-	loff_t addr;
+
+	max_size = ubi->peb_size;
+	if (mode == UBI_IO_MODE_SLC)
+		max_size /= ubi->max_lebs_per_peb;
 
 	dbg_io("write %d bytes to PEB %d:%d", len, pnum, offset);
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
-	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
+	ubi_assert(offset >= 0 && offset + len <= max_size);
 	ubi_assert(offset % ubi->hdrs_min_io_size == 0);
 	ubi_assert(len > 0 && len % ubi->hdrs_min_io_size == 0);
 
@@ -255,8 +387,23 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	if (err)
 		return err;
 
+	if (mode == UBI_IO_MODE_SLC && ubi->max_lebs_per_peb > 1) {
+		struct mtd_pairing_info info;
+
+		info.pair = offset / ubi->mtd->writesize;
+		info.group = 0;
+		rawoffs = mtd_pairing_info_to_wunit(ubi->mtd, &info);
+		rawoffs *= ubi->mtd->writesize;
+
+		info.pair = (offset + len) / ubi->mtd->writesize;
+		info.group = 0;
+		rawlen = mtd_pairing_info_to_wunit(ubi->mtd, &info);
+		rawlen *= ubi->mtd->writesize;
+		rawlen -= rawoffs;
+	}
+
 	/* The area we are writing to has to contain all 0xFF bytes */
-	err = ubi_self_check_all_ff(ubi, pnum, offset, len);
+	err = ubi_self_check_all_ff(ubi, pnum, rawoffs, rawlen);
 	if (err)
 		return err;
 
@@ -280,8 +427,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		return -EIO;
 	}
 
-	addr = (loff_t)pnum * ubi->peb_size + offset;
-	err = mtd_write(ubi->mtd, addr, len, &written, buf);
+	err = ubi_io_mtd_write(ubi, buf, pnum, offset, len, &written, mode);
 	if (err) {
 		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
 			err, len, pnum, offset, written);
@@ -291,7 +437,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		ubi_assert(written == len);
 
 	if (!err) {
-		err = self_check_write(ubi, buf, pnum, offset, len);
+		err = self_check_write(ubi, buf, pnum, offset, len, mode);
 		if (err)
 			return err;
 
@@ -299,10 +445,11 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 * Since we always write sequentially, the rest of the PEB has
 		 * to contain only 0xFF bytes.
 		 */
-		offset += len;
-		len = ubi->peb_size - offset;
-		if (len)
-			err = ubi_self_check_all_ff(ubi, pnum, offset, len);
+		rawoffs += rawlen;
+		rawlen = ubi->peb_size - rawoffs;
+		if (rawlen)
+			err = ubi_self_check_all_ff(ubi, pnum, rawoffs,
+						    rawlen);
 	}
 
 	return err;
@@ -424,7 +571,8 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 			goto out;
 
 		/* Make sure the PEB contains only 0xFF bytes */
-		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size,
+				  UBI_IO_MODE_NORMAL);
 		if (err)
 			goto out;
 
@@ -438,12 +586,14 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 
 		/* Write a pattern and check it */
 		memset(ubi->peb_buf, patterns[i], ubi->peb_size);
-		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size,
+				   UBI_IO_MODE_NORMAL);
 		if (err)
 			goto out;
 
 		memset(ubi->peb_buf, ~patterns[i], ubi->peb_size);
-		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size,
+				  UBI_IO_MODE_NORMAL);
 		if (err)
 			goto out;
 
@@ -777,7 +927,8 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 	dbg_io("read EC header from PEB %d", pnum);
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
-	read_err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
+	read_err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE,
+			       UBI_IO_MODE_NORMAL);
 	if (read_err) {
 		if (read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
 			return read_err;
@@ -901,7 +1052,8 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	if (ubi_dbg_power_cut(ubi, POWER_CUT_EC_WRITE))
 		return -EROFS;
 
-	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
+	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize,
+			   UBI_IO_MODE_NORMAL);
 	return err;
 }
 
@@ -1062,7 +1214,8 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
+			       ubi->vid_hdr_shift + UBI_VID_HDR_SIZE,
+			       UBI_IO_MODE_NORMAL);
 	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
 		return read_err;
 
@@ -1162,7 +1315,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			   ubi->vid_hdr_alsize);
+			   ubi->vid_hdr_alsize, UBI_IO_MODE_NORMAL);
 	return err;
 }
 
@@ -1250,7 +1403,8 @@ static int self_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 	if (!ec_hdr)
 		return -ENOMEM;
 
-	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
+	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE,
+			  UBI_IO_MODE_NORMAL);
 	if (err && err != UBI_IO_BITFLIPS && !mtd_is_eccerr(err))
 		goto exit;
 
@@ -1340,7 +1494,7 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	vid_hdr = ubi_get_vid_hdr(vidb);
 	p = vidb->buffer;
 	err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			  ubi->vid_hdr_alsize);
+			  ubi->vid_hdr_alsize, UBI_IO_MODE_NORMAL);
 	if (err && err != UBI_IO_BITFLIPS && !mtd_is_eccerr(err))
 		goto exit;
 
@@ -1376,12 +1530,10 @@ exit:
  * match and a negative error code if not or in case of failure.
  */
 static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
-			    int offset, int len)
+			    int offset, int len, enum ubi_io_mode mode)
 {
 	int err, i;
-	size_t read;
 	void *buf1;
-	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
 	if (!ubi_dbg_chk_io(ubi))
 		return 0;
@@ -1392,7 +1544,7 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		return 0;
 	}
 
-	err = mtd_read(ubi->mtd, addr, len, &read, buf1);
+	err = ubi_io_read(ubi, buf1, pnum, offset, len, mode);
 	if (err && !mtd_is_bitflip(err))
 		goto out_free;
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 160cdfd5442f..de4c65cb8f7a 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -166,6 +166,24 @@ enum {
 	POWER_CUT_VID_WRITE = 0x02,
 };
 
+/*
+ * IO modes.
+ *
+ * UBI_IO_MODE_NORMAL: Normal mode. For everything but MLC/TLC NANDs this is
+ *		       the only available mode. For MLC/TLC NANDs, data are
+ *		       read/written normally, without taking any precaution to
+ *		       ensure its reliability.
+ * UBI_IO_MODE_SLC: For everything but MLC/TLC NANDs passing this option as the
+ *		    same effect as passing %UBI_IO_MODE_NORMAL. For MLC/TLC
+ *		    NANDs this mode emulate the behavior of an SLC NAND by only
+ *		    writing part of the erase block to avoid 'paired page'
+ *		    corruption.
+ */
+enum ubi_io_mode {
+	UBI_IO_MODE_NORMAL,
+	UBI_IO_MODE_SLC,
+};
+
 /**
  * struct ubi_vid_io_buf - VID buffer used to read/write VID info to/from the
  *			   flash.
@@ -526,6 +544,9 @@ struct ubi_debug_info {
  * @flash_size: underlying MTD device size (in bytes)
  * @peb_count: count of physical eraseblocks on the MTD device
  * @peb_size: physical eraseblock size
+ * @max_lebs_per_peb: the maximum number of LEBs per PEB. Should always be 1
+ *		      except for MLC or TLC NANDs, where it should be equal
+ *		      to the number of bits per cell.
  * @bad_peb_limit: top limit of expected bad physical eraseblocks
  * @bad_peb_count: count of bad physical eraseblocks
  * @good_peb_count: count of good physical eraseblocks
@@ -632,6 +653,7 @@ struct ubi_device {
 	long long flash_size;
 	int peb_count;
 	int peb_size;
+	int max_lebs_per_peb;
 	int bad_peb_count;
 	int good_peb_count;
 	int corr_peb_count;
@@ -925,9 +947,9 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
-		int len);
+		int len, enum ubi_io_mode mode);
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
-		 int len);
+		 int len, enum ubi_io_mode mode);
 int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
@@ -1129,10 +1151,11 @@ static inline struct ubi_vid_hdr *ubi_get_vid_hdr(struct ubi_vid_io_buf *vidb)
  * physical eraseblock.
  */
 static inline int ubi_io_read_data(const struct ubi_device *ubi, void *buf,
-				   int pnum, int offset, int len)
+				   int pnum, int offset, int len,
+				   enum ubi_io_mode mode)
 {
 	ubi_assert(offset >= 0);
-	return ubi_io_read(ubi, buf, pnum, offset + ubi->leb_start, len);
+	return ubi_io_read(ubi, buf, pnum, offset + ubi->leb_start, len, mode);
 }
 
 /*
@@ -1141,10 +1164,11 @@ static inline int ubi_io_read_data(const struct ubi_device *ubi, void *buf,
  * physical eraseblock.
  */
 static inline int ubi_io_write_data(struct ubi_device *ubi, const void *buf,
-				    int pnum, int offset, int len)
+				    int pnum, int offset, int len,
+				    enum ubi_io_mode mode)
 {
 	ubi_assert(offset >= 0);
-	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len);
+	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len, mode);
 }
 
 /**
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 4ed75a03e363..8f4abecdae59 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -332,7 +332,8 @@ retry:
 		goto write_error;
 
 	/* Write the layout volume contents */
-	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size);
+	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size,
+				UBI_IO_MODE_NORMAL);
 	if (err)
 		goto write_error;
 
@@ -416,8 +417,8 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 			goto out_free;
 		}
 
-		err = ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum, 0,
-				       ubi->vtbl_size);
+		err = ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum,
+				       0, ubi->vtbl_size, UBI_IO_MODE_NORMAL);
 		if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err))
 			/*
 			 * Scrub the PEB later. Note, -EBADMSG indicates an
-- 
2.7.4
