Received: from the.ipv6.earth.li ([2001:1b40:0:1000:c1c9:c842:0:1]
	helo=the.earth.li)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh0rh-0004dV-71
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 05:01:54 -0400
Date: Fri, 19 May 2006 10:01:42 +0100
From: Jonathan McDowell <noodles@earth.li>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20060519090142.GB7570@earth.li>
References: <20060518160940.GS7570@earth.li>
	<20060518165728.GA26113@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060518165728.GA26113@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 18, 2006 at 06:57:28PM +0200, Jörn Engel wrote:
> On Thu, 18 May 2006 17:09:41 +0100, Jonathan McDowell wrote:
> > +	omap_writew(0, (OMAP_MPUIO_BASE + OMAP_MPUIO_IO_CNTL));
>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Could that be done in a macro?

Is there any benefit to doing so?

> > +	udelay(0.04);
> 
> Floating point in the kernel?

Not quite. udelay is a macro on ARM so this ends up as an integer before
it ever hits a function call. In an ideal world I'd use "ndelay(40);"
but that would result in a delay of over 1µs as ARM doesn't have ndelay
defined so we hit the generic fallback.

> > +	ams_delta_mtd = kmalloc (sizeof(struct mtd_info) +
>                                ^
> > +					sizeof (struct nand_chip), GFP_KERNEL);
> 
> Remove space
> 
> And please create a structure containing both struct mtd_info and
> struct nand_chip.  Then use sizeof(that structure)...

This format is used throughout the drivers/mtd/nand/ directory. I'd
suggest it'd be more appropriate to have a separate patch that did this
for all of them if it's desired, rather than having each driver do its
own thing.

Agreed on all the spacing comments you raised; hangovers from toto.c
that I used as a base.

J.

-- 
I am a passenger.
