Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005KX-I9
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 05/13] ubi: Get rid of __schedule_ubi_work()
Date: Mon, 30 May 2016 14:04:26 +0200
Message-Id: <1464609874-15488-6-git-send-email-richard@nod.at>
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

Now we can call schedule_ubi_work() directly in a worker
function without the need of a nested parameter and the
helper.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 45 ++++++++++++---------------------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8e6e8cf..0ed6e39 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -629,23 +629,19 @@ repeat:
 	spin_unlock(&ubi->wl_lock);
 }
 
-static bool wl_work_suspended(struct ubi_device *ubi)
-{
-	return ubi->thread_suspended || !ubi->thread_enabled;
-}
-
 /**
- * __schedule_ubi_work - schedule a work.
+ * schedule_ubi_work - schedule a work.
  * @ubi: UBI device description object
  * @wrk: the work to schedule
  *
  * This function adds a work defined by @wrk to the tail of the pending works
- * list. Can only be used if ubi->work_mutex is already held.
+ * list.
  */
-static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
+static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 {
 	ubi_assert(ubi->thread_enabled);
 
+	mutex_lock(&ubi->work_mutex);
 	spin_lock(&ubi->wl_lock);
 	INIT_LIST_HEAD(&wrk->list);
 	kref_init(&wrk->ref);
@@ -656,20 +652,6 @@ static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 	if (!wl_work_suspended(ubi) && !ubi_dbg_is_bgt_disabled(ubi))
 		wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
-}
-
-/**
- * schedule_ubi_work - schedule a work.
- * @ubi: UBI device description object
- * @wrk: the work to schedule
- *
- * This function adds a work defined by @wrk to the tail of the pending works
- * list.
- */
-static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
-{
-	mutex_lock(&ubi->work_mutex);
-	__schedule_ubi_work(ubi, wrk);
 	mutex_unlock(&ubi->work_mutex);
 }
 
@@ -740,7 +722,7 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	return __erase_worker(ubi, wl_wrk);
 }
 
-static int ensure_wear_leveling(struct ubi_device *ubi, int nested);
+static int ensure_wear_leveling(struct ubi_device *ubi);
 /**
  * wear_leveling_worker - wear-leveling worker function.
  * @ubi: UBI device description object
@@ -1026,7 +1008,7 @@ out_not_moved:
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	if (dst_leb_clean) {
-		ensure_wear_leveling(ubi, 1);
+		ensure_wear_leveling(ubi);
 	} else {
 		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
 		if (err)
@@ -1069,13 +1051,12 @@ out_cancel:
 /**
  * ensure_wear_leveling - schedule wear-leveling if it is needed.
  * @ubi: UBI device description object
- * @nested: set to non-zero if this function is called from UBI worker
  *
  * This function checks if it is time to start wear-leveling and schedules it
  * if yes. This function returns zero in case of success and a negative error
  * code in case of failure.
  */
-static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
+static int ensure_wear_leveling(struct ubi_device *ubi)
 {
 	int err = 0;
 	struct ubi_wl_entry *e1;
@@ -1122,10 +1103,8 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 
 	wrk->anchor = 0;
 	wrk->func = &wear_leveling_worker;
-	if (nested)
-		__schedule_ubi_work(ubi, wrk);
-	else
-		schedule_ubi_work(ubi, wrk);
+	schedule_ubi_work(ubi, wrk);
+
 	return err;
 
 out_cancel:
@@ -1173,7 +1152,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 		serve_prot_queue(ubi);
 
 		/* And take care about wear-leveling */
-		err = ensure_wear_leveling(ubi, 1);
+		err = ensure_wear_leveling(ubi);
 		return err;
 	}
 
@@ -1434,7 +1413,7 @@ retry:
 	 * Technically scrubbing is the same as wear-leveling, so it is done
 	 * by the WL worker.
 	 */
-	return ensure_wear_leveling(ubi, 0);
+	return ensure_wear_leveling(ubi);
 }
 
 /**
@@ -1718,7 +1697,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi->rsvd_pebs += reserved_pebs;
 
 	/* Schedule wear-leveling if needed */
-	err = ensure_wear_leveling(ubi, 0);
+	err = ensure_wear_leveling(ubi);
 	if (err)
 		goto out_free;
 
-- 
2.7.3
