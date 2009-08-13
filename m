Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MbVjf-0007zh-Gy
	for linux-mtd@lists.infradead.org; Thu, 13 Aug 2009 08:32:40 +0000
Subject: Re: nand_update_bbt fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200908121037.55941.david-b@pacbell.net>
References: <4A80A760.20901@iders.ca> <4A819637.7080501@iders.ca>
	<4A825873.4010202@gmail.com> <200908121037.55941.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Aug 2009 08:48:06 +0300
Message-Id: <1250142486.25202.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew McKay <amckay@iders.ca>, linux-mtd@lists.infradead.org,
	JiSheng Zhang <jszhang3@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-08-12 at 10:37 -0700, David Brownell wrote:
> On Tuesday 11 August 2009, Artem Bityutskiy wrote:
> > My position is:
> >    * vmalloc is a problem because it prevents DMA
> >    * kmalloc is a problem because large allocations of contiguous memory
> >      are impossible
> > 
> > Thus, I think people should invent some nice solution for the whole issue
> > instead of turning vmalloc's into kmallocks and back and forth.
> 
> BBT is a constrained sub-problem, but not the only one.
> 
> (Another BBT issue:  I've thought that with MLC chips and their
> small limits on number-of-erases, the current waste of BBT pages
> deserves more attention.  On a 2 GByte chip with 4KB pages and
> blocks at 256KB, each block could hold 64 BBT versions, with
> newer ones after older ones, even at one-per-page.  But today's
> BBT code is dumb:  one-per-block.  That's a lot of needless and
> extra erasures for BBT blocks...)

Agree. IMO, today's MTD is fits the "ancient crap" classification, and
badly needs some brave knight who would improve it.

> > I'm CCing 
> > David Brownell because AFAIR he was discussing similar things on lkml some
> > time ago.
> 
> The MTD stack is DMA-unfriendly today.
> 
> The issue I saw was with SPI flash chips, where the underlying
> SPI master controller often uses DMA ... causing trouble for
> certain code paths through MTD (or was it just JFFS2?).

UBI / UBIFS also send vmalloc'ed buffers :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
