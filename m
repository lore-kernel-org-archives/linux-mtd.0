Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTn-0000PH-AH
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/13] UBI: rename IO error code
Date: Mon,  6 Sep 2010 11:54:47 +0300
Message-Id: <1283763293-1882-4-git-send-email-dedekind1@gmail.com>
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

Rename UBI_IO_BAD_HDR_READ into UBI_IO_BAD_HDR_EBADMSG which is presumably more
self-documenting and readable. Indeed, the '_READ' suffix does not tell much and
even confuses, while '_EBADMSG' tells about uncorrectable ECC error, because we
use -EBADMSG all over the place to represent ECC errors.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/eba.c  |    4 ++--
 drivers/mtd/ubi/io.c   |   33 +++++++++++++++++++--------------
 drivers/mtd/ubi/scan.c |    8 ++++----
 drivers/mtd/ubi/scan.h |    2 +-
 drivers/mtd/ubi/ubi.h  |    7 ++++---
 5 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index fe74749..334865e 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -418,7 +418,7 @@ retry:
 				 * may try to recover data. FIXME: but this is
 				 * not implemented.
 				 */
-				if (err == UBI_IO_BAD_HDR_READ ||
+				if (err == UBI_IO_BAD_HDR_EBADMSG ||
 				    err == UBI_IO_BAD_HDR) {
 					ubi_warn("corrupted VID header at PEB "
 						 "%d, LEB %d:%d", pnum, vol_id,
@@ -963,7 +963,7 @@ write_error:
 static int is_error_sane(int err)
 {
 	if (err == -EIO || err == -ENOMEM || err == UBI_IO_BAD_HDR ||
-	    err == UBI_IO_BAD_HDR_READ || err == -ETIMEDOUT)
+	    err == UBI_IO_BAD_HDR_EBADMSG || err == -ETIMEDOUT)
 		return 0;
 	return 1;
 }
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 332f992..05774da 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -517,7 +517,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * In this case we probably anyway have garbage in this PEB.
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-	if (err1 == UBI_IO_BAD_HDR_READ || err1 == UBI_IO_BAD_HDR)
+	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
 		/*
 		 * The VID header is corrupted, so we can safely erase this
 		 * PEB and not afraid that it will be treated as a valid PEB in
@@ -712,6 +712,8 @@ bad:
  *   and corrected by the flash driver; this is harmless but may indicate that
  *   this eraseblock may become bad soon (but may be not);
  * o %UBI_IO_BAD_HDR if the erase counter header is corrupted (a CRC error);
+ * o %UBI_IO_BAD_HDR_EBADMSG is the same as %UBI_IO_BAD_HDR, but there also was
+ *   a data integrity error (uncorrectable ECC error in case of NAND);
  * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
  * o a negative error code in case of failure.
  */
@@ -731,15 +733,15 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 
 		/*
 		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported about some data integrity error,
-		 * like an ECC error in case of NAND. The former is harmless,
-		 * the later may mean that the read data is corrupted. But we
-		 * have a CRC check-sum and we will detect this. If the EC
-		 * header is still OK, we just report this as there was a
-		 * bit-flip.
+		 * occurred, or MTD reported a data integrity error
+		 * (uncorrectable ECC error in case of NAND). The former is
+		 * harmless, the later may mean that the read data is
+		 * corrupted. But we have a CRC check-sum and we will detect
+		 * this. If the EC header is still OK, we just report this as
+		 * there was a bit-flip, to force scrubbing.
 		 */
 		if (err == -EBADMSG)
-			read_err = UBI_IO_BAD_HDR_READ;
+			read_err = UBI_IO_BAD_HDR_EBADMSG;
 	}
 
 	magic = be32_to_cpu(ec_hdr->magic);
@@ -983,6 +985,8 @@ bad:
  *   this eraseblock may become bad soon;
  * o %UBI_IO_BAD_HDR if the volume identifier header is corrupted (a CRC
  *   error detected);
+ * o %UBI_IO_BAD_HDR_EBADMSG is the same as %UBI_IO_BAD_HDR, but there also was
+ *   a data integrity error (uncorrectable ECC error in case of NAND);
  * o %UBI_IO_PEB_FREE if the physical eraseblock is free (i.e., there is no VID
  *   header there);
  * o a negative error code in case of failure.
@@ -1006,14 +1010,15 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 
 		/*
 		 * We read all the data, but either a correctable bit-flip
-		 * occurred, or MTD reported about some data integrity error,
-		 * like an ECC error in case of NAND. The former is harmless,
-		 * the later may mean the read data is corrupted. But we have a
-		 * CRC check-sum and we will identify this. If the VID header is
-		 * still OK, we just report this as there was a bit-flip.
+		 * occurred, or MTD reported a data integrity error
+		 * (uncorrectable ECC error in case of NAND). The former is
+		 * harmless, the later may mean that the read data is
+		 * corrupted. But we have a CRC check-sum and we will detect
+		 * this. If the VID header is still OK, we just report this as
+		 * there was a bit-flip, to force scrubbing.
 		 */
 		if (err == -EBADMSG)
-			read_err = UBI_IO_BAD_HDR_READ;
+			read_err = UBI_IO_BAD_HDR_EBADMSG;
 	}
 
 	magic = be32_to_cpu(vid_hdr->magic);
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 69b52e9..7e7c56d 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -750,7 +750,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	else if (err == UBI_IO_PEB_EMPTY)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {
+	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR) {
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
@@ -816,11 +816,11 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR ||
+	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR ||
 		 (err == UBI_IO_PEB_FREE && ec_corr)) {
 		/* VID header is corrupted */
-		if (err == UBI_IO_BAD_HDR_READ ||
-		    ec_corr == UBI_IO_BAD_HDR_READ)
+		if (err == UBI_IO_BAD_HDR_EBADMSG ||
+		    ec_corr == UBI_IO_BAD_HDR_EBADMSG)
 			si->read_err_count += 1;
 		err = add_to_list(si, pnum, ec, &si->corr);
 		if (err)
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 2576a8d..0876649 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -93,7 +93,7 @@ struct ubi_scan_volume {
  *         those belonging to "preserve"-compatible internal volumes)
  * @used_peb_count: count of used PEBs
  * @corr_peb_count: count of PEBs in the @corr list
- * @read_err_count: count of PEBs read with error (%UBI_IO_BAD_HDR_READ was
+ * @read_err_count: count of PEBs read with error (%UBI_IO_BAD_HDR_EBADMSG was
  *                  returned)
  * @free_peb_count: count of PEBs in the @free list
  * @erase_peb_count: count of PEBs in the @erase list
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0359e0c..24a7c76 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -90,15 +90,16 @@
  * UBI_IO_PEB_FREE: the physical eraseblock is free, i.e. it contains only a
  *                  valid erase counter header, and the rest are %0xFF bytes
  * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
- * UBI_IO_BAD_HDR_READ: the same as %UBI_IO_BAD_HDR, but also there was a read
- * 			error reported by the flash driver
+ * UBI_IO_BAD_HDR_EBADMSG: the same as %UBI_IO_BAD_HDR, but also there was a
+ *                         data integrity error reported by the MTD driver
+ *                         (uncorrectable ECC error in case of NAND)
  * UBI_IO_BITFLIPS: bit-flips were detected and corrected
  */
 enum {
 	UBI_IO_PEB_EMPTY = 1,
 	UBI_IO_PEB_FREE,
 	UBI_IO_BAD_HDR,
-	UBI_IO_BAD_HDR_READ,
+	UBI_IO_BAD_HDR_EBADMSG,
 	UBI_IO_BITFLIPS
 };
 
-- 
1.7.1.1
