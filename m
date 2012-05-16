Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ6-00028P-IK
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/9] UBI: clean-up terminology for self-checks in io.c
Date: Wed, 16 May 2012 18:55:58 +0300
Message-Id: <1337183760-24417-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
References: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We have the "sefl-check" feature in UBI, but for historical reasons many
corresponding functions and commentaries in the code use term "paranoid check"
instead. Let's clean this up and use "self-check" everywhere.

This patch renames functions, amends comments and messages. It touches only the
io.c file.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/io.c |   76 ++++++++++++++++++++++++--------------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c1628fc..6843264 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -91,13 +91,13 @@
 #include <linux/slab.h>
 #include "ubi.h"
 
-static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum);
-static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum);
-static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
-				 const struct ubi_ec_hdr *ec_hdr);
-static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum);
-static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
-				  const struct ubi_vid_hdr *vid_hdr);
+static int self_check_not_bad(const struct ubi_device *ubi, int pnum);
+static int self_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum);
+static int self_check_ec_hdr(const struct ubi_device *ubi, int pnum,
+			     const struct ubi_ec_hdr *ec_hdr);
+static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum);
+static int self_check_vid_hdr(const struct ubi_device *ubi, int pnum,
+			      const struct ubi_vid_hdr *vid_hdr);
 
 /**
  * ubi_io_read - read data from a physical eraseblock.
@@ -134,7 +134,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
 	ubi_assert(len > 0);
 
-	err = paranoid_check_not_bad(ubi, pnum);
+	err = self_check_not_bad(ubi, pnum);
 	if (err)
 		return err;
 
@@ -249,9 +249,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		return -EROFS;
 	}
 
-	/* The below has to be compiled out if paranoid checks are disabled */
-
-	err = paranoid_check_not_bad(ubi, pnum);
+	err = self_check_not_bad(ubi, pnum);
 	if (err)
 		return err;
 
@@ -265,10 +263,10 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 * We write to the data area of the physical eraseblock. Make
 		 * sure it has valid EC and VID headers.
 		 */
-		err = paranoid_check_peb_ec_hdr(ubi, pnum);
+		err = self_check_peb_ec_hdr(ubi, pnum);
 		if (err)
 			return err;
-		err = paranoid_check_peb_vid_hdr(ubi, pnum);
+		err = self_check_peb_vid_hdr(ubi, pnum);
 		if (err)
 			return err;
 	}
@@ -581,7 +579,7 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
-	err = paranoid_check_not_bad(ubi, pnum);
+	err = self_check_not_bad(ubi, pnum);
 	if (err != 0)
 		return err;
 
@@ -866,7 +864,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
 	ec_hdr->hdr_crc = cpu_to_be32(crc);
 
-	err = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
+	err = self_check_ec_hdr(ubi, pnum, ec_hdr);
 	if (err)
 		return err;
 
@@ -1104,7 +1102,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	dbg_io("write VID header to PEB %d", pnum);
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
-	err = paranoid_check_peb_ec_hdr(ubi, pnum);
+	err = self_check_peb_ec_hdr(ubi, pnum);
 	if (err)
 		return err;
 
@@ -1113,7 +1111,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
 	vid_hdr->hdr_crc = cpu_to_be32(crc);
 
-	err = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
+	err = self_check_vid_hdr(ubi, pnum, vid_hdr);
 	if (err)
 		return err;
 
@@ -1124,14 +1122,14 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 }
 
 /**
- * paranoid_check_not_bad - ensure that a physical eraseblock is not bad.
+ * self_check_not_bad - ensure that a physical eraseblock is not bad.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number to check
  *
  * This function returns zero if the physical eraseblock is good, %-EINVAL if
  * it is bad and a negative error code if an error occurred.
  */
-static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
+static int self_check_not_bad(const struct ubi_device *ubi, int pnum)
 {
 	int err;
 
@@ -1142,13 +1140,13 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
 	if (!err)
 		return err;
 
-	ubi_err("paranoid check failed for PEB %d", pnum);
+	ubi_err("self-check failed for PEB %d", pnum);
 	dump_stack();
 	return err > 0 ? -EINVAL : err;
 }
 
 /**
- * paranoid_check_ec_hdr - check if an erase counter header is all right.
+ * self_check_ec_hdr - check if an erase counter header is all right.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number the erase counter header belongs to
  * @ec_hdr: the erase counter header to check
@@ -1156,8 +1154,8 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
  * This function returns zero if the erase counter header contains valid
  * values, and %-EINVAL if not.
  */
-static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
-				 const struct ubi_ec_hdr *ec_hdr)
+static int self_check_ec_hdr(const struct ubi_device *ubi, int pnum,
+			     const struct ubi_ec_hdr *ec_hdr)
 {
 	int err;
 	uint32_t magic;
@@ -1174,7 +1172,7 @@ static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 
 	err = validate_ec_hdr(ubi, ec_hdr);
 	if (err) {
-		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("self-check failed for PEB %d", pnum);
 		goto fail;
 	}
 
@@ -1187,14 +1185,14 @@ fail:
 }
 
 /**
- * paranoid_check_peb_ec_hdr - check erase counter header.
+ * self_check_peb_ec_hdr - check erase counter header.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
  *
  * This function returns zero if the erase counter header is all right and and
  * a negative error code if not or if an error occurred.
  */
-static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
+static int self_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 {
 	int err;
 	uint32_t crc, hdr_crc;
@@ -1215,14 +1213,14 @@ static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 	hdr_crc = be32_to_cpu(ec_hdr->hdr_crc);
 	if (hdr_crc != crc) {
 		ubi_err("bad CRC, calculated %#08x, read %#08x", crc, hdr_crc);
-		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("self-check failed for PEB %d", pnum);
 		ubi_dump_ec_hdr(ec_hdr);
 		dump_stack();
 		err = -EINVAL;
 		goto exit;
 	}
 
-	err = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
+	err = self_check_ec_hdr(ubi, pnum, ec_hdr);
 
 exit:
 	kfree(ec_hdr);
@@ -1230,7 +1228,7 @@ exit:
 }
 
 /**
- * paranoid_check_vid_hdr - check that a volume identifier header is all right.
+ * self_check_vid_hdr - check that a volume identifier header is all right.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number the volume identifier header belongs to
  * @vid_hdr: the volume identifier header to check
@@ -1238,8 +1236,8 @@ exit:
  * This function returns zero if the volume identifier header is all right, and
  * %-EINVAL if not.
  */
-static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
-				  const struct ubi_vid_hdr *vid_hdr)
+static int self_check_vid_hdr(const struct ubi_device *ubi, int pnum,
+			      const struct ubi_vid_hdr *vid_hdr)
 {
 	int err;
 	uint32_t magic;
@@ -1256,14 +1254,14 @@ static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 
 	err = validate_vid_hdr(ubi, vid_hdr);
 	if (err) {
-		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("self-check failed for PEB %d", pnum);
 		goto fail;
 	}
 
 	return err;
 
 fail:
-	ubi_err("paranoid check failed for PEB %d", pnum);
+	ubi_err("self-check failed for PEB %d", pnum);
 	ubi_dump_vid_hdr(vid_hdr);
 	dump_stack();
 	return -EINVAL;
@@ -1271,14 +1269,14 @@ fail:
 }
 
 /**
- * paranoid_check_peb_vid_hdr - check volume identifier header.
+ * self_check_peb_vid_hdr - check volume identifier header.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
  *
  * This function returns zero if the volume identifier header is all right,
  * and a negative error code if not or if an error occurred.
  */
-static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
+static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 {
 	int err;
 	uint32_t crc, hdr_crc;
@@ -1303,14 +1301,14 @@ static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	if (hdr_crc != crc) {
 		ubi_err("bad VID header CRC at PEB %d, calculated %#08x, "
 			"read %#08x", pnum, crc, hdr_crc);
-		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("self-check failed for PEB %d", pnum);
 		ubi_dump_vid_hdr(vid_hdr);
 		dump_stack();
 		err = -EINVAL;
 		goto exit;
 	}
 
-	err = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
+	err = self_check_vid_hdr(ubi, pnum, vid_hdr);
 
 exit:
 	ubi_free_vid_hdr(ubi, vid_hdr);
@@ -1358,7 +1356,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		if (c == c1)
 			continue;
 
-		ubi_err("paranoid check failed for PEB %d:%d, len %d",
+		ubi_err("self-check failed for PEB %d:%d, len %d",
 			pnum, offset, len);
 		ubi_msg("data differ at position %d", i);
 		dump_len = max_t(int, 128, len - i);
@@ -1428,7 +1426,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	return 0;
 
 fail:
-	ubi_err("paranoid check failed for PEB %d", pnum);
+	ubi_err("self-check failed for PEB %d", pnum);
 	ubi_msg("hex dump of the %d-%d region", offset, offset + len);
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
 	err = -EINVAL;
-- 
1.7.10
