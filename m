From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Mon, 2 Aug 2010 19:09:58 +0530
Subject: RE: [PATCH v3 1/4] omap3: nand: prefetch in irq mode support
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030E54E6BD@dbde02.ent.ti.com>
References: <1278996337-25172-1-git-send-email-s-ghorai@ti.com>
	<1278996337-25172-2-git-send-email-s-ghorai@ti.com>
	<20100802130306.GL12293@atomide.com>
In-Reply-To: <20100802130306.GL12293@atomide.com>
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
> Sent: Monday, August 02, 2010 6:33 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Vimal Singh
> Subject: Re: [PATCH v3 1/4] omap3: nand: prefetch in irq mode support
>=20
> * Sukumar Ghorai <s-ghorai@ti.com> [100713 07:39]:
> > This patch enable prefetch-irq mode for NAND.
>=20
> <snip>
>=20
> > --- a/arch/arm/mach-omap2/board-flash.c
> > +++ b/arch/arm/mach-omap2/board-flash.c
> > @@ -133,6 +133,7 @@ static struct omap_nand_platform_data
> board_nand_data =3D {
> >  	.nand_setup	=3D NULL,
> >  	.gpmc_t		=3D &nand_timings,
> >  	.dma_channel	=3D -1,		/* disable DMA in OMAP NAND driver */
> > +	.gpmc_irq	=3D GPMC_IRQ_NUMBER,
> >  	.dev_ready	=3D NULL,
> >  	.devsize	=3D 0,	/* '0' for 8-bit, '1' for 16-bit device */
> >  };
> > --- a/arch/arm/mach-omap2/include/mach/board-flash.h
> > +++ b/arch/arm/mach-omap2/include/mach/board-flash.h
> > @@ -19,6 +19,9 @@
> >  #define PDC_ONENAND	3
> >  #define DBG_MPDB	4
> >
> > +/* Interrupt number to the MPU Subsystem for GPMC */
> > +#define GPMC_IRQ_NUMBER	20
> > +
>=20
> This does not look right for the IRQ. Please add it to the irqs.h and 34x=
x,
> then set it dynamically during the init just like we handle the other
> interrupt numbers.
>=20
> This is because the irq numbers can change between omaps, like irqs-44xx.=
h
> already has
>=20
> #define OMAP44XX_IRQ_GPMC                       (20 +
> OMAP44XX_IRQ_GIC_START)
>=20
> > @@ -130,6 +141,13 @@ struct omap_nand_info {
> >  	unsigned long			phys_base;
> >  	struct completion		comp;
> >  	int				dma_ch;
> > +	int				gpmc_irq;
> > +	enum {
> > +		NAND_IO_READ =3D 0,	/* read */
> > +		NAND_IO_WRITE,		/* write */
> > +	} iomode;
> > +	u_char				*buf;
> > +	int					buf_len;
> >  };
>=20
> These should probably be OMAP_NAND_IO_READ and OMAP_NAND_IO_WRITE?
[Ghorai] Thanks. I understand all your comments. I will rework and submit a=
gain.=20

Regards,
Ghorai

>=20
> Regards,
>=20
> Tony
