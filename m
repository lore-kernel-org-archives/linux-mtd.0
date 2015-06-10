Date: Wed, 10 Jun 2015 11:07:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH 09/18] kthread: Make it easier to correctly sleep in
 iterant kthreads
Message-ID: <20150610090724.GD3644@twins.programming.kicks-ass.net>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-10-git-send-email-pmladek@suse.cz>
 <20150605161021.GJ19282@twins.programming.kicks-ass.net>
 <20150608134810.3abd862b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150608134810.3abd862b@gandalf.local.home>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
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

On Mon, Jun 08, 2015 at 01:48:10PM -0400, Steven Rostedt wrote:
> > commit 80ed87c8a9ca0cad7ca66cf3bbdfb17559a66dcf
> > Author: Peter Zijlstra <peterz@infradead.org>
> > Date:   Fri May 8 14:23:45 2015 +0200
> > 
> >     sched/wait: Introduce TASK_NOLOAD and TASK_IDLE
> >     
> >     Currently people use TASK_INTERRUPTIBLE to idle kthreads and wait for
> >     'work' because TASK_UNINTERRUPTIBLE contributes to the loadavg. Having
> >     all idle kthreads contribute to the loadavg is somewhat silly.
> 
> Not to mention, tasks in TASK_UNINTERRUPTIBLE state for too long will
> trigger hung task detection.

Right, and I had not considered that, but it turns out the hung_task
detector checks p->state == TASK_UNINTERRUPTIBLE, so TASK_IDLE is indeed
safe from that.
