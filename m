Date: Fri, 29 Jun 2012 17:34:38 +0800
From: Dong Aisheng <aisheng.dong@freescale.com>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
Message-ID: <20120629093437.GK5844@shlinux2.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20461.30070.771087.830745@ipc1.ka-ro>
Content-Transfer-Encoding: quoted-printable
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, Huang Shijie-B32955 <B32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 05:29:26PM +0800, Lothar Wa=DFmann wrote:
> Hi,
>=20
> Dong Aisheng writes:
> > On Fri, Jun 29, 2012 at 10:06:52AM +0800, Shawn Guo wrote:
> > > On Thu, Jun 28, 2012 at 11:52:05PM -0400, Huang Shijie wrote:
> > > > From: Huang Shijie <b32955@freescale.com>
> > > >=20
> > > > The gpmi nand driver may needs several clocks(MX6Q needs five clo=
cks).
> > > >=20
> > > > In the old clock framework, all these clocks are chained together=
,
> > > > all you need is to manipulate the first clock.
> > > >=20
> > > > But the kernel uses the common clk framework now, which forces us=
 to
> > > > get the clocks one by one. When we use them, we have to enable th=
em
> > > > one by one too.
> > > >=20
> [...]
> > > > +static char *extra_clks_for_mx6q[] =3D {
> > > > +	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
> > > > +};
> > > > +
> > > > +static int __devinit gpmi_get_clks(struct gpmi_nand_data *this)
> > > > +{
> > > > +	struct resources *r =3D &this->resources;
> > > > +	char **extra_clks =3D NULL;
> > > > +	struct clk *clk;
> > > > +	int i;
> > > > +
> > > > +	r->clock[0] =3D clk_get(&this->pdev->dev, NULL);
> > > > +	if (IS_ERR(r->clock[0]))
> > > > +		goto err_clock;
> > > > +
> > > > +	/* Get extra clocks */
> > > > +	if (GPMI_IS_MX6Q(this))
> > > > +		extra_clks =3D extra_clks_for_mx6q;
> > >=20
> > > We probably do not need this tweaking.  We can have the driver alwa=
ys
> > > take all those 5 clocks, and I think the current imx28 clock driver
> > > can just work with it, because the gpmi-nand clkdev lookup has NULL
> > > con_id and all those 5 clocks can match the same one on imx28.
> > >=20
> > Will mx28 fail if doing like that?
> > clk_get will fail if no clock found.
> > struct clk *clk_get_sys(const char *dev_id, const char *con_id)
> > {
> >         struct clk_lookup *cl;
> >=20
> >         mutex_lock(&clocks_mutex);
> >         cl =3D clk_find(dev_id, con_id);
> >         if (cl && !__clk_get(cl->clk))
> >                 cl =3D NULL;
> >         mutex_unlock(&clocks_mutex);
> >=20
> >         return cl ? cl->clk : ERR_PTR(-ENOENT);
> > }
> > EXPORT_SYMBOL(clk_get_sys);
> >=20
> > Furthermore, find unnecessary clock for mx28 seems not a good choice.
> > Probably a better way is to define each SoC required clocks and get t=
hem
> > respectively. It's explicit and clear.
> >=20
> No, that's silly. You would have to change the driver for each
> new platform that the driver can support.
>=20
If the new platform is fully compatible with exist platforms, then no.
If need more clocks, then in either way, we have to add support in driver=
.

> Instead the driver should request the maximum number of clocks that
> the existing set of platforms provide and all platforms with fewer
> clocks should provide an appropriate number of dummy clocks.
>=20
I wish we can not use dummy since it's easy causing misleading until
we have no other better way to go.

> This way new platforms can be supported without any change to the
> driver and only if a platform requires even more clocks (like in this
> particular case) would some code outside that platform have to be
> changed at all.

Regards
Dong Aisheng
