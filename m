Received: from mail-ew0-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBSvy-00055N-T0
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 12:17:45 +0000
Received: by ewy21 with SMTP id 21so13897068ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jun 2009 05:17:38 -0700 (PDT)
Sender: =?UTF-8?Q?Gerard_Lled=C3=B3?= <raharu@gmail.com>
From: Gerard Lledo <gerard.lledo@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH] [JFFS2] Move jffs2_gcd_mtd threads to the new kthread API
Date: Tue,  2 Jun 2009 15:11:25 +0300
Message-Id: <1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
In-Reply-To: <20090602113216.GA3513@tank>
References: <20090602113216.GA3513@tank>
Cc: linux-mtd@lists.infradead.org, Gerard Lledo <gerard.lledo@gmail.com>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kernel_thread() is being depracated.  This patch moves the jffs2 garbage
collecting thread to the new kthread API with the minimal impact.
---
 fs/jffs2/background.c |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index e958010..3ff50da 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -15,6 +15,7 @@
 #include <linux/completion.h>
 #include <linux/sched.h>
 #include <linux/freezer.h>
+#include <linux/kthread.h>
 #include "nodelist.h"
 
 
@@ -31,7 +32,7 @@ void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
 /* This must only ever be called when no GC thread is currently running */
 int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 {
-	pid_t pid;
+	struct task_struct *tsk;
 	int ret = 0;
 
 	BUG_ON(c->gc_task);
@@ -39,15 +40,16 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 	init_completion(&c->gc_thread_start);
 	init_completion(&c->gc_thread_exit);
 
-	pid = kernel_thread(jffs2_garbage_collect_thread, c, CLONE_FS|CLONE_FILES);
-	if (pid < 0) {
-		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %d\n", -pid);
+	tsk = kthread_run(jffs2_garbage_collect_thread, c, "jffs2_gcd_mtd%d", c->mtd->index);
+	if (IS_ERR(tsk)) {
+		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %ld\n", -PTR_ERR(tsk));
 		complete(&c->gc_thread_exit);
-		ret = pid;
+		ret = PTR_ERR(tsk);
 	} else {
 		/* Wait for it... */
-		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", pid));
+		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", tsk->pid));
 		wait_for_completion(&c->gc_thread_start);
+		ret = tsk->pid;
 	}
 
 	return ret;
@@ -71,7 +73,6 @@ static int jffs2_garbage_collect_thread(void *_c)
 {
 	struct jffs2_sb_info *c = _c;
 
-	daemonize("jffs2_gcd_mtd%d", c->mtd->index);
 	allow_signal(SIGKILL);
 	allow_signal(SIGSTOP);
 	allow_signal(SIGCONT);
@@ -107,6 +108,11 @@ static int jffs2_garbage_collect_thread(void *_c)
 		 * the GC thread get there first. */
 		schedule_timeout_interruptible(msecs_to_jiffies(50));
 
+		if (kthread_should_stop()) {
+			D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread():  kthread_stop() called.\n"));
+			goto die;
+		}
+
 		/* Put_super will send a SIGKILL and then wait on the sem.
 		 */
 		while (signal_pending(current) || freezing(current)) {
-- 
1.5.6.5
