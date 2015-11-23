Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vYd-0000SA-T4
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:09:46 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
Date: Mon, 23 Nov 2015 19:09:07 +0100
Message-Id: <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

wear_leveling_worker() currently unconditionally puts a PEB on erase in
the error case even it just been taken from the free_list and never
used.
In case the PEB was never used it can be put back on the free list
saving an erase cycle.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/ubi/wl.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index eb4489f9082f..709ca27e103c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -631,6 +631,7 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	return erase_worker(ubi, wl_wrk, 0);
 }
 
+static int ensure_wear_leveling(struct ubi_device *ubi, int nested);
 /**
  * wear_leveling_worker - wear-leveling worker function.
  * @ubi: UBI device description object
@@ -652,6 +653,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 #endif
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
+	int to_leb_clean = 0;
 
 	kfree(wrk);
 	if (shutdown)
@@ -756,6 +758,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
 	if (err && err != UBI_IO_BITFLIPS) {
+		to_leb_clean = 1;
 		if (err == UBI_IO_FF) {
 			/*
 			 * We are trying to move PEB without a VID header. UBI
@@ -801,10 +804,12 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			 * protection queue.
 			 */
 			protect = 1;
+			to_leb_clean = 1;
 			goto out_not_moved;
 		}
 		if (err == MOVE_RETRY) {
 			scrubbing = 1;
+			to_leb_clean = 1;
 			goto out_not_moved;
 		}
 		if (err == MOVE_TARGET_BITFLIPS || err == MOVE_TARGET_WR_ERR ||
@@ -830,6 +835,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 					ubi->erroneous_peb_count);
 				goto out_error;
 			}
+			to_leb_clean = 1;
 			erroneous = 1;
 			goto out_not_moved;
 		}
@@ -900,15 +906,26 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		wl_tree_add(e1, &ubi->scrub);
 	else
 		wl_tree_add(e1, &ubi->used);
+	if (to_leb_clean) {
+		wl_tree_add(e2, &ubi->free);
+		ubi->free_count++;
+	}
+
 	ubi_assert(!ubi->move_to_put);
 	ubi->move_from = ubi->move_to = NULL;
 	ubi->wl_scheduled = 0;
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
-	if (err)
-		goto out_ro;
+	if (to_leb_clean) {
+		ensure_wear_leveling(ubi, 0);
+	} else {
+		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
+		if (err) {
+			wl_entry_destroy(ubi, e2);
+			goto out_ro;
+		}
+	}
 
 	mutex_unlock(&ubi->move_mutex);
 	return 0;
-- 
2.6.2
