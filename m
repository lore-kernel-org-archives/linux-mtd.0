Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1MpW-0007yz-6d
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 22:44:43 +0000
Date: Sun, 7 Jun 2015 00:44:15 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [RFC PATCH 11/18] jffs2: Convert jffs2_gcd_mtd kthread into the
 iterant API
In-Reply-To: <20150606223001.GA18838@redhat.com>
Message-ID: <alpine.LNX.2.00.1506070034100.12753@pobox.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-12-git-send-email-pmladek@suse.cz>
 <20150606211648.GA15591@redhat.com>
 <alpine.LNX.2.00.1506062322550.12753@pobox.suse.cz>
 <20150606223001.GA18838@redhat.com>
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

On Sun, 7 Jun 2015, Oleg Nesterov wrote:

> > > Still I personally dislike the new kthread_sigaction() API. I agree,
> > > a couple if signal helpers for kthreads make sense. Say,
> > >
> > > 	void kthread_do_signal_stop(void)
> > > 	{
> > > 		spin_lock_irq(&curtent->sighand->siglock);
> > > 		if (current->jobctl & JOBCTL_STOP_DEQUEUED)
> > > 			__set_current_state(TASK_STOPPED);
> > > 		spin_unlock_irq(&current->sighand->siglock);
> > >
> > > 		schedule();
> > > 	}
> >
> > ... not to mention the fact that 'STOP' keyword in relation to kthreads
> > has completely different meaning today, which just contributes to overall
> > confusion; but that's an independent story.
> 
> Yes, agreed.

I BTW think this really needs to be fixed. We have kthread parking and 
kthread stopping at least (and that doesn't include kthreads that actually 
*do* handle SIGSTOP), and the naming is unfortunate and confusing.

> > > But personally I do not think kthread_do_signal() makes a lot of sense...
> >
> > Would it be possible for you to elaborate a little bit more why you think
> > so ... ?
> 
> Please see another email I sent in reply to 06/18.

Yeah, let's just continue more detailed discussion there. I saw your reply 
only after I answered to your original mail.

> > I personally don't see a huge principal difference between 
> > "kthread_signal_dequeue() + kthread_do_signal_{stop,...}" vs. generic 
> > "kthread_do_signal()" that's just basically completely general and 
> > takes care of 'everything necessary'.
> 
> Then why do we need the new API ?

Well, in a nutshell, because of the "it's general and takes care of 
everything" part.

> And I do see the difference. Rightly or not I belive that this API buys
> nothing but makes the kthread && signal interaction more complex and
> confusing. For no reason.

Current situation with kthrads is a mess. Everyone and his grand-son needs 
to put explicit try_to_freeze(), cond_resched() and whatever else checks 
in his private kthreads main loop.

The fact that kthreads are more and more prone to making use of signal 
handling makes this even more complicated, because everyone is reinventing 
his own wheel for this.

It can't be really properly reviewed and - more importantly - it makes the 
whole "how would this particular kthread react to this particular signal?" 
very unpredictable and hard to answer question.

IMO Petr's patchset basically brings some kind order to this all -- it 
"batches" the kthread executions to individual iterations of the main 
loop, and allows to perform actions on the border of the iteration (such 
as, but not limited to, handling of the signals). Signal handling is just 
one of the piggy-backers on top of this general cleanup.

Thanks,

-- 
Jiri Kosina
SUSE Labs
