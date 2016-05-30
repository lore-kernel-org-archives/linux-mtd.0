Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005KW-IC
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 07/13] ubi: Move work related functions to work.c
Date: Mon, 30 May 2016 14:04:28 +0200
Message-Id: <1464609874-15488-8-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/Makefile     |   2 +-
 drivers/mtd/ubi/cdev.c       |   2 +-
 drivers/mtd/ubi/fastmap-wl.c |   4 +-
 drivers/mtd/ubi/fastmap.c    |   4 +-
 drivers/mtd/ubi/kapi.c       |   2 +-
 drivers/mtd/ubi/ubi.h        |  16 ++-
 drivers/mtd/ubi/upd.c        |   4 +-
 drivers/mtd/ubi/vmt.c        |   2 +-
 drivers/mtd/ubi/wl.c         | 309 +-----------------------------------------
 drivers/mtd/ubi/work.c       | 316 +++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 343 insertions(+), 318 deletions(-)
 create mode 100644 drivers/mtd/ubi/work.c

diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index 4e3c3d7..e9d4b1d 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -1,7 +1,7 @@
 obj-$(CONFIG_MTD_UBI) += ubi.o
 
 ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o attach.o
-ubi-y += misc.o debug.o
+ubi-y += work.o misc.o debug.o
 ubi-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
 ubi-$(CONFIG_MTD_UBI_BLOCK) += block.o
 
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7e49de9..833c0a82 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -495,7 +495,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		if (err)
 			break;
 
-		err = ubi_wl_flush(ubi);
+		err = ubi_work_flush(ubi);
 		break;
 	}
 
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index c740095..f6dc426 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -184,7 +184,7 @@ static int produce_free_peb(struct ubi_device *ubi)
 {
 	while (!ubi->free.rb_node) {
 		dbg_wl("do one work synchronously");
-		if (!wl_do_one_work_sync(ubi)) {
+		if (!ubi_work_join_one(ubi)) {
 			/* Nothing to do. We have to give up. */
 			return -ENOSPC;
 		}
@@ -301,7 +301,7 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 
 	wrk->anchor = 1;
 	wrk->func = &wear_leveling_worker;
-	schedule_ubi_work(ubi, wrk);
+	ubi_schedule_work(ubi, wrk);
 	return 0;
 }
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 3d5e674..c878313 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1607,11 +1607,11 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		new_fm->e[0] = tmp_e;
 	}
 
-	ubi_wl_suspend_work(ubi);
+	ubi_work_suspend(ubi);
 	down_write(&ubi->fm_eba_sem);
 	ret = ubi_write_fastmap(ubi, new_fm);
 	up_write(&ubi->fm_eba_sem);
-	ubi_wl_resume_work(ubi);
+	ubi_work_resume(ubi);
 
 	if (ret)
 		goto err;
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 11ca859..dc315c2 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -624,7 +624,7 @@ int ubi_leb_erase(struct ubi_volume_desc *desc, int lnum)
 	if (err)
 		return err;
 
-	return ubi_wl_flush(ubi);
+	return ubi_work_flush(ubi);
 }
 EXPORT_SYMBOL_GPL(ubi_leb_erase);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 107a9d9..0f57786 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -859,19 +859,25 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
-int ubi_wl_flush(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
-int ubi_thread(void *u);
 struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor);
 int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 		      int lnum, int torture);
-int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
-void ubi_wl_suspend_work(struct ubi_device *ubi);
-void ubi_wl_resume_work(struct ubi_device *ubi);
+
+/* work.c */
+int ubi_thread(void *u);
+int ubi_is_erase_work(struct ubi_work *wrk);
+void ubi_work_suspend(struct ubi_device *ubi);
+void ubi_work_resume(struct ubi_device *ubi);
+void ubi_schedule_work(struct ubi_device *ubi, struct ubi_work *wrk);
+void ubi_work_close(struct ubi_device *ubi, int error);
+struct ubi_work *ubi_alloc_work(struct ubi_device *ubi);
+int ubi_work_flush(struct ubi_device *ubi);
+bool ubi_work_join_one(struct ubi_device *ubi);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index b7901ce..ffaface 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -149,7 +149,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 	}
 
 	if (bytes == 0) {
-		err = ubi_wl_flush(ubi);
+		err = ubi_work_flush(ubi);
 		if (err)
 			return err;
 
@@ -361,7 +361,7 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	ubi_assert(vol->upd_received <= vol->upd_bytes);
 	if (vol->upd_received == vol->upd_bytes) {
-		err = ubi_wl_flush(ubi);
+		err = ubi_work_flush(ubi);
 		if (err)
 			return err;
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 714e0b3..8a2e081 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -237,7 +237,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	 * Finish all pending erases because there may be some LEBs belonging
 	 * to the same volume ID.
 	 */
-	err = ubi_wl_flush(ubi);
+	err = ubi_work_flush(ubi);
 	if (err)
 		goto out_acc;
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a80f019..35196c8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -129,12 +129,6 @@
  */
 #define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
 
-/*
- * Maximum number of consecutive background thread failures which is enough to
- * switch to read-only mode.
- */
-#define WL_MAX_FAILURES 32
-
 static int self_check_ec(struct ubi_device *ubi, int pnum, int ec);
 static int self_check_in_wl_tree(const struct ubi_device *ubi,
 				 struct ubi_wl_entry *e, struct rb_root *root);
@@ -192,151 +186,6 @@ static void wl_entry_destroy(struct ubi_device *ubi, struct ubi_wl_entry *e)
 }
 
 /**
- * destroy_work - destroy an UBI work.
- * @ref: kref object
- *
- * This function is called by kref upon the last reference is gone.
- */
-static void destroy_work(struct kref *ref)
-{
-	struct ubi_work *wrk = container_of(ref, struct ubi_work, ref);
-
-	kfree(wrk);
-}
-
-/**
- * wl_work_suspended - Check whether UBI work is suspended.
- * @e: the wear-leveling entry to add
- */
-static bool wl_work_suspended(struct ubi_device *ubi)
-{
-	return ubi->thread_suspended || !ubi->thread_enabled;
-}
-
-/**
- * do_work - do one pending work.
- * @ubi: UBI device description object
- *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- */
-static int do_work(struct ubi_device *ubi)
-{
-	int err;
-	struct ubi_work *wrk;
-
-	cond_resched();
-
-	mutex_lock(&ubi->work_mutex);
-	spin_lock(&ubi->wl_lock);
-	ubi_assert(!ubi->cur_work);
-	if (list_empty(&ubi->works) || wl_work_suspended(ubi)) {
-		spin_unlock(&ubi->wl_lock);
-		mutex_unlock(&ubi->work_mutex);
-		return 0;
-	}
-
-	wrk = list_entry(ubi->works.next, struct ubi_work, list);
-	list_del(&wrk->list);
-	ubi->works_count -= 1;
-	ubi_assert(ubi->works_count >= 0);
-	ubi->cur_work = wrk;
-	spin_unlock(&ubi->wl_lock);
-	mutex_unlock(&ubi->work_mutex);
-
-	/*
-	 * Call the worker function. Do not touch the work structure
-	 * after this call as it will have been freed or reused by that
-	 * time by the worker function.
-	 */
-	err = wrk->func(ubi, wrk, 0);
-	wrk->ret = err;
-	if (err)
-		ubi_err(ubi, "work failed with error code %d", err);
-
-	spin_lock(&ubi->wl_lock);
-	ubi->cur_work = NULL;
-	spin_unlock(&ubi->wl_lock);
-
-	complete_all(&wrk->comp);
-
-	spin_lock(&ubi->wl_lock);
-	kref_put(&wrk->ref, destroy_work);
-	spin_unlock(&ubi->wl_lock);
-
-	return err;
-}
-
-void ubi_wl_suspend_work(struct ubi_device *ubi)
-{
-	struct ubi_work *wrk = NULL;
-
-	mutex_lock(&ubi->work_mutex);
-	spin_lock(&ubi->wl_lock);
-
-	wrk = ubi->cur_work;
-	if (wrk)
-		kref_get(&wrk->ref);
-
-	ubi->thread_suspended = 1;
-
-	spin_unlock(&ubi->wl_lock);
-	mutex_unlock(&ubi->work_mutex);
-
-	if (wrk) {
-		wait_for_completion(&wrk->comp);
-		spin_lock(&ubi->wl_lock);
-		kref_put(&wrk->ref, destroy_work);
-		spin_unlock(&ubi->wl_lock);
-	}
-}
-
-void ubi_wl_resume_work(struct ubi_device *ubi)
-{
-	ubi->thread_suspended = 0;
-	wake_up_process(ubi->bgt_thread);
-}
-
-/**
- * wl_do_one_work_sync - Run one work in sync.
- * @ubi: UBI device description object
- *
- * This function joins one work and waits for it.
- * Call it when you run out of free LEBs need to wait for one.
- * It returns false if no pending work was found to join, true otherwise.
- */
-static bool wl_do_one_work_sync(struct ubi_device *ubi)
-{
-	struct ubi_work *wrk;
-	bool success = false;
-
-	mutex_lock(&ubi->work_mutex);
-	spin_lock(&ubi->wl_lock);
-	if (ubi->cur_work)
-		wrk = ubi->cur_work;
-	else
-		wrk = list_first_entry_or_null(&ubi->works,
-			struct ubi_work, list);
-
-	if (wrk)
-		kref_get(&wrk->ref);
-	spin_unlock(&ubi->wl_lock);
-	mutex_unlock(&ubi->work_mutex);
-
-	if (wrk) {
-		wait_for_completion(&wrk->comp);
-		if (wrk->ret == 0)
-			success = true;
-
-		spin_lock(&ubi->wl_lock);
-		kref_put(&wrk->ref, destroy_work);
-		spin_unlock(&ubi->wl_lock);
-	}
-
-	return success;
-}
-
-/**
  * in_wl_tree - check if wear-leveling entry is present in a WL RB-tree.
  * @e: the wear-leveling entry to check
  * @root: the root of the tree
@@ -629,32 +478,6 @@ repeat:
 	spin_unlock(&ubi->wl_lock);
 }
 
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
-	ubi_assert(ubi->thread_enabled);
-
-	mutex_lock(&ubi->work_mutex);
-	spin_lock(&ubi->wl_lock);
-	INIT_LIST_HEAD(&wrk->list);
-	kref_init(&wrk->ref);
-	init_completion(&wrk->comp);
-	list_add_tail(&wrk->list, &ubi->works);
-	ubi_assert(ubi->works_count >= 0);
-	ubi->works_count += 1;
-	if (!wl_work_suspended(ubi))
-		wake_up_process(ubi->bgt_thread);
-	spin_unlock(&ubi->wl_lock);
-	mutex_unlock(&ubi->work_mutex);
-}
-
 static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 			int shutdown);
 
@@ -689,7 +512,8 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	wl_wrk->lnum = lnum;
 	wl_wrk->torture = torture;
 
-	schedule_ubi_work(ubi, wl_wrk);
+	ubi_schedule_work(ubi, wl_wrk);
+
 	return 0;
 }
 
@@ -1103,7 +927,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi)
 
 	wrk->anchor = 0;
 	wrk->func = &wear_leveling_worker;
-	schedule_ubi_work(ubi, wrk);
+	ubi_schedule_work(ubi, wrk);
 
 	return err;
 
@@ -1417,39 +1241,6 @@ retry:
 }
 
 /**
- * ubi_wl_flush - flush all pending works.
- * @ubi: UBI device description object
- *
- */
-int ubi_wl_flush(struct ubi_device *ubi)
-{
-	int ret = 0;
-	struct ubi_work *wrk = NULL;
-
-	dbg_wl("flush (%d pending works)", ubi->works_count);
-
-	/* Find the last entry in the work list and wait for it. */
-	mutex_lock(&ubi->work_mutex);
-	spin_lock(&ubi->wl_lock);
-	if (!list_empty(&ubi->works)) {
-		wrk = list_last_entry(&ubi->works, struct ubi_work, list);
-		kref_get(&wrk->ref);
-	}
-	spin_unlock(&ubi->wl_lock);
-	mutex_unlock(&ubi->work_mutex);
-
-	if (wrk) {
-		wait_for_completion(&wrk->comp);
-		ret = wrk->ret;
-		spin_lock(&ubi->wl_lock);
-		kref_put(&wrk->ref, destroy_work);
-		spin_unlock(&ubi->wl_lock);
-	}
-
-	return ret;
-}
-
-/**
  * tree_destroy - destroy an RB-tree.
  * @ubi: UBI device description object
  * @root: the root of the tree to destroy
@@ -1481,94 +1272,6 @@ static void tree_destroy(struct ubi_device *ubi, struct rb_root *root)
 	}
 }
 
-static void __shutdown_work(struct ubi_device *ubi, int error)
-{
-	struct ubi_work *wrk;
-
-	while (!list_empty(&ubi->works)) {
-		wrk = list_entry(ubi->works.next, struct ubi_work, list);
-		list_del(&wrk->list);
-		wrk->func(ubi, wrk, 1);
-		wrk->ret = error;
-		complete_all(&wrk->comp);
-		spin_lock(&ubi->wl_lock);
-		kref_put(&wrk->ref, destroy_work);
-		spin_unlock(&ubi->wl_lock);
-		ubi->works_count -= 1;
-		ubi_assert(ubi->works_count >= 0);
-	}
-}
-
-/**
- * ubi_thread - UBI background thread.
- * @u: the UBI device description object pointer
- */
-int ubi_thread(void *u)
-{
-	int failures = 0;
-	struct ubi_device *ubi = u;
-
-	ubi_msg(ubi, "background thread \"%s\" started, PID %d",
-		ubi->bgt_name, task_pid_nr(current));
-
-	set_freezable();
-	for (;;) {
-		int err;
-
-		if (kthread_should_stop())
-			break;
-
-		if (try_to_freeze())
-			continue;
-
-		spin_lock(&ubi->wl_lock);
-		if (list_empty(&ubi->works) || ubi->ro_mode ||
-		    wl_work_suspended(ubi)) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock(&ubi->wl_lock);
-			schedule();
-			continue;
-		}
-		spin_unlock(&ubi->wl_lock);
-
-		err = do_work(ubi);
-		if (err) {
-			ubi_err(ubi, "%s: work failed with error code %d",
-				ubi->bgt_name, err);
-			if (failures++ > WL_MAX_FAILURES) {
-				/*
-				 * Too many failures, disable the thread and
-				 * switch to read-only mode.
-				 */
-				ubi_err(ubi, "%s: %d consecutive failures",
-					ubi->bgt_name, WL_MAX_FAILURES);
-				__shutdown_work(ubi, -EROFS);
-				ubi_ro_mode(ubi);
-				ubi->thread_enabled = 0;
-				continue;
-			}
-		} else
-			failures = 0;
-
-		cond_resched();
-	}
-
-	dbg_wl("background thread \"%s\" is killed", ubi->bgt_name);
-	return 0;
-}
-
-/**
- * shutdown_work - shutdown all pending works.
- * @ubi: UBI device description object
- */
-static void shutdown_work(struct ubi_device *ubi, int error)
-{
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	flush_work(&ubi->fm_work);
-#endif
-	__shutdown_work(ubi, error);
-}
-
 /**
  * ubi_wl_init - initialize the WL sub-system using attaching information.
  * @ubi: UBI device description object
@@ -1704,7 +1407,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	return 0;
 
 out_free:
-	shutdown_work(ubi, err);
+	ubi_work_close(ubi, err);
 	tree_destroy(ubi, &ubi->used);
 	tree_destroy(ubi, &ubi->free);
 	tree_destroy(ubi, &ubi->scrub);
@@ -1737,7 +1440,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
 	ubi_fastmap_close(ubi);
-	shutdown_work(ubi, 0);
+	ubi_work_close(ubi, 0);
 	protection_queue_destroy(ubi);
 	tree_destroy(ubi, &ubi->used);
 	tree_destroy(ubi, &ubi->erroneous);
@@ -1872,7 +1575,7 @@ static int produce_free_peb(struct ubi_device *ubi)
 		spin_unlock(&ubi->wl_lock);
 
 		dbg_wl("do one work synchronously");
-		if (!wl_do_one_work_sync(ubi)) {
+		if (!ubi_work_join_one(ubi)) {
 			spin_lock(&ubi->wl_lock);
 			/* Nothing to do. We have to give up. */
 			return -ENOSPC;
diff --git a/drivers/mtd/ubi/work.c b/drivers/mtd/ubi/work.c
new file mode 100644
index 0000000..d2f8ba8
--- /dev/null
+++ b/drivers/mtd/ubi/work.c
@@ -0,0 +1,316 @@
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
+#include "ubi.h"
+
+/*
+ * Maximum number of consecutive background thread failures which is enough to
+ * switch to read-only mode.
+ */
+#define WORK_MAX_FAILURES 32
+
+/**
+ * work_suspended - Check whether UBI work is suspended.
+ */
+static bool work_suspended(struct ubi_device *ubi)
+{
+	return ubi->thread_suspended || !ubi->thread_enabled;
+}
+
+
+/**
+ * ubi_schedule_work - schedule a work.
+ * @ubi: UBI device description object
+ * @wrk: the work to schedule
+ *
+ * This function adds a work defined by @wrk to the tail of the pending works
+ * list.
+ */
+void ubi_schedule_work(struct ubi_device *ubi, struct ubi_work *wrk)
+{
+	ubi_assert(ubi->thread_enabled);
+
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+	list_add_tail(&wrk->list, &ubi->works);
+	ubi_assert(ubi->works_count >= 0);
+	ubi->works_count += 1;
+	if (!work_suspended(ubi))
+		wake_up_process(ubi->bgt_thread);
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
+}
+
+struct ubi_work *ubi_alloc_work(struct ubi_device *ubi)
+{
+	struct ubi_work *wrk;
+
+	wrk = kzalloc(sizeof(*wrk), GFP_NOFS);
+	if (!wrk)
+		return NULL;
+
+	INIT_LIST_HEAD(&wrk->list);
+	kref_init(&wrk->ref);
+	init_completion(&wrk->comp);
+
+	return wrk;
+}
+
+/**
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
+static void shutdown_work(struct ubi_device *ubi, int error)
+{
+	struct ubi_work *wrk;
+
+	while (!list_empty(&ubi->works)) {
+		wrk = list_entry(ubi->works.next, struct ubi_work, list);
+		list_del_init(&wrk->list);
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
+/**
+ * ubi_work_close - shutdown all pending works.
+ * @ubi: UBI device description object
+ */
+void ubi_work_close(struct ubi_device *ubi, int error)
+{
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	flush_work(&ubi->fm_work);
+#endif
+	shutdown_work(ubi, error);
+}
+
+/**
+ * do_work - do one pending work.
+ * @ubi: UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int do_work(struct ubi_device *ubi)
+{
+	int err;
+	struct ubi_work *wrk;
+
+	cond_resched();
+
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+	ubi_assert(!ubi->cur_work);
+	if (list_empty(&ubi->works) || work_suspended(ubi)) {
+		spin_unlock(&ubi->wl_lock);
+		mutex_unlock(&ubi->work_mutex);
+		return 0;
+	}
+
+	wrk = list_entry(ubi->works.next, struct ubi_work, list);
+	list_del_init(&wrk->list);
+	ubi->works_count -= 1;
+	ubi_assert(ubi->works_count >= 0);
+	ubi->cur_work = wrk;
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
+
+	/*
+	 * Call the worker function. Do not touch the work structure
+	 * after this call as it will have been freed or reused by that
+	 * time by the worker function.
+	 */
+	err = wrk->func(ubi, wrk, 0);
+	wrk->ret = err;
+	if (err)
+		ubi_err(ubi, "work failed with error code %d", err);
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
+
+	return err;
+}
+
+void ubi_work_suspend(struct ubi_device *ubi)
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
+void ubi_work_resume(struct ubi_device *ubi)
+{
+	ubi->thread_suspended = 0;
+	wake_up_process(ubi->bgt_thread);
+}
+
+/**
+ * ubi_work_join_one - Run one work in sync.
+ * @ubi: UBI device description object
+ *
+ * This function joins one work and waits for it.
+ * Call it when you run out of free LEBs need to wait for one.
+ * It returns false if no pending work was found to join, true otherwise.
+ */
+bool ubi_work_join_one(struct ubi_device *ubi)
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
+/**
+ * ubi_work_flush - flush all pending works.
+ * @ubi: UBI device description object
+ *
+ */
+int ubi_work_flush(struct ubi_device *ubi)
+{
+	int ret = 0;
+	struct ubi_work *wrk = NULL;
+
+	dbg_wl("flush (%d pending works)", ubi->works_count);
+
+	/* Find the last entry in the work list and wait for it. */
+	mutex_lock(&ubi->work_mutex);
+	spin_lock(&ubi->wl_lock);
+	if (!list_empty(&ubi->works)) {
+		wrk = list_last_entry(&ubi->works, struct ubi_work, list);
+		kref_get(&wrk->ref);
+	}
+	spin_unlock(&ubi->wl_lock);
+	mutex_unlock(&ubi->work_mutex);
+
+	if (wrk) {
+		wait_for_completion(&wrk->comp);
+		ret = wrk->ret;
+		spin_lock(&ubi->wl_lock);
+		kref_put(&wrk->ref, destroy_work);
+		spin_unlock(&ubi->wl_lock);
+	}
+
+	return ret;
+}
+
+/**
+ * ubi_thread - UBI background thread.
+ * @u: the UBI device description object pointer
+ */
+int ubi_thread(void *u)
+{
+	int failures = 0;
+	struct ubi_device *ubi = u;
+
+	ubi_msg(ubi, "background thread \"%s\" started, PID %d",
+		ubi->bgt_name, task_pid_nr(current));
+
+	set_freezable();
+	for (;;) {
+		int err;
+
+		if (kthread_should_stop())
+			break;
+
+		if (try_to_freeze())
+			continue;
+
+		spin_lock(&ubi->wl_lock);
+		if (list_empty(&ubi->works) || ubi->ro_mode ||
+		    work_suspended(ubi)) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			spin_unlock(&ubi->wl_lock);
+			schedule();
+			continue;
+		}
+		spin_unlock(&ubi->wl_lock);
+
+		err = do_work(ubi);
+		if (err) {
+			ubi_err(ubi, "%s: work failed with error code %d",
+				ubi->bgt_name, err);
+			if (failures++ > WORK_MAX_FAILURES) {
+				/*
+				 * Too many failures, disable the thread and
+				 * switch to read-only mode.
+				 */
+				ubi_err(ubi, "%s: %d consecutive failures",
+					ubi->bgt_name, WORK_MAX_FAILURES);
+				shutdown_work(ubi, -EROFS);
+				ubi_ro_mode(ubi);
+				ubi->thread_enabled = 0;
+				continue;
+			}
+		} else
+			failures = 0;
+
+		cond_resched();
+	}
+
+	dbg_wl("background thread \"%s\" is killed", ubi->bgt_name);
+	return 0;
+}
+
-- 
2.7.3
