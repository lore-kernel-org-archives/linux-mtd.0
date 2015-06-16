Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4lhe-0004DK-8Q
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 07:54:39 +0000
Date: Tue, 16 Jun 2015 09:54:14 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [RFC PATCH 06/18] signal/kthread: Initial implementation of
 kthread signal handling
Message-ID: <20150616075414.GE3135@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-7-git-send-email-pmladek@suse.cz>
 <20150606215816.GB15591@redhat.com>
 <20150608135107.GB3135@pathway.suse.cz>
 <20150608211336.GB24869@redhat.com>
 <20150615131341.GN9409@pathway.suse.cz>
 <20150615191429.GA29727@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150615191429.GA29727@redhat.com>
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

On Mon 2015-06-15 21:14:29, Oleg Nesterov wrote:
> Ah, understand. You think that we need to take ->siglock in advance
> to avoid the race with SIGCONT?

exactly

> No, we don't. Let me show you the code I suggested again:
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
> 	
> so you can dequeue_signal() and call kthread_do_signal_stop() without
> holding ->siglock. We can rely on JOBCTL_STOP_DEQUEUED bit. SIGCONT
> clears it, so kthread_do_signal_stop() can't race.

Heureka, I have got it. I have previously missed the meaning of the
JOBCTL_STOP_DEQUEUED bit. Thanks for explanation.

Best Regards,
Petr
