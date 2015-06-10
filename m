Date: Wed, 10 Jun 2015 12:40:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 00/18] kthreads/signal: Safer kthread API and signal
 handling
Message-ID: <20150610104057.GE3644@twins.programming.kicks-ass.net>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <20150605162216.GK19282@twins.programming.kicks-ass.net>
 <20150609061446.GV21465@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150609061446.GV21465@mtj.duckdns.org>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Petr Mladek <pmladek@suse.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-api@vger.kernel.org,
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

On Tue, Jun 09, 2015 at 03:14:46PM +0900, Tejun Heo wrote:
> Hey, Peter.
> 
> On Fri, Jun 05, 2015 at 06:22:16PM +0200, Peter Zijlstra wrote:
> > There's a lot more problems with workqueues:
> > 
> >  - they're not regular tasks and all the task controls don't work on
> >    them. This means all things scheduler, like cpu-affinity, nice, and
> >    RT/deadline scheduling policies. Instead there is some half baked
> >    secondary interface for some of these.
> 
> Because there's a pool of them and the workers come and go
> dynamically.  There's no way around it.  The attributes just have to
> be per-pool.

Sure, but there's a few possible ways to still make that work with the
regular syscall interfaces.

 1) propagate the change to any one worker to all workers of the same
    pool

 2) have a common ancestor task for each pool, and allow changing that.
    You can combine that with either the propagation like above, or a
    rule that workers kill themselves if they observe their parent
    changed (eg. check a attribute sequence count after each work).

> >    But this also very much includes things like cgroups, which brings me
> >    to the second point.
> >
> >  - its oblivious to cgroups (as it is to RT priority for example) both
> >    leading to priority inversion. A work enqueued from a deep/limited
> >    cgroup does not inherit the task's cgroup. Instead this work is ran
> >    from the root cgroup.
> > 
> >    This breaks cgroup isolation, more significantly so when a large part
> >    of the actual work is done from workqueues (as some workloads end up
> >    being). Instead of being able to control the work, it all ends up in
> >    the root cgroup outside of control.
> 
> cgroup support will surely be added but I'm not sure we can or should
> do inheritance automatically.  

I think its a good default to inherit stuff from the task that queued
it.

> Using a different API doesn't solve the
> problem automatically either.  A lot of kthreads are shared
> system-wide after all.  We'll need an abstraction layer to deal with
> that no matter where we do it.

Yes, hardware threads are global, but so is the hardware. Those are not
a problem provided the thread map 1:1 with the actual devices and do not
service multiple devices from a single thread.

Once you start combining things you start to get all the above problems
all over again.
