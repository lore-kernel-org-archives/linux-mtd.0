Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXUL-0001Cw-Jb
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:42 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/13] UBI: remove duplicate IO error codes
Date: Mon,  6 Sep 2010 11:54:48 +0300
Message-Id: <1283763293-1882-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
References: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The 'UBI_IO_PEB_EMPTY' and 'UBI_IO_PEB_FREE' are essentially the same
and mean that there are only 0xFF bytes instead of headers. Simplify
UBI a little by turning them into a single 'UBI_IO_FF' error code.

Also, stop maintaining commentaries in 'ubi_io_read_vid_hdr()' which are
almost identical to commentaries in 'ubi_io_read_ec_hdr()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c   |   45 +++++++--------------------------------------
 drivers/mtd/ubi/scan.c |    6 +++---
 drivers/mtd/ubi/ubi.h  |    8 ++------
 drivers/mtd/ubi/wl.c   |    2 +-
 4 files changed, 13 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 05774da..1677a21 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -714,7 +714,7 @@ bad:
  * o %UBI_IO_BAD_HDR if the erase counter header is corrupted (a CRC error);
  * o %UBI_IO_BAD_HDR_EBADMSG is the same as %UBI_IO_BAD_HDR, but there also was
  *   a data integrity error (uncorrectable ECC error in case of NAND);
- * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
+ * o %UBI_IO_FF if only 0xFF bytes were read (the PEB is supposedly empty)
  * o a negative error code in case of failure.
  */
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
@@ -762,7 +762,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			else if (UBI_IO_DEBUG)
 				dbg_msg("no EC header found at PEB %d, "
 					"only 0xFF bytes", pnum);
-			return UBI_IO_PEB_EMPTY;
+			return UBI_IO_FF;
 		}
 
 		/*
@@ -977,19 +977,11 @@ bad:
  *
  * This function reads the volume identifier header from physical eraseblock
  * @pnum and stores it in @vid_hdr. It also checks CRC checksum of the read
- * volume identifier header. The following codes may be returned:
+ * volume identifier header. The error codes are the same as in
+ * 'ubi_io_read_ec_hdr()'.
  *
- * o %0 if the CRC checksum is correct and the header was successfully read;
- * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
- *   and corrected by the flash driver; this is harmless but may indicate that
- *   this eraseblock may become bad soon;
- * o %UBI_IO_BAD_HDR if the volume identifier header is corrupted (a CRC
- *   error detected);
- * o %UBI_IO_BAD_HDR_EBADMSG is the same as %UBI_IO_BAD_HDR, but there also was
- *   a data integrity error (uncorrectable ECC error in case of NAND);
- * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
- *   header there);
- * o a negative error code in case of failure.
+ * Note, the implementation of this function is also very similar to
+ * 'ubi_io_read_ec_hdr()', so refer commentaries in 'ubi_io_read_ec_hdr()'.
  */
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose)
@@ -1008,15 +1000,6 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
 			return err;
 
-		/*
-		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported a data integrity error
-		 * (uncorrectable ECC error in case of NAND). The former is
-		 * harmless, the later may mean that the read data is
-		 * corrupted. But we have a CRC check-sum and we will detect
-		 * this. If the VID header is still OK, we just report this as
-		 * there was a bit-flip, to force scrubbing.
-		 */
 		if (err == -EBADMSG)
 			read_err = UBI_IO_BAD_HDR_EBADMSG;
 	}
@@ -1026,25 +1009,16 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		if (read_err)
 			return read_err;
 
-		/*
-		 * If we have read all 0xFF bytes, the VID header probably does
-		 * not exist and the physical eraseblock is assumed to be free.
-		 */
 		if (check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
-			/* The physical eraseblock is supposedly free */
 			if (verbose)
 				ubi_warn("no VID header found at PEB %d, "
 					 "only 0xFF bytes", pnum);
 			else if (UBI_IO_DEBUG)
 				dbg_msg("no VID header found at PEB %d, "
 					"only 0xFF bytes", pnum);
-			return UBI_IO_PEB_FREE;
+			return UBI_IO_FF;
 		}
 
-		/*
-		 * This is not a valid VID header, and these are not 0xFF
-		 * bytes. Report that the header is corrupted.
-		 */
 		if (verbose) {
 			ubi_warn("bad magic number at PEB %d: %08x instead of "
 				 "%08x", pnum, magic, UBI_VID_HDR_MAGIC);
@@ -1069,17 +1043,12 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		return read_err ?: UBI_IO_BAD_HDR;
 	}
 
-	/* Validate the VID header that we have just read */
 	err = validate_vid_hdr(ubi, vid_hdr);
 	if (err) {
 		ubi_err("validation failed for PEB %d", pnum);
 		return -EINVAL;
 	}
 
-	/*
-	 * If there was a read error (%-EBADMSG), but the header CRC is still
-	 * OK, report about a bit-flip to force scrubbing on this PEB.
-	 */
 	return read_err ? UBI_IO_BITFLIPS : 0;
 }
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 7e7c56d..37cb18f 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -748,7 +748,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_PEB_EMPTY)
+	else if (err == UBI_IO_FF)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
 	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR) {
 		/*
@@ -817,7 +817,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
 	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR ||
-		 (err == UBI_IO_PEB_FREE && ec_corr)) {
+		 (err == UBI_IO_FF && ec_corr)) {
 		/* VID header is corrupted */
 		if (err == UBI_IO_BAD_HDR_EBADMSG ||
 		    ec_corr == UBI_IO_BAD_HDR_EBADMSG)
@@ -826,7 +826,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		if (err)
 			return err;
 		goto adjust_mean_ec;
-	} else if (err == UBI_IO_PEB_FREE) {
+	} else if (err == UBI_IO_FF) {
 		/* No VID header - the physical eraseblock is free */
 		err = add_to_list(si, pnum, ec, &si->free);
 		if (err)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 24a7c76..774bdca 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -85,10 +85,7 @@
 /*
  * Error codes returned by the I/O sub-system.
  *
- * UBI_IO_PEB_EMPTY: the physical eraseblock is empty, i.e. it contains only
- *                   %0xFF bytes
- * UBI_IO_PEB_FREE: the physical eraseblock is free, i.e. it contains only a
- *                  valid erase counter header, and the rest are %0xFF bytes
+ * UBI_IO_FF: the read region of flash contains only 0xFFs
  * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
  * UBI_IO_BAD_HDR_EBADMSG: the same as %UBI_IO_BAD_HDR, but also there was a
  *                         data integrity error reported by the MTD driver
@@ -96,8 +93,7 @@
  * UBI_IO_BITFLIPS: bit-flips were detected and corrected
  */
 enum {
-	UBI_IO_PEB_EMPTY = 1,
-	UBI_IO_PEB_FREE,
+	UBI_IO_FF = 1,
 	UBI_IO_BAD_HDR,
 	UBI_IO_BAD_HDR_EBADMSG,
 	UBI_IO_BITFLIPS
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 97a4356..a9e7c9e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -745,7 +745,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
 	if (err && err != UBI_IO_BITFLIPS) {
-		if (err == UBI_IO_PEB_FREE) {
+		if (err == UBI_IO_FF) {
 			/*
 			 * We are trying to move PEB without a VID header. UBI
 			 * always write VID headers shortly after the PEB was
-- 
1.7.1.1
