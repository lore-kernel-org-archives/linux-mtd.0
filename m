Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131uI7-0003eO-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 18:15:55 +0100
Date: Tue, 13 Jun 2000 11:16:06 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
Reply-To: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code. 
In-Reply-To: <11705.960912719@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000613104519.11182F-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 13 Jun 2000, David Woodhouse wrote:

> > Well, yes and no, AFAIK. The mapped driver was always indented to be
> > used for memory mapped flash, that is flash that is connected directly
> > to the CPU data bus (ie it is RAM).
 
> IIRC it shouldn't have been using readb at all, in that case. Just 
> dereferencing pointers would be fine. (Thinks.... if you've been using it 
> on ARM, was it me that added the readb() then?)

I just got the ARM boards two weeks ago.. the mapped driver probably
should not have been using readb..
 
> > IMHO you should add another abstraction to keep this tidy:
> >   top) Full blow MTD interface with write, read, erase functions. This
> >        is what the MTD char, block and filesystems talk to
> >   flash) Common functions shared by direct memory mapped flash, rom and
> >          rams. Contains CFI and JEDEC routines, ram and rom reader and ram
> >          writer. Maybe some file systems speak to this layer too..
> >   mapped) Aide for Memory Mapped flash, provides a many
> >           readers, one writer type locking for the paging function, and
> >           the necessary fast IO functions using simple memory references.
> >   low level mapped driver) Provides a paging function and sets up the
> >           memory window [turn on write through, bring the physical memory
> >           into the page tables, etc]
 
> I'm not sure why you want to separate the bottom two. The locking issues
> don't work wonderfully if you make the 'page' function callable outside the
> low-level mapped driver. Different hardware requires different locking, and 
> it's worth having it all-in-one, with a set of access operations which 
> lock, page and do the operation, then unlock.

Well, that would be the point, you wouldn't make the page function
callable outside the low level driver. If ever two EC's could get into the
page function at once that would be a bug in the higher level drivers.

> What I have at the moment is...

Yes, I saw..

>     This is passed to a various probe functions, for example ram_probe.,
> 	until one of them appears to like it.

IMHO the driver should simply populate the structure with the functions it
supports (either read/write/etc or page) and then pass that to a detect
function which does all supported probes. Then you can compile in/out
support for various kinds of devices if you want to.

Having the drivers call seperate probe functions is not what I had in mind
at all when I wrote that, I wanted to have a single probe function and a
'hint' structure.
 
> nora.c, for example, needs no locking because it's all memory-mapped 
> linearly - there's only about 100 lines of code. It's the right place to do 
> locking, but that doesn't mean it can't be dead simple. vmax301.c does 
> locking now - would you claim it's not still simple?

Well, it is about 2x as long as the original one :> It is simple right
now, but if you wanted to add a read/write lock then you'd have to put all
that complexity into all the low level drivers again, when they don't
really need it.

What I am saying is that a good fraction of your low level drivers will
look *exactly* the same:

void device_writebXX(...)
{
   lock();
   page();
   write();
   unlock();
}

or if there is no paging function:

void device_writebXX(..)
{
   write()
}

So why not refactor that code, it makes it simpler for everyone to
understand and takes about 100 lines out of half the current low level
drivers.

A little later you can add in a rwlock so you can do concurrent
reads/writes to the same physical page.

> Most recent flash chips support Suspending of in-progress erases. The one 
> I'm playing with ATM (Intel 28F128) can even do Program operations while an 
> erase is suspended. You don't need the same kind of locking. The lock in 

I know, the AMD ones I was fiddling with last year did this too. It does
mean that you have to wrap all possible IO functions so you can send the
abort sequence, then restart the erase. 

> the low-level driver isn't supposed to be a mutual exclusion lock, it's 
> only supposed to protect against the page register being changed in the 
> middle of an operation. I've done it with spinlocks because that's simple - 
> but it {sh,c}ould be optimised to rwlocks, so you can have multiple 
> concurrent accesses as long as none of them want to touch the page register.

I think if you clarify that the low level driver routines will never be
called concurrently with the same mtd structure that would be a suitably
simple design.. AFAIK this is what you are saying, which is great. Pity
both my boards share the IO window so they do need locking :<

> Splitting the map drivers into two separate layers would only make that 
> more complex. There might be fewer lines of code in each individual map 
> driver, but as a whole each would be 'less obviously correct' because the 
> interaction with the higher-level map driver would have to be taken into 
> account.

I disagree, all you should be looking at in the driver is if the paging
and memory setup functions are correct and that the page window is not
shared by multiple MTD devices. The mapped driver could handle all
remaining issues. You can test the mapped driver quite easially, you
cannot really test the device drivers.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
