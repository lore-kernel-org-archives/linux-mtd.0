Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Xgi-0002qK-GJ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 04:32:29 +0000
Received: by pdjm12 with SMTP id m12so28796744pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2015 21:32:07 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 10 Jun 2015 13:31:54 +0900
From: Tejun Heo <tj@kernel.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 07/18] kthread: Make iterant kthreads freezable by
 default
Message-ID: <20150610043154.GG11955@mtj.duckdns.org>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-8-git-send-email-pmladek@suse.cz>
 <20150609072003.GY21465@mtj.duckdns.org>
 <20150609155313.GC9409@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150609155313.GC9409@pathway.suse.cz>
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

On Tue, Jun 09, 2015 at 05:53:13PM +0200, Petr Mladek wrote:
> I think that the interaction with the hardware should be the reason to
> make them properly freezable. In the current state they are stopped at
> some random place, they might either miss some event from the hardware
> or the hardware might get resumed into another state and the kthread
> might wait forever.

Yes, IIUC, there are two classes of use cases where freezing kthreads
makes sense.

* While hibernating, freezing writeback workers and whoever else which
  might issue IOs.  This is because we have to thaw devices to issue
  IOs to write out the prepared hibernation image.  If new IOs are
  issued from page cache or whereever when the devices are thawed for
  writing out the hibernation image, the hibernation image and the
  data on the disk deviate.

  Note that this only works because currently none of the block
  drivers which may be used to write out hibernation images depend on
  freezable kthreads and hopefully nobody issues IOs from unfreezable
  kthreads or bh or softirq, which, I think, can happen with
  preallocated requests or bio based devices.

  This is a very brittle approach.  Instead of controlling things
  where it actually can be controlled - the IO ingress point - we're
  trying to control all its users with a pretty blunt tool while at
  the same time depending on the fact that some of the low level
  subsystems don't happen to make use of the said blunt tool.

  I think what we should do is simply blocking all non-image IOs from
  the block layer while writing out hibernation image.  It'd be
  simpler and a lot more reliable.

* Device drivers which interact with their devices in a fully
  synchronous manner so that blocking the kthread always reliably
  quiesces the device.  For this to be true, the device shouldn't
  carry over any state across the freezing points.  There are drivers
  which are actually like this and it works for them.

  However, my impression is that people don't really scrutinize why
  freezer works for a specific case and tend to spray them all over
  and develop a fuzzy sense that freezing will somehow magically make
  the driver ready for PM operatoins.  It doesn't help that freezer is
  such a blunt tool and our historical usage has always been fuzzy -
  in the earlier days, we depended on freezer even when we knew it
  wasn't sufficient probably because updating all subsystems and
  drivers were such a huge undertaking and freezer kinda sorta works
  in many cases.

  IMHO we'd be a lot better served by blocking the kthread from PM
  callbacks explicitly for these drivers to unify control points for
  PM operations and make what's going on a lot more explicit.  This
  will surely involve a bit more boilerplate code but with the right
  helpers it should be mostly trivial and I believe that it's likely
  to encourage higher quality PM operations why getting rid of this
  fuzzy feeling around the freezer.

For both cases, I don't really think kthread freezer is a good
solution.  This is a blunt enough tool to hide problems in most but
not all cases while unnecessarily obscuring what's going on from
developers.  I personally strongly think that we eventually need to
get rid of the kernel part of freezer.

> Also I think that freezing kthreads on some well defined location
> should help with reproducing and fixing problems.
> 
> Note that _only_ kthreads using the _new API_ should be freezable by
> default. The move need to be done carefully. It is chance to review
> and clean up the freezer stuff.
>
> Of course, I might be too optimistic here.

I'm strongly against this.  We really don't want to make it even
fuzzier.  There are finite things which need to be controlled for PM
operations and I believe what we need to do is identifying them and
implementing explicit and clear control mechanisms for them, not
spreading this feel-good mechanism even more, further obscuring where
those points are.

This becomes the game of "is it frozen ENOUGH yet?"  and that "enough"
is extremely difficult to determine as we're not looking at the choke
spots at all and freezable kthreads only cover part of kernel
activity.  The fuzzy enoughness also actually inhibits development of
proper mechanisms - "I believe this is frozen ENOUGH at this point so
it is probably safe to assume that X, Y and Z aren't happening
anymore" and it usually is except when it's not.

Let's please not spread this even more.

> > In most cases, we want to implement proper power management callbacks
> > which plug new issuance of whatever work-unit the code is dealing with
> > and drain in-flight ones.  Whether the worker threads are frozen or
> > not doesn't matter once that's implemented.
> 
> I see. The power management is important here.

That's the only reason we have freezer at all.

> > It seems that people have been marking kthreads freezable w/o really
> > thinking about it - some of them are subtly broken due to missing
> > drainage of in-flight things while others simply don't need freezing
> > for correctness.
> 
> I have similar feeling.
> 
> > We do want to clean up freezer usage in the kernel but definitely do
> > not want to make kthreads freezable by default especially given that
> > the freezer essentially is one giant lockdep-less system-wide lock.
> 
> I think that we both want to clean up freezing. I would like to make
> it more deterministic and you suggest to make it more relaxed.
> Do I understand it correctly?

I'm not sure I'm trying to make it more relaxed.  I just don't want it
to spread uncontrolled.

Thanks a lot.

-- 
tejun
