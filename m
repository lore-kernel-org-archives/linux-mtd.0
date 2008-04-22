Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoLb3-0002BT-9E
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 16:43:58 +0000
Subject: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com, Hamish Moffatt <hamish@cloud.net.au>,
	Nancy <nancydreaming@gmail.com>
Content-Type: multipart/mixed; boundary="=-n9JjQW+f1JH0z8PJKQry"
Date: Tue, 22 Apr 2008 19:42:32 +0300
Message-Id: <1208882552.11721.13.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-n9JjQW+f1JH0z8PJKQry
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've prepared 2 UBI patches which may slightly improve the scan time. I
am not sure though. Would you guys please try them and tell if UBI scan
time changed? Thanks in advance.

Attached.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--=-n9JjQW+f1JH0z8PJKQry
Content-Disposition: attachment;
	filename=0001-UBI-separate-out-header-checking.patch
Content-Type: application/mbox;
	name=0001-UBI-separate-out-header-checking.patch
Content-Transfer-Encoding: 7bit

>From b9207c3481acb395c36ca9e039dedaa440b6e881 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 22 Apr 2008 18:12:40 +0300
Subject: [PATCH] UBI: separate out header checking

This is a preparation patch which separates out the checking
stuff from the EC and VID read&check functions. This will be
needed for the follow-up scanning improvement patch.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c  |  250 +++++++++++++++++++++++++++++++------------------
 drivers/mtd/ubi/ubi.h |    4 +
 2 files changed, 164 insertions(+), 90 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 4ac11df..f62728e 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -604,70 +604,38 @@ bad:
 }
 
 /**
- * ubi_io_read_ec_hdr - read and check an erase counter header.
+ * ubi_io_check_ec_hdr - check an erase counter header.
  * @ubi: UBI device description object
- * @pnum: physical eraseblock to read from
- * @ec_hdr: a &struct ubi_ec_hdr object where to store the read erase counter
- * header
- * @verbose: be verbose if the header is corrupted or was not found
+ * @pnum: physical eraseblock the header was read from
+ * @ec_hdr: the header to check
+ * @verbose: be verbose if the header is corrupted
  *
- * This function reads erase counter header from physical eraseblock @pnum and
- * stores it in @ec_hdr. This function also checks CRC checksum of the read
- * erase counter header. The following codes may be returned:
+ * This function check erase counter header which was read from physical
+ * eraseblock @pnum. The following codes may be returned:
  *
  * o %0 if the CRC checksum is correct and the header was successfully read;
- * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
- *   and corrected by the flash driver; this is harmless but may indicate that
- *   this eraseblock may become bad soon (but may be not);
  * o %UBI_IO_BAD_EC_HDR if the erase counter header is corrupted (a CRC error);
  * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
  * o a negative error code in case of failure.
  */
-int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
-		       struct ubi_ec_hdr *ec_hdr, int verbose)
+int ubi_io_check_ec_hdr(struct ubi_device *ubi, int pnum,
+			const struct ubi_ec_hdr *ec_hdr, int verbose)
 {
-	int err, read_err = 0;
 	uint32_t crc, magic, hdr_crc;
 
-	dbg_io("read EC header from PEB %d", pnum);
-	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
-	if (UBI_IO_DEBUG)
-		verbose = 1;
-
-	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
-	if (err) {
-		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
-			return err;
-
-		/*
-		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported about some data integrity error,
-		 * like an ECC error in case of NAND. The former is harmless,
-		 * the later may mean that the read data is corrupted. But we
-		 * have a CRC check-sum and we will detect this. If the EC
-		 * header is still OK, we just report this as there was a
-		 * bit-flip.
-		 */
-		read_err = err;
-	}
-
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
 		/*
 		 * The magic field is wrong. Let's check if we have read all
 		 * 0xFF. If yes, this physical eraseblock is assumed to be
 		 * empty.
-		 *
-		 * But if there was a read error, we do not test it for all
-		 * 0xFFs. Even if it does contain all 0xFFs, this error
-		 * indicates that something is still wrong with this physical
-		 * eraseblock and we anyway cannot treat it as empty.
 		 */
-		if (read_err != -EBADMSG &&
-		    check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)) {
-			/* The physical eraseblock is supposedly empty */
+		if (check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)) {
+			int err;
 
 			/*
+			 * The physical eraseblock is supposedly empty.
+			 *
 			 * The below is just a paranoid check, it has to be
 			 * compiled out if paranoid checks are disabled.
 			 */
@@ -675,7 +643,6 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 						    ubi->peb_size);
 			if (err)
 				return err > 0 ? UBI_IO_BAD_EC_HDR : err;
-
 			if (verbose)
 				ubi_warn("no EC header found at PEB %d, "
 					 "only 0xFF bytes", pnum);
@@ -691,6 +658,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 				 "%08x", pnum, magic, UBI_EC_HDR_MAGIC);
 			ubi_dbg_dump_ec_hdr(ec_hdr);
 		}
+
 		return UBI_IO_BAD_EC_HDR;
 	}
 
@@ -706,6 +674,72 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		return UBI_IO_BAD_EC_HDR;
 	}
 
+	return 0;
+}
+
+/**
+ * ubi_io_read_ec_hdr - read and check an erase counter header.
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock to read from
+ * @ec_hdr: a &struct ubi_ec_hdr object where to store the read erase counter
+ * header
+ * @verbose: be verbose if the header is corrupted or was not found
+ *
+ * This function reads erase counter header from physical eraseblock @pnum and
+ * stores it in @ec_hdr. This function also checks CRC checksum of the read
+ * erase counter header. The following codes may be returned:
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver; this is harmless but may indicate that
+ *   this eraseblock may become bad soon (but may be not);
+ * o %UBI_IO_BAD_EC_HDR if the erase counter header is corrupted (a CRC error);
+ * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
+ * o a negative error code in case of failure.
+ */
+int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
+		       struct ubi_ec_hdr *ec_hdr, int verbose)
+{
+	int err, read_err = 0;
+
+	dbg_io("read EC header from PEB %d", pnum);
+	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
+	if (UBI_IO_DEBUG)
+		verbose = 1;
+
+	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
+	if (err) {
+		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
+			return err;
+
+		/*
+		 * We read all the data, but either a correctable bit-flip
+		 * occurred, or MTD reported about some data integrity error,
+		 * like an ECC error in case of NAND. The former is harmless,
+		 * the later may mean that the read data is corrupted. But we
+		 * have a CRC check-sum and we will detect this. If the EC
+		 * header is still OK, we just report this as there was a
+		 * bit-flip.
+		 */
+		read_err = err;
+	}
+
+	err = ubi_io_check_ec_hdr(ubi, pnum, ec_hdr, verbose);
+	if (err == UBI_IO_PEB_EMPTY && read_err) {
+		/*
+		 * There was a read error, and the read data contains only
+		 * 0xFFs. Do not treat this physical eraseblock as empty
+		 * because the read error indicates that something is still
+		 * wrong with it.
+		 */
+		if (verbose)
+			ubi_warn("PEB %d is supposedly empty, but there was "
+				 "read a error (%d)", pnum, read_err);
+		return UBI_IO_BAD_EC_HDR;
+	}
+	if (err)
+		return err;
+
 	/* And of course validate what has just been read from the media */
 	err = validate_ec_hdr(ubi, ec_hdr);
 	if (err) {
@@ -876,73 +910,39 @@ bad:
 }
 
 /**
- * ubi_io_read_vid_hdr - read and check a volume identifier header.
+ * ubi_io_check_vid_hdr - check a volume identifier header.
  * @ubi: UBI device description object
- * @pnum: physical eraseblock number to read from
- * @vid_hdr: &struct ubi_vid_hdr object where to store the read volume
- * identifier header
+ * @pnum: physical eraseblock number the header was read from
+ * @vid_hdr: the header to check
  * @verbose: be verbose if the header is corrupted or wasn't found
  *
- * This function reads the volume identifier header from physical eraseblock
- * @pnum and stores it in @vid_hdr. It also checks CRC checksum of the read
- * volume identifier header. The following codes may be returned:
+ * This function checks the volume identifier header @vid_hdr which was read
+ * from physical eraseblock @pnum. The following codes may be returned:
  *
  * o %0 if the CRC checksum is correct and the header was successfully read;
- * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
- *   and corrected by the flash driver; this is harmless but may indicate that
- *   this eraseblock may become bad soon;
  * o %UBI_IO_BAD_VID_HRD if the volume identifier header is corrupted (a CRC
  *   error detected);
  * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
  *   header there);
  * o a negative error code in case of failure.
  */
-int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
-			struct ubi_vid_hdr *vid_hdr, int verbose)
+int ubi_io_check_vid_hdr(struct ubi_device *ubi, int pnum,
+			 const struct ubi_vid_hdr *vid_hdr, int verbose)
 {
-	int err, read_err = 0;
 	uint32_t crc, magic, hdr_crc;
-	void *p;
-
-	dbg_io("read VID header from PEB %d", pnum);
-	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
-	if (UBI_IO_DEBUG)
-		verbose = 1;
-
-	p = (char *)vid_hdr - ubi->vid_hdr_shift;
-	err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			  ubi->vid_hdr_alsize);
-	if (err) {
-		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
-			return err;
-
-		/*
-		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported about some data integrity error,
-		 * like an ECC error in case of NAND. The former is harmless,
-		 * the later may mean the read data is corrupted. But we have a
-		 * CRC check-sum and we will identify this. If the VID header is
-		 * still OK, we just report this as there was a bit-flip.
-		 */
-		read_err = err;
-	}
 
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
 		/*
 		 * If we have read all 0xFF bytes, the VID header probably does
 		 * not exist and the physical eraseblock is assumed to be free.
-		 *
-		 * But if there was a read error, we do not test the data for
-		 * 0xFFs. Even if it does contain all 0xFFs, this error
-		 * indicates that something is still wrong with this physical
-		 * eraseblock and it cannot be regarded as free.
 		 */
-		if (read_err != -EBADMSG &&
-		    check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
-			/* The physical eraseblock is supposedly free */
+		if (check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
+			int err;
 
 			/*
+			 * The physical eraseblock is supposedly free.
+			 *
 			 * The below is just a paranoid check, it has to be
 			 * compiled out if paranoid checks are disabled.
 			 */
@@ -981,6 +981,76 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		return UBI_IO_BAD_VID_HDR;
 	}
 
+	return 0;
+}
+
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
+ * volume identifier header. The following codes may be returned:
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver; this is harmless but may indicate that
+ *   this eraseblock may become bad soon;
+ * o %UBI_IO_BAD_VID_HRD if the volume identifier header is corrupted (a CRC
+ *   error detected);
+ * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
+ *   header there);
+ * o a negative error code in case of failure.
+ */
+int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose)
+{
+	int err, read_err = 0;
+	void *p;
+
+	dbg_io("read VID header from PEB %d", pnum);
+	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
+	if (UBI_IO_DEBUG)
+		verbose = 1;
+
+	p = (char *)vid_hdr - ubi->vid_hdr_shift;
+	err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
+			  ubi->vid_hdr_alsize);
+	if (err) {
+		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
+			return err;
+
+		/*
+		 * We read all the data, but either a correctable bit-flip
+		 * occurred, or MTD reported about some data integrity error,
+		 * like an ECC error in case of NAND. The former is harmless,
+		 * the later may mean the read data is corrupted. But we have a
+		 * CRC check-sum and we will identify this. If the VID header is
+		 * still OK, we just report this as there was a bit-flip.
+		 */
+		read_err = err;
+	}
+
+	err = ubi_io_check_vid_hdr(ubi, pnum, vid_hdr, verbose);
+	if (err == UBI_IO_PEB_EMPTY && read_err) {
+		/*
+		 * There was a read error, and the read data contains only
+		 * 0xFFs. Do not treat this physical eraseblock as empty
+		 * because the read error indicates that something is still
+		 * wrong with it.
+		 */
+		if (verbose)
+			ubi_warn("PEB %d is supposedly empty, but there was a "
+				 "read error (%d)", pnum, read_err);
+		return UBI_IO_BAD_VID_HDR;
+	}
+	if (err)
+		return err;
+
 	/* Validate the VID header that we have just read */
 	err = validate_vid_hdr(ubi, vid_hdr);
 	if (err) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 28de80f..4e36028 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -496,10 +496,14 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
+int ubi_io_check_ec_hdr(struct ubi_device *ubi, int pnum,
+			const struct ubi_ec_hdr *ec_hdr, int verbose);
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose);
 int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_ec_hdr *ec_hdr);
+int ubi_io_check_vid_hdr(struct ubi_device *ubi, int pnum,
+			 const struct ubi_vid_hdr *vid_hdr, int verbose);
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose);
 int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
-- 
1.5.4.1


--=-n9JjQW+f1JH0z8PJKQry
Content-Disposition: attachment;
	filename=0002-UBI-optimize-scanning-a-bit.patch
Content-Type: application/mbox; name=0002-UBI-optimize-scanning-a-bit.patch
Content-Transfer-Encoding: 7bit

>From 822dfc1c4799743b0edad0848f7ef6ffc30294f1 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 22 Apr 2008 18:41:05 +0300
Subject: [PATCH] UBI: optimize scanning a bit

When scanning the MTD device, we do 2 read requests - one for
the EC header and one for the VID header. These are small 64-byte
requests. In fact, MTD anyway reads whole NAND page and we
might as well make only one read request.

Some flashes have a kind of "burst" read which makes it faster
to read 2 consequtive NAND pages at once than reading them
separately. This optimization is targeted on such flashes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |  104 ++++++++++++++++++++++++++---------------------
 drivers/mtd/ubi/scan.h |   11 +++++-
 2 files changed, 67 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 96d410e..44dc214 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -51,10 +51,6 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
 #define paranoid_check_si(ubi, si) 0
 #endif
 
-/* Temporary variables used during scanning */
-static struct ubi_ec_hdr *ech;
-static struct ubi_vid_hdr *vidh;
-
 /**
  * add_to_list - add physical eraseblock to a list.
  * @si: scanning information
@@ -754,7 +750,7 @@ struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum)
 {
 	long long uninitialized_var(ec);
-	int err, bitflips = 0, vol_id, ec_corr = 0;
+	int err, bitflips = 0, vol_id, ec_corr = 0, read_err = 0;
 
 	dbg_bld("scan PEB %d", pnum);
 
@@ -771,16 +767,29 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum
 		return 0;
 	}
 
-	err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
+	err = ubi_io_read(ubi, si->read_buf, pnum, 0, si->read_len);
+	if (err) {
+		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
+			return err;
+
+		read_err = err;
+	}
+
+	err = ubi_io_check_ec_hdr(ubi, pnum, si->ech, 0);
 	if (err < 0)
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_PEB_EMPTY)
-		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_EC_HDR) {
+	else if (err == UBI_IO_PEB_EMPTY && !read_err) {
+		if (!read_err)
+			return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC,
+					   &si->erase);
+		err = UBI_IO_BAD_EC_HDR;
+	}
+
+	if (err == UBI_IO_BAD_EC_HDR) {
 		/*
-		 * We have to also look at the VID header, possibly it is not
+		 * We also have to look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
 		 * moved and EC be re-created.
 		 */
@@ -793,13 +802,13 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum
 
 	if (!ec_corr) {
 		/* Make sure UBI version is OK */
-		if (ech->version != UBI_VERSION) {
+		if (si->ech->version != UBI_VERSION) {
 			ubi_err("this UBI version is %d, image version is %d",
-				UBI_VERSION, (int)ech->version);
+				UBI_VERSION, (int)si->ech->version);
 			return -EINVAL;
 		}
 
-		ec = be64_to_cpu(ech->ec);
+		ec = be64_to_cpu(si->ech->ec);
 		if (ec > UBI_MAX_ERASECOUNTER) {
 			/*
 			 * Erase counter overflow. The EC headers have 64 bits
@@ -810,14 +819,14 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum
 			 */
 			ubi_err("erase counter overflow, max is %d",
 				UBI_MAX_ERASECOUNTER);
-			ubi_dbg_dump_ec_hdr(ech);
+			ubi_dbg_dump_ec_hdr(si->ech);
 			return -EINVAL;
 		}
 	}
 
 	/* OK, we've done with the EC header, let's look at the VID header */
 
-	err = ubi_io_read_vid_hdr(ubi, pnum, vidh, 0);
+	err = ubi_io_check_vid_hdr(ubi, pnum, si->vidh, 0);
 	if (err < 0)
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
@@ -837,12 +846,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum
 		goto adjust_mean_ec;
 	}
 
-	vol_id = be32_to_cpu(vidh->vol_id);
+	vol_id = be32_to_cpu(si->vidh->vol_id);
 	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
-		int lnum = be32_to_cpu(vidh->lnum);
+		int lnum = be32_to_cpu(si->vidh->lnum);
 
 		/* Unsupported internal volume */
-		switch (vidh->compat) {
+		switch (si->vidh->compat) {
 		case UBI_COMPAT_DELETE:
 			ubi_msg("\"delete\" compatible internal volume %d:%d"
 				" found, remove it", vol_id, lnum);
@@ -875,7 +884,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si, int pnum
 	}
 
 	/* Both UBI headers seem to be fine */
-	err = ubi_scan_add_used(ubi, si, pnum, ec, vidh, bitflips);
+	err = ubi_scan_add_used(ubi, si, pnum, ec, si->vidh, bitflips);
 	if (err)
 		return err;
 
@@ -918,14 +927,21 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	si->volumes = RB_ROOT;
 	si->is_empty = 1;
 
-	err = -ENOMEM;
-	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
-	if (!ech)
+	/*
+	 * During scanning we read EC and VID headers at one go in to the
+	 * @si->read_buf, and then check EC and VID header. This must be faster
+	 * than doing 2 small read operations.
+	 */
+	si->read_len = ubi->vid_hdr_offset + UBI_VID_HDR_SIZE;
+	si->read_len = ALIGN(si->read_len, ubi->min_io_size);
+	si->read_buf = kmalloc(si->read_len, GFP_KERNEL);
+	if (!si->read_buf) {
+		err = -ENOMEM;
 		goto out_si;
+	}
 
-	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
-	if (!vidh)
-		goto out_ech;
+	si->ech = si->read_buf;
+	si->vidh = si->read_buf + ubi->vid_hdr_offset;
 
 	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
 		cond_resched();
@@ -933,7 +949,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 		dbg_msg("process PEB %d", pnum);
 		err = process_eb(ubi, si, pnum);
 		if (err < 0)
-			goto out_vidh;
+			goto out_si;
 	}
 
 	dbg_msg("scanning is finished");
@@ -974,18 +990,11 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	if (err) {
 		if (err > 0)
 			err = -EINVAL;
-		goto out_vidh;
+		goto out_si;
 	}
 
-	ubi_free_vid_hdr(ubi, vidh);
-	kfree(ech);
-
 	return si;
 
-out_vidh:
-	ubi_free_vid_hdr(ubi, vidh);
-out_ech:
-	kfree(ech);
 out_si:
 	ubi_scan_destroy_si(si);
 	return ERR_PTR(err);
@@ -1073,6 +1082,7 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 		}
 	}
 
+	kfree(si->read_buf);
 	kfree(si);
 }
 
@@ -1221,7 +1231,7 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 
 			last_seb = seb;
 
-			err = ubi_io_read_vid_hdr(ubi, seb->pnum, vidh, 1);
+			err = ubi_io_read_vid_hdr(ubi, seb->pnum, si->vidh, 1);
 			if (err && err != UBI_IO_BITFLIPS) {
 				ubi_err("VID header is not OK (%d)", err);
 				if (err > 0)
@@ -1229,44 +1239,44 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 				return err;
 			}
 
-			vol_type = vidh->vol_type == UBI_VID_DYNAMIC ?
+			vol_type = si->vidh->vol_type == UBI_VID_DYNAMIC ?
 				   UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
 			if (sv->vol_type != vol_type) {
 				ubi_err("bad vol_type");
 				goto bad_vid_hdr;
 			}
 
-			if (seb->sqnum != be64_to_cpu(vidh->sqnum)) {
+			if (seb->sqnum != be64_to_cpu(si->vidh->sqnum)) {
 				ubi_err("bad sqnum %llu", seb->sqnum);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->vol_id != be32_to_cpu(vidh->vol_id)) {
+			if (sv->vol_id != be32_to_cpu(si->vidh->vol_id)) {
 				ubi_err("bad vol_id %d", sv->vol_id);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->compat != vidh->compat) {
-				ubi_err("bad compat %d", vidh->compat);
+			if (sv->compat != si->vidh->compat) {
+				ubi_err("bad compat %d", si->vidh->compat);
 				goto bad_vid_hdr;
 			}
 
-			if (seb->lnum != be32_to_cpu(vidh->lnum)) {
+			if (seb->lnum != be32_to_cpu(si->vidh->lnum)) {
 				ubi_err("bad lnum %d", seb->lnum);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->used_ebs != be32_to_cpu(vidh->used_ebs)) {
+			if (sv->used_ebs != be32_to_cpu(si->vidh->used_ebs)) {
 				ubi_err("bad used_ebs %d", sv->used_ebs);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->data_pad != be32_to_cpu(vidh->data_pad)) {
+			if (sv->data_pad != be32_to_cpu(si->vidh->data_pad)) {
 				ubi_err("bad data_pad %d", sv->data_pad);
 				goto bad_vid_hdr;
 			}
 
-			if (seb->leb_ver != be32_to_cpu(vidh->leb_ver)) {
+			if (seb->leb_ver != be32_to_cpu(si->vidh->leb_ver)) {
 				ubi_err("bad leb_ver %u", seb->leb_ver);
 				goto bad_vid_hdr;
 			}
@@ -1275,12 +1285,12 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 		if (!last_seb)
 			continue;
 
-		if (sv->highest_lnum != be32_to_cpu(vidh->lnum)) {
+		if (sv->highest_lnum != be32_to_cpu(si->vidh->lnum)) {
 			ubi_err("bad highest_lnum %d", sv->highest_lnum);
 			goto bad_vid_hdr;
 		}
 
-		if (sv->last_data_size != be32_to_cpu(vidh->data_size)) {
+		if (sv->last_data_size != be32_to_cpu(si->vidh->data_size)) {
 			ubi_err("bad last_data_size %d", sv->last_data_size);
 			goto bad_vid_hdr;
 		}
@@ -1346,7 +1356,7 @@ bad_sv:
 bad_vid_hdr:
 	ubi_err("bad scanning information about volume %d", sv->vol_id);
 	ubi_dbg_dump_sv(sv);
-	ubi_dbg_dump_vid_hdr(vidh);
+	ubi_dbg_dump_vid_hdr(si->vidh);
 
 out:
 	ubi_dbg_dump_stack();
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 966b9b6..57cf793 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -93,7 +93,7 @@ struct ubi_scan_volume {
  * @erase: list of physical eraseblocks which have to be erased
  * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
  * @bad_peb_count: count of bad physical eraseblocks
- * those belonging to "preserve"-compatible internal volumes)
+ *                 those belonging to "preserve"-compatible internal volumes)
  * @vols_found: number of volumes found during scanning
  * @highest_vol_id: highest volume ID
  * @alien_peb_count: count of physical eraseblocks in the @alien list
@@ -104,6 +104,11 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
+ * @read_buf: temporary buffer where the EC and VID headers are read during
+ *            scanning
+ * @ech: points to the beginning of the EC header in @buf
+ * @vidh: points to the beginning of the VID header in @buf
+ * @read_len: how much is read from each eraseblock during scanning
  *
  * This data structure contains the result of scanning and may be used by other
  * UBI units to build final UBI data structures, further error-recovery and so
@@ -126,6 +131,10 @@ struct ubi_scan_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
+	void *read_buf;
+	struct ubi_ec_hdr *ech;
+	struct ubi_vid_hdr *vidh;
+	int read_len;
 };
 
 struct ubi_device;
-- 
1.5.4.1


--=-n9JjQW+f1JH0z8PJKQry--
