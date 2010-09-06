Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXU0-0000lv-NF
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:21 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/13] UBI: separate out corrupted list
Date: Mon,  6 Sep 2010 11:54:52 +0300
Message-Id: <1283763293-1882-9-git-send-email-dedekind1@gmail.com>
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

This patch introduces 'add_corrupted()' function and separates out 'corr' list
manipulation from the common 'add_to_list()' function. This is just a
preparation for further changes - this patch does not change functionality.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   45 ++++++++++++++++++++++++++++++++++-----------
 1 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 9405e24..fba3dc6 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -64,9 +64,9 @@ static struct ubi_vid_hdr *vidh;
  * @ec: erase counter of the physical eraseblock
  * @list: the list to add to
  *
- * This function adds physical eraseblock @pnum to free, erase, corrupted or
- * alien lists. Returns zero in case of success and a negative error code in
- * case of failure.
+ * This function adds physical eraseblock @pnum to free, erase, or alien lists.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
  */
 static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 		       struct list_head *list)
@@ -79,9 +79,6 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 	} else if (list == &si->erase) {
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
 		si->erase_peb_count += 1;
-	} else if (list == &si->corr) {
-		dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
-		si->corr_peb_count += 1;
 	} else if (list == &si->alien) {
 		dbg_bld("add to alien: PEB %d, EC %d", pnum, ec);
 		si->alien_peb_count += 1;
@@ -99,6 +96,33 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 }
 
 /**
+ * add_corrupted - add a corrupted physical eraseblock.
+ * @si: scanning information
+ * @pnum: physical eraseblock number to add
+ * @ec: erase counter of the physical eraseblock
+ *
+ * This function adds corrupted physical eraseblock @pnum to the 'corr' list.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+static int add_corrupted(struct ubi_scan_info *si, int pnum, int ec)
+{
+	struct ubi_scan_leb *seb;
+
+	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
+
+	seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
+	if (!seb)
+		return -ENOMEM;
+
+	si->corr_peb_count += 1;
+	seb->pnum = pnum;
+	seb->ec = ec;
+	list_add(&seb->u.list, &si->corr);
+	return 0;
+}
+
+/**
  * validate_vid_hdr - check volume identifier header.
  * @vid_hdr: the volume identifier header to check
  * @sv: information about the volume this logical eraseblock belongs to
@@ -464,8 +488,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 				return err;
 
 			if (cmp_res & 4)
-				err = add_to_list(si, seb->pnum, seb->ec,
-						  &si->corr);
+				err = add_corrupted(si, seb->pnum, seb->ec);
 			else
 				err = add_to_list(si, seb->pnum, seb->ec,
 						  &si->erase);
@@ -488,7 +511,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * previously.
 			 */
 			if (cmp_res & 4)
-				return add_to_list(si, pnum, ec, &si->corr);
+				return add_corrupted(si, pnum, ec);
 			else
 				return add_to_list(si, pnum, ec, &si->erase);
 		}
@@ -835,13 +858,13 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		si->read_err_count += 1;
 	case UBI_IO_BAD_HDR:
 	case UBI_IO_FF_BITFLIPS:
-		err = add_to_list(si, pnum, ec, &si->corr);
+		err = add_corrupted(si, pnum, ec);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
 	case UBI_IO_FF:
 		if (ec_err)
-			err = add_to_list(si, pnum, ec, &si->corr);
+			err = add_corrupted(si, pnum, ec);
 		else
 			err = add_to_list(si, pnum, ec, &si->free);
 		if (err)
-- 
1.7.1.1
