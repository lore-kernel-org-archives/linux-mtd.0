Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1LiF-0000QE-8T
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 21:33:07 +0000
Date: Sat, 6 Jun 2015 23:32:40 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [RFC PATCH 11/18] jffs2: Convert jffs2_gcd_mtd kthread into the
 iterant API
In-Reply-To: <20150606211648.GA15591@redhat.com>
Message-ID: <alpine.LNX.2.00.1506062322550.12753@pobox.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-12-git-send-email-pmladek@suse.cz>
 <20150606211648.GA15591@redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 Michal Hocko <mhocko@suse.cz>, Chris Mason <clm@fb.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 live-patching@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
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

On Sat, 6 Jun 2015, Oleg Nesterov wrote:

> Still I personally dislike the new kthread_sigaction() API. I agree,
> a couple if signal helpers for kthreads make sense. Say,
> 
> 	void kthread_do_signal_stop(void)
> 	{
> 		spin_lock_irq(&curtent->sighand->siglock);
> 		if (current->jobctl & JOBCTL_STOP_DEQUEUED)
> 			__set_current_state(TASK_STOPPED);
> 		spin_unlock_irq(&current->sighand->siglock);
> 
> 		schedule();
> 	}

... not to mention the fact that 'STOP' keyword in relation to kthreads 
has completely different meaning today, which just contributes to overall 
confusion; but that's an independent story.

> 
> and probably even "int kthread_signal_deque(void)".
> 
> But personally I do not think kthread_do_signal() makes a lot of sense...

Would it be possible for you to elaborate a little bit more why you think 
so ... ?

I personally don't see a huge principal difference between 
"kthread_signal_dequeue() + kthread_do_signal_{stop,...}" vs. generic 
"kthread_do_signal()" that's just basically completely general and takes 
care of 'everything necessary'. That being said, my relationship to signal 
handling code is of course much less intimate compared to yours, so I am 
really curious what particular objections to that interface have.

Thanks a lot,

-- 
Jiri Kosina
SUSE Labs
