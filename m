Received: from [2002:d993:5cf9::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hpgij-0001iy-Ov
	for linux-mtd@lists.infradead.org; Sun, 20 May 2007 04:25:07 -0400
Date: Sun, 20 May 2007 09:24:27 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Anton Vorontsov <cbou@mail.ru>
Subject: Re: consistent_sync on ioremap'ed area
Message-ID: <20070520082427.GA12640@flint.arm.linux.org.uk>
References: <20070519185638.GA7553@zarina>
	<20070519223249.GA16143@flint.arm.linux.org.uk>
	<20070520015622.GA29296@zarina>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070520015622.GA29296@zarina>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk, kernel-discuss@handhelds.org
Reply-To: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Anton Vorontsov <cbou@mail.ru>, Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 20, 2007 at 05:56:22AM +0400, Anton Vorontsov wrote:
> On Sat, May 19, 2007 at 11:32:49PM +0100, Russell King - ARM Linux wrote:
> > On Sat, May 19, 2007 at 10:56:38PM +0400, Anton Vorontsov wrote:
> > > Hi all,
> > > 
> > > During 2.6.21 development BUG_ON() was added to consistent_sync
> > > function. Thus, I'm curious if it is correct.
> > 
> > consistent_sync() exists to provide the DMA mapping code with the
> > required functionality to ensure cache coherency in the system.
> > That is it's sole purpose.  That's why it's in a file to do with
> > DMA mapping and why it takes DMA-related arguments.
> > 
> > As the requirements for the DMA mapping code change with enhancements
> > in the ARM architecture, this function will continue to evolve to
> > ensure that it continues to forfill its purpose.
> 
> I see...
> 
> > > drivers/mtd/maps/mainstone-flash.c
> > > drivers/mtd/maps/lubbock-flash.c
> > 
> > What this means is that improper usage will break at some point.
> > The two MTD map drivers that you have identified are the only two
> > abusers of this function.  They make assumptions about the behaviour
> > of this function which are no longer valid.
> 
> The key words are "no longer". In time that drivers were written (and
> they were accepted) using that function was okay, I guess.

At the time when the use appeared, I said it was incorrect.  I got ignored.

> I've run git blame on consistent.c, and seeing that comment regarding
> "no no, don't call it directly" appeard relatively recently (2006-11-21).
> 
> I'm curious when exactly behaviour of this function became invalid in
> MTD usage context. Maybe we can apply some band-aid: copy older, still
> valid function under different name, with huge "TODO:" regarding
> generic API need?

Maybe, but it needs a new home rather than being in consistent.c.
However, the problem with band-aids is that they tend to become
permanent, so a little bit of thought now helps a lot.

> > > So, is BUG_ON() inside consistent_sync really correct? If it is, then
> > > what is wrong?
> > 
> > Yes.  Whenever this function is called on behalf of the DMA code,
> > the requirements will be met - and these requirements are brought
> > on by the L2 cache support.
> > 
> > These two drivers need fixing, by inventing a new cache coherency
> > interface for the purpose that they're trying to implement - cache
> > flushing due to the backing data changing in an ioremapped cachable
> > region.
> > 
> > Carefully consider two points:
> > 
> > 1. if a PXA device became DMA coherent, consistent_sync() would become
> >    a no-op.  The above drivers break.
> > 
> > 2. what would be the implication if we were to continue to allow these
> >    MTD drivers to use this, and then a PXA platform came along which
> >    had L2 cache _and_ re-used the lubbock or mainstone flash driver.
> > 
> > It would be nice if these two map drivers could be fixed.  As I've
> > said on this list recently (and above), the right way forward is to
> > invent a new purpose-defined API to satisfy the MTD drivers.
> 
> (1)
> 
> Well.. speaking of me, it will take months to get into all mm stuff,
> and design new mm thing in correct/generic way..

I'm not talking about re-designing the entire cache flushing API.  I'm
talking about supplementing it with one additional function that takes
some appropriate arguments to deal with the problem.

The problem that needs solving for MTD is:

  we have two mappings of the same physical address space.  One mapping
  is cached.  The other is uncached.  Due to writes to the uncached
  mapping, cached data may become stale without the processor realising
  it.

So, to solve the problem we need to invalidate the contents of the cache
in some ioremapped region or sub-region.  We know what operation needs to
be performed, so passing arguments like DMA direction arguments are
utterly senseless.

However, we do need a way to describe the region.  Given the possibility
of a virtually mapped L1 cache and a physically mapped L2 cache, both of
which need dealing with, maybe the best approach would be to pass the
return value from ioremap, the cookie given to ioremap, offset, and size?

What about a name?  flush_ioremap_region() maybe?

> > Since my PXA hardware (lubbock) is quite a bit of hastle to get going
> > (I estimate at least a day's worth of fiddling around) it's not
> > something I'm able to look into.  Patches welcome.
> 
> ..and because of (1), you hardly can expect this patch from me
> in near future.

I don't think it's that far off.

PS, it's rude to cross-post between member post only lists and open lists.
It's in the lists.arm.linux.org.uk etiquette.
