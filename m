Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8x-00024D-DN
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:48 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 15/18] ring_buffer: Allow to exit the ring buffer
 benchmark immediately
Date: Fri,  5 Jun 2015 17:01:14 +0200
Message-Id: <1433516477-5153-16-git-send-email-pmladek@suse.cz>
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

It takes a while until the ring_buffer_benchmark module is removed
when the ring buffer hammer is running. It is because it takes
few seconds and kthread_should_terminate() is not being checked.

This patch adds the check for kthread termination into the producer.
It uses the existing kill_test flag to finish the kthreads as
cleanly as possible.

It disables printing the "ERROR" message when the kthread is going.

Also it makes sure that producer does not go into the 10sec sleep
when it is being killed.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 kernel/trace/ring_buffer_benchmark.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer_benchmark.c b/kernel/trace/ring_buffer_benchmark.c
index 2d276b892aea..4ecf7c4567e2 100644
--- a/kernel/trace/ring_buffer_benchmark.c
+++ b/kernel/trace/ring_buffer_benchmark.c
@@ -270,6 +270,9 @@ static void ring_buffer_producer(void)
 			try_to_freeze();
 		}
 
+		if (kthread_should_stop())
+			kill_test = 1;
+
 	} while (ktime_before(end_time, timeout) && !kill_test);
 	trace_printk("End ring buffer hammer\n");
 
@@ -291,7 +294,7 @@ static void ring_buffer_producer(void)
 	entries = ring_buffer_entries(buffer);
 	overruns = ring_buffer_overruns(buffer);
 
-	if (kill_test)
+	if (kill_test && !kthread_should_stop())
 		trace_printk("ERROR!\n");
 
 	if (!disable_reader) {
@@ -377,10 +380,8 @@ static void ring_buffer_producer_thread_init(void *arg)
 
 static void ring_buffer_producer_thread_func(void *arg)
 {
-	if (kill_test) {
-		set_kthread_iterant_int_sleep();
-		return;
-	}
+	if (kill_test)
+		goto test_killed;
 
 	ring_buffer_reset(buffer);
 
@@ -393,9 +394,16 @@ static void ring_buffer_producer_thread_func(void *arg)
 
 	ring_buffer_producer();
 
+	if (kill_test)
+		goto test_killed;
+
 	trace_printk("Sleeping for 10 secs\n");
 	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(HZ * SLEEP_TIME);
+	return;
+
+test_killed:
+	set_kthread_iterant_int_sleep();
 }
 
 static int __init ring_buffer_benchmark_init(void)
-- 
1.8.5.6
