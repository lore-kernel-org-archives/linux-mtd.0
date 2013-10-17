Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWsLK-00077H-7l
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 18:30:43 +0000
Received: by mail-ie0-f181.google.com with SMTP id ar20so4490361iec.26
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2013 11:30:20 -0700 (PDT)
Date: Thu, 17 Oct 2013 11:30:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v9 4/9] mtd: nand: omap: enable auto-detection of
 bus-width for omap-nand drivers
Message-ID: <20131017183016.GG23337@ld-irv-0074.broadcom.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-5-git-send-email-pekon@ti.com>
 <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA27917@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA27917@DBDE04.ent.ti.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 17, 2013 at 04:42:23AM +0000, Pekon Gupta wrote:
> > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > > On Tue, Oct 15, 2013 at 11:19:52AM +0530, Pekon Gupta wrote:
> > > Autodetection of NAND device bus-width was added in generic NAND
> > driver as
> [...]
> > > @@ -1904,6 +1903,21 @@ static int omap_nand_probe(struct
> > platform_device *pdev)
> > >  		nand_chip->chip_delay = 50;
> > >  	}
> > >
> > > +	/* scan for NAND device connected to chip controller */
> > > +	if (nand_scan_ident(mtd, 1, NULL)) {
> > > +		err = -ENXIO;
> > > +		goto out_release_mem_region;
> > > +	}
> > > +	if ((nand_chip->options & NAND_BUSWIDTH_16) !=
> > > +			(pdata->devsize & NAND_BUSWIDTH_16)) {
> > > +		pr_err("%s: detected %s device but driver configured for
> > %s\n",
> > > +			DRIVER_NAME,
> > > +			(nand_chip->options & NAND_BUSWIDTH_16) ?
> > "x16" : "x8",
> > > +			(pdata->devsize & NAND_BUSWIDTH_16) ? "x16" :
> > "x8");
> > 
> > I'm not sure on the policy choice here; if you're using BUSWIDTH_AUTO,
> > do you even want to try to configure the buswidth by platform data?
> > You're not really getting the full use out of NAND_BUSWIDTH_AUTO because
> > the platform data has to guess the same buswidth that nand_base.c
> > determines. This is worse than the previous behavior, in which you would
> > try both buswidths if the specified type failed.
> > 
> > IOW, what are you trying to achieve with auto-buswidth? Automatic
> > determination of the buswidth or just automatic validation? What do you
> > achieve with platform data's selection of buswidth? Specification of the
> > buswidth or just a hint? Do the goals conflict? Perhaps you can just
> > warn, and not error out if the two selections don't match? Or maybe you
> > really wanted to replace the platform data selection mechanism entirely
> > with auto-buswidth?
> > 
> This is 'automatic validation' of value set in DT binding "nand-bus-width"

You mean you intend for the patched driver to simply validate, not
configure the buswidth?

> So this approach is other way round, where controller is configured
> based on DT binding "nand-bus-width" and then it checks whether
> device actual buswidth matches DT binding value or not.

If this is the case, then you really don't want to use
NAND_BUSWIDTH_AUTO. The default nand_base.c just *validates* the
pre-selected buswidth and exits with an error, in much the same way that
you're doing here (you're just duplicating the functionality).
NAND_BUSWIDTH_AUTO is useful if you want to turn control of the buswidth
configuration entirely over to nand_base.c.

> - GPMC controller is pre-configured to support "x8" or "x16" device based
>    on DT binding "nand-bus-width".
>    Reference: $LINUX/arch/arm/mach-omap2/gpmc.c
>   @@gpmc_probe_nand_child()
> 	val = of_get_nand_bus_width(child);
> 
> - But, bus-width of NAND device is only known during NAND driver
>    Probe in nand_scan_ident().
> 
> Going forward when all NAND devices are compliant to ONFI,
> then we can deprecate "nand-bus-width".

Buswidth auto-detection is not actually restricted to ONFI. nand_base.c
has (corretly, AFAIK) been detecting buswidths for a long time, using
some form of ID decode detection. But it was just that: detection. It
did not actually configure the buswidth, since it left that
responsibility to the low-level driver to get right.

Another thing to consider: I think this current patch is a regression
from previous behavior. Previously, you would run nand_scan_ident()
twice if the first one failed; once with the platform-configured
buswidth and once with the opposite. But now, you only run
nand_scan_ident() once, and then you quit if it detects differently than
you expected.

My opinion: the platform- and device-tree-provided buswidth is
unnecessary; it was previouisly only a suggestion which your driver
would readily discard, and it isn't really needed now. You can probably
get by with just NAND_BUSWIDTH_AUTO and (at most) a warning if the
auto-configured buswidth is different than the platform specified.

But the real point: you need to clearly communicate what you are
choosing in this patch. Either you want to

 (1) strictly follow the buswidth provided by the platform or

 (2) use the nand_base.c BUSWIDTH_AUTO automatic configuration.

Trying to mix both (as your patch currently does) just makes everything
worse.

Brian
