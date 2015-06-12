Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3OxF-0007tp-Qd
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 13:25:07 +0000
Date: Fri, 12 Jun 2015 15:24:40 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 07/18] kthread: Make iterant kthreads freezable by
 default
Message-ID: <20150612132440.GH9409@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-8-git-send-email-pmladek@suse.cz>
 <20150609072003.GY21465@mtj.duckdns.org>
 <20150609155313.GC9409@pathway.suse.cz>
 <20150610043154.GG11955@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150610043154.GG11955@mtj.duckdns.org>
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

On Wed 2015-06-10 13:31:54, Tejun Heo wrote:
> Hello, Petr.
> 
> On Tue, Jun 09, 2015 at 05:53:13PM +0200, Petr Mladek wrote:
> > I think that the interaction with the hardware should be the reason to
> > make them properly freezable. In the current state they are stopped at
> > some random place, they might either miss some event from the hardware
> > or the hardware might get resumed into another state and the kthread
> > might wait forever.
> 
> Yes, IIUC, there are two classes of use cases where freezing kthreads
> makes sense.

First, thanks a lot for detailed explanation.

> * While hibernating, freezing writeback workers and whoever else which
>   might issue IOs.  This is because we have to thaw devices to issue
>   IOs to write out the prepared hibernation image.  If new IOs are
>   issued from page cache or whereever when the devices are thawed for
>   writing out the hibernation image, the hibernation image and the
>   data on the disk deviate.

Just an idea. I do not say that it is a good solution. If we already
thaw devices needed to write the data. It should be possible to thaw
also kthreads needed to write the data.


>   Note that this only works because currently none of the block
>   drivers which may be used to write out hibernation images depend on
>   freezable kthreads and hopefully nobody issues IOs from unfreezable
>   kthreads or bh or softirq, which, I think, can happen with
>   preallocated requests or bio based devices.

It means that some kthreads must be stopped, some must be available,
and we do not mind about the rest. I wonder which group is bigger.
It might help to decide about the more safe default. It is not easy
for me to decide :-/


>   This is a very brittle approach.  Instead of controlling things
>   where it actually can be controlled - the IO ingress point - we're
>   trying to control all its users with a pretty blunt tool while at
>   the same time depending on the fact that some of the low level
>   subsystems don't happen to make use of the said blunt tool.
>
>   I think what we should do is simply blocking all non-image IOs from
>   the block layer while writing out hibernation image.  It'd be
>   simpler and a lot more reliable.

This sounds like an interesting idea to me. Do you already have some
more precise plan in mind?

Unfortunately, for me it is not easy to judge it. I wonder how many
interfaces would need to get hacked to make this working.
Also I wonder if they would be considered as a hack or a clean
solution by the affected parties. By other words, I wonder if it is
realistic.


> * Device drivers which interact with their devices in a fully
>   synchronous manner so that blocking the kthread always reliably
>   quiesces the device.  For this to be true, the device shouldn't
>   carry over any state across the freezing points.  There are drivers
>   which are actually like this and it works for them.

I am trying to sort it in my head. In each case, we need to stop these
kthreads in some well defined state. Also the kthread (or device)
must be able to block the freezing if they are not in the state yet.

The stop points are defined by try_to_freeze() now. And freezable
kthreads block the freezer until they reach these points.


>   However, my impression is that people don't really scrutinize why
>   freezer works for a specific case and tend to spray them all over
>   and develop a fuzzy sense that freezing will somehow magically make
>   the driver ready for PM operatoins.  It doesn't help that freezer is
>   such a blunt tool and our historical usage has always been fuzzy -
>   in the earlier days, we depended on freezer even when we knew it
>   wasn't sufficient probably because updating all subsystems and
>   drivers were such a huge undertaking and freezer kinda sorta works
>   in many cases.

I try to better understand why freezer is considered to be a blunt
tool. Is it because it is a generic API, try_to_freeze() is put on
"random" locations, so that it does not define the safe point
precisely enough?


>   IMHO we'd be a lot better served by blocking the kthread from PM
>   callbacks explicitly for these drivers to unify control points for
>   PM operations and make what's going on a lot more explicit.  This
>   will surely involve a bit more boilerplate code but with the right
>   helpers it should be mostly trivial and I believe that it's likely
>   to encourage higher quality PM operations why getting rid of this
>   fuzzy feeling around the freezer.

I agree. There is needed some synchronization between the device
drivers and kthread to make sure that they are on the same note.

If I get this correctly. It works the following way now. PM notifies
both kthreads (via freezer) and device drivers (via callbacks) about
that the suspend is in progress. They are supposed to go into a sane
state. But there is no explicit communication between the kthread
and the driver.

What do you exactly mean with the callbacks? Should they set some
flags that would navigate the kthread into some state?


> I'm strongly against this.  We really don't want to make it even
> fuzzier.  There are finite things which need to be controlled for PM
> operations and I believe what we need to do is identifying them and
> implementing explicit and clear control mechanisms for them, not
> spreading this feel-good mechanism even more, further obscuring where
> those points are.

I see. This explains why you are so strongly against changing the
default. I see the following in the kernel sources:

	 61  set_freezable()
	 97  kthread_create()
	 259 kthread_run()

I means that only about 17% kthreads are freezable these days.

> This becomes the game of "is it frozen ENOUGH yet?"  and that "enough"
> is extremely difficult to determine as we're not looking at the choke
> spots at all and freezable kthreads only cover part of kernel
> activity.  The fuzzy enoughness also actually inhibits development of
> proper mechanisms - "I believe this is frozen ENOUGH at this point so
> it is probably safe to assume that X, Y and Z aren't happening
> anymore" and it usually is except when it's not.

I am not sure what you mean by frozen enough? I think that a tasks
is either frozen or not. Do I miss something, please?

Best Regards,
Petr
