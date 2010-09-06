Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTq-0000Va-8q
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/13] UBI: handle bit-flips when no header found
Date: Mon,  6 Sep 2010 11:54:49 +0300
Message-Id: <1283763293-1882-6-git-send-email-dedekind1@gmail.com>
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

Currently UBI has one small flaw - when we read EC or VID header, but find only
0xFF bytes, we return UBI_IO_FF and do not report whether we had bit-flips or
not. In case of the VID header, the scanning code adds this PEB to the free list,
even though there were bit-flips.

Imagine the following situation: we start writing VID header to a PEB and have a
power cut, so the PEB becomes unstable. When we scan and read the PEB, we get
a bit-flip. Currently, UBI would just ignore this and treat the PEB as free. This
patch changes UBI behavior and now UBI will schedule this PEB for erasure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c   |   54 ++++++++++++++++++++++++++---------------------
 drivers/mtd/ubi/scan.c |    4 +-
 drivers/mtd/ubi/ubi.h  |   10 ++++++++-
 drivers/mtd/ubi/wl.c   |   10 ++++++++
 4 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 1677a21..b762524 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -720,16 +720,16 @@ bad:
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose)
 {
-	int err, read_err = 0;
+	int err, read_err;
 	uint32_t crc, magic, hdr_crc;
 
 	dbg_io("read EC header from PEB %d", pnum);
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
-	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
-	if (err) {
-		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
-			return err;
+	read_err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
+	if (read_err) {
+		if (read_err != UBI_IO_BITFLIPS && read_err != -EBADMSG)
+			return read_err;
 
 		/*
 		 * We read all the data, but either a correctable bit-flip
@@ -740,14 +740,12 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		 * this. If the EC header is still OK, we just report this as
 		 * there was a bit-flip, to force scrubbing.
 		 */
-		if (err == -EBADMSG)
-			read_err = UBI_IO_BAD_HDR_EBADMSG;
 	}
 
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
-		if (read_err)
-			return read_err;
+		if (read_err == -EBADMSG)
+			return UBI_IO_BAD_HDR_EBADMSG;
 
 		/*
 		 * The magic field is wrong. Let's check if we have read all
@@ -762,7 +760,10 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			else if (UBI_IO_DEBUG)
 				dbg_msg("no EC header found at PEB %d, "
 					"only 0xFF bytes", pnum);
-			return UBI_IO_FF;
+			if (!read_err)
+				return UBI_IO_FF;
+			else
+				return UBI_IO_FF_BITFLIPS;
 		}
 
 		/*
@@ -790,7 +791,11 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad EC header CRC at PEB %d, calculated "
 				"%#08x, read %#08x", pnum, crc, hdr_crc);
-		return read_err ?: UBI_IO_BAD_HDR;
+
+		if (!read_err)
+			return UBI_IO_BAD_HDR;
+		else
+			return UBI_IO_BAD_HDR_EBADMSG;
 	}
 
 	/* And of course validate what has just been read from the media */
@@ -986,7 +991,7 @@ bad:
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose)
 {
-	int err, read_err = 0;
+	int err, read_err;
 	uint32_t crc, magic, hdr_crc;
 	void *p;
 
@@ -994,20 +999,15 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
-	err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
+	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			  ubi->vid_hdr_alsize);
-	if (err) {
-		if (err != UBI_IO_BITFLIPS && err != -EBADMSG)
-			return err;
-
-		if (err == -EBADMSG)
-			read_err = UBI_IO_BAD_HDR_EBADMSG;
-	}
+	if (read_err && read_err != UBI_IO_BITFLIPS && read_err != -EBADMSG)
+		return read_err;
 
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
-		if (read_err)
-			return read_err;
+		if (read_err == -EBADMSG)
+			return UBI_IO_BAD_HDR_EBADMSG;
 
 		if (check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
 			if (verbose)
@@ -1016,7 +1016,10 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			else if (UBI_IO_DEBUG)
 				dbg_msg("no VID header found at PEB %d, "
 					"only 0xFF bytes", pnum);
-			return UBI_IO_FF;
+			if (!read_err)
+				return UBI_IO_FF;
+			else
+				return UBI_IO_FF_BITFLIPS;
 		}
 
 		if (verbose) {
@@ -1040,7 +1043,10 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		} else if (UBI_IO_DEBUG)
 			dbg_msg("bad CRC at PEB %d, calculated %#08x, "
 				"read %#08x", pnum, crc, hdr_crc);
-		return read_err ?: UBI_IO_BAD_HDR;
+		if (!read_err)
+			return UBI_IO_BAD_HDR;
+		else
+			return UBI_IO_BAD_HDR_EBADMSG;
 	}
 
 	err = validate_vid_hdr(ubi, vid_hdr);
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 37cb18f..6f90807 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -748,7 +748,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_FF)
+	else if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
 	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR) {
 		/*
@@ -817,7 +817,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
 	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR ||
-		 (err == UBI_IO_FF && ec_corr)) {
+		 (err == UBI_IO_FF && ec_corr) || err == UBI_IO_FF_BITFLIPS) {
 		/* VID header is corrupted */
 		if (err == UBI_IO_BAD_HDR_EBADMSG ||
 		    ec_corr == UBI_IO_BAD_HDR_EBADMSG)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 774bdca..1099077 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -86,17 +86,25 @@
  * Error codes returned by the I/O sub-system.
  *
  * UBI_IO_FF: the read region of flash contains only 0xFFs
+ * UBI_IO_FF_BITFLIPS: the same as %UBI_IO_FF, but also also there was a data
+ *                     integrity error reported by the MTD driver
+ *                     (uncorrectable ECC error in case of NAND)
  * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
  * UBI_IO_BAD_HDR_EBADMSG: the same as %UBI_IO_BAD_HDR, but also there was a
  *                         data integrity error reported by the MTD driver
  *                         (uncorrectable ECC error in case of NAND)
  * UBI_IO_BITFLIPS: bit-flips were detected and corrected
+ *
+ * Note, it is probably better to have bit-flip and ebadmsg as flags which can
+ * be or'ed with other error code. But this is a big change because there are
+ * may callers, so it does not worth the risk of introducing a bug
  */
 enum {
 	UBI_IO_FF = 1,
+	UBI_IO_FF_BITFLIPS,
 	UBI_IO_BAD_HDR,
 	UBI_IO_BAD_HDR_EBADMSG,
-	UBI_IO_BITFLIPS
+	UBI_IO_BITFLIPS,
 };
 
 /*
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a9e7c9e..605ecb1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -759,6 +759,16 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			dbg_wl("PEB %d has no VID header", e1->pnum);
 			protect = 1;
 			goto out_not_moved;
+		} else if (err == UBI_IO_FF_BITFLIPS) {
+			/*
+			 * The same situation as %UBI_IO_FF, but bit-flips were
+			 * detected. It is better to schedule this PEB for
+			 * scrubbing.
+			 */
+			dbg_wl("PEB %d has no VID header but has bit-flips",
+			       e1->pnum);
+			scrubbing = 1;
+			goto out_not_moved;
 		}
 
 		ubi_err("error %d while reading VID header from PEB %d",
-- 
1.7.1.1
