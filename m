Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8i-0002SS-Qc
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:36 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 07/18] kthread: Make iterant kthreads freezable by default
Date: Fri,  5 Jun 2015 17:01:06 +0200
Message-Id: <1433516477-5153-8-git-send-email-pmladek@suse.cz>
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

Many kthreads already calls set_freezable() before they enter the main
cycle. One of the reasons for creating iterant kthreads is to create
a safe point for freezing and make even more kthreads properly
freezable. Therefore it would make sense to set all iterant
kthreads freezable by default.

However some kthreads might be hard to make properly freezable.
For example, if they do non-interruptible sleeps. They would
need to explicitly clear PF_NOFREEZE flag in the init() call.
But it should be avoided whenever possible.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 kernel/kthread.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 185902d0e293..e34f67cb8ecf 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -412,13 +412,20 @@ struct task_struct *kthread_create_on_cpu(int (*threadfn)(void *data),
  *
  * This function defines the work flow of iterant kthreads. It calls
  * the given callbacks. Also it defines and implements a common
- * check point for freezing and stopping.
+ * check point for freezing, stopping, and signal handling.
+ *
+ * IMPORTANT: Iterant kthreads are freezable by default. The functions
+ * defined in the given struct kthread_iterant still have to explicitly
+ * call try_to_freeze() after each interruptible sleep. They must avoid
+ * non-interruptible sleep if freezing is allowed.
  */
 static int kthread_iterant_fn(void *kti_ptr)
 {
 	struct kthread_iterant *kti = kti_ptr;
 	void *data = kti->data;
 
+	set_freezable();
+
 	if (kti->init)
 		kti->init(data);
 
-- 
1.8.5.6
