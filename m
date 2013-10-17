From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 4/9] mtd: nand: omap: enable auto-detection of
 bus-width for omap-nand drivers
Date: Thu, 17 Oct 2013 04:42:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA27917@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-5-git-send-email-pekon@ti.com>
 <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Brian,

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> > On Tue, Oct 15, 2013 at 11:19:52AM +0530, Pekon Gupta wrote:
> > Autodetection of NAND device bus-width was added in generic NAND
> driver as
[...]
> > @@ -1904,6 +1903,21 @@ static int omap_nand_probe(struct
> platform_device *pdev)
> >  		nand_chip->chip_delay =3D 50;
> >  	}
> >
> > +	/* scan for NAND device connected to chip controller */
> > +	if (nand_scan_ident(mtd, 1, NULL)) {
> > +		err =3D -ENXIO;
> > +		goto out_release_mem_region;
> > +	}
> > +	if ((nand_chip->options & NAND_BUSWIDTH_16) !=3D
> > +			(pdata->devsize & NAND_BUSWIDTH_16)) {
> > +		pr_err("%s: detected %s device but driver configured for
> %s\n",
> > +			DRIVER_NAME,
> > +			(nand_chip->options & NAND_BUSWIDTH_16) ?
> "x16" : "x8",
> > +			(pdata->devsize & NAND_BUSWIDTH_16) ? "x16" :
> "x8");
>=20
> I'm not sure on the policy choice here; if you're using BUSWIDTH_AUTO,
> do you even want to try to configure the buswidth by platform data?
> You're not really getting the full use out of NAND_BUSWIDTH_AUTO because
> the platform data has to guess the same buswidth that nand_base.c
> determines. This is worse than the previous behavior, in which you would
> try both buswidths if the specified type failed.
>=20
> IOW, what are you trying to achieve with auto-buswidth? Automatic
> determination of the buswidth or just automatic validation? What do you
> achieve with platform data's selection of buswidth? Specification of the
> buswidth or just a hint? Do the goals conflict? Perhaps you can just
> warn, and not error out if the two selections don't match? Or maybe you
> really wanted to replace the platform data selection mechanism entirely
> with auto-buswidth?
>=20
This is 'automatic validation' of value set in DT binding "nand-bus-width"
So this approach is other way round, where controller is configured
based on DT binding "nand-bus-width" and then it checks whether
device actual buswidth matches DT binding value or not.

- GPMC controller is pre-configured to support "x8" or "x16" device based
   on DT binding "nand-bus-width".
   Reference: $LINUX/arch/arm/mach-omap2/gpmc.c
  @@gpmc_probe_nand_child()
	val =3D of_get_nand_bus_width(child);

- But, bus-width of NAND device is only known during NAND driver
   Probe in nand_scan_ident().

Going forward when all NAND devices are compliant to ONFI,
then we can deprecate "nand-bus-width".


with regards, pekon
