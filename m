Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2IRc-0005gz-8N
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 12:15:53 +0000
Date: Tue, 9 Jun 2015 14:15:24 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 06/18] signal/kthread: Initial implementation of
 kthread signal handling
In-Reply-To: <20150609071022.GX21465@mtj.duckdns.org>
Message-ID: <alpine.LNX.2.00.1506091405360.12753@pobox.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-7-git-send-email-pmladek@suse.cz>
 <20150609071022.GX21465@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Petr Mladek <pmladek@suse.cz>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
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

On Tue, 9 Jun 2015, Tejun Heo wrote:

> While I agree that it'd be great to consolidate the existing kthread
> signal users, I feel quite uncomfortable with doing full-fledged
> signal handling for kthreads which try to mimic the userland behavior.
> Most of the default behaviors don't make sense for kthreads and it'd
> be awful to have different kthreads interpreting arbitrary signals for
> differing custom behaviors, which often happens when there's no
> default.

I don't think the ultimate goal is to mimic what userspace does; 
especially when it comes to default actions.

To me, the ultimate goal (*) is to make it possible for kthread to be able 
to decide whether it wants "some kind of default behavior" (however that'd 
be defined), or "ignore all", or "just handle this set of signals with 
these handlers", and make API for this that would avoid every kthread 
implementing its own complete signal handling.

(*) Well, the ultimate goal really is to bring sanity to how kthreads are 
    handling their main loop. Trying to bring some consistency to how 
    kthreads are handling signals is just an (optional) added value on 
    top of that.

> While we do have several kthread signal users, they aren't too many and 
> majority of them use it to allow userland to tell it to shutdown and 

Yeah. Via SIGKILL. Or SIGTERM. Or SIGINT. Or SIGQUIT. Not really 
consistent either.

> there seem to be a couple which use HUP/USR1 to cancel whatever it's 
> processing / waiting on at the moment.  Hmmm... jffs uses STOP/CONT too.

> I don't know how this should be done but let's please try to
> 
> 1. Encourage uniform behaviors across the signals.

Fully agreed.

> 2. Ultimately discourage usage of signals on kthreads as this closely
>    ties implementation detail (use of single kthread) to the userland
>    visible interface in a way where we can't easily get back out of.
>    For example, what if jffs needs its gc workers to be multi-threaded
>    and per-NUMA for high-iops devices later on?

What kind of multi-threading kthreads are you referring to here? Something 
more sophisticated than simply spawning several per-CPU (or 
per-whatever-resource) full-fledged kthreads?

-- 
Jiri Kosina
SUSE Labs
