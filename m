Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSTPM-0004LN-SC
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 10:14:23 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n6JAE6nH014434
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jul 2009 13:14:07 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: print a warning if too many PEBs are corrupted
Date: Sun, 19 Jul 2009 15:05:56 +0300
Message-Id: <1248005156-18662-3-git-send-email-dedekind@infradead.org>
In-Reply-To: <1248005156-18662-1-git-send-email-dedekind@infradead.org>
References: <1248005156-18662-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

There was a bug report recently where UBI prints:

UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22

error messages and refuses to attach a PEB. It turned out to be a
buggy flash driver which returned garbage to almost every UBI read.
This patch makes UBI print a better message in such cases. Namely,
if UBI finds 8 or more corrupted PEBs, it prints a warning and
lists the corrupted PEBs.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   19 +++++++++++++++++--
 drivers/mtd/ubi/scan.h |    2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 44c8273..0042f7b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -75,9 +75,10 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec,
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
 	else if (list == &si->erase)
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
-	else if (list == &si->corr)
+	else if (list == &si->corr) {
 		dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
-	else if (list == &si->alien)
+		si->corr_count += 1;
+	} else if (list == &si->alien)
 		dbg_bld("add to alien: PEB %d, EC %d", pnum, ec);
 	else
 		BUG();
@@ -927,6 +928,20 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 		ubi_msg("empty MTD device detected");
 
 	/*
+	 * Few corrupted PEBs are not a problem and may be just a result of
+	 * unclean reboots. However, many of them may indicate some problems
+	 * with the flash HW or driver. Print a warning in this case.
+	 */
+	if (si->corr_count >= 8 || si->corr_count >= ubi->peb_count / 4) {
+		ubi_warn("%d PEBs are corrupted", si->corr_count);
+		printk(KERN_WARNING "corrupted PEBs are: ");
+		list_for_each_entry(seb, &si->corr, u.list) {
+			printk(KERN_CONT "%d", seb->pnum);
+		}
+		printk(KERN_CONT "\n");
+	}
+
+	/*
 	 * In case of unknown erase counter we use the mean erase counter
 	 * value.
 	 */
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 1017cf1..bab3169 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -102,6 +102,7 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
+ * @corr_count: count of corrupted PEBs
  * @image_seq_set: indicates @ubi->image_seq is known
  *
  * This data structure contains the result of scanning and may be used by other
@@ -125,6 +126,7 @@ struct ubi_scan_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
+	int corr_count;
 	int image_seq_set;
 };
 
-- 
1.6.0.6
