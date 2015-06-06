Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1LTm-00020y-KP
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 21:18:11 +0000
Date: Sat, 6 Jun 2015 23:16:48 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 11/18] jffs2: Convert jffs2_gcd_mtd kthread into
 the iterant API
Message-ID: <20150606211648.GA15591@redhat.com>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-12-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433516477-5153-12-git-send-email-pmladek@suse.cz>
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
> [*] In fact, there was a bug in the original code. It tried to process
>     a non-existing signal when the system was freezing. See the common
>     check for pending signal and freezing.

And another bug afaics:

> -			case SIGSTOP:
> -				jffs2_dbg(1, "%s(): SIGSTOP received\n",
> -					  __func__);
> -				set_current_state(TASK_STOPPED);
> -				schedule();
> -				break;

This is obviously racy, we can miss SIGCONT.

Still I personally dislike the new kthread_sigaction() API. I agree,
a couple if signal helpers for kthreads make sense. Say,

	void kthread_do_signal_stop(void)
	{
		spin_lock_irq(&curtent->sighand->siglock);
		if (current->jobctl & JOBCTL_STOP_DEQUEUED)
			__set_current_state(TASK_STOPPED);
		spin_unlock_irq(&current->sighand->siglock);

		schedule();
	}

and probably even "int kthread_signal_deque(void)".

But personally I do not think kthread_do_signal() makes a lot of sense...

Oleg.
