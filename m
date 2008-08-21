Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW0ZD-0004SS-SZ
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 03:10:32 +0000
Date: Wed, 20 Aug 2008 23:10:32 -0400
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
Subject: Re: [RFC] mtd: add OF2PDEV convertor for the NDFC driver
Message-ID: <20080820231032.5abfa45e@lappy.seanm.ca>
In-Reply-To: <20080820203719.5224dc78@zod.rchland.ibm.com>
References: <20080820205958.GA13371@www.tglx.de>
	<200808210040.58809.arnd@arndb.de>
	<20080820203719.5224dc78@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, Sebastian
	Siewior <bigeasy@linutronix.de>, linux-mtd@lists.infradead.org,
	tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Aug 2008 20:37:19 -0400
"Josh Boyer" <jwboyer@linux.vnet.ibm.com> wrote:

> On Thu, 21 Aug 2008 00:40:58 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > On Wednesday 20 August 2008, Sebastian Siewior wrote:  
> > > I didn't convert the NDFC driver to support OF because there are
> > > non-OF-aware platforms with the ndfc chip.
> > > All settings are mandatory except the oob layout.  
> > 
> > Are you aware of Sean's patch from
> > http://patchwork.ozlabs.org/linuxppc/patch?id=20183 ?  
> 
> I need to look at that hard for .28 still.

Please do, I know it works, but I am not sure it is correct.

I haven't had a chance to really look at the new driver from Sebastian,
but it is more complete than mine. It has to be decided if that is a
good thing. I modeled my driver after the existing nand of drivers. They
also limit, even more than mine, what can be configured.

My gut feel is that it is better to let the upper level nand drivers
default correctly based on the chip. For example, on the warp we need to
let the ecc layout default since then it can handle the differences
between 64M and 256M nand chips without a fixup at boot time. (I
believe Sebastian's driver *does* allow this)

I also believe that some fields are now obsolete when going to an of
platform driver. For example, chip select is part of the reg entry.

So my goal was to configure as little as possible and then add as
needed.

Cheers,
   Sean
