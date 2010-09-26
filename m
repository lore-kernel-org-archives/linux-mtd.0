From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sun, 26 Sep 2010 20:47:28 +0300
Subject: [PATCH] UBI: Matthiew fixes - 1
Message-ID: <mailman.8.1285523920.1886.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Fixes on top of my "preserve corrupted" patch series for issues indicated
by Matthieu Castet.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   43 ++++++++++++++++++++++++++++++-------------
 1 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index ae901cc..30b7102 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -746,15 +746,15 @@ struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
  * @vid_hrd: the (corrupted) VID header of this PEB
  * @pnum: the physical eraseblock number to check
  *
- * This is a helper function which was created to distinguish between VID header
+ * This is a helper function which is used to distinguish between VID header
  * corruptions caused by power cuts and other reasons. If the PEB contains only
  * 0xFF bytes at the data area, the VID header is most probably corrupted
- * because of power cut (%0 is returned in this case). Otherwise, it was
+ * because of a power cut (%0 is returned in this case). Otherwise, it was
  * corrupted for some other reasons (%1 is returned in this case). A negative
  * error code is returned if a read error occurred.
  *
  * If the corruption reason was a power cut, UBI can safely erase this PEB.
- * Otherwise, we cannot do this, because we'd possibly destroy important
+ * Otherwise, it should preserve it to avoid possibly destroying important
  * information.
  */
 static int check_data_ff(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
@@ -912,15 +912,32 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		break;
 	case UBI_IO_BAD_HDR_EBADMSG:
 		if (ec_err == UBI_IO_BAD_HDR_EBADMSG)
-			/* Both EC and VID headers were read with data
-			 * integrity error, probably this is a bad PEB, bit it
-			 * is not marked a bad yet.
+			/*
+			 * Both EC and VID headers are corrupted and were read
+			 * with data integrity error, probably this is a bad
+			 * PEB, bit it is not marked as bad yet. This may also
+			 * be a result of power cut during erasure.
 			 */
 			si->maybe_bad_peb_count += 1;
 	case UBI_IO_BAD_HDR:
-		err = check_data_ff(ubi, vidh, pnum);
+		if (ec_err)
+			/*
+			 * Both headers are corrupted. There is a possibility
+			 * that this a valid UBI PEB which has corresponding
+			 * LEB, but the headers are corrupted. However, it is
+			 * impossible to distinguish it from a PEB which just
+			 * contains garbage because a power cut during erase
+			 * operation. So we just schedule this PEB for erasure.
+			 */
+			err = 0;
+		else
+			/*
+			 * The EC was OK, but the VID header is corrupted. We
+			 * have to check what is in the data area.
+			 */
+			err = check_data_ff(ubi, vidh, pnum);
 		if (!err)
-			/* This corruption is caused by a power cut - it's OK */
+			/* This corruption is caused by a power cut */
 			err = add_to_list(si, pnum, ec, 1, &si->erase);
 		else
 			/* This is an unexpected corruption */
@@ -1023,7 +1040,7 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 	max_corr = peb_count / 20 ?: 8;
 
 	/*
-	 * Few corrupted PEBs are not a problem and may be just a result of
+	 * Few corrupted PEBs is not a problem and may be just a result of
 	 * unclean reboots. However, many of them may indicate some problems
 	 * with the flash HW or driver.
 	 */
@@ -1048,14 +1065,14 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 	if (si->empty_peb_count + si->maybe_bad_peb_count == peb_count) {
 		/*
 		 * All PEBs are empty, or almost all - a couple PEBs look like
-		 * they may be bad PEB which were not marked as bad yet.
+		 * they may be bad PEBs which were not marked as bad yet.
 		 *
-		 * This piece of code basically tries to distinguish  between
-		 * the following 2 situations:
+		 * This piece of code basically tries to distinguish between
+		 * the following situations:
 		 *
 		 * 1. Flash is empty, but there are few bad PEBs, which are not
 		 *    marked as bad so far, and which were read with error. We
-		 *    want to go ahead and format this flash. While formating,
+		 *    want to go ahead and format this flash. While formatting,
 		 *    the faulty PEBs will probably be marked as bad.
 		 *
 		 * 2. Flash contains non-UBI data and we do not want to format
-- 
1.7.2.2

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)
