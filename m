Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTw-0000ig-Kl
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/13] UBI: do not put eraseblocks to the corrupted list
	unnecessarily
Date: Mon,  6 Sep 2010 11:54:53 +0300
Message-Id: <1283763293-1882-10-git-send-email-dedekind1@gmail.com>
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

Currently UBI maintains 2 lists of PEBs during scanning:
1. 'erase' list - PEBs which have no corruptions but should be erased
2. 'corr' list - PEBs which have some corruptions and should be erased

But we do not really need 2 lists for PEBs which should be erased after
scanning is done - this is redundant. So this patch makes sure all PEBs
which are corrupted are moved to the head of the 'erase' list. We add
them to the head to make sure they are erased first and we get rid of
corruption ASAP.

However, we do not remove the 'corr' list and realted functions, because
the plan is to use this list for other purposes. Namely, we plan to
put eraseblocks with corruption which does not look like it was caused
by unclean power cut. Then we'll preserve thes PEBs in order to avoid
killing potentially valuable user data.

This patch also amends PEBs accounting, because it was closely tight to
the 'erase'/'corr' lists separation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |  141 +++++++++++++++++++++++++++---------------------
 drivers/mtd/ubi/scan.h |   15 ++---
 drivers/mtd/ubi/vtbl.c |    2 +-
 3 files changed, 87 insertions(+), 71 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index fba3dc6..d5666a0 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -29,7 +29,7 @@
  * objects which are kept in volume RB-tree with root at the @volumes field.
  * The RB-tree is indexed by the volume ID.
  *
- * Found logical eraseblocks are represented by &struct ubi_scan_leb objects.
+ * Scanned logical eraseblocks are represented by &struct ubi_scan_leb objects.
  * These objects are kept in per-volume RB-trees with the root at the
  * corresponding &struct ubi_scan_volume object. To put it differently, we keep
  * an RB-tree of per-volume objects and each of these objects is the root of
@@ -38,6 +38,21 @@
  * Corrupted physical eraseblocks are put to the @corr list, free physical
  * eraseblocks are put to the @free list and the physical eraseblock to be
  * erased are put to the @erase list.
+ *
+ * UBI tries to distinguish between 2 types of corruptions.
+ * 1. Corruptions caused by power cuts. These are harmless and expected
+ *    corruptions and UBI tries to handle them gracefully, without printing too
+ *    many warnings and error messages. The idea is that we do not lose
+ *    important data in these case - we may lose only the data which was being
+ *    written to the media just before the power cut happened, and the upper
+ *    layers are supposed to handle these situations. UBI puts these PEBs to
+ *    the head of the @erase list and they are scheduled for erasure.
+ *
+ * 2. Unexpected corruptions which are not caused by power cuts. During
+ *    scanning, such PEBs are put to the @corr list and UBI preserves them.
+ *    Obviously, this lessens the amount of available PEBs, and if at some
+ *    point UBI runs out of free PEBs, it switches to R/O mode. UBI also loudly
+ *    informs about such PEBs every time the MTD device is attached.
  */
 
 #include <linux/err.h>
@@ -62,23 +77,26 @@ static struct ubi_vid_hdr *vidh;
  * @si: scanning information
  * @pnum: physical eraseblock number to add
  * @ec: erase counter of the physical eraseblock
+ * @to_head: if not zero, add to the head of the list
  * @list: the list to add to
  *
  * This function adds physical eraseblock @pnum to free, erase, or alien lists.
- * Returns zero in case of success and a negative error code in case of
+ * If @to_head is not zero, PEB will be added to the head of the list, which
+ * basically means it will be processed first later. E.g., we add corrupted
+ * PEBs (corrupted due to power cuts) to the head of the erase list to make
+ * sure we erase them first and get rid of corruptions ASAP. This function
+ * returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
+static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
 		       struct list_head *list)
 {
 	struct ubi_scan_leb *seb;
 
 	if (list == &si->free) {
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
-		si->free_peb_count += 1;
 	} else if (list == &si->erase) {
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
-		si->erase_peb_count += 1;
 	} else if (list == &si->alien) {
 		dbg_bld("add to alien: PEB %d, EC %d", pnum, ec);
 		si->alien_peb_count += 1;
@@ -91,7 +109,10 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 
 	seb->pnum = pnum;
 	seb->ec = ec;
-	list_add_tail(&seb->u.list, list);
+	if (to_head)
+		list_add(&seb->u.list, list);
+	else
+		list_add_tail(&seb->u.list, list);
 	return 0;
 }
 
@@ -282,8 +303,8 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 		 * created before sequence numbers support has been added. At
 		 * that times we used 32-bit LEB versions stored in logical
 		 * eraseblocks. That was before UBI got into mainline. We do not
-		 * support these images anymore. Well, those images will work
-		 * still work, but only if no unclean reboots happened.
+		 * support these images anymore. Well, those images still work,
+		 * but only if no unclean reboots happened.
 		 */
 		ubi_err("unsupported on-flash UBI format\n");
 		return -EINVAL;
@@ -321,7 +342,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 				bitflips = 1;
 			else {
 				dbg_err("VID of PEB %d header is bad, but it "
-					"was OK earlier", pnum);
+					"was OK earlier, err %d", pnum, err);
 				if (err > 0)
 					err = -EIO;
 
@@ -487,11 +508,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 			if (err)
 				return err;
 
-			if (cmp_res & 4)
-				err = add_corrupted(si, seb->pnum, seb->ec);
-			else
-				err = add_to_list(si, seb->pnum, seb->ec,
-						  &si->erase);
+			err = add_to_list(si, seb->pnum, seb->ec, cmp_res & 4,
+					  &si->erase);
 			if (err)
 				return err;
 
@@ -510,10 +528,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * This logical eraseblock is older than the one found
 			 * previously.
 			 */
-			if (cmp_res & 4)
-				return add_corrupted(si, pnum, ec);
-			else
-				return add_to_list(si, pnum, ec, &si->erase);
+			return add_to_list(si, pnum, ec, cmp_res & 4,
+					   &si->erase);
 		}
 	}
 
@@ -544,7 +560,6 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 	sv->leb_count += 1;
 	rb_link_node(&seb->u.rb, parent, p);
 	rb_insert_color(&seb->u.rb, &sv->root);
-	si->used_peb_count += 1;
 	return 0;
 }
 
@@ -776,10 +791,14 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 		break;
 	case UBI_IO_FF:
+		si->empty_peb_count += 1;
+		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, 0,
+				   &si->erase);
 	case UBI_IO_FF_BITFLIPS:
-		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
+		si->empty_peb_count += 1;
+		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, 1,
+				   &si->erase);
 	case UBI_IO_BAD_HDR_EBADMSG:
-		si->read_err_count += 1;
 	case UBI_IO_BAD_HDR:
 		/*
 		 * We have to also look at the VID header, possibly it is not
@@ -855,18 +874,23 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 		break;
 	case UBI_IO_BAD_HDR_EBADMSG:
-		si->read_err_count += 1;
+		if (ec_err == UBI_IO_BAD_HDR_EBADMSG)
+			/* Both EC and VID headers were read with data
+			 * integrity error, probably this is a bad PEB, bit it
+			 * is not marked a bad yet.
+			 */
+			si->maybe_bad_peb_count += 1;
 	case UBI_IO_BAD_HDR:
 	case UBI_IO_FF_BITFLIPS:
-		err = add_corrupted(si, pnum, ec);
+		err = add_to_list(si, pnum, ec, 1, &si->erase);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
 	case UBI_IO_FF:
 		if (ec_err)
-			err = add_corrupted(si, pnum, ec);
+			err = add_to_list(si, pnum, ec, 1, &si->erase);
 		else
-			err = add_to_list(si, pnum, ec, &si->free);
+			err = add_to_list(si, pnum, ec, 0, &si->free);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
@@ -885,7 +909,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		case UBI_COMPAT_DELETE:
 			ubi_msg("\"delete\" compatible internal volume %d:%d"
 				" found, will remove it", vol_id, lnum);
-			err = add_to_list(si, pnum, ec, &si->erase);
+			err = add_to_list(si, pnum, ec, 1, &si->erase);
 			if (err)
 				return err;
 			return 0;
@@ -900,7 +924,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		case UBI_COMPAT_PRESERVE:
 			ubi_msg("\"preserve\" compatible internal volume %d:%d"
 				" found", vol_id, lnum);
-			err = add_to_list(si, pnum, ec, &si->alien);
+			err = add_to_list(si, pnum, ec, 0, &si->alien);
 			if (err)
 				return err;
 			return 0;
@@ -946,19 +970,20 @@ adjust_mean_ec:
 static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	struct ubi_scan_leb *seb;
-	int max_corr;
+	int max_corr, peb_count;
 
-	max_corr = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
-	max_corr = max_corr / 20 ?: 8;
+	peb_count = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
+	max_corr = peb_count / 20 ?: 8;
 
 	/*
 	 * Few corrupted PEBs are not a problem and may be just a result of
 	 * unclean reboots. However, many of them may indicate some problems
 	 * with the flash HW or driver.
 	 */
-	if (si->corr_peb_count >= 8) {
-		ubi_warn("%d PEBs are corrupted", si->corr_peb_count);
-		printk(KERN_WARNING "corrupted PEBs are:");
+	if (si->corr_peb_count) {
+		ubi_err("%d PEBs are corrupted and preserved",
+			si->corr_peb_count);
+		printk(KERN_ERR "Corrupted PEBs are:");
 		list_for_each_entry(seb, &si->corr, u.list)
 			printk(KERN_CONT " %d", seb->pnum);
 		printk(KERN_CONT "\n");
@@ -973,41 +998,35 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 		}
 	}
 
-	if (si->free_peb_count + si->used_peb_count +
-	    si->alien_peb_count == 0) {
-		/* No UBI-formatted eraseblocks were found */
-		if (si->corr_peb_count == si->read_err_count &&
-		    si->corr_peb_count < 8) {
-			/* No or just few corrupted PEBs, and all of them had a
-			 * read error. We assume that those are bad PEBs, which
-			 * were just not marked as bad so far.
-			 *
-			 * This piece of code basically tries to distinguish
-			 * between the following 2 situations:
-			 *
-			 * 1. Flash is empty, but there are few bad PEBs, which
-			 *    are not marked as bad so far, and which were read
-			 *    with error. We want to go ahead and format this
-			 *    flash. While formating, the faulty PEBs will
-			 *    probably be marked as bad.
-			 *
-			 * 2. Flash probably contains non-UBI data and we do
-			 * not want to format it and destroy possibly needed
-			 * data (e.g., consider the case when the bootloader
-			 * MTD partition was accidentally fed to UBI).
-			 */
+	if (si->empty_peb_count + si->maybe_bad_peb_count == peb_count) {
+		/*
+		 * All PEBs are empty, or almost all - a couple PEBs look like
+		 * they may be bad PEB which were not marked as bad yet.
+		 *
+		 * This piece of code basically tries to distinguish  between
+		 * the following 2 situations:
+		 *
+		 * 1. Flash is empty, but there are few bad PEBs, which are not
+		 *    marked as bad so far, and which were read with error. We
+		 *    want to go ahead and format this flash. While formating,
+		 *    the faulty PEBs will probably be marked as bad.
+		 *
+		 * 2. Flash contains non-UBI data and we do not want to format
+		 *    it and destroy possibly important information.
+		 */
+		if (si->maybe_bad_peb_count <= 2) {
 			si->is_empty = 1;
 			ubi_msg("empty MTD device detected");
-			get_random_bytes(&ubi->image_seq, sizeof(ubi->image_seq));
+			get_random_bytes(&ubi->image_seq,
+					 sizeof(ubi->image_seq));
 		} else {
-			ubi_err("MTD device possibly contains non-UBI data, "
-				"refusing it");
+			ubi_err("MTD device is not UBI-formatted and possibly "
+				"contains non-UBI data - refusing it");
 			return -EINVAL;
 		}
+
 	}
 
-	if (si->corr_peb_count > 0)
-		ubi_msg("corrupted PEBs will be formatted");
 	return 0;
 }
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 0876649..12ac852 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -91,14 +91,13 @@ struct ubi_scan_volume {
  * @erase: list of physical eraseblocks which have to be erased
  * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
  *         those belonging to "preserve"-compatible internal volumes)
- * @used_peb_count: count of used PEBs
  * @corr_peb_count: count of PEBs in the @corr list
- * @read_err_count: count of PEBs read with error (%UBI_IO_BAD_HDR_EBADMSG was
- *                  returned)
- * @free_peb_count: count of PEBs in the @free list
- * @erase_peb_count: count of PEBs in the @erase list
+ * @empty_peb_count: count of PEBs which are presumably empty (contain only
+ *                   0xFF bytes)
  * @alien_peb_count: count of PEBs in the @alien list
  * @bad_peb_count: count of bad physical eraseblocks
+ * @maybe_bad_peb_count: count of bad physical eraseblocks which are not marked
+ *                       as bad yet, but which look like bad
  * @vols_found: number of volumes found during scanning
  * @highest_vol_id: highest volume ID
  * @is_empty: flag indicating whether the MTD device is empty or not
@@ -119,13 +118,11 @@ struct ubi_scan_info {
 	struct list_head free;
 	struct list_head erase;
 	struct list_head alien;
-	int used_peb_count;
 	int corr_peb_count;
-	int read_err_count;
-	int free_peb_count;
-	int erase_peb_count;
+	int empty_peb_count;
 	int alien_peb_count;
 	int bad_peb_count;
+	int maybe_bad_peb_count;
 	int vols_found;
 	int highest_vol_id;
 	int is_empty;
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 14c10be..3bfe00a 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -366,7 +366,7 @@ write_error:
 		 * Probably this physical eraseblock went bad, try to pick
 		 * another one.
 		 */
-		list_add_tail(&new_seb->u.list, &si->corr);
+		list_add(&new_seb->u.list, &si->erase);
 		goto retry;
 	}
 	kfree(new_seb);
-- 
1.7.1.1
