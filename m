Date: Fri, 5 Jun 2015 18:22:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 00/18] kthreads/signal: Safer kthread API and signal
 handling
Message-ID: <20150605162216.GK19282@twins.programming.kicks-ass.net>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
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

On Fri, Jun 05, 2015 at 05:00:59PM +0200, Petr Mladek wrote:
> Workqueue
> 
> 
> Workqueues are quite popular and many kthreads have already been
> converted into them.
> 
> Work queues allow to split the function into even more pieces and
> reach the common check point more often. It is especially useful
> when a kthread handles more tasks and is woken when some work
> is needed. Then we could queue the appropriate work instead
> of waking the whole kthread and checking what exactly needs
> to be done.
> 
> But there are many kthreads that need to cycle many times
> until some work is finished, e.g. khugepaged, virtio_balloon,
> jffs2_garbage_collect_thread. They would need to queue the
> work item repeatedly from the same work item or between
> more work items. It would be a strange semantic.
> 
> Work queues allow to share the same kthread between more users.
> It helps to reduce the number of running kthreads. It is especially
> useful if you would need a kthread for each CPU.
> 
> But this might also be a disadvantage. Just look into the output
> of the command "ps" and see the many [kworker*] processes. One
> might see this a black hole. If a kworker makes the system busy,
> it is less obvious what the problem is in compare with the old
> "simple" and dedicated kthreads.
> 
> Yes, we could add some debugging tools for work queues but
> it would be another non-standard thing that developers and
> system administrators would need to understand.
> 
> Another thing is that work queues have their own scheduler. If we
> move even more tasks there it might need even more love. Anyway,
> the extra scheduler adds another level of complexity when
> debugging problems.

There's a lot more problems with workqueues:

 - they're not regular tasks and all the task controls don't work on
   them. This means all things scheduler, like cpu-affinity, nice, and
   RT/deadline scheduling policies. Instead there is some half baked
   secondary interface for some of these.

   But this also very much includes things like cgroups, which brings me
   to the second point.

 - its oblivious to cgroups (as it is to RT priority for example) both
   leading to priority inversion. A work enqueued from a deep/limited
   cgroup does not inherit the task's cgroup. Instead this work is ran
   from the root cgroup.

   This breaks cgroup isolation, more significantly so when a large part
   of the actual work is done from workqueues (as some workloads end up
   being). Instead of being able to control the work, it all ends up in
   the root cgroup outside of control.
