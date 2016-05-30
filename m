Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005Ke-IB
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 09/13] ubi: Remove usless debug info from
 wear_leveling_worker()
Date: Mon, 30 May 2016 14:04:30 +0200
Message-Id: <1464609874-15488-10-git-send-email-richard@nod.at>
In-Reply-To: <1464609874-15488-1-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7d42739..bf4e6b2 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -573,7 +573,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int shutdown)
 {
 	int err, scrubbing = 0, torture = 0, protect = 0, erroneous = 0;
-	int vol_id = -1, lnum = -1;
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	int anchor = wrk->anchor;
 #endif
@@ -715,9 +714,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		goto out_error;
 	}
 
-	vol_id = be32_to_cpu(vid_hdr->vol_id);
-	lnum = be32_to_cpu(vid_hdr->lnum);
-
 	err = ubi_eba_copy_leb(ubi, e1->pnum, e2->pnum, vid_hdr);
 	if (err) {
 		if (err == MOVE_CANCEL_RACE) {
@@ -773,8 +769,8 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	/* The PEB has been successfully moved */
 	if (scrubbing)
-		ubi_msg(ubi, "scrubbed PEB %d (LEB %d:%d), data moved to PEB %d",
-			e1->pnum, vol_id, lnum, e2->pnum);
+		ubi_msg(ubi, "scrubbed PEB %d, data moved to PEB %d",
+			e1->pnum, e2->pnum);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 
 	spin_lock(&ubi->wl_lock);
@@ -798,8 +794,8 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 * Well, the target PEB was put meanwhile, schedule it for
 		 * erasure.
 		 */
-		dbg_wl("PEB %d (LEB %d:%d) was put meanwhile, erase",
-		       e2->pnum, vol_id, lnum);
+		dbg_wl("PEB %d was put meanwhile, erase",
+		       e2->pnum);
 		err = do_sync_erase(ubi, e2, 0);
 		if (err)
 			goto out_ro;
@@ -815,12 +811,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	 * have been changed, schedule it for erasure.
 	 */
 out_not_moved:
-	if (vol_id != -1)
-		dbg_wl("cancel moving PEB %d (LEB %d:%d) to PEB %d (%d)",
-		       e1->pnum, vol_id, lnum, e2->pnum, err);
-	else
-		dbg_wl("cancel moving PEB %d to PEB %d (%d)",
-		       e1->pnum, e2->pnum, err);
+	dbg_wl("cancel moving PEB %d to PEB %d (%d)", e1->pnum, e2->pnum, err);
 	spin_lock(&ubi->wl_lock);
 	if (protect)
 		prot_queue_add(ubi, e1);
@@ -854,12 +845,8 @@ out_not_moved:
 	return 0;
 
 out_error:
-	if (vol_id != -1)
-		ubi_err(ubi, "error %d while moving PEB %d to PEB %d",
-			err, e1->pnum, e2->pnum);
-	else
-		ubi_err(ubi, "error %d while moving PEB %d (LEB %d:%d) to PEB %d",
-			err, e1->pnum, vol_id, lnum, e2->pnum);
+	ubi_err(ubi, "error %d while moving PEB %d to PEB %d", err, e1->pnum,
+		e2->pnum);
 	spin_lock(&ubi->wl_lock);
 	ubi->move_from = ubi->move_to = NULL;
 	ubi->move_to_put = ubi->wl_scheduled = 0;
-- 
2.7.3
