Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8sgd-0003X5-RF
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 10:15:41 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH 2/4] UBI: introduce a new IO return code
Date: Mon,  3 May 2010 13:13:00 +0300
Message-Id: <1272881582-17196-3-git-send-email-Artem.Bityutskiy@nokia.com>
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

This patch introduces the %UBI_IO_BAD_HDR_READ return code for
the I/O level function. We will use this code in order to distinguish
between "corrupted header possibly because this is non-ubi data" and
"corrupted header possibly because of real data corruption and ECC error".

So far this patch does not introduce any functional change, just a
preparation.

This patch is pased on a patch from
Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/eba.c  |    5 +++--
 drivers/mtd/ubi/io.c   |   42 +++++++++++++++++++++++-------------------
 drivers/mtd/ubi/scan.c |    4 ++--
 drivers/mtd/ubi/ubi.h  |    3 +++
 4 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8e82267..b582671 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -418,7 +418,8 @@ retry:
 				 * may try to recover data. FIXME: but this is
 				 * not implemented.
 				 */
-				if (err == UBI_IO_BAD_HDR) {
+				if (err == UBI_IO_BAD_HDR_READ ||
+				    err == UBI_IO_BAD_HDR) {
 					ubi_warn("corrupted VID header at PEB "
 						 "%d, LEB %d:%d", pnum, vol_id,
 						 lnum);
@@ -962,7 +963,7 @@ write_error:
 static int is_error_sane(int err)
 {
 	if (err == -EIO || err == -ENOMEM || err == UBI_IO_BAD_HDR ||
-	    err == -ETIMEDOUT)
+	    err == UBI_IO_BAD_HDR_READ || err == -ETIMEDOUT)
 		return 0;
 	return 1;
 }
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 6f5b087..abae9af 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -515,7 +515,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * In this case we probably anyway have garbage in this PEB.
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-	if (err1 == UBI_IO_BAD_HDR)
+	if (err1 == UBI_IO_BAD_HDR_READ || err1 == UBI_IO_BAD_HDR)
 		/*
 		 * The VID header is corrupted, so we can safely erase this
 		 * PEB and not afraid that it will be treated as a valid PEB in
@@ -736,23 +736,21 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		 * header is still OK, we just report this as there was a
 		 * bit-flip.
 		 */
-		read_err = err;
+		if (err == -EBADMSG)
+			read_err = UBI_IO_BAD_HDR_READ;
 	}
 
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
+		if (read_err)
+			return read_err;
+
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
+		if (check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)) {
 			/* The physical eraseblock is supposedly empty */
 			if (verbose)
 				ubi_warn("no EC header found at PEB %d, "
@@ -788,7 +786,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad EC header CRC at PEB %d, calculated "
 				"%#08x, read %#08x", pnum, crc, hdr_crc);
-		return UBI_IO_BAD_HDR;
+		return read_err ?: UBI_IO_BAD_HDR;
 	}
 
 	/* And of course validate what has just been read from the media */
@@ -798,6 +796,10 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		return -EINVAL;
 	}
 
+	/*
+	 * If there was %-EBADMSG, but the header CRC is still OK, report about
+	 * a bit-flip to force scrubbing on this PEB.
+	 */
 	return read_err ? UBI_IO_BITFLIPS : 0;
 }
 
@@ -1008,22 +1010,20 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		 * CRC check-sum and we will identify this. If the VID header is
 		 * still OK, we just report this as there was a bit-flip.
 		 */
-		read_err = err;
+		if (err == -EBADMSG)
+			read_err = UBI_IO_BAD_HDR_READ;
 	}
 
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
+		if (read_err)
+			return read_err;
+
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
+		if (check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
 			/* The physical eraseblock is supposedly free */
 			if (verbose)
 				ubi_warn("no VID header found at PEB %d, "
@@ -1059,7 +1059,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad CRC at PEB %d, calculated %#08x, "
 				"read %#08x", pnum, crc, hdr_crc);
-		return UBI_IO_BAD_HDR;
+		return read_err ?: UBI_IO_BAD_HDR;
 	}
 
 	/* Validate the VID header that we have just read */
@@ -1069,6 +1069,10 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EINVAL;
 	}
 
+	/*
+	 * If there was a read error (%-EBADMSG), but the header CRC is still
+	 * OK, report about a bit-flip to force scrubbing on this PEB.
+	 */
 	return read_err ? UBI_IO_BITFLIPS : 0;
 }
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index f52adca..65d03b5 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -745,7 +745,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	else if (err == UBI_IO_PEB_EMPTY)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_HDR) {
+	else if (err = UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
@@ -813,7 +813,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_BAD_HDR ||
+	else if (err == UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR ||
 		 (err == UBI_IO_PEB_FREE && ec_corr)) {
 		/* VID header is corrupted */
 		err = add_to_list(si, pnum, ec, &si->corr);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 539b3f6..0359e0c 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -90,12 +90,15 @@
  * UBI_IO_PEB_FREE: the physical eraseblock is free, i.e. it contains only a
  *                  valid erase counter header, and the rest are %0xFF bytes
  * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
+ * UBI_IO_BAD_HDR_READ: the same as %UBI_IO_BAD_HDR, but also there was a read
+ * 			error reported by the flash driver
  * UBI_IO_BITFLIPS: bit-flips were detected and corrected
  */
 enum {
 	UBI_IO_PEB_EMPTY = 1,
 	UBI_IO_PEB_FREE,
 	UBI_IO_BAD_HDR,
+	UBI_IO_BAD_HDR_READ,
 	UBI_IO_BITFLIPS
 };
 
-- 
1.6.6.1
