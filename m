Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t93-0006DT-KZ
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:53 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 18/18] jffs2: Use the new API for a sleep with a timeout
Date: Fri,  5 Jun 2015 17:01:17 +0200
Message-Id: <1433516477-5153-19-git-send-email-pmladek@suse.cz>
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

It allows to maintain the checks for freezing, parking, and signal
handling on a single place.

Note that the sleep with the timeout is used here to slow down
the progress a bit. It does not matter if we do it before or after
calling jffs2_garbage_collect_pass().

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 fs/jffs2/background.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 50c16048ba2d..2d38d40e0ad1 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -62,6 +62,16 @@ static void jffs2_garbage_collect_thread_func(void *_c)
 	}
 	spin_unlock(&c->erase_completion_lock);
 
+	/* We don't want SIGHUP to interrupt us. STOP and KILL are OK though. */
+	sigprocmask(SIG_BLOCK, &hupmask, NULL);
+
+	jffs2_dbg(1, "%s(): pass\n", __func__);
+	if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
+		pr_notice("No space for garbage collection. Aborting GC thread\n");
+		kthread_stop_current();
+	}
+	sigprocmask(SIG_UNBLOCK, &hupmask, NULL);
+
 	/* Problem - immediately after bootup, the GCD spends a lot
 	 * of time in places like jffs2_kill_fragtree(); so much so
 	 * that userspace processes (like gdm and X) are starved
@@ -73,24 +83,7 @@ static void jffs2_garbage_collect_thread_func(void *_c)
 	 * inode in with read_inode() is much preferable to having
 	 * the GC thread get there first.
 	 */
-	schedule_timeout_interruptible(msecs_to_jiffies(50));
-
-	if (kthread_should_stop()) {
-		jffs2_dbg(1, "%s(): kthread_stop() called\n", __func__);
-		return;
-	}
-
-	try_to_freeze();
-
-	/* We don't want SIGHUP to interrupt us. STOP and KILL are OK though. */
-	sigprocmask(SIG_BLOCK, &hupmask, NULL);
-
-	jffs2_dbg(1, "%s(): pass\n", __func__);
-	if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
-		pr_notice("No space for garbage collection. Aborting GC thread\n");
-		kthread_stop_current();
-	}
-	sigprocmask(SIG_UNBLOCK, &hupmask, NULL);
+	set_kthread_iterant_int_sleep_timeout(msecs_to_jiffies(50));
 }
 
 static void jffs2_garbage_collect_thread_destroy(void *_c)
-- 
1.8.5.6
