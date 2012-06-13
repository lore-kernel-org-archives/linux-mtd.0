Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2A-0007AC-EA
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/21] UBI: Fastmap: Erase PEBs synchronous in
 wear_leveling_worker()
Date: Wed, 13 Jun 2012 12:42:11 +0200
Message-Id: <1339584138-69914-15-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fastmap calls ubi_wl_flush() to ensure that no PEBs are in flight.
But if ubi_wl_flush() runs the WL-worker the worker may inject
new erase work which runs later.
This PEBs are not visible to fastmap and leak.
So solve this erase PEBs synchronous in wear_leveling_worker().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |   23 ++++++++++++++++++++---
 1 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8fb8b41..def6a88 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -804,6 +804,23 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	return 0;
 }
 
+static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
+			 int torture)
+{
+	struct ubi_work *wl_wrk;
+
+	ubi_msg("sync erase of PEB %i", e->pnum);
+
+	wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	if (!wl_wrk)
+		return -ENOMEM;
+
+	wl_wrk->e = e;
+	wl_wrk->torture = torture;
+
+	return erase_worker(ubi, wl_wrk, 0);
+}
+
 /**
  * ubi_wl_put_fm_peb - returns a PEB used in a fastmap to the wear-leveling
  * sub-system.
@@ -1035,7 +1052,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	ubi->move_to_put = ubi->wl_scheduled = 0;
 	spin_unlock(&ubi->wl_lock);
 
-	err = schedule_erase(ubi, e1, 0);
+	err = do_sync_erase(ubi, e1, 0);
 	if (err) {
 		kmem_cache_free(ubi_wl_entry_slab, e1);
 		if (e2)
@@ -1050,7 +1067,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 */
 		dbg_wl("PEB %d (LEB %d:%d) was put meanwhile, erase",
 		       e2->pnum, vol_id, lnum);
-		err = schedule_erase(ubi, e2, 0);
+		err = do_sync_erase(ubi, e2, 0);
 		if (err) {
 			kmem_cache_free(ubi_wl_entry_slab, e2);
 			goto out_ro;
@@ -1089,7 +1106,7 @@ out_not_moved:
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	err = schedule_erase(ubi, e2, torture);
+	err = do_sync_erase(ubi, e2, torture);
 	if (err) {
 		kmem_cache_free(ubi_wl_entry_slab, e2);
 		goto out_ro;
-- 
1.7.6.5
