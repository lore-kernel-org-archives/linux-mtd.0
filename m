From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Wed, 29 Sep 2010 11:32:23 +0530
Subject: RE: [PATCH v5 2/5] omap3: nand: prefetch in irq mode support
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B03564763D3@dbde02.ent.ti.com>
References: <1285594634-19277-1-git-send-email-s-ghorai@ti.com>
	<1285594634-19277-3-git-send-email-s-ghorai@ti.com>
	<20100928222933.GT3117@atomide.com>
In-Reply-To: <20100928222933.GT3117@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Vimal Singh <vimalsingh@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: Wednesday, September 29, 2010 4:00 AM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Vimal Singh
> Subject: Re: [PATCH v5 2/5] omap3: nand: prefetch in irq mode support
>=20
> * Sukumar Ghorai <s-ghorai@ti.com> [100927 06:30]:
> >  This patch enable prefetch-irq mode for NAND.
>=20
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -112,6 +112,9 @@ config MTD_NAND_OMAP_PREFETCH
> >  	help
> >  	 The NAND device can be accessed for Read/Write using GPMC PREFETCH
> engine
> >  	 to improve the performance.
> > +	 GPMC PREFETCH can be configured eigther in MPU interrupt mode or in
> DMA
> > +	 interrupt mode. If not selected any of them prefetch will be used
> in
> > +	 polling mode.
> >
> >  config MTD_NAND_OMAP_PREFETCH_DMA
> >  	depends on MTD_NAND_OMAP_PREFETCH
> > @@ -120,7 +123,16 @@ config MTD_NAND_OMAP_PREFETCH_DMA
> >  	help
> >  	 The GPMC PREFETCH engine can be configured eigther in MPU interrupt
> mode
> >  	 or in DMA interrupt mode.
> > -	 Say y for DMA mode or MPU mode will be used
> > +	 Say y for DMA mode
> > +
> > +config MTD_NAND_OMAP_PREFETCH_IRQ
> > +	depends on MTD_NAND_OMAP_PREFETCH && !MTD_NAND_OMAP_PREFETCH_DMA
> > +	bool "IRQ mode"
> > +	default n
> > +	help
> > +	 The GPMC PREFETCH engine can be configured eigther in MPU interrupt
> mode
> > +	 or in DMA interrupt mode.
> > +	 Say y for IRQ mode
> >
> >  config MTD_NAND_IDS
> >  	tristate
>=20
> The configuration to use the prefetch IRQ should be passed in the
> platform_data
> from the board-*.c files. What if you want to to boot a distro kernel on
> omap2, 3 and 4 and only some of the boards can use the prefetch interrupt=
?
[Ghorai] thanks.. we will provide the interface to select the io mode and e=
cc mode from board file.

>=20
> Tony
