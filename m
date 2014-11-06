Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmPIW-0006fR-Hw
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 15:48:33 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Fix double free after do_sync_erase()
Date: Thu,  6 Nov 2014 16:47:49 +0100
Message-Id: <1415288869-14915-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the erase worker is unable to erase a PEB it will
free the ubi_wl_entry itself.
The failing ubi_wl_entry must not free()'d again after
do_sync_erase() returns.

Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 6654f191..b9686c1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1212,7 +1212,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	err = do_sync_erase(ubi, e1, vol_id, lnum, 0);
 	if (err) {
-		kmem_cache_free(ubi_wl_entry_slab, e1);
 		if (e2)
 			kmem_cache_free(ubi_wl_entry_slab, e2);
 		goto out_ro;
@@ -1226,10 +1225,8 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		dbg_wl("PEB %d (LEB %d:%d) was put meanwhile, erase",
 		       e2->pnum, vol_id, lnum);
 		err = do_sync_erase(ubi, e2, vol_id, lnum, 0);
-		if (err) {
-			kmem_cache_free(ubi_wl_entry_slab, e2);
+		if (err)
 			goto out_ro;
-		}
 	}
 
 	dbg_wl("done");
@@ -1265,10 +1262,9 @@ out_not_moved:
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
-	if (err) {
-		kmem_cache_free(ubi_wl_entry_slab, e2);
+	if (err)
 		goto out_ro;
-	}
+
 	mutex_unlock(&ubi->move_mutex);
 	return 0;
 
-- 
2.1.0
