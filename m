Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1M7t-0000DY-Qz
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 21:59:38 +0000
Date: Sat, 6 Jun 2015 23:58:16 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 06/18] signal/kthread: Initial implementation of
 kthread signal handling
Message-ID: <20150606215816.GB15591@redhat.com>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-7-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433516477-5153-7-git-send-email-pmladek@suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Michal Hocko <mhocko@suse.cz>, Chris Mason <clm@fb.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
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

On 06/05, Petr Mladek wrote:
>
> The main question is how much it should follow POSIX and the signal
> handling of user space processes. On one hand, we want to be as close
> as possible.

Why? Let the kthread decide what it should if it gets, say, SIGSTOP.

> Finally, kthread_do_signal() is called on a safe place in the main
> iterant kthread cycle. Then we will not need any special code for
> signals when using this kthread API.

OK, I will not comment other parts of iterant API in this thread.

But as for signal handling, to me a single kthread_iterant->do_signal()
callback looks better. Rather than multiple callbacks passed as
->kthread_sa_handler.

That single callback can deque a signal and decide what it should do.

> +	spin_lock_irqsave(&sighand->siglock, flags);
> +
> +	if (unlikely(signal->flags & SIGNAL_CLD_MASK)) {
> +		WARN(1, "there are no parents for kernel threads\n");
> +		signal->flags &= ~SIGNAL_CLD_MASK;
> +	}
> +
> +	for (;;) {
> +		struct k_sigaction *ka;
> +
> +		signr = dequeue_signal(current, &current->blocked, &ksig.info);
> +
> +		if (!signr)
> +			break;
> +
> +		ka = &sighand->action[signr-1];
> +
> +		/* Do nothing for ignored signals */
> +		if (ka->sa.kthread_sa_handler == KTHREAD_SIG_IGN)
> +			continue;

Again, I agree something like the simple kthread_dequeue_signal() makes
sense. Say, to drop the ignore signal like this code does. Although I
do not think this is really important, SIG_IGN is only possible if this
kthread does something strange. Say, blocks/unblocs the ignored signal.

> +
> +		/* Run the custom handler if any */
> +		if (ka->sa.kthread_sa_handler != KTHREAD_SIG_DFL) {
> +			ksig.ka = *ka;
> +
> +			if (ka->sa.sa_flags & SA_ONESHOT)
> +				ka->sa.kthread_sa_handler = KTHREAD_SIG_DFL;
> +
> +			spin_unlock_irqrestore(&sighand->siglock, flags);
> +			/* could run directly for kthreads */
> +			ksig.ka.sa.kthread_sa_handler(signr);
> +			freezable_cond_resched();
> +			goto relock;

Well. But for what? A simple "switch (signr)" after kthread_dequeue_signal()
can do the same. Or, speaking of kthread_iterant_fn() it can even dequeue the
signal and pass it to kti->whatever(signr).

> +		if (sig_kernel_ignore(signr))
> +			continue;

For what? Why a kthread should unignore (say) SIGWINCH if it is not going
to react?

> +		if (sig_kernel_stop(signr)) {
> +			__set_current_state(TASK_STOPPED);
> +			spin_unlock_irqrestore(&sighand->siglock, flags);
> +			/* Don't run again until woken by SIGCONT or SIGKILL */
> +			freezable_schedule();
> +			goto relock;

Yes this avoids the race with SIGCONT. But as I said we can add another
trivial helper which checks JOBCTL_STOP_DEQUEUED. So a kthread can do
this itself.

To me, SIG_DFL behaviour just makes makes no sense when it comes to
kthreads. I do not even think this can simplify the code. Unlike user-
space task, kthread can happily dequeue SIGSTOP, so why should we mimic
the userspace SIG_DFL logic.


> +		/* Death signals, but try to terminate cleanly */
> +		kthread_stop_current();
> +		__flush_signals(current);
> +		break;

The same.

Oleg.
