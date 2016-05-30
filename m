Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005Kn-IE
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 13/13] ubi: Add debugfs knob to trigger LEB consolidation
Date: Mon, 30 May 2016 14:04:34 +0200
Message-Id: <1464609874-15488-14-git-send-email-richard@nod.at>
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

...useful in combination with force_leb_consolidation
to test the worker.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/consolidate.c | 14 ++++++++++++++
 drivers/mtd/ubi/debug.c       | 12 ++++++++++++
 drivers/mtd/ubi/ubi.h         |  5 +++++
 drivers/mtd/ubi/work.c        | 42 +++++++++++++++++++++++++++++-------------
 4 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/consolidate.c b/drivers/mtd/ubi/consolidate.c
index 7313be0..61b9903 100644
--- a/drivers/mtd/ubi/consolidate.c
+++ b/drivers/mtd/ubi/consolidate.c
@@ -359,6 +359,20 @@ void ubi_conso_schedule(struct ubi_device *ubi)
 		BUG();
 }
 
+int ubi_conso_sync(struct ubi_device *ubi)
+{
+	int ret = -ENOMEM;
+
+	struct ubi_work *wrk = ubi_alloc_work(ubi);
+
+	if (wrk) {
+		wrk->func = &consolidation_worker;
+		ret = ubi_schedule_work_sync(ubi, wrk);
+	}
+
+	return ret;
+}
+
 void ubi_eba_consolidate(struct ubi_device *ubi)
 {
 	if (consolidation_possible(ubi) && ubi->consolidation_pnum >= 0)
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 14b0ce5..98812bc 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -378,6 +378,11 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		d->emulate_io_failures = val;
 	else if (dent == d->dfs_force_leb_consolidation)
 		d->force_leb_consolidation = val;
+	else if (dent == d->dfs_trigger_leb_consolidation) {
+		val = ubi_conso_sync(ubi);
+		if (val < 0)
+			count = val;
+	}
 	else
 		count = -EINVAL;
 
@@ -490,6 +495,13 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_force_leb_consolidation = dent;
+
+	fname = "trigger_leb_consolidation";
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_trigger_leb_consolidation = dent;
 	return 0;
 
 out_remove:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 15c8ff6..f022e9a 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -449,6 +449,7 @@ struct ubi_debug_info {
 	struct dentry *dfs_emulate_bitflips;
 	struct dentry *dfs_emulate_io_failures;
 	struct dentry *dfs_force_leb_consolidation;
+	struct dentry *dfs_trigger_leb_consolidation;
 	struct dentry *dfs_emulate_power_cut;
 	struct dentry *dfs_power_cut_min;
 	struct dentry *dfs_power_cut_max;
@@ -932,6 +933,7 @@ bool ubi_conso_invalidate_leb(struct ubi_device *ubi, int pnum,
 int ubi_coso_add_full_leb(struct ubi_device *ubi, int vol_id, int lnum, int lpos);
 int ubi_conso_init(struct ubi_device *ubi);
 void ubi_conso_close(struct ubi_device *ubi);
+int ubi_conso_sync(struct ubi_device *ubi);
 #else
 static inline bool ubi_conso_consolidation_needed(struct ubi_device *ubi)
 {
@@ -954,6 +956,7 @@ static inline int ubi_coso_add_full_leb(struct ubi_device *ubi, int vol_id, int
 }
 static inline int ubi_conso_init(struct ubi_device *ubi) { return 0; }
 static inline void ubi_conso_close(struct ubi_device *ubi) {}
+static inline int ubi_conso_sync(struct ubi_device *ubi) { return 0; }
 #endif
 
 /* wl.c */
@@ -982,6 +985,8 @@ bool ubi_work_join_one(struct ubi_device *ubi);
 struct ubi_work *ubi_alloc_erase_work(struct ubi_device *ubi,
 				      struct ubi_wl_entry *e,
 				      int torture);
+int ubi_schedule_work_sync(struct ubi_device *ubi, struct ubi_work *wrk);
+
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 		int len);
diff --git a/drivers/mtd/ubi/work.c b/drivers/mtd/ubi/work.c
index d2f8ba8..cd1c38b 100644
--- a/drivers/mtd/ubi/work.c
+++ b/drivers/mtd/ubi/work.c
@@ -18,6 +18,18 @@ static bool work_suspended(struct ubi_device *ubi)
 	return ubi->thread_suspended || !ubi->thread_enabled;
 }
 
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
 
 /**
  * ubi_schedule_work - schedule a work.
@@ -42,6 +54,23 @@ void ubi_schedule_work(struct ubi_device *ubi, struct ubi_work *wrk)
 	mutex_unlock(&ubi->work_mutex);
 }
 
+int ubi_schedule_work_sync(struct ubi_device *ubi, struct ubi_work *wrk)
+{
+	int ret;
+
+	kref_get(&wrk->ref);
+
+	ubi_schedule_work(ubi, wrk);
+	wait_for_completion(&wrk->comp);
+
+	spin_lock(&ubi->wl_lock);
+	ret = wrk->ret;
+	kref_put(&wrk->ref, destroy_work);
+	spin_unlock(&ubi->wl_lock);
+
+	return ret;
+}
+
 struct ubi_work *ubi_alloc_work(struct ubi_device *ubi)
 {
 	struct ubi_work *wrk;
@@ -57,19 +86,6 @@ struct ubi_work *ubi_alloc_work(struct ubi_device *ubi)
 	return wrk;
 }
 
-/**
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
 static void shutdown_work(struct ubi_device *ubi, int error)
 {
 	struct ubi_work *wrk;
-- 
2.7.3
