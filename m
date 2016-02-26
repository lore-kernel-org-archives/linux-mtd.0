Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZJU2-0002xP-Te
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 14:35:08 +0000
Date: Fri, 26 Feb 2016 14:18:39 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Javier
 Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Luis de Bethencourt
 <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>, Neelesh Gupta
 <neelegup@linux.vnet.ibm.com>, David Woodhouse <dwmw2@infradead.org>, Cyril
 Bur <cyrilbur@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use ioremap_cachable() instead of
 KSEG0ADDR()
In-Reply-To: <CACna6rzBTKXE6=ej-PY7V3facAR9kJ-Tq2LDc2EwszaTCK+2YA@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1602261411591.15885@tp.orcam.me.uk>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
 <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
 <CACna6rzBTKXE6=ej-PY7V3facAR9kJ-Tq2LDc2EwszaTCK+2YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 26 Feb 2016, Rafał Miłecki wrote:

> >> KSEG0ADDR was translating 0x1c000000 into 0x9c000000. With
> >> ioremap_cachable we use MIPS's __ioremap (and remap_area_pages). This
> >> results in different address (e.g. 0xc0080000) but it still should be
> >> cached as expected and it was successfully tested with BCM47186B0.
> >
> >  This is due to this piece:
> >
> >         /*
> >          * Map uncached objects in the low 512mb of address space using KSEG1,
> >          * otherwise map using page tables.
> >          */
> >         if (IS_LOW512(phys_addr) && IS_LOW512(last_addr) &&
> >             flags == _CACHE_UNCACHED)
> >                 return (void __iomem *) CKSEG1ADDR(phys_addr);
> >
> > special-casing uncached mapping only (replicated in 2 places).  I think
> > there will really be no harm from returning a KSEG0 mapping for calls
> > requesting a caching mode equal to `_page_cachable_default', which --
> > depending on the cache architecture -- will have been either hardwired or
> > prearranged via Config.K0.  I think there's really no need to put pressure
> > on the TLB, which may be small, in cases where a fixed mapping will do.
> 
> No, it isn't hitting condition you pointed. We call ioremap_cachable
> which uses _page_cachable_default as a flag. This flag
> (_page_cachable_default) isn't equal to the _CACHE_UNCACHED.

 That's exactly what I wrote: code I quoted is "special-casing uncached 
mapping only" -- which as you have correctly observed does not apply after 
your change anymore.  Which is why previously you got an address in the 
unmapped KSEG1 segment and now you get an address in the mapped KSEG2 
rather than the unmapped KSEG0 segment.

> Moreover code you pointed uses CKSEG1ADDR which would result in
> setting bit KSEG1 (0xa0000000). As I pointed in the commit message
> address it ORed with KSEG2 (0xc0000000).

 It's not merely ORed, it's actually mapped via the TLB.

 I hope this makes things clear.

  Maciej
