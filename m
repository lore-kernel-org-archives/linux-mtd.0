Date: Sat, 7 Dec 2013 22:35:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jason Cooper <jason@lakedaemon.net>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Disable "armada370-nand" compatible
 support
Message-ID: <20131208013525.GA4487@localhost>
References: <1386430787-2962-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131207232315.GC11251@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131207232315.GC11251@titan.lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 07, 2013 at 06:23:15PM -0500, Jason Cooper wrote:
> > +/*
> > + * Currently, the armada370 support is incomplete and can cause the
> > + * system to crash. Disable it until all the infrastructure is in place.
> > + */
> > +#if 0
> >  	{
> >  		.compatible = "marvell,armada370-nand",
> >  		.data       = (void *)PXA3XX_NAND_VARIANT_ARMADA370,
> >  	},
> > +#endif
> 
> I prefer to just remove the lines.
> 

I'm actually fine either way. Did both (disable and remove) but since all
the code is already sitting and waiting for v3.14 thought it might be cleaner
to just "disable" it.

Brian (given you're going to take the patch): what do you think?

If we agree to remove the lines, shall we also revert the binding
documentation, removing the compatible from there as well?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
