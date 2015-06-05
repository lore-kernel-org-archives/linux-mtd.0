Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8n-0006CZ-4s
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:38 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 10/18] jffs2: Remove forward definition of
 jffs2_garbage_collect_thread()
Date: Fri,  5 Jun 2015 17:01:09 +0200
Message-Id: <1433516477-5153-11-git-send-email-pmladek@suse.cz>
In-Reply-To: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Jiri Kosina <jkosina@suse.cz>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Michal Hocko <mhocko@suse.cz>, Chris Mason <clm@fb.com>,
 Petr Mladek <pmladek@suse.cz>, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 live-patching@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit just moves the function definition and fixes few coding
style problems reported by checkpatch.pl. There are no changes in
the functionality.

The change will be useful when switching to the new iterant kthread API.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 fs/jffs2/background.c | 101 +++++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index bb9cebc9ca8a..6af076b8f60f 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -21,57 +21,6 @@
 #include <linux/kthread.h>
 #include "nodelist.h"
 
-
-static int jffs2_garbage_collect_thread(void *);
-
-void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
-{
-	assert_spin_locked(&c->erase_completion_lock);
-	if (c->gc_task && jffs2_thread_should_wake(c))
-		send_sig(SIGHUP, c->gc_task, 1);
-}
-
-/* This must only ever be called when no GC thread is currently running */
-int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
-{
-	struct task_struct *tsk;
-	int ret = 0;
-
-	BUG_ON(c->gc_task);
-
-	init_completion(&c->gc_thread_start);
-	init_completion(&c->gc_thread_exit);
-
-	tsk = kthread_run(jffs2_garbage_collect_thread, c, "jffs2_gcd_mtd%d", c->mtd->index);
-	if (IS_ERR(tsk)) {
-		pr_warn("fork failed for JFFS2 garbage collect thread: %ld\n",
-			-PTR_ERR(tsk));
-		complete(&c->gc_thread_exit);
-		ret = PTR_ERR(tsk);
-	} else {
-		/* Wait for it... */
-		jffs2_dbg(1, "Garbage collect thread is pid %d\n", tsk->pid);
-		wait_for_completion(&c->gc_thread_start);
-		ret = tsk->pid;
-	}
-
-	return ret;
-}
-
-void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
-{
-	int wait = 0;
-	spin_lock(&c->erase_completion_lock);
-	if (c->gc_task) {
-		jffs2_dbg(1, "Killing GC task %d\n", c->gc_task->pid);
-		send_sig(SIGKILL, c->gc_task, 1);
-		wait = 1;
-	}
-	spin_unlock(&c->erase_completion_lock);
-	if (wait)
-		wait_for_completion(&c->gc_thread_exit);
-}
-
 static int jffs2_garbage_collect_thread(void *_c)
 {
 	struct jffs2_sb_info *c = _c;
@@ -166,3 +115,53 @@ static int jffs2_garbage_collect_thread(void *_c)
 	spin_unlock(&c->erase_completion_lock);
 	complete_and_exit(&c->gc_thread_exit, 0);
 }
+
+void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
+{
+	assert_spin_locked(&c->erase_completion_lock);
+	if (c->gc_task && jffs2_thread_should_wake(c))
+		send_sig(SIGHUP, c->gc_task, 1);
+}
+
+/* This must only ever be called when no GC thread is currently running */
+int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
+{
+	struct task_struct *tsk;
+	int ret = 0;
+
+	BUG_ON(c->gc_task);
+
+	init_completion(&c->gc_thread_start);
+	init_completion(&c->gc_thread_exit);
+
+	tsk = kthread_run(jffs2_garbage_collect_thread, c,
+			  "jffs2_gcd_mtd%d", c->mtd->index);
+	if (IS_ERR(tsk)) {
+		pr_warn("fork failed for JFFS2 garbage collect thread: %ld\n",
+			-PTR_ERR(tsk));
+		complete(&c->gc_thread_exit);
+		ret = PTR_ERR(tsk);
+	} else {
+		/* Wait for it... */
+		jffs2_dbg(1, "Garbage collect thread is pid %d\n", tsk->pid);
+		wait_for_completion(&c->gc_thread_start);
+		ret = tsk->pid;
+	}
+
+	return ret;
+}
+
+void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
+{
+	int wait = 0;
+
+	spin_lock(&c->erase_completion_lock);
+	if (c->gc_task) {
+		jffs2_dbg(1, "Killing GC task %d\n", c->gc_task->pid);
+		send_sig(SIGKILL, c->gc_task, 1);
+		wait = 1;
+	}
+	spin_unlock(&c->erase_completion_lock);
+	if (wait)
+		wait_for_completion(&c->gc_thread_exit);
+}
-- 
1.8.5.6
