Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCdSL-0001uW-43
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 18:48:26 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Fri, 14 May 2010 00:18:13 +0530
Subject: RE: [PATCH 2/3] omap3 nand: cleanup for not to use GPMC virtual
	address
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D8FB10F@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1273657718-12517-1-git-send-email-s-ghorai@ti.com>
	<1273657718-12517-2-git-send-email-s-ghorai@ti.com>
	<1273657718-12517-3-git-send-email-s-ghorai@ti.com>
	<20100513154103.GI29368@atomide.com>
In-Reply-To: <20100513154103.GI29368@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "sakoman@gmail.com" <sakoman@gmail.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tony,

> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: 2010-05-13 21:11
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org;
> sakoman@gmail.com; mike@compulab.co.il; Artem.Bityutskiy@nokia.com
> Subject: Re: [PATCH 2/3] omap3 nand: cleanup for not to use GPMC virtual
> address
>=20
> * Sukumar Ghorai <s-ghorai@ti.com> [100512 02:43]:
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -64,16 +64,32 @@ static void __iomem *gpmc_base;
> >
> >  static struct clk *gpmc_l3_clk;
> >
> > -static void gpmc_write_reg(int idx, u32 val)
> > +void gpmc_write_reg(int idx, u32 val)
> >  {
> >  	__raw_writel(val, gpmc_base + idx);
> >  }
> >
> > -static u32 gpmc_read_reg(int idx)
> > +u32 gpmc_read_reg(int idx)
> >  {
> >  	return __raw_readl(gpmc_base + idx);
> >  }
> >
> > +void gpmc_cs_write_byte(int cs, int idx, u32 val)
> > +{
> > +	void __iomem *reg_addr;
> > +
> > +	reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) + idx;
> > +	__raw_writeb(val, reg_addr);
> > +}
> > +
> > +u8 gpmc_cs_read_byte(int cs, int idx)
> > +{
> > +	void __iomem *reg_addr;
> > +
> > +	reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) + idx;
> > +	return __raw_readb(reg_addr);
> > +}
> > +
>=20
> This will not improve the situation unfortunately.
> We for sure don't want to export functions to mess
> with the GPMC registers all over the place.
>=20
> > @@ -432,15 +448,6 @@ void gpmc_prefetch_reset(void)
> >  }
> >  EXPORT_SYMBOL(gpmc_prefetch_reset);
> >
> > -/**
> > - * gpmc_prefetch_status - reads prefetch status of engine
> > - */
> > -int  gpmc_prefetch_status(void)
> > -{
> > -	return gpmc_read_reg(GPMC_PREFETCH_STATUS);
> > -}
> > -EXPORT_SYMBOL(gpmc_prefetch_status);
> > -
>=20
> And we don't want to remove GPMC functions like this,
> instead we need to implement more functions like this
> for the platform init code to use.

[Ghorai]=20
1. NAND IO address needed by core NAND driver. So we can't move that access=
 to GMPC.
2. And is it ok if we add functions as below and all need to be as EXPORT_S=
YMBOL too?=20
get_gpmc_status()
get_gpmc_irq_status()
set_gpmc_irq_status()
set_gpmc_irq_enable()
get_gpmc_config
set_gpmc_config
get_gpmc_status()
get_gpmc_prefetch_config()
gpmc_prefetch_status=20
set_gpmc_ecc_config
set_gpmc_ecc_contol
set_gpmc_ecc_size
get_gpmc_ecc_result

Regards,
Sukumar


> Regards,
>=20
> Tony
