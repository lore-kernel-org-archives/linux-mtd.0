Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcXQQ-0006To-71
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 12:37:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ubi: Deal with interrupted erasures in WL
Date: Wed, 24 Aug 2016 14:36:13 +0200
Message-Id: <1472042175-8655-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When Fastmap is used we can face here an -EBADMSG
since Fastmap cannot know about unmaps.
If the erasure was interrupted the PEB may show ECC
errors and UBI would go to ro-mode as it assumes
that the PEB was check during attach time, which is
not the case with Fastmap.

Cc: <stable@vger.kernel.org>
Fixes: dbb7d2a88d ("UBI: Add fastmap core")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f453326..b419c7c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -644,7 +644,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int shutdown)
 {
 	int err, scrubbing = 0, torture = 0, protect = 0, erroneous = 0;
-	int vol_id = -1, lnum = -1;
+	int erase = 0, keep = 0, vol_id = -1, lnum = -1;
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	int anchor = wrk->anchor;
 #endif
@@ -780,6 +780,16 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			       e1->pnum);
 			scrubbing = 1;
 			goto out_not_moved;
+		} else if (ubi->fast_attach && err == UBI_IO_BAD_HDR_EBADMSG) {
+			/*
+			 * While a full scan would detect interrupted erasures
+			 * at attach time we can face them here when attached from
+			 * Fastmap.
+			 */
+			dbg_wl("PEB %d has ECC errors, maybe from an interrupted erasure",
+			       e1->pnum);
+			erase = 1;
+			goto out_not_moved;
 		}
 
 		ubi_err(ubi, "error %d while reading VID header from PEB %d",
@@ -815,6 +825,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			 * Target PEB had bit-flips or write error - torture it.
 			 */
 			torture = 1;
+			keep = 1;
 			goto out_not_moved;
 		}
 
@@ -901,7 +912,7 @@ out_not_moved:
 		ubi->erroneous_peb_count += 1;
 	} else if (scrubbing)
 		wl_tree_add(e1, &ubi->scrub);
-	else
+	else if (keep)
 		wl_tree_add(e1, &ubi->used);
 	if (dst_leb_clean) {
 		wl_tree_add(e2, &ubi->free);
@@ -922,6 +933,12 @@ out_not_moved:
 			goto out_ro;
 	}
 
+	if (erase) {
+		err = do_sync_erase(ubi, e1, vol_id, lnum, 1);
+		if (err)
+			goto out_ro;
+	}
+
 	mutex_unlock(&ubi->move_mutex);
 	return 0;
 
-- 
2.7.3
