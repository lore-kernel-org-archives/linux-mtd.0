Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2u6l-0002Dw-Vy
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 04:28:52 +0000
Date: Thu, 11 Jun 2015 06:28:28 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH 09/18] kthread: Make it easier to correctly sleep in
 iterant kthreads
In-Reply-To: <20150610100729.6a674c15@gandalf.local.home>
Message-ID: <alpine.LNX.2.00.1506110625010.12753@pobox.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-10-git-send-email-pmladek@suse.cz>
 <20150605161021.GJ19282@twins.programming.kicks-ass.net>
 <20150608134810.3abd862b@gandalf.local.home>
 <20150610090724.GD3644@twins.programming.kicks-ass.net>
 <20150610100729.6a674c15@gandalf.local.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Petr Mladek <pmladek@suse.cz>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
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

On Wed, 10 Jun 2015, Steven Rostedt wrote:

> > Right, and I had not considered that, but it turns out the hung_task
> > detector checks p->state == TASK_UNINTERRUPTIBLE, so TASK_IDLE is indeed
> > safe from that.
> 
> Also, I would assume that TASK_IDLE only makes sense for kernel
> threads, I wonder if we should add an assertion in schedule that
> triggers if a task is scheduling with TASK_IDLE and is not a kernel
> thread (has its own mm?)

For the sake of completnes -- testing for !task_struct->mm is not a 
correct test to find out whether given entity is a kernel thread; kernel 
threads are free to temporarily adopt user struct mm via use_mm() (usually 
for handling AIO on behalf of a particular struct mm).

The correct check is to look at PF_KTHREAD flag in task_struct->flags.

-- 
Jiri Kosina
SUSE Labs
