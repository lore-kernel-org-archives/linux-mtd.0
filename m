Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyIY5-0000Rw-Cs
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 04:02:17 +0000
Date: Fri, 7 Nov 2008 04:02:00 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Trent Piepho <tpiepho@freescale.com>
Subject: Re: flash read performance
Message-ID: <20081107040200.GB17593@shareable.org>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org> <49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de> <20081104114229.GA1673@shareable.org>
	<49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
Cc: Arnaud Mouiche <arnaud.mouiche@thomson.net>,
	Andre Puschman <andre.puschmann@imms.de>,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trent Piepho wrote:
> On Tue, 4 Nov 2008, Andre Puschman wrote:
> > Jamie Lokier schrieb:
> >> I don't know much about this area, but will _writing_ to the flash
> >> work reliably if ioremap_cached() is used?
> >>
> > Good point. I only was into reading and so I totally forgot writing ;-)
> > I gave it a try, although it was terribly slow (only a few kb/s), it worked.
> > I just did a cp uImage /dev/mtd3. On the other hand, I never tried writing
> > with the old driver. So I don't know if this is faster.
> 
> I've found that writes do not work with caching enabled.  When the CPU writes
> to the flash and then reads it back, it gets returned what it wrote.

Thanks, both.

Based on Andre's observation, I will soon try enabling cache for my
NOR, and see if it makes a difference to cold-cache read performance.
I don't expect it, but it's worth a try.

If that helps significantly, then I'll look at doing writes properly.

> That's not what is supposed to happen.  For example, to program
> flash word 'i' to the value 'val' using the Spansion/AMD method, you
> do this:
> 
> flash[0] = 0xf0f0;
> flash[0x555] = 0xaaaa;
> flash[0x2aa] = 0x5555;
> flash[0x555] = 0xa0a0;
> flash[i] = val;
> while(flash[i] != val); /* wait for it to finish */
> 
> After this flash[0] should be whatever data was there before, not 0xf0f0. 
> Same with flash[0x555] and the rest.  Only flash[i] should be modified.  But
> if flash is cached, the cpu will use the cached values and think flash[0] is
> 0xf0f0 until the cache gets flushed.

You might also find the write operation to be unreliable, if the
caching mode is write-back rather than write-through.

Really, you should use an uncached mapping to write commands to the
flash, flush the cached mapping (for reads) when commands are written,
and prevent any access during the writes (this is in MTD normally).
You could optimise by flushing only the cached read regions which are
affected by write and erase commands.

> > I also did some more testing with my improved flash-timing parameters,
> > which yields to read speeds of up to 18-19MB/s, which is really fast
> > compared
> > to 1,3MB/s at the beginning :-)
> 
> My results, from a mpc8572 (powerpc) with a spansion s96gl064n flash
> chip on a 100 MHz bus.
> 
> Mapping				Speed (MB/sec) (MB = 1048576 bytes)
> un-cached and guarded		12.30
> cached and gaurded		14.24
> cached and un-guarded		14.31
> un-cached and un-guarded	14.66
> 
> I measured by reading flash linearly from beginning to end 32-bits at a time. 
> Since the flash is bigger than the cache, ever read should have come from the
> flash.  If I just read the same 1k over and over that would obviously be much
> faster if it could come from the cache.

That's nice to see that cache helps cold-read performance too, not
just cached reads.  Thanks :-)

> The biggest bootup delay I have now is waiting for the ethernet phy to get
> online, which takes almost 3 seconds.

Do you need to delay everything else for that, or can you parallelise?

-- Jamie
