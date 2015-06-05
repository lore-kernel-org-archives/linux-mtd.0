Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8y-0006DQ-KZ
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:49 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 16/18] kthread: Support interruptible sleep with a timeout
 by iterant kthreads
Date: Fri,  5 Jun 2015 17:01:15 +0200
Message-Id: <1433516477-5153-17-git-send-email-pmladek@suse.cz>
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

The aim of kthread iterant API is to maintain some non-trivial operations
on the single place. One of this operations is sleeping between iterations
because we need to handle properly system freezing, parking, and
kthread stopping.

This patch adds support for interruptible sleep with a timeout. It defines
the type, function to set and do the sleep. The timeout value is added
into the struct kthread_iterant.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 include/linux/kthread.h |  5 +++++
 kernel/kthread.c        | 30 +++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index 415178c20cde..e8f7c0106cfd 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -53,13 +53,16 @@ struct task_struct *kthread_create_on_cpu(int (*threadfn)(void *data),
 #define KTI_PAUSE_ONCE		0x00000001
 /* Do interruptible sleep between iterations. */
 #define KTI_INT_SLEEP		0x00000002
+#define KTI_INT_SLEEP_TIMEOUT	0x00000004
 
 #define KTI_PAUSE_MASK		(KTI_INT_SLEEP | \
+				 KTI_INT_SLEEP_TIMEOUT | \
 				 KTI_PAUSE_ONCE)
 
 /**
  * struct kthread_iterant - structure describing the function of the kthread
  * @type: modifies the kthread behavior using extra flags.
+ * @timeout: timeout value in jiffies.
  * @data: pointer to a data passed to the functions.
  * @init: function called when the kthread is created.
  * @func: function called in the main cycle until the kthread is terminated.
@@ -67,6 +70,7 @@ struct task_struct *kthread_create_on_cpu(int (*threadfn)(void *data),
  */
 struct kthread_iterant {
 	unsigned int type;
+	signed long timeout;
 	void *data;
 	void (*init)(void *data);
 	void (*func)(void *data);
@@ -97,6 +101,7 @@ kthread_iterant_create_on_cpu(struct kthread_iterant *kti,
 })
 
 void set_kthread_iterant_int_sleep(void);
+void set_kthread_iterant_int_sleep_timeout(signed long timeout);
 
 void kthread_bind(struct task_struct *k, unsigned int cpu);
 void kthread_stop_current(void);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index fa40fb549e22..9a5845674419 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -455,6 +455,30 @@ void set_kthread_iterant_int_sleep(void)
 EXPORT_SYMBOL(set_kthread_iterant_int_sleep);
 
 /**
+ * set_kthread_iterant_int_sleep_timeout - do interuptible sleep
+ *	with a timeout before the next iteration
+ * @timeout: timeout value in jiffies
+ *
+ * This function is typically called under a lock, when the main func()
+ * checks for the pending work.
+ *
+ * Kthreads should pause between iterations only when there is no work,
+ * signal pending, freezing, parking, or termination; we want to do most
+ * of these checks properly on a single place: kthread_iterant_fn().
+ * Only the check for pending work need to be done in the main func()
+ * because it is not generic.
+ */
+void set_kthread_iterant_int_sleep_timeout(signed long timeout)
+{
+	struct kthread_iterant *kti = to_kthread_iterant(current);
+
+	set_kthread_iterant_pause_type(kti, KTI_INT_SLEEP_TIMEOUT);
+	kti->timeout = timeout;
+	set_current_state(TASK_INTERRUPTIBLE);
+}
+EXPORT_SYMBOL(set_kthread_iterant_int_sleep_timeout);
+
+/**
  * do_kthread_iterant_pause - do the selected pause before next iteration
  *
  * Most kthreads sleep or wait between iterations. This function
@@ -470,7 +494,9 @@ static void do_kthread_iterant_pause(struct kthread_iterant *kti)
 	 * Explicitly set the task state when it was not set by
 	 * set_kthread_iterant_int_sleep*() functions.
 	 */
-	if (!(type & KTI_PAUSE_ONCE) && (type & KTI_INT_SLEEP))
+	if (!(type & KTI_PAUSE_ONCE) &&
+	    ((type & KTI_INT_SLEEP) ||
+	     (type & KTI_INT_SLEEP_TIMEOUT)))
 		set_current_state(TASK_INTERRUPTIBLE);
 
 	if (kthread_freezable_should_stop(NULL)) {
@@ -480,6 +506,8 @@ static void do_kthread_iterant_pause(struct kthread_iterant *kti)
 
 	if (type & KTI_INT_SLEEP)
 		freezable_schedule();
+	else if (type & KTI_INT_SLEEP_TIMEOUT)
+		freezable_schedule_timeout(kti->timeout);
 	else
 		freezable_cond_resched();
 
-- 
1.8.5.6
