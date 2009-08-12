Received: from smtp110.sbc.mail.gq1.yahoo.com ([67.195.14.95])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbNQe-0007iX-E1
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 23:40:29 +0000
From: David Brownell <david-b@pacbell.net>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: nand_update_bbt fix
Date: Wed, 12 Aug 2009 10:37:55 -0700
References: <4A80A760.20901@iders.ca> <4A819637.7080501@iders.ca>
	<4A825873.4010202@gmail.com>
In-Reply-To: <4A825873.4010202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200908121037.55941.david-b@pacbell.net>
Cc: Andrew McKay <amckay@iders.ca>, linux-mtd@lists.infradead.org,
	JiSheng Zhang <jszhang3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 11 August 2009, Artem Bityutskiy wrote:
> My position is:
>    * vmalloc is a problem because it prevents DMA
>    * kmalloc is a problem because large allocations of contiguous memory
>      are impossible
> 
> Thus, I think people should invent some nice solution for the whole issue
> instead of turning vmalloc's into kmallocks and back and forth.

BBT is a constrained sub-problem, but not the only one.

(Another BBT issue:  I've thought that with MLC chips and their
small limits on number-of-erases, the current waste of BBT pages
deserves more attention.  On a 2 GByte chip with 4KB pages and
blocks at 256KB, each block could hold 64 BBT versions, with
newer ones after older ones, even at one-per-page.  But today's
BBT code is dumb:  one-per-block.  That's a lot of needless and
extra erasures for BBT blocks...)


> I'm CCing 
> David Brownell because AFAIR he was discussing similar things on lkml some
> time ago.

The MTD stack is DMA-unfriendly today.

The issue I saw was with SPI flash chips, where the underlying
SPI master controller often uses DMA ... causing trouble for
certain code paths through MTD (or was it just JFFS2?).

I'm not sure it's well understood which things are DMA-unsafe.
Using vmalloc is one problem.  There's also code making more
subtle assumptions, which dma-incoherent caches will break...

There are two issues I see.  One is "does it work at all";
that was the SPI issue.  Another is performance ... it's
easy for DMA overheads to be excessive:  DMA setup/teardown
can cost more than the PIO code would, even ignoring cache
operation costs.  Fixing performance will likely require
interface changes. 

Either issue will need care to fix.  Given that NOR is now
becoming less prevalent, I'd suggest that "people" doing
such work focus on large-page NAND.

- Dave
