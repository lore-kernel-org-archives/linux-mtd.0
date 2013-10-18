From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH v9 1/9] mtd: nand: omap: combine different flavours of
 1-bit hamming ecc schemes
Date: Fri, 18 Oct 2013 11:48:31 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA284F4@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-2-git-send-email-pekon@ti.com>
 <20131018105917.GE29779@e106331-lin.cambridge.arm.com>
In-Reply-To: <20131018105917.GE29779@e106331-lin.cambridge.arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

> From: Mark Rutland
> [...]
>=20
> > diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-
> omap2/gpmc.c
> > index 579697a..c9fb353 100644
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -1342,9 +1342,7 @@ static void __maybe_unused
> gpmc_read_timings_dt(struct device_node *np,
> >  #ifdef CONFIG_MTD_NAND
> >
> >  static const char * const nand_ecc_opts[] =3D {
> > -	[OMAP_ECC_HAMMING_CODE_DEFAULT]		=3D "sw",
> > -	[OMAP_ECC_HAMMING_CODE_HW]		=3D "hw",
> > -	[OMAP_ECC_HAMMING_CODE_HW_ROMCODE]	=3D "hw-
> romcode",
> > +	[OMAP_ECC_HAM1_CODE_HW]			=3D "ham1",
> >  	[OMAP_ECC_BCH4_CODE_HW]			=3D "bch4",
> >  	[OMAP_ECC_BCH8_CODE_HW]			=3D "bch8",
> >  };
>=20
> As the parsing isn't updated until the next patch, doesn't this
> temporarily break DTBs with the deprecated ti,nand-ecc-opt values?
>=20
Ok then I'll swap the [Patch 1/9] and [Patch 2/9] so that DT parsing update=
s
(with backward compatibility) happen before the deprecation of DT values.
This way old DT binding would work all through.

And as DT parsing is kept backward compatible, so .dts changes would not
break the DTBs even if updated in separate patch.

with regards, pekon
