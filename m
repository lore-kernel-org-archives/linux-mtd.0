Received: from the.earth.li ([193.201.200.66])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYODA-0003CY-VO
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 10:08:25 -0400
Date: Tue, 25 Apr 2006 15:03:11 +0100
From: Jonathan McDowell <noodles@earth.li>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060425140311.GP7570@earth.li>
References: <20060424161529.GR7570@earth.li>
	<1145972592.11909.392.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1145972592.11909.392.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 25, 2006 at 02:43:12PM +0100, David Woodhouse wrote:
> On Mon, 2006-04-24 at 17:15 +0100, Jonathan McDowell wrote:
> > In particular I'm using "udelay(1);" in the read/write routines to wait
> > for the bus to settle after setting the read/write enable lines. Really
> > I want "ndelay(40);", but ndelay doesn't seem to be implemented on ARM,
> > except in terms of udelay. Can I get away with udelay(0.04)? Should I be
> > doing something else entirely?
> 
> That's a question best directed at linux-arm-kernel list.

Ok, ta.

> > +/*
> > + * These 3 functions are basically identical to the ones in nand_base.c, but
> > + * we have to call our read_byte/write_byte functions instead of readb/writeb
> > + * directly. I submitted a patch to MTD to move this to nand_base.c, but it
> > + * was deemed too intrusive.
> > + */
>
> Thomas' decision, I assume? I think he's right -- this way it can be
> inlined in the loop rather than being a real function call for every
> byte.
 
Ben Dooks. I'd actually forgotten I'd left that comment in. I'll remove
it before I submit the patch proper; it was mainly a note to people who
might have picked up my earlier version that patches nand-core as well.

J.

-- 
/-\                             |     What's the worse that could
|@/  Debian GNU/Linux Developer |     happen?  Smoke. - Anonymous
\-                              |              HWHacker
