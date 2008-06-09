Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5kqK-0006yy-Gs
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 17:07:41 +0000
From: David Brownell <david-b@pacbell.net>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [patch 2.6.26-rc5-git] at91_nand speedup via {read, write}s{b,
	w}()
Date: Mon, 9 Jun 2008 10:07:37 -0700
References: <200806090313.28515.david-b@pacbell.net>
	<20080609133124.0eb97e25@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <20080609133124.0eb97e25@hskinnemo-gx745.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806091007.37494.david-b@pacbell.net>
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 June 2008, Haavard Skinnemoen wrote:
> David Brownell <david-b@pacbell.net> wrote:
> > This uses __raw_{read,write}s{b,w}() primitives to access data on NAND
> > chips for more efficient I/O.
> > 
> > On an arm926 with memory clocked at 100 MHz, this reduced the elapsed
> > time for a 64 MByte read by 16%.  ("dd" /dev/mtd0 to /dev/null, with
> > an 8-bit NAND using hardware ECC and 128KB blocksize.)
> 
> Nice. Here are some numbers from my setup (256 MB, 8-bit, software ECC).
> 
> Before:
> real	2m38.131s
> user	0m0.228s
> sys	2m37.740s
> 
> After:
> real	2m27.404s
> user	0m0.180s
> sys	2m27.068s
> 
> which is a 6.8% speedup. I guess hardware ECC helps...

The AVR32 versions of readsb/writesb didn't look to me as if they'd
be quite as fast as the ARM ones either.  If AVR32 has some analogue
of "stmia r1!, {r3 - r6}" for burst 16 byte stores, it's not using
it right now.  (What was the bug you found in its readsb?)

Yes, I'd think the win would be most visible with hardware ECC, since
without it you've still got a second manual scan of each block.  (And
I see you observed this too, after applying a workaround for an ECC
erratum you just learned about...)  My numbers for one pair of trials
(the "16%" was an average of 6 runs) had a *lot* less system time.
Which oddly enough went *up* after the switch to readsb/writesb:

Before:
real    0m24.199s
user    0m0.000s
sys     0m5.630s

After:
real    0m20.226s
user    0m0.010s
sys     0m6.000s

However, the fact that you got a win even with soft ECC (and, I'm
guessing, slower RAM and slower readsb) suggests that this speedup
should be pretty generally applicable!


> though I can't 
> seem to get it to work properly. Is there anything I need to do besides
> flash_eraseall when changing the ECC layout?

I wouldn't know.  Just be sure not to lose all your badblocks data
when you convert ...


> Also, I wonder if we can use the DMA engine framework to get rid of all
> that "sys" time...?

It's another one of those cases where the framework overhead has to be
low enough to make that practical.  Last time I looked, the overhead to
set up and wait for a DMA of a couple KBytes was a significant chunk of
the cost to readsb()/writesb() the same data ... and that's even before
the data starts transferring.

Plus, the MTD layer currently assumes DMA is never used.  Some of the
buffers it passes are not suitable for dma_map_single() since they
come from vmalloc.

 
> > 	...
> > 	
> > Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> > ---
> > Yeah, this does may you wonder why the *default* nand r/w code isn't
> > using these primitives; this speedup shouldn't be platform-specific.
> > 
> > Posting this now since I think this should either be incorporated into
> > the new atmel_nand.c code or into drivers/mtd/nand/nand_base.c ...
> > both arm and avr32 support these calls, I'm not sure whether or not
> > some platforms don't support them.
> 
> I'll leave it up to the MTD people to decide whether or not to update
> nand_base.c. Below is your patch rebased onto my patchset. I'll include
> it in my next series after I figure out where to send it.

Sounds fair to me.  Thanks; this has been sitting in my tree for many
months now, I finally made time to measure it and was pleasantly
surprised by the size of the win!

- Dave
