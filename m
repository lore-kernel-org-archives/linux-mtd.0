Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IDdM-00057n-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 19:13:48 +0100
Date: Thu, 5 Jul 2001 20:16:21 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
cc: jffs-dev@axis.com, MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: On the "safe filesystem" and write() topic
In-Reply-To: <5.1.0.14.0.20010704082022.00a67538@mail.spewey.com>
Message-ID: <Pine.LNX.4.21.0107051942540.17972-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 4 Jul 2001, Vipin Malik wrote:
> I think I surely said it in context of JFFS (not JFFS2) loosing integrity 
> (including files at random) during power fail tests and I stand behind 
> those results till proven otherwise. Have you guys tested the JFFS fs under 
> power fail? What version are you using and what were your results?

We've tested it but probably not in more than a couple of hundred
cycles; I've never seen that floating bit error before, perhaps it's just
some flash chips that get bitten by that and it might depend on the
hardware as well (resident charge in capacitors etc).

> would you rather go with? With the maturing of JFFS2, IMHO folks should be 
> encouraged to migrate to JFFS2 if possible (I am). Is there anything that 
> JFFS gives you that you don't get with JFFS2?

All products on sale from Axis still run 2.0.. next generation will be 2.4
and some sort of JFFS, and it will be JFFS2 if the bugs are sorted out (no
theoretical reason why JFFS2 shouldn't be perfect of course, it's just a
matter of finetuning :) Well apart from compression-code and
latency; after all you cannot both have synchronous writes, compression
and expecting the application to not be blocked.. 

(The rest of the system should not be blocked though, that's just a matter
of being able to yield due to need_resched inside the
compression code)

> >The problems arise from the vague definition of what the desired state
> >would be - is it the data before the last write(), and what happens if you
> >receive a signal ?
> 
> Isn't it the same case as what happens when you get a power fail? (please 
> pardon my lack of understanding of signals in kernels. Can the execution 
> that was interrupted with a signal ever resume at the interrupted point?)

Depends on the system call and underlying filesystem; for a
normal read/write, they probably just return the number of chars
read/written up to the point of the signal (just as they can by the
API). And hence my comment that it's no use trying to enforce atomic
behaviour for entire write() chunks. Your app can catch a signal, return
from a half-written write and then crash before you can write() the
"missing" chars.

So if you want to do the "atomic write" you need to disable all signal
checking inside the write paths, which means going back to the non-generic
write VFS functions and coincidentally you'll need to block the rest of
the system as well (see 2'nd above paragraph) because you can't reschedule
without a signal-check.

It's simply not a tenable scenario :) 

I'd much rather see the "start transaction/end transaction" ioctl's than
trying to make write be atomic.

> >  Writes to mmap'ed pages can't use that mechanism, and
> >you'll be stuck with using write()'s when you really probably want to use
> >libc wrappers like fwrite and fprintf.
> 
> That's true, but it's a tradeoff: If the task wants reliable writes to the 
> fs, it must not use any lib calls. As a matter of fact, that's the last 
> thing you want to use anyway as these wrappers buffer the programs writes, 
> defeating the purpose of the default mechanism of O_SYNC of the JFFS(2) fs.

I think that's a non sequiteur, especially given that the individual write
itself is not atomic anyway. It can't matter if you do fprintf or a
write() in a loop (since that's exactly what fprintf does eventually
anyway).

As long as writes are enforced to be sequential, I think that's
enough. Does not JFFS2 queue writes internally anyway BTW ? And if you
have O_SYNC (assuming JFFS adheres to it) when fprintf returns you can be
as guaranteed that the data has been written as if you'd done it yourself
with a write().

> points in it that are being updated frequently. Each file has an overhead 
> (as well a max # of files limit on the fs). How reasonable is it to put 
> 5000, 8 byte files on a 1MB JFFS(2) fs? (this file would only occupy <50KB 
> in a single (db) file) vs at least 5000*64(file overhead)+5000*8 = 360KB as 
> separate files, assuming that you can even fit 5000 files on your partition.

I think either a transaction mechanism or an entirely different flash
filesystem (not VFS-based) need to be used if that is a common usage
scenario.

> >The kernel-level transactional extension would probably be quite difficult
> >to get consistent also, because Linux VFS does not know about it yet (this
> >is eventually changing with the integration of the general journalling
> >layer I guess). I get a headache thinking about it, perhaps it's possible
> >perhaps it's not; perhaps this code already exist in the other journalling
> >filesystems, perhaps it does not.
> 
> I cannot speak intelligently about this so I'll keep my mouth shut :)

IIRC the main holding points against merging reiserfs before was that it
really should wait until VFS is made aware of journalling concepts in
order to avoid "half way" solutions, and that in turn was dependant on the
ext3 developers etc... 

Thing is, I think JFFS2 uses the generic file writing in VFS which means
that VFS itself fetches and updates pages in the page-cache (or
similar) which means an overall more complex situation for JFFS which
wants to write this transactionally without inter-process dependencies
etc..

I.e. suppose process A is writing to file X while B is reading from it,
and writing to file Y at the same time. A starts a transaction and
writes. If VFS does not know about transactions, it will simply put the
writes in the page-cache so B might read them and write to file Y. So if a
crash occurs, yes, file X is intact but Y is screwed up.

So the writes need to be queued up in JFFS or VFS or you need to guarantee
that only the process doing the writes have access to the file at the same
time. This is a major obstacle, and I don't know how it's solved in
reiser, JFS and XFS (if they support user-level transactions at
all) without patching VFS and the page-cache.

> any config or db directly on the fs unreasonable. (if you've been following 
> my jitter tests recently, JFFS2 can block for 10's of seconds when it 
> getting quite full).

Probably possible but that's an implementation problem not a theoretical
problem. In a "run time" phase (flash is almost all dirty, space exist and
writes are coming in) there should never need to be more latency that what
it takes to GC the same amount of space as you want to write.

And as I wrote above somewhere, while the writing process needs to be
blocked (in O_SYNC) there is no reason to block other processes from
scheduling in, unless I've missed something major...

> transactions in the fs. Anyway, there is a new project that is being 
> started on developing (or modifying an existing embedded db (mird)) to 
> provide for this transaction level processing for embedded systems on 
> JFFS(2). In addition to providing transactions it will also provide a 

One alternative is a completely user-mode flash DB. Have a deamon which
have access to a raw flash device and implements a transactional database
on that device. No need for a kernel system really..

> caching layer that will allow the transaction log to be put on *another* 
> non-volatile medium if such is available in your system. The big advantage 

Why would this be necessary ?

/BW
