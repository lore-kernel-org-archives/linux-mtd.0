From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Thu, 28 Oct 2010 19:41:53 +0530
Subject: RE: [PATCH v5 1/5] omap gpmc: enable irq mode in gpmc
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0356AEEDE2@dbde02.ent.ti.com>
References: <1285594634-19277-1-git-send-email-s-ghorai@ti.com>
	<1285594634-19277-2-git-send-email-s-ghorai@ti.com>
	<20100928222727.GS3117@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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

Tony,

> -----Original Message-----
> From: Ghorai, Sukumar
> Sent: Wednesday, September 29, 2010 12:08 PM
> To: 'Tony Lindgren'
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org
> Subject: RE: [PATCH v5 1/5] omap gpmc: enable irq mode in gpmc
>=20
>=20
[..snip..]

> > > diff --git a/arch/arm/mach-omap2/board-3430sdp.c b/arch/arm/mach-
> > omap2/board-3430sdp.c
> > > index 67b95b5..549cd62 100644
> > > --- a/arch/arm/mach-omap2/board-3430sdp.c
> > > +++ b/arch/arm/mach-omap2/board-3430sdp.c
> > > @@ -328,6 +328,7 @@ static void __init omap_3430sdp_init_irq(void)
> > >  	omap3_pm_init_cpuidle(omap3_cpuidle_params_table);
> > >  	omap2_init_common_hw(hyb18m512160af6_sdrc_params, NULL);
> > >  	omap_init_irq();
> > > +	gpmc_init();
> > >  	omap_gpio_init();
> > >  }
> > ...
> >
> > You can avoid adding gpmc_init() by making it a subsys_initcall().
> > Just make sure you return early from it with if (!cpu_class_is_omap2())=
.
> [Ghorai] will do
> >
[Ghorai] I was trying this and no success, as nand_init() get called before=
  subsys_initcall(gpmc_init);

126 MACHINE_START(OMAP_ZOOM3, "OMAP Zoom3 board")=20
..
130         .init_irq       =3D omap_zoom_init_irq,
131         .init_machine   =3D omap_zoom_init,
..

Step-(n):
	kernel_init() -> customize_machine()=20
             -> omap_zoom_init() -> gpmc_nand_init() -> which call gpmc
                functions, that's crashing, as gpmc is not initialized.

Step-(n+1):
	Followed by subsys_initcall(gpmc_init)

So I will incorporate the other input and will re-submit.
[..snip..]
