Received: from mtagate1.uk.ibm.com ([195.212.29.134])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HM2jI-0006QB-O5
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 13:51:01 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate1.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1RDokfw045234
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:50:46 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1RDokJc1085540
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:50:46 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1RDojZG010697
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:50:45 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem <dedekind@infradead.org>
Subject: [RFC] [PATCH] UBI: convert to kthread API
Date: Tue, 27 Feb 2007 14:50:40 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702271450.41167.alexs@linux.vnet.ibm.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

UBI should use the kthread API, which makes completions and signal
handling go away.

I took Christoph on CC, I hope he has some comments on this.

Regards,
Alex

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/background.c |   71 ++++++++++---------------------------------
 drivers/mtd/ubi/build.c      |    4 --
 drivers/mtd/ubi/ubi.h        |    5 ---
 3 files changed, 18 insertions(+), 62 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/background.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/background.c
@@ -27,6 +27,7 @@
  */
 
 #include <linux/freezer.h>
+#include <linux/kthread.h>
 #include "ubi.h"
 
 /* Background thread name pattern */
@@ -160,23 +161,6 @@ void ubi_bgt_disable(struct ubi_info *ub
 }
 
 /**
- * ubi_bgt_kill_thread - kill the background thread.
- *
- * @ubi: the UBI device description object
- *
- * This function kills the background thread for UBI device defined by @ubi.
- * This function also makes sure all the pending tasks are done.
- */
-void ubi_bgt_kill_thread(struct ubi_info *ubi)
-{
-	dbg_bgt("disable \"%s\"", ubi->bgt.bgt_name);
-	if (ubi->bgt.task) {
-		send_sig(SIGKILL, ubi->bgt.task, 1);
-		wait_for_completion(&ubi->bgt.thread_stop);
-	}
-}
-
-/**
  * ubi_bgt_do_work - do one pending work.
  *
  * @ubi: the UBI device description object
@@ -235,46 +219,22 @@ static int ubi_thread(void *u)
 	int failures = 0;
 	struct ubi_info *ubi = u;
 
-	daemonize(ubi->bgt.bgt_name);
-	allow_signal(SIGKILL);
-	allow_signal(SIGSTOP);
-
 	ubi_msg("background thread \"%s\" started, PID %d",
 		ubi->bgt.bgt_name, current->pid);
 
-	ubi->bgt.task = current;
-	complete(&ubi->bgt.thread_start);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule();
-
 	for (;;) {
-		cond_resched();
-
 		if (unlikely(!ubi->bgt.enabled) ||
 			     list_empty(&ubi->bgt.pending_works)) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			schedule();
 		}
 
+		if (kthread_should_stop())
+			goto out;
+
 		if (try_to_freeze())
 			continue;
 
-		while (signal_pending(current)) {
-			siginfo_t info;
-			unsigned long nr;
-
-			nr = dequeue_signal_lock(current, &current->blocked,
-						 &info);
-			if (nr == SIGKILL)
-				goto out;
-			if (nr == SIGSTOP) {
-				ubi->bgt.enabled = !ubi->bgt.enabled;
-				ubi_msg("%s the background thread",
-					ubi->bgt.enabled ? "enable" :
-							   "disable");
-			}
-		}
-
 		spin_lock(&ubi->bgt.lock);
 		while (ubi->bgt.pending_works_count > 0 &&
 		       likely(ubi->bgt.enabled)) {
@@ -297,7 +257,6 @@ static int ubi_thread(void *u)
 					ubi_msg("%d consecutive failures, "
 						"disable the background thread",
 						BGT_MAX_FAILURES);
-					ubi_bgt_disable(ubi);
 					ubi_eba_ro_mode(ubi);
 					break;
 				} else
@@ -307,6 +266,8 @@ static int ubi_thread(void *u)
 			spin_lock(&ubi->bgt.lock);
 		}
 		spin_unlock(&ubi->bgt.lock);
+
+		cond_resched();
 	}
 
 out:
@@ -330,7 +291,7 @@ out:
 	}
 	spin_unlock(&ubi->bgt.lock);
 
-	complete_and_exit(&ubi->bgt.thread_stop, 0);
+	return 0;
 }
 
 /**
@@ -344,12 +305,9 @@ out:
 int ubi_bgt_init(struct ubi_info *ubi)
 {
 	int err;
-	pid_t pid;
 
 	dbg_bgt("initialize the UBI background thread unit");
 
-	init_completion(&ubi->bgt.thread_start);
-	init_completion(&ubi->bgt.thread_stop);
 	INIT_LIST_HEAD(&ubi->bgt.pending_works);
 	spin_lock_init(&ubi->bgt.lock);
 	mutex_init(&ubi->bgt.wrk_mutex);
@@ -359,14 +317,15 @@ int ubi_bgt_init(struct ubi_info *ubi)
 		return -ENOMEM;
 	sprintf(ubi->bgt.bgt_name, BGT_NAME_PATTERN, ubi->ubi_num);
 
-	pid = kernel_thread(ubi_thread, ubi, CLONE_FS | CLONE_FILES);
-	if (pid < 0) {
-		err = pid;
-		ubi_err("cannot spawn \"%s\", error %d", ubi->bgt.bgt_name, err);
+	ubi->bgt.task = kthread_create(ubi_thread, ubi, ubi->bgt.bgt_name);
+	if (IS_ERR(ubi->bgt.task)) {
+		err = PTR_ERR(ubi->bgt.task);
+		ubi_err("cannot spawn \"%s\", error %d", ubi->bgt.bgt_name,
+			err);
 		goto out_name;
 	}
 
-	wait_for_completion(&ubi->bgt.thread_start);
+	wake_up_process(ubi->bgt.task);
 	dbg_bgt("the UBI background thread unit is initialized");
 	return 0;
 
@@ -382,6 +341,10 @@ out_name:
  */
 void ubi_bgt_close(struct ubi_info *ubi)
 {
+	dbg_bgt("disable \"%s\"", ubi->bgt.bgt_name);
+	if (ubi->bgt.task)
+		kthread_stop(ubi->bgt.task);
+
 	dbg_bgt("close the UBI background thread unit");
 
 	ubi_assert(!ubi->bgt.enabled);
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/build.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/build.c
@@ -123,12 +123,11 @@ static void detach_mtd_dev(struct ubi_in
 
 	dbg_bld("detaching mtd%d from ubi%d", mtd_num, ubi_num);
 
-	ubi_bgt_kill_thread(ubi);
+	ubi_bgt_close(ubi);
 	ubi_uif_close(ubi);
 	ubi_eba_close(ubi);
 	ubi_wl_close(ubi);
 	ubi_vmt_close(ubi);
-	ubi_bgt_close(ubi);
 	ubi_io_close(ubi);
 	kfree(ubis[ubi_num]);
 	ubis[ubi_num] = NULL;
@@ -276,7 +275,6 @@ out_detach:
 	ubi_wl_close(ubi);
 	ubi_vmt_close(ubi);
 out_bgt:
-	ubi_bgt_kill_thread(ubi);
 	ubi_bgt_close(ubi);
 out_io:
 	ubi_io_close(ubi);
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/ubi.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/ubi.h
@@ -239,8 +239,6 @@ struct ubi_bgt_work {
  * @enabled: if the background thread is enabled
  * @task: a pointer to the &struct task_struct of the background thread
  * @bgt_name: the background thread name
- * @thread_start: used to synchronize with starting of the background thread
- * @thread_stop: used to synchronize with killing of the background thread
  * @wrk_mutex: serializes execution if background works
  */
 struct ubi_bgt_info {
@@ -251,8 +249,6 @@ struct ubi_bgt_info {
 	int enabled;                      /* public  */
 	struct task_struct *task;         /* private */
 	char *bgt_name;                   /* public  */
-	struct completion thread_start;   /* private */
-	struct completion thread_stop;    /* private */
 	struct mutex wrk_mutex;           /* private */
 };
 
@@ -551,7 +547,6 @@ int ubi_bgt_reschedule(struct ubi_info *
 int ubi_bgt_do_work(struct ubi_info *ubi);
 int ubi_bgt_enable(struct ubi_info *ubi);
 void ubi_bgt_disable(struct ubi_info *ubi);
-void ubi_bgt_kill_thread(struct ubi_info *ubi);
 int ubi_bgt_init(struct ubi_info *ubi);
 void ubi_bgt_close(struct ubi_info *ubi);
 
