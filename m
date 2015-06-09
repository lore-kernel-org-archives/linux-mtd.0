Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2LqL-00037g-Li
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 15:53:38 +0000
Date: Tue, 9 Jun 2015 17:53:13 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 07/18] kthread: Make iterant kthreads freezable by
 default
Message-ID: <20150609155313.GC9409@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-8-git-send-email-pmladek@suse.cz>
 <20150609072003.GY21465@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150609072003.GY21465@mtj.duckdns.org>
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

On Tue 2015-06-09 16:20:03, Tejun Heo wrote:
> Hello, Petr.
> 
> On Fri, Jun 05, 2015 at 05:01:06PM +0200, Petr Mladek wrote:
> > Many kthreads already calls set_freezable() before they enter the main
> > cycle. One of the reasons for creating iterant kthreads is to create
> > a safe point for freezing and make even more kthreads properly
> > freezable. Therefore it would make sense to set all iterant
> > kthreads freezable by default.
> 
> Actually, for most cases, making kthreads freezable is unnecessary and
> often indicative of something going wrong.  This is a crude mechanism
> which goes along the line of "if all threads are stopped, the machine
> should be safe to be put into whatever state", which isn't true at all
> as there usually are a lot of stuff going on asynchronously especially
> when interacting with hardware.

I think that the interaction with the hardware should be the reason to
make them properly freezable. In the current state they are stopped at
some random place, they might either miss some event from the hardware
or the hardware might get resumed into another state and the kthread
might wait forever.

Also I think that freezing kthreads on some well defined location
should help with reproducing and fixing problems.

Note that _only_ kthreads using the _new API_ should be freezable by
default. The move need to be done carefully. It is chance to review
and clean up the freezer stuff.

Of course, I might be too optimistic here.

> In most cases, we want to implement proper power management callbacks
> which plug new issuance of whatever work-unit the code is dealing with
> and drain in-flight ones.  Whether the worker threads are frozen or
> not doesn't matter once that's implemented.

I see. The power management is important here.


> It seems that people have been marking kthreads freezable w/o really
> thinking about it - some of them are subtly broken due to missing
> drainage of in-flight things while others simply don't need freezing
> for correctness.

I have similar feeling.

> We do want to clean up freezer usage in the kernel but definitely do
> not want to make kthreads freezable by default especially given that
> the freezer essentially is one giant lockdep-less system-wide lock.

I think that we both want to clean up freezing. I would like to make
it more deterministic and you suggest to make it more relaxed.
Do I understand it correctly?

Best Regards,
Petr


PS: Thanks a lot everyone for feedback. I try hard to get it
somehow sorted and more confident about the conclusions.
