Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a235Y-00065k-1e
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 20:24:22 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 3/3] mtd: ubi: wl: avoid erasing a PEB which is empty
Date: Thu, 26 Nov 2015 21:23:50 +0100
Message-Id: <1448569430-885-3-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
References: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
saving a precious erase cycle.

v1…v2:
	- to_leb_clean -> dst_leb_clean
	- use the nested option for ensure_wear_leveling()
	- do_sync_erase() can't go -ENOMEM so we can just go into
	  RO-mode now.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/ubi/wl.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 56065632a5b8..17ec948ac40e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -628,6 +628,7 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	return __erase_worker(ubi, &wl_wrk);
 }
 
+static int ensure_wear_leveling(struct ubi_device *ubi, int nested);
 /**
  * wear_leveling_worker - wear-leveling worker function.
  * @ubi: UBI device description object
@@ -649,6 +650,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 #endif
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
+	int dst_leb_clean = 0;
 
 	kfree(wrk);
 	if (shutdown)
@@ -753,6 +755,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
 	if (err && err != UBI_IO_BITFLIPS) {
+		dst_leb_clean = 1;
 		if (err == UBI_IO_FF) {
 			/*
 			 * We are trying to move PEB without a VID header. UBI
@@ -798,10 +801,12 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			 * protection queue.
 			 */
 			protect = 1;
+			dst_leb_clean = 1;
 			goto out_not_moved;
 		}
 		if (err == MOVE_RETRY) {
 			scrubbing = 1;
+			dst_leb_clean = 1;
 			goto out_not_moved;
 		}
 		if (err == MOVE_TARGET_BITFLIPS || err == MOVE_TARGET_WR_ERR ||
@@ -827,6 +832,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 					ubi->erroneous_peb_count);
 				goto out_error;
 			}
+			dst_leb_clean = 1;
 			erroneous = 1;
 			goto out_not_moved;
 		}
@@ -897,15 +903,24 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		wl_tree_add(e1, &ubi->scrub);
 	else
 		wl_tree_add(e1, &ubi->used);
+	if (dst_leb_clean) {
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
+	if (dst_leb_clean) {
+		ensure_wear_leveling(ubi, 1);
+	} else {
+		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
+		if (err)
+			goto out_ro;
+	}
 
 	mutex_unlock(&ubi->move_mutex);
 	return 0;
-- 
2.6.2
