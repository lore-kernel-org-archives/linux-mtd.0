Received: from mail-bn1on0139.outbound.protection.outlook.com
 ([157.56.110.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyB6E-0000cf-GS
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 04:09:03 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Li Leo <LeoLi@freescale.com>, Scott Wood <scottwood@freescale.com>, Xu Han
 <han.xu@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Mon, 16 Nov 2015 04:08:39 +0000
Message-ID: <BLUPR03MB134D5B98BF8C5DA5E763B1E831E0@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111190359.GE12143@google.com>
In-Reply-To: <20151111190359.GE12143@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian Norris,

Thanks for your information and the documents shared by you.
It's very helpful for me to understand the regmap.

But I think if we use:
static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
*addr) {
       if (q->big_endian)
               iowrite32be(val, addr);
       else
               iowrite32(val, addr);
 }
It looks like easier to read, use and change.
Is it?

And David Woodhouse, Xu Han, Mark Brown
is there any other comments from you?

Thank.

On Thu, Nov 12, 2015 3:04 AM Brian Norris wrote:
> On Fri, Oct 30, 2015 at 09:49:41AM +0000, Yao Yuan wrote:
> > Hi Fabio Estevam,
> >
> > Thanks for your suggestion.
> > We have an internal discussions for that.
> >
> > We think that:
> > According to the initial commit message of regmap, it is targeting
> > non-memory mapped buses. (regmap: Add generic non-memory mapped
> > register access API)  But in the imx2_wdt driver, it is used for
> > memory-mapped register space.  So it seems that using such a complex
> > framework just to deal with endian is an over-kill.
>=20
> It is definitely useful for non-MMIO cases, but it's certainly not exclus=
ive too it.
>=20
> > when it is not necessary to enable the clock every time we access the r=
egister.
>=20
> You don't have to give it a clock. Just pass a NULL clk_id.
>=20
> > We don't think it is obvious to us how to use it for handling
> > endianness, especially not the way imx2_wdt uses regmap.
> > __regmap_init_mmio_clk() calls regmap_mmio_gen_context() which errors
> > out if reg_format_endian is not REGMAP_ENDIAN_DEFAULT or
> > REGMAP_ENDIAN_NATIVE, and elsewhere regmap-mmio.c It seems only
> > little-endian accessors.
> >
> > Although it is possible to add the endianness support in the
> > regmap_mmio driver, we don't see too much value in using it especially
>=20
> It already has DT endianness configuration support. See __regmap_init(),
> which reconfigures the endianness according to regmap_get_val_endian().
> So you don't need to do anything but just try it... I exepct it'll work j=
ust fine.
>=20
> > So we think:
> > static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> > *addr) {
> >       if (q->big_endian)
> >               iowrite32be(val, addr);
> >       else
> >               iowrite32(val, addr);
> > }
> > This way is an easier, more effective solution to do the endian issue.
> >
> > How about your think?
>=20
> I think there's at least one more advantage: you get pretty good tracing
> support for free. For debugging, for example, you can turn on regmap trac=
ing
> to see all the register reads and writes done in your driver, all within =
the nice
> tracefs event infrastructure. I'm sure there are other advantages too, bu=
t not
> all are applicable here.
>=20
> Anyway, I do agree on the complexity argument. It's not actually that com=
plex
> to use (the imx2_wdt.c example really does show you everything you need t=
o
> know), it is a bit more complex to sort through all its features and unde=
rstand
> exactly what it's doing. But I'm confident it has everything you need.
>=20
> So, make your choice. I just wanted to educate on several points, so that=
 your
> decision is not just driven by lack of correct information.
>=20
> For more information, a quick google search shows a few links, but no off=
icial
> docs:
>=20
> http://elinux.org/images/a/a3/Regmap-
> _The_Power_of_Subsystems_and_Abstractions.pdf
> https://lwn.net/Articles/451789/
>=20
> Brian
>=20
> > Best Regards,
> > Yuan Yao
> >
> > On Sat, Oct 24, 2015 at 11:47 PM, Fabio Estevam <festevam@gmail.com>
> wrote:
> > > On Fri, Oct 23, 2015 at 5:53 AM, Yuan Yao <yao.yuan@freescale.com> wr=
ote:
> > >
> > > > +static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> > > > +*addr) {
> > > > +       if (q->big_endian)
> > > > +               iowrite32be(val, addr);
> > > > +       else
> > > > +               iowrite32(val, addr); }
> > >
> > > I suggest you to implement regmap support for this driver instead.
> > >
> > > Take a look at drivers/watchdog/imx2_wdt.c for a reference.
> > >
> > > Then you only need to pass 'big-endian' as a property for the qspi
> > > in the .dtsi file and regmap core will take care of endianness.
