Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8sh1-0003Zn-1Y
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 10:16:04 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH 1/4] UBI: simplify IO error codes - part 1
Date: Mon,  3 May 2010 13:12:59 +0300
Message-Id: <1272881582-17196-2-git-send-email-Artem.Bityutskiy@nokia.com>
In-Reply-To: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We do not really need 2 separate error codes for indicating bad VID
and bad EC headers (UBI_IO_BAD_EC_HDR, UBI_IO_BAD_VID_HDR), it is
enough to have only one UBI_IO_BAD_HDR return code.

This patch does not introduce any functional change, only some
code simplification.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/eba.c  |    4 ++--
 drivers/mtd/ubi/io.c   |   14 +++++++-------
 drivers/mtd/ubi/scan.c |    4 ++--
 drivers/mtd/ubi/ubi.h  |    7 ++-----
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 9f87c99..8e82267 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -418,7 +418,7 @@ retry:
 				 * may try to recover data. FIXME: but this is
 				 * not implemented.
 				 */
-				if (err == UBI_IO_BAD_VID_HDR) {
+				if (err == UBI_IO_BAD_HDR) {
 					ubi_warn("corrupted VID header at PEB "
 						 "%d, LEB %d:%d", pnum, vol_id,
 						 lnum);
@@ -961,7 +961,7 @@ write_error:
  */
 static int is_error_sane(int err)
 {
-	if (err == -EIO || err == -ENOMEM || err == UBI_IO_BAD_VID_HDR ||
+	if (err == -EIO || err == -ENOMEM || err == UBI_IO_BAD_HDR ||
 	    err == -ETIMEDOUT)
 		return 0;
 	return 1;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 533b1a4..6f5b087 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -515,7 +515,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * In this case we probably anyway have garbage in this PEB.
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-	if (err1 == UBI_IO_BAD_VID_HDR)
+	if (err1 == UBI_IO_BAD_HDR)
 		/*
 		 * The VID header is corrupted, so we can safely erase this
 		 * PEB and not afraid that it will be treated as a valid PEB in
@@ -709,7 +709,7 @@ bad:
  * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
  *   and corrected by the flash driver; this is harmless but may indicate that
  *   this eraseblock may become bad soon (but may be not);
- * o %UBI_IO_BAD_EC_HDR if the erase counter header is corrupted (a CRC error);
+ * o %UBI_IO_BAD_HDR if the erase counter header is corrupted (a CRC error);
  * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
  * o a negative error code in case of failure.
  */
@@ -774,7 +774,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad magic number at PEB %d: %08x instead of "
 				"%08x", pnum, magic, UBI_EC_HDR_MAGIC);
-		return UBI_IO_BAD_EC_HDR;
+		return UBI_IO_BAD_HDR;
 	}
 
 	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
@@ -788,7 +788,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad EC header CRC at PEB %d, calculated "
 				"%#08x, read %#08x", pnum, crc, hdr_crc);
-		return UBI_IO_BAD_EC_HDR;
+		return UBI_IO_BAD_HDR;
 	}
 
 	/* And of course validate what has just been read from the media */
@@ -977,7 +977,7 @@ bad:
  * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
  *   and corrected by the flash driver; this is harmless but may indicate that
  *   this eraseblock may become bad soon;
- * o %UBI_IO_BAD_VID_HDR if the volume identifier header is corrupted (a CRC
+ * o %UBI_IO_BAD_HDR if the volume identifier header is corrupted (a CRC
  *   error detected);
  * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
  *   header there);
@@ -1045,7 +1045,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad magic number at PEB %d: %08x instead of "
 				"%08x", pnum, magic, UBI_VID_HDR_MAGIC);
-		return UBI_IO_BAD_VID_HDR;
+		return UBI_IO_BAD_HDR;
 	}
 
 	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
@@ -1059,7 +1059,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad CRC at PEB %d, calculated %#08x, "
 				"read %#08x", pnum, crc, hdr_crc);
-		return UBI_IO_BAD_VID_HDR;
+		return UBI_IO_BAD_HDR;
 	}
 
 	/* Validate the VID header that we have just read */
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index dc5f688..f52adca 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -745,7 +745,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	else if (err == UBI_IO_PEB_EMPTY)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_EC_HDR) {
+	else if (err == UBI_IO_BAD_HDR) {
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
@@ -813,7 +813,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_BAD_VID_HDR ||
+	else if (err == UBI_IO_BAD_HDR ||
 		 (err == UBI_IO_PEB_FREE && ec_corr)) {
 		/* VID header is corrupted */
 		err = add_to_list(si, pnum, ec, &si->corr);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a637f02..539b3f6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -89,16 +89,13 @@
  *                   %0xFF bytes
  * UBI_IO_PEB_FREE: the physical eraseblock is free, i.e. it contains only a
  *                  valid erase counter header, and the rest are %0xFF bytes
- * UBI_IO_BAD_EC_HDR: the erase counter header is corrupted (bad magic or CRC)
- * UBI_IO_BAD_VID_HDR: the volume identifier header is corrupted (bad magic or
- *                     CRC)
+ * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
  * UBI_IO_BITFLIPS: bit-flips were detected and corrected
  */
 enum {
 	UBI_IO_PEB_EMPTY = 1,
 	UBI_IO_PEB_FREE,
-	UBI_IO_BAD_EC_HDR,
-	UBI_IO_BAD_VID_HDR,
+	UBI_IO_BAD_HDR,
 	UBI_IO_BITFLIPS
 };
 
-- 
1.6.6.1
