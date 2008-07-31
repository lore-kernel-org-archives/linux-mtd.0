Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOS5Q-0002dK-Ba
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 06:56:32 +0000
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
Date: Wed, 30 Jul 2008 23:56:29 -0700
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<1217481315.9048.64.camel@sauron>
In-Reply-To: <1217481315.9048.64.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807302356.29835.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it, jwboyer@gmail.com,
	dwmw2@infradead.org, akpm@linux-foundation.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 July 2008, Artem Bityutskiy wrote:
> We use vmalloc() in both UBI and UBIFS because we need to allocate a
> large (of eraseblock size) buffer.

In this case, the erase blocks are often small ... many would be
4KB (or less) if JFFS2 didn't jack them up to 8KB minimum, but some
of the flash chips supported by m25p80 are more like NOR.


> So this is not just JFFS2. Using 
> kmalloc() for this does not seem to be a good idea for me, because
> indeed the buffer size may be up to 512KiB, and may even grow at some
> point to 1MiB.

Yeah, nobody's saying kmalloc() is the right answer.  The questions
include who's going to change what, given that this part of the MTD
driver interface has previously been unspecified. 

(DataFlash support has been around since 2003 or so; only *this year*
did anyone suggest that buffers handed to it wouldn't work with the
standard DMA mapping operations, and that came up in the context of
a newish JFFS2 "summary" feature ...)


Another perspective comes from looking at it bottom up, starting with
what the various kinds of flash do.

 - NOR (which I'll assume for discussion is all CFI) hasn't previously
   considered DMA ... although the drivers/dma stuff might handle its
   memcpy on some platforms.  (I measured it on a few systems and saw
   no performance wins however; IMO the interface overheads hurt it.)

 - NAND only does reads/writes of smallish pages ... in conjunction
   with hardware ECC, DMA can help (*) but that only uses small buffers.
   Some NAND drivers *do* use DMA ... Blackfin looks like it assumes
   the buffers are always in adjacent pages, fwiw, and PXA3 looks like
   it always uses a bounce buffer (not very speedy).

 - SPI (two drivers) often does writes of smaller pages than NAND, but
   can read out the entire flash chip in a single operation.  (Which is
   handy for bootstrapping and suchlike.)

So right *now* the main trouble spot with DMA seems to be SPI, initially
with the newish summary support, although some troubles may be lurking
with NAND too (which has an easier time using DMA than NOR).


> Using kmalloc() would mean that at some point we would be unable to
> allocate these buffers at one go and would have to do things is
> fractions smaller than eraseblock size, which is not always easy. So I
> am not really sure what is better - to add complexity to JFFS2/UBI/UBIFS
> or to teach low levels (which do DMA)

Midlayers *could* use drivers/dma to shrink cpu memcpy costs, if
they wanted.  Not sure I'd advise it just now though ... just
saying that more than the lowest levels could do DMA.


> 	to deal with physically 
> noncontinuous buffers (e.g., DMA only one RAM page at a time).

I suppose I'd rather see some mid-layer utilities offloading the
DMA from the lower level drivers.  It seems wrong to expect two
drivers to do the same kind of virtual-buffer to physical-pages
mappings.  There's probably even a utility to do that, leaving
just the task of using it when the lowest level driver (the one
called by MTD-over-SPI drivers like m25p80/dataflash) does DMA.

Comments?

- Dave

(*) As I noted in the context of a different patch:  why doesn't the
    generic NAND code use readsw()/writesw() to get a speedup even
    for PIO based access?  I thought a 16% improvement (ARM9) over
    the current I/O loops would be compelling ...
