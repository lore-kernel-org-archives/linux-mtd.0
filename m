Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131tIV-0003Uy-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 17:12:15 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131tIP-0003Us-00
	for mtd@infradead.org; Tue, 13 Jun 2000 17:12:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000613085608.11182B-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000613085608.11182B-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Jun 2000 17:11:59 +0100
Message-ID: <11705.960912719@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
> On Tue, 13 Jun 2000, David Woodhouse wrote:
> > I'll even throw in actual read/write/erase code, rather than just
> > probe :)

> Oooh :> 

For the Intel/Sharp Extended Command Set (0001), that is.

> Well, yes and no, AFAIK. The mapped driver was always indented to be
> used for memory mapped flash, that is flash that is connected directly
> to the CPU data bus (ie it is RAM).

IIRC it shouldn't have been using readb at all, in that case. Just 
dereferencing pointers would be fine. (Thinks.... if you've been using it 
on ARM, was it me that added the readb() then?)


> IMHO you should add another abstraction to keep this tidy:
>   top) Full blow MTD interface with write, read, erase functions. This
>        is what the MTD char, block and filesystems talk to
>   flash) Common functions shared by direct memory mapped flash, rom and
>          rams. Contains CFI and JEDEC routines, ram and rom reader and ram
>          writer. Maybe some file systems speak to this layer too..
>   mapped) Aide for Memory Mapped flash, provides a many
>           readers, one writer type locking for the paging function, and
>           the necessary fast IO functions using simple memory references.
>   low level mapped driver) Provides a paging function and sets up the
>           memory window [turn on write through, bring the physical memory
>           into the page tables, etc]

I'm not sure why you want to separate the bottom two. The locking issues
don't work wonderfully if you make the 'page' function callable outside the
low-level mapped driver. Different hardware requires different locking, and 
it's worth having it all-in-one, with a set of access operations which 
lock, page and do the operation, then unlock.

What I have at the moment is...

    Map hardware driver produces a 'struct map_info' with access functions.

    This is passed to a various probe functions, for example ram_probe.,
	until one of them appears to like it.

    If ram_probe likes the stuff in the map (i.e. it behaves like RAM)
	it returns a (struct mtd_info *) which is populated with
	appropriate read/write/erase/sync methods and other data.

    The hardware driver then registers this with add_mtd_device.


There's also a 'cfi_probe' function which will return a populated MTD
if it finds CFI flash. I haven't yet ported the JEDEC probe to this setup.
rom_probe is a last resort, and returns an MTD device which is readonly and 
has only a read() function. 

Those probe functions correspond to the 'flash' layer to which you refer -
common functions shared by mmap'd flash chips in different physical devices.
It's not kept layered at runtime for efficiency reasons - the top-level MTD
access methods point directly at the routines provided by flash layer, and
they all use mtd->priv as a pointer to the struct map_info for that
particular device/mapping.


jgg@ualberta.ca said:
> The intention I had was to keep the low level driver as dead simple as
> possible, all it does is setup a memory window and provide a paging
> function, it should never need changing. If I was going to do any
> locking for SMP it would have been done in the mapped driver, since
> that is where the long operations are hiding. 

But the locking only needs to be done over individual access operations, 
and only the bottom-level hardware driver knows exactly what the locking 
rules are for its particular device. 

nora.c, for example, needs no locking because it's all memory-mapped 
linearly - there's only about 100 lines of code. It's the right place to do 
locking, but that doesn't mean it can't be dead simple. vmax301.c does 
locking now - would you claim it's not still simple?


jgg@ualberta.ca said:
>  Locking in the low level driver is probably not very usefull, the
> flash driver also will need locking to ensure nobdy tries to access
> the flash while it is erasing, so it has to wrap all those functions
> anyhow :< 

Most recent flash chips support Suspending of in-progress erases. The one 
I'm playing with ATM (Intel 28F128) can even do Program operations while an 
erase is suspended. You don't need the same kind of locking. The lock in 
the low-level driver isn't supposed to be a mutual exclusion lock, it's 
only supposed to protect against the page register being changed in the 
middle of an operation. I've done it with spinlocks because that's simple - 
but it {sh,c}ould be optimised to rwlocks, so you can have multiple 
concurrent accesses as long as none of them want to touch the page register.


jgg@ualberta.ca said:
>  Thats true, but I would worry more about keeping those drivers as
> small and simple as possible, they are less likely to break and easier
> to write.

That was my reason for wanting to do it this way. The map drivers provide a
set of very simple functions to access the underlying memory space. They 
handle their own locking so that the page register doesn't get abused, if 
they have one. That's all they do.

Splitting the map drivers into two separate layers would only make that 
more complex. There might be fewer lines of code in each individual map 
driver, but as a whole each would be 'less obviously correct' because the 
interaction with the higher-level map driver would have to be taken into 
account.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
