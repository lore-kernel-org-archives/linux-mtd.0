Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UWBB9-0001HT-RF
 for linux-mtd@lists.infradead.org; Sat, 27 Apr 2013 19:53:05 +0000
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
 by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3RJqwqw001764
 for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2013 14:52:58 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
 by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3RJqt6G005472
 for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2013 14:52:56 -0500
From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: UBI: optimize erase-header read checks
Date: Sun, 28 Apr 2013 01:22:43 +0530
Message-ID: <1367092363-5249-1-git-send-email-pekon@ti.com>
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

During mounting of UBI volume, all PEB headers are scanned and checked.
This scanning of PEB header is done
- To re-creating PEB to LEB map table.
- To filter out bad PEB or alien (non-UBI) PEB.
- recover corrupt PEB effected by sudden power-failure.
During this scanning both erase_header and volume_id_header are scanned.
This volume recovery time is critical for some safety use-cases where system
should recover as soon as possible after the fault.

This patch tries to optimize erase-header checks done during scan by:
- re-ordering data checks based on below analysis.
- removing ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)
	(checking of 0xFF in page-data)
	- REASON1: even if first few bytes 'sizeof(ec_hdr)' of page-data are
		0xFF, still it does not guarantee that page is erased | blank.
	- REASON2: As per analysis below, pages with invalid magic-number need
		 to be erased in most of the conditions. Thus explicit checking
		 of 0xFF in page-data can be avoided.

MTD device driver can return following return-code for read access (mtd_read)
--------------------------------------------------------------------------
RETURN_VALUE	REASON					NEXT STEP
--------------------------------------------------------------------------
0		no errors or bit-flips detected		parse data

EUCLEAN		correctable bit-flips detected		parse data & scrub PEB

EBADMSG		uncorrectable bit-flip detected		parse data & scrub PEB

<others>	device error or incomplete data		reject data
--------------------------------------------------------------------------

Parsing the read_data can result in following combinations:
--------------------------------------------------------------------------
                MAGIC
ECC	HDR_CRC	NUMBER	CONCLUSION			NEXT STEP
--------------------------------------------------------------------------
OK	valid	valid*	valid UBI erase_header		parse header
EUCLEAN	valid	valid*	valid UBI erase_header		parse header
EBADMSG	valid	valid*	valid UBI erase_header		parse header

OK	invalid	valid	corrupted UBI erase_header	depends on vid_hdr
EUCLEAN	invalid	valid	corrupted UBI erase_header	depends on vid_hdr
EBADMSG invalid	--	undeterministic_data**		schedule for erase

OK	invalid	invalid	undeterministic_data**		schedule for erase
EUCLEAN	invalid	invalid	undeterministic_data**		schedule for erase
EBADMSG invalid	invalid	undeterministic_data**		schedule for erase
--------------------------------------------------------------------------

where
'valid*': As hdr_crc covers magic-number field so matching of hdr_crc
	implicitely indicates matching of magic=number.

underministic_data**: page-data can be any of the following
	(a) programmed page (non-UBI)
	(b) programmed page (all 0xFF
	(c) erased page	without bit-flips
	(d) erased page	with bit-flips
	(d) valid UBI erase_header with un-recoverable bit-flips corrupting
		erase-header content.

Signed-off-by: Gupta, Pekon <pekon@ti.com>
---
 drivers/mtd/ubi/attach.c |  10 ++++
 drivers/mtd/ubi/io.c     | 126 +++++++++++++++++++----------------------------
 2 files changed, 62 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c071d41..f6a8d9e 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -848,6 +848,16 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		return add_to_list(ai, pnum, UBI_UNKNOWN, UBI_UNKNOWN,
 				   UBI_UNKNOWN, 1, &ai->erase);
 	case UBI_IO_BAD_HDR_EBADMSG:
+		/* un=recoverable erase-header
+ 		* unknown erase-count: can reset to mean erase-count after erase
+ 		* unknown image_seq: cannot determine if PEB was programmed
+ 		* unknown version: cannot determine UBI protocol to use
+ 		* So no point in checking vid_hdr, schedule this PEB for erase.
+ 		*/
+		ai->empty_peb_count += 1;
+		return add_to_list(ai, pnum, UBI_UNKNOWN, UBI_UNKNOWN,
+				   UBI_UNKNOWN, 1, &ai->erase);
+
 	case UBI_IO_BAD_HDR:
 		/*
 		 * We have to also look at the VID header, possibly it is not
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index bf79def..0b9b0af 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -537,7 +537,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 
 		err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
 		if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
-		    err1 == UBI_IO_FF)
+		    err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS)
 			/*
 			 * Both VID and EC headers are corrupted, so we can
 			 * safely erase this PEB and not afraid that it will be
@@ -741,93 +741,71 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose)
 {
 	int err, read_err;
-	uint32_t crc, magic, hdr_crc;
+	uint32_t crc, hdr_crc;
 
 	dbg_io("read EC header from PEB %d", pnum);
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
 	read_err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
-	if (read_err) {
-		if (read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
-			return read_err;
-
-		/*
-		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported a data integrity error
-		 * (uncorrectable ECC error in case of NAND). The former is
-		 * harmless, the later may mean that the read data is
-		 * corrupted. But we have a CRC check-sum and we will detect
-		 * this. If the EC header is still OK, we just report this as
-		 * there was a bit-flip, to force scrubbing.
-		 */
-	}
-
-	magic = be32_to_cpu(ec_hdr->magic);
-	if (magic != UBI_EC_HDR_MAGIC) {
-		if (mtd_is_eccerr(read_err))
-			return UBI_IO_BAD_HDR_EBADMSG;
-
-		/*
-		 * The magic field is wrong. Let's check if we have read all
-		 * 0xFF. If yes, this physical eraseblock is assumed to be
-		 * empty.
-		 */
-		if (ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)) {
-			/* The physical eraseblock is supposedly empty */
-			if (verbose)
-				ubi_warn("no EC header found at PEB %d, only 0xFF bytes",
-					 pnum);
-			dbg_bld("no EC header found at PEB %d, only 0xFF bytes",
-				pnum);
-			if (!read_err)
-				return UBI_IO_FF;
-			else
-				return UBI_IO_FF_BITFLIPS;
-		}
-
-		/*
-		 * This is not a valid erase counter header, and these are not
-		 * 0xFF bytes. Report that the header is corrupted.
-		 */
-		if (verbose) {
-			ubi_warn("bad magic number at PEB %d: %08x instead of %08x",
-				 pnum, magic, UBI_EC_HDR_MAGIC);
-			ubi_dump_ec_hdr(ec_hdr);
-		}
-		dbg_bld("bad magic number at PEB %d: %08x instead of %08x",
-			pnum, magic, UBI_EC_HDR_MAGIC);
-		return UBI_IO_BAD_HDR;
-	}
-
-	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
-	hdr_crc = be32_to_cpu(ec_hdr->hdr_crc);
-
-	if (hdr_crc != crc) {
-		if (verbose) {
-			ubi_warn("bad EC header CRC at PEB %d, calculated %#08x, read %#08x",
-				 pnum, crc, hdr_crc);
-			ubi_dump_ec_hdr(ec_hdr);
+	switch (read_err) {
+	case -EBADMSG:
+		/* un-correctable bit-flips detected
+		 * Case-1: uncorrectable bit-flip within erase-header bytes
+		 *	hdr_crc with fail. erase-header underministic.
+		 * Case-2: uncorrectable bit-flip outside erase-header bytes
+		 *	hdr_crc will match. erase-header can be parsed.
+		 * Case-3: 'unstable bit-flip issue'
+		 *	power-failure during programming of erase-header.
+		 *	So even if hdr_crc matches, information may get corrupt
+		 *	later during future reads, like when scubbing this PEB,
+		 *	thereby causing leakage of information into next PEB */
+		crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
+		hdr_crc = be32_to_cpu(ec_hdr->hdr_crc);
+		if (hdr_crc == crc)
+			/* implicitely checks magic-number also */
+			goto good_peb;
+		else
+			/* undeterministic data, magic-number can be corrupt */
+			return  UBI_IO_BAD_HDR_EBADMSG;
+		break;
+	case 0:
+	case UBI_IO_BITFLIPS:
+		crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
+		hdr_crc = be32_to_cpu(ec_hdr->hdr_crc);
+		/* In a stable UBI system, most of PEB will match hdr_crc */
+		if (likely(hdr_crc == crc)) {
+			/* magic-numnber check implicetely covered in CRC */
+			goto good_peb;
+		} else if (UBI_EC_HDR_MAGIC == be32_to_cpu(ec_hdr->magic)) {
+			/* seems vid-hdr */
+			return UBI_IO_BAD_HDR;
+		} else {
+			/* Not a vid-hdr.
+			 * - programmed page with non-UBI data
+			 * - erased blank page
+			*/
+			if (verbose) {
+				ubi_warn("bad magic number in ec-hdr of PEB %d"
+								, pnum);
+				ubi_dump_ec_hdr(ec_hdr);
+			}
+			dbg_bld("bad magic number in ec-hdr of PEB %d", pnum);
+			return  UBI_IO_BAD_HDR_EBADMSG;
 		}
-		dbg_bld("bad EC header CRC at PEB %d, calculated %#08x, read %#08x",
-			pnum, crc, hdr_crc);
+		break;
 
-		if (!read_err)
-			return UBI_IO_BAD_HDR;
-		else
-			return UBI_IO_BAD_HDR_EBADMSG;
+	default:
+		/* -EIO (may be incomplete page reads) */
+		return read_err;
 	}
 
-	/* And of course validate what has just been read from the media */
+good_peb:
 	err = validate_ec_hdr(ubi, ec_hdr);
 	if (err) {
 		ubi_err("validation failed for PEB %d", pnum);
 		return -EINVAL;
 	}
-
-	/*
-	 * If there was %-EBADMSG, but the header CRC is still OK, report about
-	 * a bit-flip to force scrubbing on this PEB.
-	 */
+	 /* UBI_IO_BITFLIPS it will force scrubbing this PEB*/
 	return read_err ? UBI_IO_BITFLIPS : 0;
 }
 
-- 
1.8.1
