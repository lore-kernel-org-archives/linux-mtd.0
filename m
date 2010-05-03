Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8sgu-0003Ys-QU
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 10:15:58 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH 3/4] UBI: introduce eraseblock counter variables
Date: Mon,  3 May 2010 13:13:01 +0300
Message-Id: <1272881582-17196-4-git-send-email-Artem.Bityutskiy@nokia.com>
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

This is just a preparation patch which introduces several
'struct ubi_scan_info' fields which count eraseblocks of different
types. This will be used later on to decide whether it is safe to
format the flash or not. No functional changes so far.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   29 ++++++++++++++++++-----------
 drivers/mtd/ubi/scan.h |   19 ++++++++++++++-----
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 65d03b5..dc5e061 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -72,16 +72,19 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 {
 	struct ubi_scan_leb *seb;
 
-	if (list == &si->free)
+	if (list == &si->free) {
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
-	else if (list == &si->erase)
+		si->free_peb_count += 1;
+	} else if (list == &si->erase) {
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
-	else if (list == &si->corr) {
+		si->erase_peb_count += 1;
+	} else if (list == &si->corr) {
 		dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
-		si->corr_count += 1;
-	} else if (list == &si->alien)
+		si->corr_peb_count += 1;
+	} else if (list == &si->alien) {
 		dbg_bld("add to alien: PEB %d, EC %d", pnum, ec);
-	else
+		si->alien_peb_count += 1;
+	} else
 		BUG();
 
 	seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
@@ -517,6 +520,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 	sv->leb_count += 1;
 	rb_link_node(&seb->u.rb, parent, p);
 	rb_insert_color(&seb->u.rb, &sv->root);
+	si->used_peb_count += 1;
 	return 0;
 }
 
@@ -745,13 +749,13 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	else if (err == UBI_IO_PEB_EMPTY)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err = UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {
+	else if (err == UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
 		 * moved and EC be re-created.
 		 */
-		ec_corr = 1;
+		ec_corr = err;
 		ec = UBI_SCAN_UNKNOWN_EC;
 		bitflips = 1;
 	}
@@ -816,6 +820,9 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	else if (err == UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR ||
 		 (err == UBI_IO_PEB_FREE && ec_corr)) {
 		/* VID header is corrupted */
+		if (err == UBI_IO_BAD_HDR_READ ||
+		    ec_corr == UBI_IO_BAD_HDR_READ)
+			si->read_err_count += 1;
 		err = add_to_list(si, pnum, ec, &si->corr);
 		if (err)
 			return err;
@@ -855,7 +862,6 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			err = add_to_list(si, pnum, ec, &si->alien);
 			if (err)
 				return err;
-			si->alien_peb_count += 1;
 			return 0;
 
 		case UBI_COMPAT_REJECT:
@@ -943,8 +949,9 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	 * unclean reboots. However, many of them may indicate some problems
 	 * with the flash HW or driver. Print a warning in this case.
 	 */
-	if (si->corr_count >= 8 || si->corr_count >= ubi->peb_count / 4) {
-		ubi_warn("%d PEBs are corrupted", si->corr_count);
+	if (si->corr_peb_count >= 8 ||
+	    si->corr_peb_count >= ubi->peb_count / 4) {
+		ubi_warn("%d PEBs are corrupted", si->corr_peb_count);
 		printk(KERN_WARNING "corrupted PEBs are:");
 		list_for_each_entry(seb, &si->corr, u.list)
 			printk(KERN_CONT " %d", seb->pnum);
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index ff179ad..2576a8d 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -91,10 +91,16 @@ struct ubi_scan_volume {
  * @erase: list of physical eraseblocks which have to be erased
  * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
  *         those belonging to "preserve"-compatible internal volumes)
+ * @used_peb_count: count of used PEBs
+ * @corr_peb_count: count of PEBs in the @corr list
+ * @read_err_count: count of PEBs read with error (%UBI_IO_BAD_HDR_READ was
+ *                  returned)
+ * @free_peb_count: count of PEBs in the @free list
+ * @erase_peb_count: count of PEBs in the @erase list
+ * @alien_peb_count: count of PEBs in the @alien list
  * @bad_peb_count: count of bad physical eraseblocks
  * @vols_found: number of volumes found during scanning
  * @highest_vol_id: highest volume ID
- * @alien_peb_count: count of physical eraseblocks in the @alien list
  * @is_empty: flag indicating whether the MTD device is empty or not
  * @min_ec: lowest erase counter value
  * @max_ec: highest erase counter value
@@ -102,7 +108,6 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
- * @corr_count: count of corrupted PEBs
  *
  * This data structure contains the result of scanning and may be used by other
  * UBI sub-systems to build final UBI data structures, further error-recovery
@@ -114,10 +119,15 @@ struct ubi_scan_info {
 	struct list_head free;
 	struct list_head erase;
 	struct list_head alien;
+	int used_peb_count;
+	int corr_peb_count;
+	int read_err_count;
+	int free_peb_count;
+	int erase_peb_count;
+	int alien_peb_count;
 	int bad_peb_count;
 	int vols_found;
 	int highest_vol_id;
-	int alien_peb_count;
 	int is_empty;
 	int min_ec;
 	int max_ec;
@@ -125,7 +135,6 @@ struct ubi_scan_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
-	int corr_count;
 };
 
 struct ubi_device;
@@ -135,7 +144,7 @@ struct ubi_vid_hdr;
  * ubi_scan_move_to_list - move a PEB from the volume tree to a list.
  *
  * @sv: volume scanning information
- * @seb: scanning eraseblock infprmation
+ * @seb: scanning eraseblock information
  * @list: the list to move to
  */
 static inline void ubi_scan_move_to_list(struct ubi_scan_volume *sv,
-- 
1.6.6.1
