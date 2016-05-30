Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7LwV-00048t-KS
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 02/13] ubi: Rework UBI worker
Date: Mon, 30 May 2016 14:04:23 +0200
Message-Id: <1464609874-15488-3-git-send-email-richard@nod.at>
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

>From now on all UBI work is done exclusively within the worker thread.
This relaxes the locking situation a lot. It also allows us to run work
without an extra lock held.
Waiting for work is now implemented using a struct completition.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c      |   5 +-
 drivers/mtd/ubi/fastmap-wl.c |  12 +-
 drivers/mtd/ubi/fastmap.c    |   4 +-
 drivers/mtd/ubi/ubi.h        |  19 +++-
 drivers/mtd/ubi/upd.c        |   1 +
 drivers/mtd/ubi/wl.c         | 254 +++++++++++++++++++++++++++++++------------
 6 files changed, 211 insertions(+), 84 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 16baeb5..ee3c833 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -979,6 +979,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (!ubi->fm_buf)
 		goto out_free;
 #endif
+	ubi->thread_enabled = 1;
+	ubi->thread_suspended = 1;
+
 	err = ubi_attach(ubi, 0);
 	if (err) {
 		ubi_err(ubi, "failed to attach mtd%d, error %d",
@@ -1032,7 +1035,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * checks @ubi->thread_enabled. Otherwise we may fail to wake it up.
 	 */
 	spin_lock(&ubi->wl_lock);
-	ubi->thread_enabled = 1;
+	ubi->thread_suspended = 0;
 	wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 30d3999..c740095 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -182,14 +182,12 @@ void ubi_refill_pools(struct ubi_device *ubi)
  */
 static int produce_free_peb(struct ubi_device *ubi)
 {
-	int err;
-
-	while (!ubi->free.rb_node && ubi->works_count) {
+	while (!ubi->free.rb_node) {
 		dbg_wl("do one work synchronously");
-		err = do_work(ubi);
-
-		if (err)
-			return err;
+		if (!wl_do_one_work_sync(ubi)) {
+			/* Nothing to do. We have to give up. */
+			return -ENOSPC;
+		}
 	}
 
 	return 0;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 990898b..3d5e674 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1607,11 +1607,11 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		new_fm->e[0] = tmp_e;
 	}
 
-	down_write(&ubi->work_sem);
+	ubi_wl_suspend_work(ubi);
 	down_write(&ubi->fm_eba_sem);
 	ret = ubi_write_fastmap(ubi, new_fm);
 	up_write(&ubi->fm_eba_sem);
-	up_write(&ubi->work_sem);
+	ubi_wl_resume_work(ubi);
 
 	if (ret)
 		goto err;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c472aad..4486869 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -30,6 +30,8 @@
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
+#include <linux/completion.h>
+#include <linux/kref.h>
 #include <linux/fs.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
@@ -481,8 +483,8 @@ struct ubi_debug_info {
  *	     @erroneous, @erroneous_peb_count, @fm_work_scheduled, @fm_pool,
  *	     and @fm_wl_pool fields
  * @move_mutex: serializes eraseblock moves
- * @work_sem: used to wait for all the scheduled works to finish and prevent
- * new works from being submitted
+ * @work_mutex: used to protect the worker thread and block it temporary
+ * @cur_work: Pointer to the currently executed work
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
  * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object for any
  *             physical eraseblock
@@ -493,6 +495,7 @@ struct ubi_debug_info {
  * @works_count: count of pending works
  * @bgt_thread: background thread description object
  * @thread_enabled: if the background thread is enabled
+ * @thread_suspended: if the background thread is suspended
  * @bgt_name: background thread name
  *
  * @flash_size: underlying MTD device size (in bytes)
@@ -587,7 +590,8 @@ struct ubi_device {
 	int pq_head;
 	spinlock_t wl_lock;
 	struct mutex move_mutex;
-	struct rw_semaphore work_sem;
+	struct mutex work_mutex;
+	struct ubi_work *cur_work;
 	int wl_scheduled;
 	struct ubi_wl_entry **lookuptbl;
 	struct ubi_wl_entry *move_from;
@@ -597,6 +601,7 @@ struct ubi_device {
 	int works_count;
 	struct task_struct *bgt_thread;
 	int thread_enabled;
+	int thread_suspended;
 	char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
 
 	/* I/O sub-system's stuff */
@@ -752,6 +757,9 @@ struct ubi_attach_info {
  * struct ubi_work - UBI work description data structure.
  * @list: a link in the list of pending works
  * @func: worker function
+ * @ret: return value of the worker function
+ * @comp: completion to wait on a work
+ * @ref: reference counter for work objects
  * @e: physical eraseblock to erase
  * @vol_id: the volume ID on which this erasure is being performed
  * @lnum: the logical eraseblock number
@@ -767,6 +775,9 @@ struct ubi_attach_info {
 struct ubi_work {
 	struct list_head list;
 	int (*func)(struct ubi_device *ubi, struct ubi_work *wrk, int shutdown);
+	int ret;
+	struct completion comp;
+	struct kref ref;
 	/* The below fields are only relevant to erasure works */
 	struct ubi_wl_entry *e;
 	int vol_id;
@@ -865,6 +876,8 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
+void ubi_wl_suspend_work(struct ubi_device *ubi);
+void ubi_wl_resume_work(struct ubi_device *ubi);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 6799cc4..b7901ce 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -364,6 +364,7 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 		err = ubi_wl_flush(ubi);
 		if (err)
 			return err;
+
 		/* The update is finished, clear the update marker */
 		err = clear_update_marker(ubi, vol, vol->upd_bytes);
 		if (err)
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a54c3f4..8e6e8cf 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -192,6 +192,28 @@ static void wl_entry_destroy(struct ubi_device *ubi, struct ubi_wl_entry *e)
 }
 
 /**
+ * destroy_work - destroy an UBI work.
+ * @ref: kref object
+ *
+ * This function is called by kref upon the last reference is gone.
+ */
+static void destroy_work(struct kref *ref)
+{
+	struct ubi_work *wrk = container_of(ref, struct ubi_work, ref);
+
+	kfree(wrk);
+}
+
+/**
+ * wl_work_suspended - Check whether UBI work is suspended.
+ * @e: the wear-leveling entry to add
+ */
+static bool wl_work_suspended(struct ubi_device *ubi)
+{
+	return ubi->thread_suspended || !ubi->thread_enabled;
+}
+
+/**
  * do_work - do one pending work.
  * @ubi: UBI device description object
  *
@@ -205,17 +227,12 @@ static int do_work(struct ubi_device *ubi)
 
 	cond_resched();
 
-	/*
-	 * @ubi->work_sem is used to synchronize with the workers. Workers take
-	 * it in read mode, so many of them may be doing works at a time. But
-	 * the queue flush code has to be sure the whole queue of works is
-	 * done, and it takes the mutex in write mode.
-	 */
-	down_read(&ubi->work_sem);
+	mutex_lock(&ubi->work_mutex);
 	spin_lock(&ubi->wl_lock);
-	if (list_empty(&ubi->works)) {
+	ubi_assert(!ubi->cur_work);
+	if (list_empty(&ubi->works) || wl_work_suspended(ubi)) {
 		spin_unlock(&ubi->wl_lock);
-		up_read(&ubi->work_sem);
+		mutex_unlock(&ubi->work_mutex);
 		return 0;
 	}
 
@@ -223,7 +240,9 @@ static int do_work(struct ubi_device *ubi)
 	list_del(&wrk->list);
 	ubi->works_count -= 1;
 	ubi_assert(ubi->works_count >= 0);
+	ubi->cur_work = wrk;
 	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
 
 	/*
 	 * Call the worker function. Do not touch the work structure
@@ -231,13 +250,92 @@ static int do_work(struct ubi_device *ubi)
 	 * time by the worker function.
 	 */
 	err = wrk->func(ubi, wrk, 0);
+	wrk->ret = err;
 	if (err)
 		ubi_err(ubi, "work failed with error code %d", err);
-	up_read(&ubi->work_sem);
+
+	spin_lock(&ubi->wl_lock);
+	ubi->cur_work = NULL;
+	spin_unlock(&ubi->wl_lock);
+
+	complete_all(&wrk->comp);
+
+	spin_lock(&ubi->wl_lock);
+	kref_put(&wrk->ref, destroy_work);
+	spin_unlock(&ubi->wl_lock);
 
 	return err;
 }
 
+void ubi_wl_suspend_work(struct ubi_device *ubi)
+{
+	struct ubi_work *wrk = NULL;
+
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+
+	wrk = ubi->cur_work;
+	if (wrk)
+		kref_get(&wrk->ref);
+
+	ubi->thread_suspended = 1;
+
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
+
+	if (wrk) {
+		wait_for_completion(&wrk->comp);
+		spin_lock(&ubi->wl_lock);
+		kref_put(&wrk->ref, destroy_work);
+		spin_unlock(&ubi->wl_lock);
+	}
+}
+
+void ubi_wl_resume_work(struct ubi_device *ubi)
+{
+	ubi->thread_suspended = 0;
+	wake_up_process(ubi->bgt_thread);
+}
+
+/**
+ * wl_do_one_work_sync - Run one work in sync.
+ * @ubi: UBI device description object
+ *
+ * This function joins one work and waits for it.
+ * Call it when you run out of free LEBs need to wait for one.
+ * It returns false if no pending work was found to join, true otherwise.
+ */
+static bool wl_do_one_work_sync(struct ubi_device *ubi)
+{
+	struct ubi_work *wrk;
+	bool success = false;
+
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+	if (ubi->cur_work)
+		wrk = ubi->cur_work;
+	else
+		wrk = list_first_entry_or_null(&ubi->works,
+			struct ubi_work, list);
+
+	if (wrk)
+		kref_get(&wrk->ref);
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
+
+	if (wrk) {
+		wait_for_completion(&wrk->comp);
+		if (wrk->ret == 0)
+			success = true;
+
+		spin_lock(&ubi->wl_lock);
+		kref_put(&wrk->ref, destroy_work);
+		spin_unlock(&ubi->wl_lock);
+	}
+
+	return success;
+}
+
 /**
  * in_wl_tree - check if wear-leveling entry is present in a WL RB-tree.
  * @e: the wear-leveling entry to check
@@ -531,21 +629,31 @@ repeat:
 	spin_unlock(&ubi->wl_lock);
 }
 
+static bool wl_work_suspended(struct ubi_device *ubi)
+{
+	return ubi->thread_suspended || !ubi->thread_enabled;
+}
+
 /**
  * __schedule_ubi_work - schedule a work.
  * @ubi: UBI device description object
  * @wrk: the work to schedule
  *
  * This function adds a work defined by @wrk to the tail of the pending works
- * list. Can only be used if ubi->work_sem is already held in read mode!
+ * list. Can only be used if ubi->work_mutex is already held.
  */
 static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 {
+	ubi_assert(ubi->thread_enabled);
+
 	spin_lock(&ubi->wl_lock);
+	INIT_LIST_HEAD(&wrk->list);
+	kref_init(&wrk->ref);
+	init_completion(&wrk->comp);
 	list_add_tail(&wrk->list, &ubi->works);
 	ubi_assert(ubi->works_count >= 0);
 	ubi->works_count += 1;
-	if (ubi->thread_enabled && !ubi_dbg_is_bgt_disabled(ubi))
+	if (!wl_work_suspended(ubi) && !ubi_dbg_is_bgt_disabled(ubi))
 		wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 }
@@ -560,9 +668,9 @@ static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
  */
 static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 {
-	down_read(&ubi->work_sem);
+	mutex_lock(&ubi->work_mutex);
 	__schedule_ubi_work(ubi, wrk);
-	up_read(&ubi->work_sem);
+	mutex_unlock(&ubi->work_mutex);
 }
 
 static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
@@ -616,16 +724,20 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk);
 static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 			 int vol_id, int lnum, int torture)
 {
-	struct ubi_work wl_wrk;
+	struct ubi_work *wl_wrk;
 
 	dbg_wl("sync erase of PEB %i", e->pnum);
 
-	wl_wrk.e = e;
-	wl_wrk.vol_id = vol_id;
-	wl_wrk.lnum = lnum;
-	wl_wrk.torture = torture;
+	wl_wrk = ubi_alloc_work(ubi);
+	if (!wl_wrk)
+		return -ENOMEM;
+
+	wl_wrk->e = e;
+	wl_wrk->vol_id = vol_id;
+	wl_wrk->lnum = lnum;
+	wl_wrk->torture = torture;
 
-	return __erase_worker(ubi, &wl_wrk);
+	return __erase_worker(ubi, wl_wrk);
 }
 
 static int ensure_wear_leveling(struct ubi_device *ubi, int nested);
@@ -652,7 +764,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	struct ubi_vid_hdr *vid_hdr;
 	int dst_leb_clean = 0;
 
-	kfree(wrk);
 	if (shutdown)
 		return 0;
 
@@ -1160,13 +1271,11 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		struct ubi_wl_entry *e = wl_wrk->e;
 
 		dbg_wl("cancel erasure of PEB %d EC %d", e->pnum, e->ec);
-		kfree(wl_wrk);
 		wl_entry_destroy(ubi, e);
 		return 0;
 	}
 
 	ret = __erase_worker(ubi, wl_wrk);
-	kfree(wl_wrk);
 	return ret;
 }
 
@@ -1332,43 +1441,33 @@ retry:
  * ubi_wl_flush - flush all pending works.
  * @ubi: UBI device description object
  *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
  */
 int ubi_wl_flush(struct ubi_device *ubi)
 {
-	int err = 0;
+	int ret = 0;
+	struct ubi_work *wrk = NULL;
 
-	/*
-	 * Erase while the pending works queue is not empty, but not more than
-	 * the number of currently pending works.
-	 */
 	dbg_wl("flush (%d pending works)", ubi->works_count);
-	while (ubi->works_count) {
-		err = do_work(ubi);
-		if (err)
-			return err;
-	}
 
-	/*
-	 * Make sure all the works which have been done in parallel are
-	 * finished.
-	 */
-	down_write(&ubi->work_sem);
-	up_write(&ubi->work_sem);
+	/* Find the last entry in the work list and wait for it. */
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+	if (!list_empty(&ubi->works)) {
+		wrk = list_last_entry(&ubi->works, struct ubi_work, list);
+		kref_get(&wrk->ref);
+	}
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
 
-	/*
-	 * And in case last was the WL worker and it canceled the LEB
-	 * movement, flush again.
-	 */
-	while (ubi->works_count) {
-		dbg_wl("flush more (%d pending works)", ubi->works_count);
-		err = do_work(ubi);
-		if (err)
-			return err;
+	if (wrk) {
+		wait_for_completion(&wrk->comp);
+		ret = wrk->ret;
+		spin_lock(&ubi->wl_lock);
+		kref_put(&wrk->ref, destroy_work);
+		spin_unlock(&ubi->wl_lock);
 	}
 
-	return err;
+	return ret;
 }
 
 /**
@@ -1403,6 +1502,24 @@ static void tree_destroy(struct ubi_device *ubi, struct rb_root *root)
 	}
 }
 
+static void __shutdown_work(struct ubi_device *ubi, int error)
+{
+	struct ubi_work *wrk;
+
+	while (!list_empty(&ubi->works)) {
+		wrk = list_entry(ubi->works.next, struct ubi_work, list);
+		list_del(&wrk->list);
+		wrk->func(ubi, wrk, 1);
+		wrk->ret = error;
+		complete_all(&wrk->comp);
+		spin_lock(&ubi->wl_lock);
+		kref_put(&wrk->ref, destroy_work);
+		spin_unlock(&ubi->wl_lock);
+		ubi->works_count -= 1;
+		ubi_assert(ubi->works_count >= 0);
+	}
+}
+
 /**
  * ubi_thread - UBI background thread.
  * @u: the UBI device description object pointer
@@ -1427,7 +1544,7 @@ int ubi_thread(void *u)
 
 		spin_lock(&ubi->wl_lock);
 		if (list_empty(&ubi->works) || ubi->ro_mode ||
-		    !ubi->thread_enabled || ubi_dbg_is_bgt_disabled(ubi)) {
+		    wl_work_suspended(ubi) || ubi_dbg_is_bgt_disabled(ubi)) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			spin_unlock(&ubi->wl_lock);
 			schedule();
@@ -1444,8 +1561,9 @@ int ubi_thread(void *u)
 				 * Too many failures, disable the thread and
 				 * switch to read-only mode.
 				 */
-				ubi_msg(ubi, "%s: %d consecutive failures",
+				ubi_err(ubi, "%s: %d consecutive failures",
 					ubi->bgt_name, WL_MAX_FAILURES);
+				__shutdown_work(ubi, -EROFS);
 				ubi_ro_mode(ubi);
 				ubi->thread_enabled = 0;
 				continue;
@@ -1464,20 +1582,12 @@ int ubi_thread(void *u)
  * shutdown_work - shutdown all pending works.
  * @ubi: UBI device description object
  */
-static void shutdown_work(struct ubi_device *ubi)
+static void shutdown_work(struct ubi_device *ubi, int error)
 {
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	flush_work(&ubi->fm_work);
 #endif
-	while (!list_empty(&ubi->works)) {
-		struct ubi_work *wrk;
-
-		wrk = list_entry(ubi->works.next, struct ubi_work, list);
-		list_del(&wrk->list);
-		wrk->func(ubi, wrk, 1);
-		ubi->works_count -= 1;
-		ubi_assert(ubi->works_count >= 0);
-	}
+	__shutdown_work(ubi, error);
 }
 
 /**
@@ -1499,7 +1609,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi->used = ubi->erroneous = ubi->free = ubi->scrub = RB_ROOT;
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
-	init_rwsem(&ubi->work_sem);
+	mutex_init(&ubi->work_mutex);
 	ubi->max_ec = ai->max_ec;
 	INIT_LIST_HEAD(&ubi->works);
 
@@ -1615,7 +1725,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	return 0;
 
 out_free:
-	shutdown_work(ubi);
+	shutdown_work(ubi, err);
 	tree_destroy(ubi, &ubi->used);
 	tree_destroy(ubi, &ubi->free);
 	tree_destroy(ubi, &ubi->scrub);
@@ -1648,7 +1758,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
 	ubi_fastmap_close(ubi);
-	shutdown_work(ubi);
+	shutdown_work(ubi, 0);
 	protection_queue_destroy(ubi);
 	tree_destroy(ubi, &ubi->used);
 	tree_destroy(ubi, &ubi->erroneous);
@@ -1777,17 +1887,19 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
  */
 static int produce_free_peb(struct ubi_device *ubi)
 {
-	int err;
+	ubi_assert(spin_is_locked(&ubi->wl_lock));
 
-	while (!ubi->free.rb_node && ubi->works_count) {
+	while (!ubi->free.rb_node) {
 		spin_unlock(&ubi->wl_lock);
 
 		dbg_wl("do one work synchronously");
-		err = do_work(ubi);
+		if (!wl_do_one_work_sync(ubi)) {
+			spin_lock(&ubi->wl_lock);
+			/* Nothing to do. We have to give up. */
+			return -ENOSPC;
+		}
 
 		spin_lock(&ubi->wl_lock);
-		if (err)
-			return err;
 	}
 
 	return 0;
-- 
2.7.3
