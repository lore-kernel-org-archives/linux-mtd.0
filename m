Received: from mx33.mail.ru ([194.67.23.194])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HpqR2-0007ct-Cs
	for linux-mtd@lists.infradead.org; Sun, 20 May 2007 14:47:18 -0400
Date: Sun, 20 May 2007 22:43:58 +0400
From: Anton Vorontsov <cbou@mail.ru>
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org,
	Nicolas Pitre <nico@cam.org>, kernel-discuss@handhelds.org
Subject: Re: consistent_sync on ioremap'ed area
Message-ID: <20070520184358.GA31309@zarina>
References: <20070519185638.GA7553@zarina>
	<20070519223249.GA16143@flint.arm.linux.org.uk>
	<20070520015622.GA29296@zarina>
	<20070520082427.GA12640@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20070520082427.GA12640@flint.arm.linux.org.uk>
Reply-To: cbou@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 20, 2007 at 09:24:27AM +0100, Russell King - ARM Linux wrote:
> On Sun, May 20, 2007 at 05:56:22AM +0400, Anton Vorontsov wrote:
[...]
> > > What this means is that improper usage will break at some point.
> > > The two MTD map drivers that you have identified are the only two
> > > abusers of this function.  They make assumptions about the behaviour
> > > of this function which are no longer valid.
> > 
> > The key words are "no longer". In time that drivers were written (and
> > they were accepted) using that function was okay, I guess.
> 
> At the time when the use appeared, I said it was incorrect.  I got ignored.

I see.

> > I've run git blame on consistent.c, and seeing that comment regarding
> > "no no, don't call it directly" appeard relatively recently (2006-11-21).
> > 
> > I'm curious when exactly behaviour of this function became invalid in
> > MTD usage context. Maybe we can apply some band-aid: copy older, still
> > valid function under different name, with huge "TODO:" regarding
> > generic API need?
> 
> Maybe, but it needs a new home rather than being in consistent.c.
> However, the problem with band-aids is that they tend to become
> permanent, so a little bit of thought now helps a lot.

Yes, that happens. But on the other side band-aiding sometimes helps,
i.e. later, looking at lots of band-aids you're seeing whole picture -
all demands. And then could refactor code to satisfy these demands in
generic manner. Though, I'm not advocating this particular case.

[...]
> > Well.. speaking of me, it will take months to get into all mm stuff,
> > and design new mm thing in correct/generic way..
> 
> I'm not talking about re-designing the entire cache flushing API.  I'm
> talking about supplementing it with one additional function that takes
> some appropriate arguments to deal with the problem.
> 
> The problem that needs solving for MTD is:
> 
>   we have two mappings of the same physical address space.  One mapping
>   is cached.  The other is uncached.  Due to writes to the uncached
>   mapping, cached data may become stale without the processor realising
>   it.
> 
> So, to solve the problem we need to invalidate the contents of the cache
> in some ioremapped region or sub-region.  We know what operation needs to
> be performed, so passing arguments like DMA direction arguments are
> utterly senseless.
> 
> However, we do need a way to describe the region.  Given the possibility
> of a virtually mapped L1 cache and a physically mapped L2 cache, both of
> which need dealing with, maybe the best approach would be to pass the
> return value from ioremap, the cookie given to ioremap, offset, and size?
> 
> What about a name?  flush_ioremap_region() maybe?

Um.. if we'll look how exactly MTD drivers tried to use
consistent_sync(), we'll see that they were doing dmac_inv_range()
through consistent_sync(), i.e. they tried to invalidate/discard
cache, to eliminate possible write backs (?). So, inval_ioremap_region()
seems better name for this purpose?

> > > Since my PXA hardware (lubbock) is quite a bit of hastle to get going
> > > (I estimate at least a day's worth of fiddling around) it's not
> > > something I'm able to look into.  Patches welcome.
> > 
> > ..and because of (1), you hardly can expect this patch from me
> > in near future.
> 
> I don't think it's that far off.
> 
> PS, it's rude to cross-post between member post only lists and open lists.
> It's in the lists.arm.linux.org.uk etiquette.

Sorry.

I've actually read etiquette docs at arm.linux.org.uk, but of course
I forgot something (not surprisingly, LAKML is single members-only list
I'm taking a part in, and on open lists it's normal practice adding other
related lists to Cc).

Well, as you didn't altered To and Cc, I still keeping them that way,
it's better keep people informed than discuss things behind their back
(though I do understand that it brings mess to LAKML when non-subscribers
answers).

Thanks,

-- 
Anton Vorontsov
email: cbou@mail.ru
backup email: ya-cbou@yandex.ru
irc://irc.freenode.org/bd2
