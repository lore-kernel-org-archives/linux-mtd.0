Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2DgW-0003Qx-Nx
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 07:10:57 +0000
Received: by pdbnf5 with SMTP id nf5so8634726pdb.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2015 00:10:34 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 9 Jun 2015 16:10:22 +0900
From: Tejun Heo <tj@kernel.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 06/18] signal/kthread: Initial implementation of
 kthread signal handling
Message-ID: <20150609071022.GX21465@mtj.duckdns.org>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-7-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433516477-5153-7-git-send-email-pmladek@suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, live-patching@vger.kernel.org,
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

Hello, Petr.

On Fri, Jun 05, 2015 at 05:01:05PM +0200, Petr Mladek wrote:
> Several kthreads already handle signals some way. They do so
> in different ways, search for allow_signal().
> 
> This patch allows to handle the signals in a more uniform way using
> kthread_do_signal().
> 
> The main question is how much it should follow POSIX and the signal
> handling of user space processes. On one hand, we want to be as close
> as possible. On the other hand, we need to be very careful. All signals
> were ignored until now, except for the few kthreads that somehow
> handled them.
> 
> POSIX behavior might cause some surprises and crazy bug reports.
> For example, imagine a home user stopping or killing kswapd because
> it makes the system too busy. It is like shooting in its own leg.
> 
> Also the signals are already used a strange way. For example, klockd
> drops all locks when it gets SIGKILL. This was added before initial
> git commit, so the archaeology was not easy. The most likely explanation
> is that it is used during the system shutdown. It would make sense
> to drop all locks when user space processes are killed and before
> filesystems get unmounted.
> 
> Now, the patch does the following compromise:
> 
>   + defines default actions for SIGSTOP, SIGCONT, and fatal signals
>   + custom actions can be defined by kthread_sigaction()
>   + all signals are still ignored by default
> 
> Well, fatal signals do not terminate the kthread immediately. They just
> set a flag to terminate the kthread, flush all other pending signals,
> and return to the main kthread cycle. The kthread is supposed to check
> the flag, leave the main cycle, do some cleanup actions when necessary
> and return from the kthread.
> 
> Note that kthreads are running in the kernel address space. It makes
> the life much easier. The signal handler can be called directly and
> we do not need any arch-specific code to process it in the userspace.
> Also we do not care about ptrace.
> 
> Finally, kthread_do_signal() is called on a safe place in the main
> iterant kthread cycle. Then we will not need any special code for
> signals when using this kthread API.
> 
> This change does not affect any existing kthread. The plan is to
> use them only in safe kthreads that can be converted into
> the iterant kthread API.

While I agree that it'd be great to consolidate the existing kthread
signal users, I feel quite uncomfortable with doing full-fledged
signal handling for kthreads which try to mimic the userland behavior.
Most of the default behaviors don't make sense for kthreads and it'd
be awful to have different kthreads interpreting arbitrary signals for
differing custom behaviors, which often happens when there's no
default.

While we do have several kthread signal users, they aren't too many
and majority of them use it to allow userland to tell it to shutdown
and there seem to be a couple which use HUP/USR1 to cancel whatever
it's processing / waiting on at the moment.  Hmmm... jffs uses
STOP/CONT too.

I don't know how this should be done but let's please try to

1. Encourage uniform behaviors across the signals.

2. Ultimately discourage usage of signals on kthreads as this closely
   ties implementation detail (use of single kthread) to the userland
   visible interface in a way where we can't easily get back out of.
   For example, what if jffs needs its gc workers to be multi-threaded
   and per-NUMA for high-iops devices later on?

Thanks.

-- 
tejun
