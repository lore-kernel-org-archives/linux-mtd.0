Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1Mcd-0004wj-CC
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 22:31:24 +0000
Date: Sun, 7 Jun 2015 00:30:01 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [RFC PATCH 11/18] jffs2: Convert jffs2_gcd_mtd kthread into
 the iterant API
Message-ID: <20150606223001.GA18838@redhat.com>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-12-git-send-email-pmladek@suse.cz>
 <20150606211648.GA15591@redhat.com>
 <alpine.LNX.2.00.1506062322550.12753@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1506062322550.12753@pobox.suse.cz>
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

On 06/06, Jiri Kosina wrote:
>
> On Sat, 6 Jun 2015, Oleg Nesterov wrote:
>
> > Still I personally dislike the new kthread_sigaction() API. I agree,
> > a couple if signal helpers for kthreads make sense. Say,
> >
> > 	void kthread_do_signal_stop(void)
> > 	{
> > 		spin_lock_irq(&curtent->sighand->siglock);
> > 		if (current->jobctl & JOBCTL_STOP_DEQUEUED)
> > 			__set_current_state(TASK_STOPPED);
> > 		spin_unlock_irq(&current->sighand->siglock);
> >
> > 		schedule();
> > 	}
>
> ... not to mention the fact that 'STOP' keyword in relation to kthreads
> has completely different meaning today, which just contributes to overall
> confusion; but that's an independent story.

Yes, agreed.

> > But personally I do not think kthread_do_signal() makes a lot of sense...
>
> Would it be possible for you to elaborate a little bit more why you think
> so ... ?

Please see another email I sent in reply to 06/18.

> I personally don't see a huge principal difference between
> "kthread_signal_dequeue() + kthread_do_signal_{stop,...}" vs. generic
> "kthread_do_signal()" that's just basically completely general and takes
> care of 'everything necessary'.

Then why do we need the new API ?

And I do see the difference. Rightly or not I belive that this API buys
nothing but makes the kthread && signal interaction more complex and
confusing. For no reason.

But!

> That being said, my relationship to signal
> handling code is of course much less intimate compared to yours,

No, no, no, this doesn't matter at all ;)

Yes I do dislike this API. So what? I can be wrong. So if other reviewers
like it I will hate them all ^W^W^W not argure. So please comment. I never
trust myself unless I can technically (try to) prove I am right. In this
case I can't, this is only my feeling.

Oleg.
