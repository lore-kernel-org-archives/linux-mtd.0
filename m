Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005KV-IF
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/13] ubi: Remove tst_disable_bgt debugfs knob
Date: Mon, 30 May 2016 14:04:27 +0200
Message-Id: <1464609874-15488-7-git-send-email-richard@nod.at>
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

With the new worker model we hard depend on the worker
and disabling it will lockup UBI.
So, this knob makes no longer sense.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/debug.c | 11 -----------
 drivers/mtd/ubi/debug.h | 12 ------------
 drivers/mtd/ubi/ubi.h   |  4 ----
 drivers/mtd/ubi/wl.c    |  4 ++--
 4 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index f101a49..ed23009 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -277,8 +277,6 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		val = d->chk_io;
 	else if (dent == d->dfs_chk_fastmap)
 		val = d->chk_fastmap;
-	else if (dent == d->dfs_disable_bgt)
-		val = d->disable_bgt;
 	else if (dent == d->dfs_emulate_bitflips)
 		val = d->emulate_bitflips;
 	else if (dent == d->dfs_emulate_io_failures)
@@ -372,8 +370,6 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		d->chk_io = val;
 	else if (dent == d->dfs_chk_fastmap)
 		d->chk_fastmap = val;
-	else if (dent == d->dfs_disable_bgt)
-		d->disable_bgt = val;
 	else if (dent == d->dfs_emulate_bitflips)
 		d->emulate_bitflips = val;
 	else if (dent == d->dfs_emulate_io_failures)
@@ -449,13 +445,6 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 		goto out_remove;
 	d->dfs_chk_fastmap = dent;
 
-	fname = "tst_disable_bgt";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_disable_bgt = dent;
-
 	fname = "tst_emulate_bitflips";
 	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
 				   &dfs_fops);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index eb8985e..47c447d 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -66,18 +66,6 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi);
 void ubi_debugfs_exit_dev(struct ubi_device *ubi);
 
 /**
- * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
- * @ubi: UBI device description object
- *
- * Returns non-zero if the UBI background thread is disabled for testing
- * purposes.
- */
-static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
-{
-	return ubi->dbg.disable_bgt;
-}
-
-/**
  * ubi_dbg_is_bitflip - if it is time to emulate a bit-flip.
  * @ubi: UBI device description object
  *
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index efdff07..107a9d9 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -374,7 +374,6 @@ struct ubi_wl_entry;
  * @chk_gen: if UBI general extra checks are enabled
  * @chk_io: if UBI I/O extra checks are enabled
  * @chk_fastmap: if UBI fastmap extra checks are enabled
- * @disable_bgt: disable the background task for testing purposes
  * @emulate_bitflips: emulate bit-flips for testing purposes
  * @emulate_io_failures: emulate write/erase failures for testing purposes
  * @emulate_power_cut: emulate power cut for testing purposes
@@ -386,7 +385,6 @@ struct ubi_wl_entry;
  * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
  * @dfs_chk_io: debugfs knob to enable UBI I/O extra checks
  * @dfs_chk_fastmap: debugfs knob to enable UBI fastmap extra checks
- * @dfs_disable_bgt: debugfs knob to disable the background task
  * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
  * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
  * @dfs_emulate_power_cut: debugfs knob to emulate power cuts
@@ -397,7 +395,6 @@ struct ubi_debug_info {
 	unsigned int chk_gen:1;
 	unsigned int chk_io:1;
 	unsigned int chk_fastmap:1;
-	unsigned int disable_bgt:1;
 	unsigned int emulate_bitflips:1;
 	unsigned int emulate_io_failures:1;
 	unsigned int emulate_power_cut:2;
@@ -409,7 +406,6 @@ struct ubi_debug_info {
 	struct dentry *dfs_chk_gen;
 	struct dentry *dfs_chk_io;
 	struct dentry *dfs_chk_fastmap;
-	struct dentry *dfs_disable_bgt;
 	struct dentry *dfs_emulate_bitflips;
 	struct dentry *dfs_emulate_io_failures;
 	struct dentry *dfs_emulate_power_cut;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0ed6e39..a80f019 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -649,7 +649,7 @@ static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 	list_add_tail(&wrk->list, &ubi->works);
 	ubi_assert(ubi->works_count >= 0);
 	ubi->works_count += 1;
-	if (!wl_work_suspended(ubi) && !ubi_dbg_is_bgt_disabled(ubi))
+	if (!wl_work_suspended(ubi))
 		wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 	mutex_unlock(&ubi->work_mutex);
@@ -1523,7 +1523,7 @@ int ubi_thread(void *u)
 
 		spin_lock(&ubi->wl_lock);
 		if (list_empty(&ubi->works) || ubi->ro_mode ||
-		    wl_work_suspended(ubi) || ubi_dbg_is_bgt_disabled(ubi)) {
+		    wl_work_suspended(ubi)) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			spin_unlock(&ubi->wl_lock);
 			schedule();
-- 
2.7.3
