Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTDYB-0001ow-GC
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 11:30:33 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Decrease I/O count in ubi_scan
Date: Tue, 21 Jul 2009 13:26:31 +0200
Message-Id: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Merge ec_hdr and vid_hdr read in one ubi_io_read()
This result in a 25% speedup with nandsim, and 6%
speedup on an AT91SAM9263 board with a 200Mo UBI volume.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/ubi/io.c   |   67 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/ubi/scan.c |   35 +++++++++++++------------
 drivers/mtd/ubi/ubi.h  |    4 +++
 3 files changed, 87 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 4e7bcb2..cbb5f5b 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -684,7 +684,6 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose)
 {
 	int err, read_err = 0;
-	uint32_t crc, magic, hdr_crc;
 
 	dbg_io("read EC header from PEB %d", pnum);
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
@@ -705,6 +704,37 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		 */
 		read_err = err;
 	}
+	return ubi_parse_ec_hdr(ubi, pnum, ec_hdr, verbose, read_err);
+}
+
+/**
+ * ubi_parse_ec_hdr - check an erase counter header.
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock to read from
+ * @ec_hdr: a &struct ubi_ec_hdr object where to store the read erase counter
+ * header
+ * @verbose: be verbose if the header is corrupted or was not found
+ * @read_err: error code returned when reading the header
+ *
+ * This function checks CRC checksum of the read erase counter header.
+ * The following codes may be returned:
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver; this is harmless but may indicate that
+ *   this eraseblock may become bad soon (but may be not);
+ * o %UBI_IO_BAD_EC_HDR if the erase counter header is corrupted (a CRC error);
+ * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
+ * o a negative error code in case of failure.
+ */
+int ubi_parse_ec_hdr(struct ubi_device *ubi, int pnum,
+		     struct ubi_ec_hdr *ec_hdr, int verbose, int read_err)
+{
+	int err;
+	uint32_t crc, magic, hdr_crc;
+
+	dbg_io("parse EC header from PEB %d", pnum);
+	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
@@ -954,7 +984,6 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose)
 {
 	int err, read_err = 0;
-	uint32_t crc, magic, hdr_crc;
 	void *p;
 
 	dbg_io("read VID header from PEB %d", pnum);
@@ -978,6 +1007,40 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		read_err = err;
 	}
 
+	return ubi_parse_vid_hdr(ubi, pnum, vid_hdr, verbose, read_err);
+}
+
+/**
+ * ubi_parse_vid_hdr - check a volume identifier header.
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock number to read from
+ * @vid_hdr: &struct ubi_vid_hdr object where to store the read volume
+ * identifier header
+ * @verbose: be verbose if the header is corrupted or wasn't found
+ * @read_err: error code returned when reading the header
+ *
+ * This function checks CRC checksum of the read volume identifier header.
+ * The following codes may be returned:
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver; this is harmless but may indicate that
+ *   this eraseblock may become bad soon;
+ * o %UBI_IO_BAD_VID_HDR if the volume identifier header is corrupted (a CRC
+ *   error detected);
+ * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
+ *   header there);
+ * o a negative error code in case of failure.
+ */
+int ubi_parse_vid_hdr(struct ubi_device *ubi, int pnum,
+		      struct ubi_vid_hdr *vid_hdr, int verbose, int read_err)
+{
+	int err;
+	uint32_t crc, magic, hdr_crc;
+
+	dbg_io("parse VID header from PEB %d", pnum);
+	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
+
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
 		/*
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index db4cf04..8b9f990 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -54,6 +54,7 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
 static struct ubi_vid_hdr *vidh;
+static void *buf;
 
 /**
  * add_to_list - add physical eraseblock to a list.
@@ -719,7 +720,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		      int pnum)
 {
 	long long uninitialized_var(ec);
-	int err, bitflips = 0, vol_id, ec_corr = 0;
+	int read_err, err, bitflips = 0, vol_id, ec_corr = 0;
 
 	dbg_bld("scan PEB %d", pnum);
 
@@ -737,7 +738,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return 0;
 	}
 
-	err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
+	read_err = ubi_io_read(ubi, buf, pnum, 0,
+			       ubi->vid_hdr_aloffset + ubi->vid_hdr_alsize);
+	if (read_err < 0)
+		return read_err;
+
+	err = ubi_parse_ec_hdr(ubi, pnum, ech, 0, read_err);
 	if (err < 0)
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
@@ -797,7 +803,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 
 	/* OK, we've done with the EC header, let's look at the VID header */
 
-	err = ubi_io_read_vid_hdr(ubi, pnum, vidh, 0);
+	err = ubi_parse_vid_hdr(ubi, pnum, vidh, 0, read_err);
 	if (err < 0)
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
@@ -901,13 +907,12 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	si->is_empty = 1;
 
 	err = -ENOMEM;
-	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
-	if (!ech)
+	buf = kzalloc(ubi->vid_hdr_aloffset + ubi->vid_hdr_alsize, GFP_KERNEL);
+	if (!buf)
 		goto out_si;
 
-	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
-	if (!vidh)
-		goto out_ech;
+	ech = buf;
+	vidh = buf + ubi->vid_hdr_aloffset + ubi->vid_hdr_shift;
 
 	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
 		cond_resched();
@@ -915,7 +920,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 		dbg_gen("process PEB %d", pnum);
 		err = process_eb(ubi, si, pnum);
 		if (err < 0)
-			goto out_vidh;
+			goto out_buf;
 	}
 
 	dbg_msg("scanning is finished");
@@ -968,18 +973,14 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	if (err) {
 		if (err > 0)
 			err = -EINVAL;
-		goto out_vidh;
+		goto out_buf;
 	}
-
-	ubi_free_vid_hdr(ubi, vidh);
-	kfree(ech);
+	kfree(buf);
 
 	return si;
 
-out_vidh:
-	ubi_free_vid_hdr(ubi, vidh);
-out_ech:
-	kfree(ech);
+out_buf:
+	kfree(buf);
 out_si:
 	ubi_scan_destroy_si(si);
 	return ERR_PTR(err);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 6a5fe96..1c83fa6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -543,10 +543,14 @@ int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose);
+int ubi_parse_ec_hdr(struct ubi_device *ubi, int pnum,
+		     struct ubi_ec_hdr *ec_hdr, int verbose, int read_err);
 int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_ec_hdr *ec_hdr);
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose);
+int ubi_parse_vid_hdr(struct ubi_device *ubi, int pnum,
+		      struct ubi_vid_hdr *vid_hdr, int verbose, int read_err);
 int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 			 struct ubi_vid_hdr *vid_hdr);
 
-- 
1.6.3.3
