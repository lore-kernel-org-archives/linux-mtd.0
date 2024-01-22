Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC04EC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=THws6KhPuF0GmkC+/L+Msq/kM/VYa5o2cr71pMrPMww=; b=BT+m52boFyLTnW
	3+LkpVATTcRGalWvDw4JEUdLM2Do9xhe3iin34V3BTwkWvdxB3NWn5ruV+iRGFSWI877YUwbyqZLu
	ol21ZbWc0txPdGm2uuWYl4HpYI2lNB3ybL4NQsEoGvt1AoCQGOcEWhjk1nvdXp9u+Au3k7BpHAXB1
	ia0g8KmkG23B2B6VLrsOI0ZHSNAG5I/myPopQyx4AycK91Zzx0712d9NBSNJZoLCn9y1Ec0KShnY0
	Tif1mYBgknaY+JieldmFUF5tHl3J1zZoJEeG376+1f0c+eNTRKwURcJ6UUIwCPyzyNWBUEoLvtIRq
	nkbPhU09dnCGf/LBtLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRntp-00AkcM-30;
	Mon, 22 Jan 2024 06:35:13 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRntk-00AkZx-1i
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 06:35:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TJL551WFGz1gxpb;
	Mon, 22 Jan 2024 14:33:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 617B8180020;
	Mon, 22 Jan 2024 14:34:55 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 14:34:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <yi.zhang@huawei.com>
Subject: [PATCH v2] ubifs: Queue up space reservation tasks if retrying many times
Date: Mon, 22 Jan 2024 14:31:03 +0800
Message-ID: <20240122063103.359501-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_223508_919949_6C6D9CC2 
X-CRM114-Status: GOOD (  31.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Recently we catched ENOSPC returned by make_reservation() while doing
fsstress on UBIFS, we got following information when it occurred (See
details in Link):

 UBIFS error (ubi0:0 pid 3640152): make_reservation [ubifs]: cannot
 reserve 112 bytes in jhead 2, error -28
 CPU: 2 PID: 3640152 Comm: kworker/u16:2 Tainted: G    B   W
 Hardware name: Hisilicon PhosphorHi1230 EMU (DT)
 Workqueue: writeback wb_workfn (flush-ubifs_0_0)
 Call trace:
  dump_stack+0x114/0x198
  make_reservation+0x564/0x610 [ubifs]
  ubifs_jnl_write_data+0x328/0x48c [ubifs]
  do_writepage+0x2a8/0x3e4 [ubifs]
  ubifs_writepage+0x16c/0x374 [ubifs]
  generic_writepages+0xb4/0x114
  do_writepages+0xcc/0x11c
  writeback_sb_inodes+0x2d0/0x564
  wb_writeback+0x20c/0x2b4
  wb_workfn+0x404/0x510
  process_one_work+0x304/0x4ac
  worker_thread+0x31c/0x4e4
  kthread+0x23c/0x290
  Budgeting info: data budget sum 17576, total budget sum 17768
	budg_data_growth 4144, budg_dd_growth 13432, budg_idx_growth 192
	min_idx_lebs 13, old_idx_sz 988640, uncommitted_idx 0
	page_budget 4144, inode_budget 160, dent_budget 312
	nospace 0, nospace_rp 0
	dark_wm 8192, dead_wm 4096, max_idx_node_sz 192
	freeable_cnt 0, calc_idx_sz 988640, idx_gc_cnt 0
	dirty_pg_cnt 4, dirty_zn_cnt 0, clean_zn_cnt 4811
	gc_lnum 21, ihead_lnum 14
	jhead 0 (GC)	 LEB 16
	jhead 1 (base)	 LEB 34
	jhead 2 (data)	 LEB 23
	bud LEB 16
	bud LEB 23
	bud LEB 34
	old bud LEB 33
	old bud LEB 31
	old bud LEB 15
	commit state 4
 Budgeting predictions:
	available: 33832, outstanding 17576, free 15356
 (pid 3640152) start dumping LEB properties
 (pid 3640152) Lprops statistics: empty_lebs 3, idx_lebs  11
	taken_empty_lebs 1, total_free 1253376, total_dirty 2445736
	total_used 3438712, total_dark 65536, total_dead 17248
 LEB 15 free 0      dirty 248000   used 5952   (taken)
 LEB 16 free 110592 dirty 896      used 142464 (taken, jhead 0 (GC))
 LEB 21 free 253952 dirty 0        used 0      (taken, GC LEB)
 LEB 23 free 0      dirty 248104   used 5848   (taken, jhead 2 (data))
 LEB 29 free 253952 dirty 0        used 0      (empty)
 LEB 33 free 0      dirty 253952   used 0      (taken)
 LEB 34 free 217088 dirty 36544    used 320    (taken, jhead 1 (base))
 LEB 37 free 253952 dirty 0        used 0      (empty)
 OTHERS: index lebs, zero-available non-index lebs

According to the budget algorithm, there are 5 LEBs reserved for budget:
three journal heads(16,23,34), 1 GC LEB(21) and 1 deletion LEB(can be
used in make_reservation()). There are 2 empty LEBs used for index nodes,
which is calculated as min_idx_lebs - idx_lebs = 2. In theory, LEB 15
and 33 should be reclaimed as free state after committing, but it is now
in taken state. After looking the realization of reserve_space(), there's
a possible situation:

LEB 15: free 2000 dirty 248000 used 3952 (jhead 2)
LEB 23: free 2000 dirty 248104 used 3848 (bud, taken)
LEB 33: free 2000 dirty 251952 used 0    (bud, taken)

      wb_workfn          wb_workfn_2
do_writepage // write 3000 bytes
 ubifs_jnl_write_data
  make_reservation
   reserve_space
    ubifs_garbage_collect
     ubifs_find_dirty_leb // ret ENOSPC, dirty LEBs are taken
   nospc_retries++  // 1
   ubifs_run_commit
    do_commit

LEB 15: free 2000 dirty 248000 used 3952 (jhead 2)
LEB 23: free 2000 dirty 248104 used 3848 (dirty)
LEB 33: free 2000 dirty 251952 used 0    (dirty)

                   do_writepage // write 2000 bytes for 3 times
		    ubifs_jnl_write_data
		    // grabs 15\23\33

LEB 15: free 0    dirty 248000 used 5952 (bud, taken)
LEB 23: free 0    dirty 248104 used 5848 (jhead 2)
LEB 33: free 0    dirty 253952 used 0    (bud, taken)

   reserve_space
    ubifs_garbage_collect
     ubifs_find_dirty_leb // ret ENOSPC, dirty LEBs are taken
   if (nospc_retries++ < 2) // false
 ubifs_ro_mode !

Fetch a reproducer in Link.

The dirty LEBs could be grabbed by other threads, which fails finding dirty
LEBs of GC in current thread, so make_reservation() could try many times to
invoke GC&&committing, but current realization limits the times of retrying
as 'nospc_retries'(twice).
Fix it by adding a wait queue, start queuing up space reservation tasks
when someone task has retried gc + commit for many times. Then there is
only one task making space reservation at any time, and it can always make
success under the premise of correct budgeting.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218164
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 v1->v2: Change fix method, increasing retrying times => queuing up all space
	 reservation tasks if someone task has retried many times.
 fs/ubifs/journal.c | 171 +++++++++++++++++++++++++++++++++++++++------
 fs/ubifs/super.c   |   2 +
 fs/ubifs/ubifs.h   |   4 ++
 3 files changed, 155 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index f0a5538c84b0..74aee92433d7 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -292,6 +292,96 @@ static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 	return err;
 }
 
+/**
+ * __queue_and_wait - queue a task and wait until the task is waked up.
+ * @c: UBIFS file-system description object
+ *
+ * This function adds current task in queue and waits until the task is waked
+ * up. This function should be called with @c->reserve_space_wq locked.
+ */
+static void __queue_and_wait(struct ubifs_info *c)
+{
+	DEFINE_WAIT(wait);
+
+	__add_wait_queue_entry_tail_exclusive(&c->reserve_space_wq, &wait);
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	spin_unlock(&c->reserve_space_wq.lock);
+
+	schedule();
+	finish_wait(&c->reserve_space_wq, &wait);
+}
+
+/**
+ * wait_for_reservation - try queuing current task to wait until waked up.
+ * @c: UBIFS file-system description object
+ *
+ * This function queues current task to wait until waked up, if queuing is
+ * started(@c->need_wait_space is not %0). Returns %true if current task is
+ * added in queue, otherwise %false is returned.
+ */
+static bool wait_for_reservation(struct ubifs_info *c)
+{
+	if (likely(atomic_read(&c->need_wait_space) == 0))
+		/* Quick path to check whether queuing is started. */
+		return false;
+
+	spin_lock(&c->reserve_space_wq.lock);
+	if (atomic_read(&c->need_wait_space) == 0) {
+		/* Queuing is not started, don't queue current task. */
+		spin_unlock(&c->reserve_space_wq.lock);
+		return false;
+	}
+
+	__queue_and_wait(c);
+	return true;
+}
+
+/**
+ * wake_up_reservation - wake up first task in queue or stop queuing.
+ * @c: UBIFS file-system description object
+ *
+ * This function wakes up the first task in queue if it exists, or stops
+ * queuing if no tasks in queue.
+ */
+static void wake_up_reservation(struct ubifs_info *c)
+{
+	spin_lock(&c->reserve_space_wq.lock);
+	if (waitqueue_active(&c->reserve_space_wq))
+		wake_up_locked(&c->reserve_space_wq);
+	else
+		/*
+		 * Compared with wait_for_reservation(), set @c->need_wait_space
+		 * under the protection of wait queue lock, which can avoid that
+		 * @c->need_wait_space is set to 0 after new task queued.
+		 */
+		atomic_set(&c->need_wait_space, 0);
+	spin_unlock(&c->reserve_space_wq.lock);
+}
+
+/**
+ * wake_up_reservation - add current task in queue or start queuing.
+ * @c: UBIFS file-system description object
+ *
+ * This function starts queuing if queuing is not started, otherwise adds
+ * current task in queue.
+ */
+static void add_or_start_queue(struct ubifs_info *c)
+{
+	spin_lock(&c->reserve_space_wq.lock);
+	if (atomic_cmpxchg(&c->need_wait_space, 0, 1) == 0) {
+		/* Starts queuing, task can go on directly. */
+		spin_unlock(&c->reserve_space_wq.lock);
+		return;
+	}
+
+	/*
+	 * There are at least two tasks have retried more than 32 times
+	 * at certain point, first task has started queuing, just queue
+	 * the left tasks.
+	 */
+	__queue_and_wait(c);
+}
+
 /**
  * make_reservation - reserve journal space.
  * @c: UBIFS file-system description object
@@ -311,33 +401,27 @@ static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 static int make_reservation(struct ubifs_info *c, int jhead, int len)
 {
 	int err, cmt_retries = 0, nospc_retries = 0;
+	bool blocked = wait_for_reservation(c);
 
 again:
 	down_read(&c->commit_sem);
 	err = reserve_space(c, jhead, len);
-	if (!err)
+	if (!err) {
 		/* c->commit_sem will get released via finish_reservation(). */
-		return 0;
+		goto out_wake_up;
+	}
 	up_read(&c->commit_sem);
 
 	if (err == -ENOSPC) {
 		/*
 		 * GC could not make any progress. We should try to commit
-		 * once because it could make some dirty space and GC would
-		 * make progress, so make the error -EAGAIN so that the below
+		 * because it could make some dirty space and GC would make
+		 * progress, so make the error -EAGAIN so that the below
 		 * will commit and re-try.
 		 */
-		if (nospc_retries++ < 2) {
-			dbg_jnl("no space, retry");
-			err = -EAGAIN;
-		}
-
-		/*
-		 * This means that the budgeting is incorrect. We always have
-		 * to be able to write to the media, because all operations are
-		 * budgeted. Deletions are not budgeted, though, but we reserve
-		 * an extra LEB for them.
-		 */
+		nospc_retries++;
+		dbg_jnl("no space, retry");
+		err = -EAGAIN;
 	}
 
 	if (err != -EAGAIN)
@@ -349,15 +433,37 @@ static int make_reservation(struct ubifs_info *c, int jhead, int len)
 	 */
 	if (cmt_retries > 128) {
 		/*
-		 * This should not happen unless the journal size limitations
-		 * are too tough.
+		 * This should not happen unless:
+		 * 1. The journal size limitations are too tough.
+		 * 2. The budgeting is incorrect. We always have to be able to
+		 *    write to the media, because all operations are budgeted.
+		 *    Deletions are not budgeted, though, but we reserve an
+		 *    extra LEB for them.
 		 */
-		ubifs_err(c, "stuck in space allocation");
+		ubifs_err(c, "stuck in space allocation, nospc_retries %d",
+			  nospc_retries);
 		err = -ENOSPC;
 		goto out;
-	} else if (cmt_retries > 32)
-		ubifs_warn(c, "too many space allocation re-tries (%d)",
-			   cmt_retries);
+	} else if (cmt_retries > 32) {
+		/*
+		 * It's almost impossible to happen, unless there are many tasks
+		 * making reservation concurrently and someone task has retried
+		 * gc + commit for many times, generated available space during
+		 * this period are grabbed by other tasks.
+		 * But if it happens, start queuing up all tasks that will make
+		 * space reservation, then there is only one task making space
+		 * reservation at any time, and it can always make success under
+		 * the premise of correct budgeting.
+		 */
+		ubifs_warn(c, "too many space allocation cmt_retries (%d) "
+			   "nospc_retries (%d), start queuing tasks",
+			   cmt_retries, nospc_retries);
+
+		if (!blocked) {
+			blocked = true;
+			add_or_start_queue(c);
+		}
+	}
 
 	dbg_jnl("-EAGAIN, commit and retry (retried %d times)",
 		cmt_retries);
@@ -365,7 +471,7 @@ static int make_reservation(struct ubifs_info *c, int jhead, int len)
 
 	err = ubifs_run_commit(c);
 	if (err)
-		return err;
+		goto out_wake_up;
 	goto again;
 
 out:
@@ -380,6 +486,27 @@ static int make_reservation(struct ubifs_info *c, int jhead, int len)
 		cmt_retries = dbg_check_lprops(c);
 		up_write(&c->commit_sem);
 	}
+out_wake_up:
+	if (blocked) {
+		/*
+		 * Only tasks that have ever started queuing or ever been queued
+		 * can wake up other queued tasks, which can make sure that
+		 * there is only one task waked up to make space reservation.
+		 * For example:
+		 *      task A          task B           task C
+		 *                 make_reservation  make_reservation
+		 * reserve_space // 0
+		 * wake_up_reservation
+		 *                  atomic_cmpxchg // 0, start queuing
+		 *                  reserve_space
+		 *                                    wait_for_reservation
+		 *                                     __queue_and_wait
+		 *                                      add_wait_queue
+		 *  if (blocked) // false
+		 *  // So that task C won't be waked up to race with task B
+		 */
+		wake_up_reservation(c);
+	}
 	return err;
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 09e270d6ed02..571c9dc92b94 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2151,6 +2151,8 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 		mutex_init(&c->bu_mutex);
 		mutex_init(&c->write_reserve_mutex);
 		init_waitqueue_head(&c->cmt_wq);
+		init_waitqueue_head(&c->reserve_space_wq);
+		atomic_set(&c->need_wait_space, 0);
 		c->buds = RB_ROOT;
 		c->old_idx = RB_ROOT;
 		c->size_tree = RB_ROOT;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ee910c8ce157..7a7c62104f2b 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1047,6 +1047,8 @@ struct ubifs_debug_info;
  * @bg_bud_bytes: number of bud bytes when background commit is initiated
  * @old_buds: buds to be released after commit ends
  * @max_bud_cnt: maximum number of buds
+ * @need_wait_space: Non %0 means space reservation tasks need to wait in queue
+ * @reserve_space_wq: wait queue to sleep on if @need_wait_space is not %0
  *
  * @commit_sem: synchronizes committer with other processes
  * @cmt_state: commit state
@@ -1305,6 +1307,8 @@ struct ubifs_info {
 	long long bg_bud_bytes;
 	struct list_head old_buds;
 	int max_bud_cnt;
+	atomic_t need_wait_space;
+	wait_queue_head_t reserve_space_wq;
 
 	struct rw_semaphore commit_sem;
 	int cmt_state;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
