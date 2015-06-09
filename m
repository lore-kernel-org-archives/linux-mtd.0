Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Coj-0001Ex-4c
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 06:15:21 +0000
Received: by pdbki1 with SMTP id ki1so7763409pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2015 23:14:58 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 9 Jun 2015 15:14:46 +0900
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 00/18] kthreads/signal: Safer kthread API and signal
 handling
Message-ID: <20150609061446.GV21465@mtj.duckdns.org>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <20150605162216.GK19282@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150605162216.GK19282@twins.programming.kicks-ass.net>
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

Hey, Peter.

On Fri, Jun 05, 2015 at 06:22:16PM +0200, Peter Zijlstra wrote:
> There's a lot more problems with workqueues:
> 
>  - they're not regular tasks and all the task controls don't work on
>    them. This means all things scheduler, like cpu-affinity, nice, and
>    RT/deadline scheduling policies. Instead there is some half baked
>    secondary interface for some of these.

Because there's a pool of them and the workers come and go
dynamically.  There's no way around it.  The attributes just have to
be per-pool.

>    But this also very much includes things like cgroups, which brings me
>    to the second point.
>
>  - its oblivious to cgroups (as it is to RT priority for example) both
>    leading to priority inversion. A work enqueued from a deep/limited
>    cgroup does not inherit the task's cgroup. Instead this work is ran
>    from the root cgroup.
> 
>    This breaks cgroup isolation, more significantly so when a large part
>    of the actual work is done from workqueues (as some workloads end up
>    being). Instead of being able to control the work, it all ends up in
>    the root cgroup outside of control.

cgroup support will surely be added but I'm not sure we can or should
do inheritance automatically.  Using a different API doesn't solve the
problem automatically either.  A lot of kthreads are shared
system-wide after all.  We'll need an abstraction layer to deal with
that no matter where we do it.

Thanks.

-- 
tejun
