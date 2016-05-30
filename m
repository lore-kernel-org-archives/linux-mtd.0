Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005Kf-I9
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/13] ubi: SLC mode
Date: Mon, 30 May 2016 14:04:31 +0200
Message-Id: <1464609874-15488-11-git-send-email-richard@nod.at>
In-Reply-To: <1464609874-15488-1-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implements a software SLC mode emulation such that we can write
MLC chips in SLC mode.
As only lower pages are written a power cut will not corrupt data.
This patch was implemented by Boris Brezillon and me.

TODO: some self checks are disabled because vmalloc()ing 2MiB+ (MLC)
will OOM the kernel soon.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |   8 +-
 drivers/mtd/ubi/io.c    | 426 ++++++++++++++++++++++++++++++++++++------------
 drivers/mtd/ubi/ubi.h   |  10 ++
 3 files changed, 340 insertions(+), 104 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 1448f05..99e31ed 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -650,7 +650,10 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	 * physical eraseblocks maximum.
 	 */
 
-	ubi->peb_size   = ubi->mtd->erasesize;
+	ubi->consolidated_peb_size = ubi->mtd->erasesize;
+	ubi->peb_size   = ubi->consolidated_peb_size /
+			  mtd_pairing_groups_per_eb(ubi->mtd);
+	ubi->lebs_per_consolidated_peb = mtd_pairing_groups_per_eb(ubi->mtd);
 	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
 	ubi->flash_size = ubi->mtd->size;
 
@@ -969,7 +972,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		goto out_free;
 
 	err = -ENOMEM;
-	ubi->peb_buf = vmalloc(ubi->peb_size);
+	ubi->peb_buf = vmalloc(ubi->consolidated_peb_size);
 	if (!ubi->peb_buf)
 		goto out_free;
 
@@ -1023,6 +1026,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		ubi->image_seq);
 	ubi_msg(ubi, "available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
 		ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
+	ubi_msg(ubi, "LEBs per PEB: %d", ubi->lebs_per_consolidated_peb);
 
 	/*
 	 * The below lock makes sure we do not race with 'ubi_thread()' which
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 10cf3b5..604434a 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -99,10 +99,71 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum);
 static int self_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 			      const struct ubi_vid_hdr *vid_hdr);
 static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
-			    int offset, int len);
+			    int offset, int len, bool raw);
 
 /**
- * ubi_io_read - read data from a physical eraseblock.
+ * ubi_io_mtd_read - mtd_read wrapper handling MLC specificities.
+ * @ubi: UBI device description object
+ * @buf: buffer where to store the read data
+ * @pnum: physical eraseblock number to read from
+ * @offset: offset within the physical eraseblock from where to read
+ * @len: how many bytes to read
+ * @read: number of bytes successfully read from the underlying MTD device
+ *
+ * This function reads data from offset @offset of physical eraseblock @pnum
+ * and stores the read data in the @buf buffer. The following return codes are
+ * possible:
+ *
+ * o %0 if all the requested data were successfully read;
+ * o other negative error codes in case of other errors.
+ */
+static int ubi_io_mtd_read(const struct ubi_device *ubi, void *buf, int pnum,
+			   int offset, int len, size_t *read, bool raw)
+{
+	loff_t addr = (loff_t)pnum * ubi->consolidated_peb_size;
+	int wunitoffs, chunklen, err = 0, end = offset + len;
+	struct mtd_pairing_info info;
+
+	/*
+	 * Call mtd_read() directly if we're doing a raw read of interacting
+	 * with an SLC chip.
+	 */
+	if (raw || mtd_pairing_groups_per_eb(ubi->mtd) == 1)
+		return mtd_read(ubi->mtd, addr + offset, len, read, buf);
+
+	wunitoffs = offset % ubi->mtd->writesize;
+	info.pair = offset / ubi->mtd->writesize;
+	info.group = 0;
+	*read = 0;
+
+	while (offset < end) {
+		int realoffs;
+		size_t chunkread = 0;
+
+		chunklen = min_t(int, ubi->mtd->writesize - wunitoffs,
+				 end - offset);
+		realoffs = mtd_pairing_info_to_wunit(ubi->mtd, &info);
+		realoffs *= ubi->mtd->writesize;
+		realoffs += wunitoffs;
+		err = mtd_read(ubi->mtd, addr + realoffs, chunklen,
+			       &chunkread, buf);
+		*read += chunkread;
+		if (err && !mtd_is_bitflip(err))
+			return err;
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
+ * __ubi_io_read - read data from a physical eraseblock.
  * @ubi: UBI device description object
  * @buf: buffer where to store the read data
  * @pnum: physical eraseblock number to read from
@@ -123,17 +184,17 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
  * o %-EIO if some I/O error occurred;
  * o other negative error codes in case of other errors.
  */
-int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
-		int len)
+static int __ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum,
+			 int offset, int len, bool raw)
 {
+	int peb_size = raw ? ubi->consolidated_peb_size : ubi->peb_size;
 	int err, retries = 0;
 	size_t read;
-	loff_t addr;
 
 	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
-	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
+	ubi_assert(offset >= 0 && offset + len <= peb_size);
 	ubi_assert(len > 0);
 
 	err = self_check_not_bad(ubi, pnum);
@@ -162,9 +223,8 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	 */
 	*((uint8_t *)buf) ^= 0xFF;
 
-	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
-	err = mtd_read(ubi->mtd, addr, len, &read, buf);
+	err = ubi_io_mtd_read(ubi, buf, pnum, offset, len, &read, raw);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -215,6 +275,54 @@ retry:
 	return err;
 }
 
+int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
+		int len)
+{
+	return __ubi_io_read(ubi, buf, pnum, offset, len, false);
+}
+
+int ubi_io_raw_read(const struct ubi_device *ubi, void *buf, int pnum,
+		    int offset, int len)
+{
+	return __ubi_io_read(ubi, buf, pnum, offset, len, true);
+}
+
+int ubi_io_mtd_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
+		     int len, size_t *written, bool raw)
+{
+	loff_t addr = (loff_t)pnum * ubi->consolidated_peb_size;
+	int chunklen, err = 0, end = offset + len;
+	struct mtd_pairing_info info;
+
+	if (raw || mtd_pairing_groups_per_eb(ubi->mtd) == 1)
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
 /**
  * ubi_io_write - write data to a physical eraseblock.
  * @ubi: UBI device description object
@@ -232,17 +340,18 @@ retry:
  * Note, in case of an error, it is possible that something was still written
  * to the flash media, but may be some garbage.
  */
-int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
-		 int len)
+static int __ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum,
+			  int offset, int len, bool raw)
 {
+	int peb_size = raw ? ubi->consolidated_peb_size : ubi->peb_size;
+	int rawoffs = offset, rawlen = len;
 	int err;
 	size_t written;
-	loff_t addr;
 
 	dbg_io("write %d bytes to PEB %d:%d", len, pnum, offset);
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
-	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
+	ubi_assert(offset >= 0 && offset + len <= peb_size);
 	ubi_assert(offset % ubi->hdrs_min_io_size == 0);
 	ubi_assert(len > 0 && len % ubi->hdrs_min_io_size == 0);
 
@@ -255,8 +364,23 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	if (err)
 		return err;
 
+	if (!raw && mtd_pairing_groups_per_eb(ubi->mtd) > 1) {
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
 
@@ -280,8 +404,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		return -EIO;
 	}
 
-	addr = (loff_t)pnum * ubi->peb_size + offset;
-	err = mtd_write(ubi->mtd, addr, len, &written, buf);
+	err = ubi_io_mtd_write(ubi, buf, pnum, offset, len, &written, raw);
 	if (err) {
 		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
 			err, len, pnum, offset, written);
@@ -291,7 +414,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		ubi_assert(written == len);
 
 	if (!err) {
-		err = self_check_write(ubi, buf, pnum, offset, len);
+		err = self_check_write(ubi, buf, pnum, offset, len, raw);
 		if (err)
 			return err;
 
@@ -299,15 +422,30 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 * Since we always write sequentially, the rest of the PEB has
 		 * to contain only 0xFF bytes.
 		 */
-		offset += len;
-		len = ubi->peb_size - offset;
-		if (len)
-			err = ubi_self_check_all_ff(ubi, pnum, offset, len);
+		rawoffs += rawlen;
+		rawlen = peb_size - rawoffs;
+		if (rawlen)
+			err = ubi_self_check_all_ff(ubi, pnum, rawoffs,
+						    rawlen);
 	}
 
 	return err;
 }
 
+int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
+		 int len)
+{
+	ubi_assert(!ubi->consolidated || !ubi->consolidated[pnum]);
+
+	return __ubi_io_write(ubi, buf, pnum, offset, len, false);
+}
+
+int ubi_io_raw_write(struct ubi_device *ubi, const void *buf, int pnum,
+		     int offset, int len)
+{
+	return __ubi_io_write(ubi, buf, pnum, offset, len, true);
+}
+
 /**
  * erase_callback - MTD erasure call-back.
  * @ei: MTD erase information object.
@@ -348,8 +486,8 @@ retry:
 	memset(&ei, 0, sizeof(struct erase_info));
 
 	ei.mtd      = ubi->mtd;
-	ei.addr     = (loff_t)pnum * ubi->peb_size;
-	ei.len      = ubi->peb_size;
+	ei.addr     = (loff_t)pnum * ubi->consolidated_peb_size;
+	ei.len      = ubi->consolidated_peb_size;
 	ei.callback = erase_callback;
 	ei.priv     = (unsigned long)&wq;
 
@@ -385,7 +523,7 @@ retry:
 		return -EIO;
 	}
 
-	err = ubi_self_check_all_ff(ubi, pnum, 0, ubi->peb_size);
+	err = ubi_self_check_all_ff(ubi, pnum, 0, ubi->consolidated_peb_size);
 	if (err)
 		return err;
 
@@ -424,11 +562,13 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 			goto out;
 
 		/* Make sure the PEB contains only 0xFF bytes */
-		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_raw_read(ubi, ubi->peb_buf, pnum, 0,
+				      ubi->consolidated_peb_size);
 		if (err)
 			goto out;
 
-		err = ubi_check_pattern(ubi->peb_buf, 0xFF, ubi->peb_size);
+		err = ubi_check_pattern(ubi->peb_buf, 0xFF,
+					ubi->consolidated_peb_size);
 		if (err == 0) {
 			ubi_err(ubi, "erased PEB %d, but a non-0xFF byte found",
 				pnum);
@@ -437,18 +577,20 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 		}
 
 		/* Write a pattern and check it */
-		memset(ubi->peb_buf, patterns[i], ubi->peb_size);
-		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		memset(ubi->peb_buf, patterns[i], ubi->consolidated_peb_size);
+		err = ubi_io_raw_write(ubi, ubi->peb_buf, pnum, 0,
+				       ubi->consolidated_peb_size);
 		if (err)
 			goto out;
 
 		memset(ubi->peb_buf, ~patterns[i], ubi->peb_size);
-		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_raw_read(ubi, ubi->peb_buf, pnum, 0,
+				      ubi->consolidated_peb_size);
 		if (err)
 			goto out;
 
 		err = ubi_check_pattern(ubi->peb_buf, patterns[i],
-					ubi->peb_size);
+					ubi->consolidated_peb_size);
 		if (err == 0) {
 			ubi_err(ubi, "pattern %x checking failed for PEB %d",
 				patterns[i], pnum);
@@ -519,7 +661,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * invalid VID header, in which case UBI will treat this PEB as
 	 * corrupted and will try to preserve it, and print scary warnings.
 	 */
-	addr = (loff_t)pnum * ubi->peb_size;
+	addr = (loff_t)pnum * ubi->consolidated_peb_size;
 	err = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
 	if (err != UBI_IO_BAD_HDR_EBADMSG && err != UBI_IO_BAD_HDR &&
 	    err != UBI_IO_FF){
@@ -545,7 +687,7 @@ error:
 	 * return an error.
 	 */
 	ubi_err(ubi, "cannot invalidate PEB %d, write returned %d", pnum, err);
-	ubi_dump_flash(ubi, pnum, 0, ubi->peb_size);
+	ubi_dump_flash(ubi, pnum, 0, ubi->consolidated_peb_size);
 	return -EIO;
 }
 
@@ -616,7 +758,9 @@ int ubi_io_is_bad(const struct ubi_device *ubi, int pnum)
 	if (ubi->bad_allowed) {
 		int ret;
 
-		ret = mtd_block_isbad(mtd, (loff_t)pnum * ubi->peb_size);
+		ret = mtd_block_isbad(mtd,
+				      (loff_t)pnum *
+				      ubi->consolidated_peb_size);
 		if (ret < 0)
 			ubi_err(ubi, "error %d while checking if PEB %d is bad",
 				ret, pnum);
@@ -651,7 +795,8 @@ int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum)
 	if (!ubi->bad_allowed)
 		return 0;
 
-	err = mtd_block_markbad(mtd, (loff_t)pnum * ubi->peb_size);
+	err = mtd_block_markbad(mtd,
+				(loff_t)pnum * ubi->consolidated_peb_size);
 	if (err)
 		ubi_err(ubi, "cannot mark PEB %d bad, error %d", pnum, err);
 	return err;
@@ -992,92 +1137,142 @@ bad:
 }
 
 /**
- * ubi_io_read_vid_hdr - read and check a volume identifier header.
+ * ubi_io_read_vid_hdrs - read and check a volume identifier header.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number to read from
- * @vid_hdr: &struct ubi_vid_hdr object where to store the read volume
- * identifier header
+ * @vid_hdrs: &struct ubi_vid_hdr pointer where to store the read volume
+ * identifier headers
+ * @max: maximum number of headers that can be retrieved
  * @verbose: be verbose if the header is corrupted or wasn't found
  *
- * This function reads the volume identifier header from physical eraseblock
- * @pnum and stores it in @vid_hdr. It also checks CRC checksum of the read
+ * This function reads the volume identifier headers from physical eraseblock
+ * @pnum and stores it in @vid_hdrs. It also checks CRC checksum of the read
  * volume identifier header. The error codes are the same as in
  * 'ubi_io_read_ec_hdr()'.
  *
  * Note, the implementation of this function is also very similar to
  * 'ubi_io_read_ec_hdr()', so refer commentaries in 'ubi_io_read_ec_hdr()'.
  */
-int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
-			struct ubi_vid_hdr *vid_hdr, int verbose)
+int ubi_io_read_vid_hdrs(struct ubi_device *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdrs, int *num,
+			 int verbose)
 {
-	int err, read_err;
+	int err = 0, ret, read_err, i, max = *num;
 	uint32_t crc, magic, hdr_crc;
 	void *p;
 
-	dbg_io("read VID header from PEB %d", pnum);
+	dbg_io("read VID headers from PEB %d", pnum);
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
-	p = (char *)vid_hdr - ubi->vid_hdr_shift;
+	p = (char *)vid_hdrs - ubi->vid_hdr_shift;
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			  ubi->vid_hdr_alsize);
-	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
+	if (read_err && read_err != UBI_IO_BITFLIPS &&
+	    !mtd_is_eccerr(read_err))
 		return read_err;
 
-	magic = be32_to_cpu(vid_hdr->magic);
-	if (magic != UBI_VID_HDR_MAGIC) {
-		if (mtd_is_eccerr(read_err))
-			return UBI_IO_BAD_HDR_EBADMSG;
+	for (i = 0; i < max; i++) {
+		struct ubi_vid_hdr *vid_hdr = vid_hdrs + i;
 
-		if (ubi_check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
-			if (verbose)
-				ubi_warn(ubi, "no VID header found at PEB %d, only 0xFF bytes",
-					 pnum);
-			dbg_bld("no VID header found at PEB %d, only 0xFF bytes",
-				pnum);
+		magic = be32_to_cpu(vid_hdr->magic);
+		if (magic != UBI_VID_HDR_MAGIC) {
+			if (mtd_is_eccerr(read_err)) {
+				err = UBI_IO_BAD_HDR_EBADMSG;
+				break;
+			}
+
+			if (ubi_check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
+				if (verbose && !i)
+					ubi_warn(ubi, "no VID header found at PEB %d, only 0xFF bytes",
+						 pnum);
+				dbg_bld("no VID header found at PEB %d, only 0xFF bytes",
+					pnum);
+				if (!read_err)
+					err = UBI_IO_FF;
+				else
+					err = UBI_IO_FF_BITFLIPS;
+
+				/*
+				 * Propagate UBI_IO_FF/_BITFLIPS only for the first VID header,
+				 * otherwise UBI will treat the whole PEB as empty.
+				 */
+				if (i)
+					err = 0;
+
+				break;
+			}
+
+			if (verbose && !i) {
+				ubi_warn(ubi, "bad magic number at PEB %d: %08x instead of %08x",
+						pnum, magic, UBI_VID_HDR_MAGIC);
+				ubi_dump_vid_hdr(vid_hdr);
+			}
+			dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
+					pnum, magic, UBI_VID_HDR_MAGIC);
+			err = UBI_IO_BAD_HDR;
+			break;
+		}
+
+		crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
+		hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
+
+		if (hdr_crc != crc) {
+			if (verbose && !i) {
+				ubi_warn(ubi, "bad CRC at PEB %d, calculated %#08x, read %#08x",
+						pnum, crc, hdr_crc);
+				ubi_dump_vid_hdr(vid_hdr);
+			}
+			dbg_bld("bad CRC at PEB %d, calculated %#08x, read %#08x",
+					pnum, crc, hdr_crc);
 			if (!read_err)
-				return UBI_IO_FF;
+				err = UBI_IO_BAD_HDR;
 			else
-				return UBI_IO_FF_BITFLIPS;
+				err = UBI_IO_BAD_HDR_EBADMSG;
+			break;
 		}
 
-		if (verbose) {
-			ubi_warn(ubi, "bad magic number at PEB %d: %08x instead of %08x",
-				 pnum, magic, UBI_VID_HDR_MAGIC);
-			ubi_dump_vid_hdr(vid_hdr);
+		ret = validate_vid_hdr(ubi, vid_hdr);
+		if (ret && !i) {
+			ubi_err(ubi, "validation failed for PEB %d", pnum);
+			err = -EINVAL;
+			break;
 		}
-		dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
-			pnum, magic, UBI_VID_HDR_MAGIC);
-		return UBI_IO_BAD_HDR;
+
+		if (read_err)
+			err |= UBI_IO_BITFLIPS;
 	}
 
-	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
-	hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
+	*num = i;
 
-	if (hdr_crc != crc) {
-		if (verbose) {
-			ubi_warn(ubi, "bad CRC at PEB %d, calculated %#08x, read %#08x",
-				 pnum, crc, hdr_crc);
-			ubi_dump_vid_hdr(vid_hdr);
-		}
-		dbg_bld("bad CRC at PEB %d, calculated %#08x, read %#08x",
-			pnum, crc, hdr_crc);
-		if (!read_err)
-			return UBI_IO_BAD_HDR;
-		else
-			return UBI_IO_BAD_HDR_EBADMSG;
-	}
+	return err;
+}
 
-	err = validate_vid_hdr(ubi, vid_hdr);
-	if (err) {
-		ubi_err(ubi, "validation failed for PEB %d", pnum);
-		return -EINVAL;
-	}
+/**
+ * ubi_io_read_vid_hdr - read and check a volume identifier header.
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock number to read from
+ * @vid_hdr: &struct ubi_vid_hdr object where to store the read volume
+ * identifier header
+ * @verbose: be verbose if the header is corrupted or wasn't found
+ *
+ * This function reads the volume identifier header from physical eraseblock
+ * @pnum and stores it in @vid_hdr. It also checks CRC checksum of the read
+ * volume identifier header. The error codes are the same as in
+ * 'ubi_io_read_ec_hdr()'.
+ *
+ * Note, the implementation of this function is also very similar to
+ * 'ubi_io_read_ec_hdr()', so refer commentaries in 'ubi_io_read_ec_hdr()'.
+ */
+int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose)
+{
+	int nhdrs = 1;
 
-	return read_err ? UBI_IO_BITFLIPS : 0;
+	return ubi_io_read_vid_hdrs(ubi, pnum, vid_hdr, &nhdrs, verbose);
 }
 
 /**
- * ubi_io_write_vid_hdr - write a volume identifier header.
+ * ubi_io_write_vid_hdrs - write a volume identifier header.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to write to
  * @vid_hdr: the volume identifier header to write
@@ -1091,10 +1286,10 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
  * case of failure. If %-EIO is returned, the physical eraseblock probably went
  * bad.
  */
-int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
-			 struct ubi_vid_hdr *vid_hdr)
+int ubi_io_write_vid_hdrs(struct ubi_device *ubi, int pnum,
+			  struct ubi_vid_hdr *vid_hdrs, int num)
 {
-	int err;
+	int err, i;
 	uint32_t crc;
 	void *p;
 
@@ -1105,25 +1300,49 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	if (err)
 		return err;
 
-	vid_hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
-	vid_hdr->version = UBI_VERSION;
-	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
-	vid_hdr->hdr_crc = cpu_to_be32(crc);
+	for (i = 0; i < num; i++) {
+		vid_hdrs[i].magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
+		vid_hdrs[i].version = UBI_VERSION;
+		crc = crc32(UBI_CRC32_INIT, &vid_hdrs[i],
+			    UBI_VID_HDR_SIZE_CRC);
+		vid_hdrs[i].hdr_crc = cpu_to_be32(crc);
 
-	err = self_check_vid_hdr(ubi, pnum, vid_hdr);
-	if (err)
-		return err;
+		err = self_check_vid_hdr(ubi, pnum, &vid_hdrs[i]);
+		if (err)
+			return err;
+	}
 
 	if (ubi_dbg_power_cut(ubi, POWER_CUT_VID_WRITE))
 		return -EROFS;
 
-	p = (char *)vid_hdr - ubi->vid_hdr_shift;
+	p = (char *)vid_hdrs - ubi->vid_hdr_shift;
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
 	return err;
 }
 
 /**
+ * ubi_io_write_vid_hdr - write a volume identifier header.
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock number to write to
+ * @vid_hdr: the volume identifier header to write
+ *
+ * This function writes the volume identifier header described by @vid_hdr to
+ * physical eraseblock @pnum. This function automatically fills the
+ * @vid_hdr->magic and the @vid_hdr->version fields, as well as calculates
+ * header CRC checksum and stores it at vid_hdr->hdr_crc.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. If %-EIO is returned, the physical eraseblock probably went
+ * bad.
+ */
+int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdr)
+{
+	return ubi_io_write_vid_hdrs(ubi, pnum, vid_hdr, 1);
+}
+
+/**
  * self_check_not_bad - ensure that a physical eraseblock is not bad.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number to check
@@ -1331,23 +1550,23 @@ exit:
  * match and a negative error code if not or in case of failure.
  */
 static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
-			    int offset, int len)
+			    int offset, int len, bool raw)
 {
 	int err, i;
-	size_t read;
 	void *buf1;
-	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
+
+	return 0;
 
 	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
-	buf1 = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
+	buf1 = __vmalloc(0x1f8000, GFP_NOFS, PAGE_KERNEL);
 	if (!buf1) {
 		ubi_err(ubi, "cannot allocate memory to check writes");
 		return 0;
 	}
 
-	err = mtd_read(ubi->mtd, addr, len, &read, buf1);
+	err = __ubi_io_read(ubi, buf1, pnum, offset, len, raw);
 	if (err && !mtd_is_bitflip(err))
 		goto out_free;
 
@@ -1400,7 +1619,10 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	size_t read;
 	int err;
 	void *buf;
-	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
+	loff_t addr = (loff_t)pnum * ubi->consolidated_peb_size + offset;
+
+	//XXX
+	return 0;
 
 	if (!ubi_dbg_chk_io(ubi))
 		return 0;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c901cc0..aab984f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -602,6 +602,7 @@ struct ubi_device {
 	long long flash_size;
 	int peb_count;
 	int peb_size;
+	int consolidated_peb_size;
 	int bad_peb_count;
 	int good_peb_count;
 	int corr_peb_count;
@@ -879,8 +880,12 @@ bool ubi_work_join_one(struct ubi_device *ubi);
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 		int len);
+int ubi_io_raw_read(const struct ubi_device *ubi, void *buf, int pnum,
+		    int offset, int len);
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 int len);
+int ubi_io_raw_write(struct ubi_device *ubi, const void *buf, int pnum,
+		     int offset, int len);
 int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
@@ -890,8 +895,13 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_ec_hdr *ec_hdr);
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose);
+int ubi_io_read_vid_hdrs(struct ubi_device *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdrs, int *num,
+			 int verbose);
 int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 			 struct ubi_vid_hdr *vid_hdr);
+int ubi_io_write_vid_hdrs(struct ubi_device *ubi, int pnum,
+			  struct ubi_vid_hdr *vid_hdrs, int num);
 
 /* build.c */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
-- 
2.7.3
