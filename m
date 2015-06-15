Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4WEd-0002Z4-Vq
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 15:23:41 +0000
Date: Mon, 15 Jun 2015 17:23:13 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH 15/18] ring_buffer: Allow to exit the ring buffer
 benchmark immediately
Message-ID: <20150615152313.GC3135@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-16-git-send-email-pmladek@suse.cz>
 <20150608134417.3fb7a811@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150608134417.3fb7a811@gandalf.local.home>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Tejun Heo <tj@kernel.org>, live-patching@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Mon 2015-06-08 13:44:17, Steven Rostedt wrote:
> On Fri,  5 Jun 2015 17:01:14 +0200
> Petr Mladek <pmladek@suse.cz> wrote:
> 
> > It takes a while until the ring_buffer_benchmark module is removed
> > when the ring buffer hammer is running. It is because it takes
> > few seconds and kthread_should_terminate() is not being checked.
> > 
> > This patch adds the check for kthread termination into the producer.
> > It uses the existing kill_test flag to finish the kthreads as
> > cleanly as possible.
> > 
> > It disables printing the "ERROR" message when the kthread is going.
> > 
> > Also it makes sure that producer does not go into the 10sec sleep
> > when it is being killed.
> 
> This patch looks like something I may take regardless of the other
> patches (if it applies cleanly).

Please, find below a version of the patch that can be applied against
current Linus tree and also against your for-next branch.

> As for the other patches, the ring buffer benchmark is just that, a
> benchmark that I use when making changes to the ring buffer. It's not
> something for production systems.

I see.

> What about just adding a depend on !LIVE_PATCHING to
> RING_BUFFER_BENCHMARK, or force it to shut down during patching.
> There's no reason to make it safe to be running when you patch the
> kernel. Just adds complexity to some simple code.

I would like to convert all kthreads into some sane API. I hope
that it will make them rather easier. Let's see how it will look
like in the end.

Anyway, the two kthreads in this benchmark are in the "easy" group
regarding patching because they are sleeping only limited time.


>From 7c1f80e8389c036a06f35c5fd94a648025b995be Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.cz>
Date: Mon, 15 Jun 2015 15:53:10 +0200
Subject: [PATCH] ring_buffer: Allow to exit the ring buffer benchmark
 immediately

It takes a while until the ring_buffer_benchmark module is removed
when the ring buffer hammer is running. It is because it takes
few seconds and kthread_should_stop() is not being checked.

This patch adds the check for kthread termination into the producer.
It uses the existing @kill_test flag to finish the kthreads as
cleanly as possible.

It disables printing the "ERROR" message when the kthread is going.

It makes sure that producer does not go into the 10sec sleep
when it is being killed.

Finally, it does not call wait_to_die() when kthread_should_stop()
already returns true.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 kernel/trace/ring_buffer_benchmark.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ring_buffer_benchmark.c b/kernel/trace/ring_buffer_benchmark.c
index 1b28df2d9104..5b3583a01849 100644
--- a/kernel/trace/ring_buffer_benchmark.c
+++ b/kernel/trace/ring_buffer_benchmark.c
@@ -263,6 +263,8 @@ static void ring_buffer_producer(void)
 		if (cnt % wakeup_interval)
 			cond_resched();
 #endif
+		if (kthread_should_stop())
+			kill_test = 1;
 
 	} while (ktime_before(end_time, timeout) && !kill_test);
 	trace_printk("End ring buffer hammer\n");
@@ -285,7 +287,7 @@ static void ring_buffer_producer(void)
 	entries = ring_buffer_entries(buffer);
 	overruns = ring_buffer_overruns(buffer);
 
-	if (kill_test)
+	if (kill_test && !kthread_should_stop())
 		trace_printk("ERROR!\n");
 
 	if (!disable_reader) {
@@ -379,7 +381,7 @@ static int ring_buffer_consumer_thread(void *arg)
 	}
 	__set_current_state(TASK_RUNNING);
 
-	if (kill_test)
+	if (!kthread_should_stop)
 		wait_to_die();
 
 	return 0;
@@ -399,13 +401,16 @@ static int ring_buffer_producer_thread(void *arg)
 		}
 
 		ring_buffer_producer();
+		if (kill_test)
+			goto out_kill;
 
 		trace_printk("Sleeping for 10 secs\n");
 		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(HZ * SLEEP_TIME);
 	}
 
-	if (kill_test)
+out_kill:
+	if (!kthread_should_stop())
 		wait_to_die();
 
 	return 0;
-- 
1.8.5.6
