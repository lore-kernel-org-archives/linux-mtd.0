Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UWS0e-0002HS-Hh
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2013 13:51:21 +0000
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
 by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3SDpH2T017799
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2013 08:51:18 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
 by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3SDpEas008206
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2013 08:51:16 -0500
From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: optimize vid-header IO read checks
Date: Sun, 28 Apr 2013 19:21:09 +0530
Message-ID: <1367157069-18994-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Gupta, Pekon" <pekon@ti.com>

This patch is extension of earlier patch
	'UBI: optimize erase-header IO read checksUBI'

During mounting of UBI device, ec_hdr and vid_hdr of all PEB are scanned.
This patch tries to reduce the PEB scan time, by optimizing ubi_io_read_vid_hdr
based on following analysis.
--------------------------------------------------------------------------
EC_HDR	VID_HDR	CONCLUSION		NEXT STEP
--------------------------------------------------------------------------
valid	valid	PEB contains data	map PEB to corresponding LEB
valid	blank	PEB is free		attach to free list
valid	invalid	PEB may contain data	try recovering data

invalid valid	PEB may contain data	try recovering data
invalid blank	PEB is free[1]		schedule for erasure
invalid invalid	underministic		schedule for erasure
--------------------------------------------------------------------------

EC_HDR or VID_HDR may read 'invalid' due to following reasons:
(a) contains non-UBI data.
(b) block is completely erased.
(b) header corrupted due to power-failure during program or erase operation.
(c) header corrupted due to bitflips after program or erase operation.

Signed-off-by: Gupta, Pekon <pekon@ti.com>
---
 drivers/mtd/ubi/io.c | 110 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 0b9b0af..1446137 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -532,7 +532,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
 	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
-	    err1 == UBI_IO_FF) {
+	    err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
 		struct ubi_ec_hdr ec_hdr;
 
 		err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
@@ -829,7 +829,6 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 {
 	int err;
 	uint32_t crc;
-
 	dbg_io("write EC header to PEB %d", pnum);
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
@@ -998,60 +997,87 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			  ubi->vid_hdr_alsize);
-	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
-		return read_err;
-
-	magic = be32_to_cpu(vid_hdr->magic);
-	if (magic != UBI_VID_HDR_MAGIC) {
-		if (mtd_is_eccerr(read_err))
+	switch (read_err) {
+	case -EBADMSG:
+		/* un-correctable bit-flips detected
+		 * Case-1: hdr_crc != crc(vid_hdr)
+		 *	uncorrectable bit-flips detected within header region.
+		 *	header data cannot be trusted.
+		 * Case-2: hdr_crc == crc(vid_hdr)
+		 *	uncorrectable bit-flip do not effect header region.
+		 *	header data can be parsed.
+		 */
+		crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
+		hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
+		if (hdr_crc == crc)
+			goto good_vid_hdr;
+		else
 			return UBI_IO_BAD_HDR_EBADMSG;
+		break;
 
-		if (ubi_check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
+	case 0:
+	case UBI_IO_BITFLIPS:
+		/* check whether this is UBI vid-hdr */
+		magic = be32_to_cpu(vid_hdr->magic);
+		if (magic == UBI_VID_HDR_MAGIC) {
+			/* check hdr-crc (data integrity check) */
+			crc = crc32(UBI_CRC32_INIT, vid_hdr,
+						UBI_VID_HDR_SIZE_CRC);
+			hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
+			if (hdr_crc == crc) {
+				goto good_vid_hdr;
+			} else {
+				if (verbose) {
+					ubi_warn("bad vid_hdr CRC at PEB %d",
+									pnum);
+					ubi_dump_vid_hdr(vid_hdr);
+				}
+				ubi_warn("bad vid_hdr CRC at PEB %d", pnum);
+				if (read_err)
+					return UBI_IO_BAD_HDR_EBADMSG;
+				else
+					return UBI_IO_BAD_HDR;
+			}
+
+		/* BUT UNLIKE EC_HDR, we need to explicit check for
+		* vid-hdr(data) == all(0xFF) because vid_hdr is written only
+		* when PEB is mapped to LEB, Thus valid free PEB will still
+		* have blank vid_hdr.
+		*/
+		} else if (ubi_check_pattern(vid_hdr, 0xFF,
+							UBI_VID_HDR_SIZE)) {
 			if (verbose)
-				ubi_warn("no VID header found at PEB %d, only 0xFF bytes",
-					 pnum);
-			dbg_bld("no VID header found at PEB %d, only 0xFF bytes",
-				pnum);
-			if (!read_err)
-				return UBI_IO_FF;
-			else
-				return UBI_IO_FF_BITFLIPS;
-		}
+				ubi_warn("No vid_hdr found at PEB %d", pnum);
+			dbg_bld("No vid_hdr found at PEB %d", pnum);
+			return (read_err) ? UBI_IO_FF_BITFLIPS : UBI_IO_FF;
 
-		if (verbose) {
-			ubi_warn("bad magic number at PEB %d: %08x instead of %08x",
-				 pnum, magic, UBI_VID_HDR_MAGIC);
-			ubi_dump_vid_hdr(vid_hdr);
+		/* its a programmed page, but does not contain UBI vid_hdr */
+		} else {
+			if (verbose) {
+				ubi_warn("invalid vid_hdr at PEB %d", pnum);
+				ubi_dump_vid_hdr(vid_hdr);
+			}
+			dbg_bld("invalid vid_hdr at PEB %d", pnum);
+			return UBI_IO_BAD_HDR_EBADMSG;
 		}
-		dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
-			pnum, magic, UBI_VID_HDR_MAGIC);
-		return UBI_IO_BAD_HDR;
-	}
-
-	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
-	hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
+		break;
 
-	if (hdr_crc != crc) {
-		if (verbose) {
-			ubi_warn("bad CRC at PEB %d, calculated %#08x, read %#08x",
-				 pnum, crc, hdr_crc);
-			ubi_dump_vid_hdr(vid_hdr);
-		}
-		dbg_bld("bad CRC at PEB %d, calculated %#08x, read %#08x",
-			pnum, crc, hdr_crc);
-		if (!read_err)
-			return UBI_IO_BAD_HDR;
-		else
-			return UBI_IO_BAD_HDR_EBADMSG;
+	default:
+		/* -EIO (may be incomplete page reads) */
+		return read_err;
 	}
 
+good_vid_hdr:
 	err = validate_vid_hdr(ubi, vid_hdr);
 	if (err) {
 		ubi_err("validation failed for PEB %d", pnum);
 		return -EINVAL;
 	}
 
-	return read_err ? UBI_IO_BITFLIPS : 0;
+	if (read_err)
+		return UBI_IO_BITFLIPS;
+	else
+		return 0;
 }
 
 /**
-- 
1.8.1
