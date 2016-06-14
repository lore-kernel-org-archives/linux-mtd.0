Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjTG-0007Om-27
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:13:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 6/7] ubi: Be more paranoid while seaching for the most recent
 Fastmap
Date: Tue, 14 Jun 2016 10:12:17 +0200
Message-Id: <1465891938-4063-6-git-send-email-richard@nod.at>
In-Reply-To: <1465891938-4063-1-git-send-email-richard@nod.at>
References: <1465891938-4063-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since PEB erasure is asynchornous it can happen that there is
more than one Fastmap on the MTD. This is fine because the attach logic
will pick the Fastmap data structure with the highest sequence number.

On a not so well configured MTD stack spurious ECC errors are common.
Causes can be different, bad hardware, wrong operating modes, etc...
If the most current Fastmap renders bad due to ECC errors UBI might
pick an older Fastmap to attach from.
While this can only happen on an anyway broken setup it will show
completely different sympthoms and makes finding the root cause much
more difficult.
So, be debug friendly and fall back to scanning mode of we're facing
an ECC error while scanning for Fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 28 ++++++++++++++++++++++++----
 drivers/mtd/ubi/ubi.h    |  3 +++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index bd6fc52..903becd 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -856,13 +856,15 @@ static bool vol_ignored(int vol_id)
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: the physical eraseblock number
+ * @fast: true if we're scanning for a Fastmap
  *
  * This function reads UBI headers of PEB @pnum, checks them, and adds
  * information about this PEB to the corresponding list or RB-tree in the
  * "attaching info" structure. Returns zero if the physical eraseblock was
  * successfully handled and a negative error code in case of failure.
  */
-static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum)
+static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
+		    int pnum, bool fast)
 {
 	long long ec;
 	int err, bitflips = 0, vol_id = -1, ec_err = 0;
@@ -980,6 +982,20 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum
 			 */
 			ai->maybe_bad_peb_count += 1;
 	case UBI_IO_BAD_HDR:
+			/*
+			 * If we're facing a bad VID header we have to drop *all*
+			 * Fastmap data structures we find. The most recent Fastmap
+			 * could be bad and therefore there is a chance that we attach
+			 * from an old one. On a fine MTD stack a PEB must not render
+			 * bad all of a sudden, but the reality is different.
+			 * So, let's be paranoid and help finding the root cause by
+			 * falling back to scanning mode instead of attaching with a
+			 * bad EBA table and cause data corruption which is hard to
+			 * analyze.
+			 */
+			if (fast)
+				ai->force_full_scan = 1;
+
 		if (ec_err)
 			/*
 			 * Both headers are corrupted. There is a possibility
@@ -1293,7 +1309,7 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, ai, pnum);
+		err = scan_peb(ubi, ai, pnum, false);
 		if (err < 0)
 			goto out_vidh;
 	}
@@ -1407,7 +1423,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, scan_ai, pnum);
+		err = scan_peb(ubi, scan_ai, pnum, true);
 		if (err < 0)
 			goto out_vidh;
 	}
@@ -1415,7 +1431,11 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	ubi_free_vid_hdr(ubi, vidh);
 	kfree(ech);
 
-	err = ubi_scan_fastmap(ubi, *ai, scan_ai);
+	if (scan_ai->force_full_scan)
+		err = UBI_NO_FASTMAP;
+	else
+		err = ubi_scan_fastmap(ubi, *ai, scan_ai);
+
 	if (err) {
 		/*
 		 * Didn't attach via fastmap, do a full scan but reuse what
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8b90a8..b616a115 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -715,6 +715,8 @@ struct ubi_ainf_volume {
  * @vols_found: number of volumes found
  * @highest_vol_id: highest volume ID
  * @is_empty: flag indicating whether the MTD device is empty or not
+ * @force_full_scan: flag indicating whether we need to do a full scan and drop
+		     all existing Fastmap data structures
  * @min_ec: lowest erase counter value
  * @max_ec: highest erase counter value
  * @max_sqnum: highest sequence number value
@@ -742,6 +744,7 @@ struct ubi_attach_info {
 	int vols_found;
 	int highest_vol_id;
 	int is_empty;
+	int force_full_scan;
 	int min_ec;
 	int max_ec;
 	unsigned long long max_sqnum;
-- 
2.7.3
