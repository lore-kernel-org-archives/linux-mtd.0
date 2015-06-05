Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8j-0002SR-7h
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:34 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 08/18] kthread: Allow to get struct kthread_iterant from
 task_struct
Date: Fri,  5 Jun 2015 17:01:07 +0200
Message-Id: <1433516477-5153-9-git-send-email-pmladek@suse.cz>
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

It is easy to make a mistake when one implements sleeping between kthread
iterations. We will want to do it a more uniform way. For this we will
want to set some flags in struct kthread_iterant from the current
task (kthread). This patch adds the basic infrastructure to make
it possible.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 kernel/kthread.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index e34f67cb8ecf..41fb6a43a1f1 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -44,6 +44,7 @@ struct kthread {
 	void *data;
 	struct completion parked;
 	struct completion exited;
+	struct kthread_iterant *kti;
 };
 
 enum KTHREAD_BITS {
@@ -69,6 +70,11 @@ static struct kthread *to_live_kthread(struct task_struct *k)
 	return NULL;
 }
 
+static struct kthread_iterant *to_kthread_iterant(struct task_struct *k)
+{
+	return __to_kthread(k->vfork_done)->kti;
+}
+
 /**
  * kthread_stop_current - make the current kthread to terminate a safe way
  *
@@ -199,6 +205,7 @@ static int kthread(void *_create)
 	self.data = data;
 	init_completion(&self.exited);
 	init_completion(&self.parked);
+	self.kti = NULL;
 	current->vfork_done = &self.exited;
 
 	/* If user was SIGKILLed, I release the structure. */
@@ -421,9 +428,12 @@ struct task_struct *kthread_create_on_cpu(int (*threadfn)(void *data),
  */
 static int kthread_iterant_fn(void *kti_ptr)
 {
+	struct kthread *kt = to_kthread(current);
 	struct kthread_iterant *kti = kti_ptr;
 	void *data = kti->data;
 
+	kt->kti = kti;
+
 	set_freezable();
 
 	if (kti->init)
-- 
1.8.5.6
