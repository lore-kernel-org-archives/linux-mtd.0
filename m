Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131se3-0003MI-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 16:30:27 +0100
Date: Tue, 13 Jun 2000 09:30:45 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code. 
In-Reply-To: <29382.960882055@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000613085608.11182B-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 13 Jun 2000, David Woodhouse wrote:

> jgg@deltatee.com said:
> >  Assuming the flash is CFI it looks like your detector will find the
> > first 4 chips, but not the second set. 
 
> That's correct so far. Don't worry - the machine I'm working with has two 
> flash chips mapped one after the other, so I'm going to be fixing that.
> 
> I'll even throw in actual read/write/erase code, rather than just probe :)

Oooh :> 
 
> jgg@deltatee.com said:
> >  Wots up with this? Some of the ARM ports have 'interesting' IO..
> 
> #define readb(p)	(panic("readb called, but not implemented"),0)
> 
> Which brings me to the other thing I wanted to discuss with you - because
> Linux drivers basically needs to have a readb function per bus, the old
> 'mapped' code isn't quite generic enough.

Well, yes and no, AFAIK. The mapped driver was always indented to be used
for memory mapped flash, that is flash that is connected directly to the
CPU data bus (ie it is RAM). On my two ARM boards the flash is like that,
on my three Intel boards it is like that and I'm sure that on other boards
it is like that too. 

Basically, if the CPU can boot from the flash then you should be able to
use the mapped interface for it. 

Boards where it is not, say the flash is on a PCI, should not use the
mapped interface. Remember most of these drivers are not general things
like network drivers - they only run on one very specific bit of hardware.
If mapped works, then it works, there is no worry about readb/writeb.

IMHO you should add another abstraction to keep this tidy:
  top) Full blow MTD interface with write, read, erase functions. This
       is what the MTD char, block and filesystems talk to
  flash) Common functions shared by direct memory mapped flash, rom and
         rams. Contains CFI and JEDEC routines, ram and rom reader and ram
         writer. Maybe some file systems speak to this layer too..
  mapped) Aide for Memory Mapped flash, provides a many
          readers, one writer type locking for the paging function, and
          the necessary fast IO functions using simple memory references.
  low level mapped driver) Provides a paging function and sets up the
          memory window [turn on write through, bring the physical memory
          into the page tables, etc]

So move the JEDEC probe/erase/write routines up a level and move the new
_read/writeXX functions up from the drivers into the mapped interface,
then clean up the JEDEC functions to use your new IO functions (right now
it does not look correct to me)

The intention I had was to keep the low level driver as dead simple as
possible, all it does is setup a memory window and provide a paging
function, it should never need changing. If I was going to do any locking
for SMP it would have been done in the mapped driver, since that is where
the long operations are hiding. 

Locking in the low level driver is probably not very usefull, the flash
driver also will need locking to ensure nobdy tries to access the flash
while it is erasing, so it has to wrap all those functions anyhow :<

It is really hard to test the low level drivers, most people don't have
the hardware to do it with, but everything else is perfectly generic.

> There's an indirection per access, but it's cleaner like that, and in fact 
> the overhead isn't _too_ horrible - flash is bloody slow anyway so we don't 
> care too much about it there, and for accessing RAM or even reading flash, 
> you have the copy_from() and copy_to() functions where the cost is O(1).

Thats true, but I would worry more about keeping those drivers as small
and simple as possible, they are less likely to break and easier to
write.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
