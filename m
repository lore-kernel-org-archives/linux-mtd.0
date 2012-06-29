Message-ID: <20461.30991.63507.369439@ipc1.ka-ro>
Date: Fri, 29 Jun 2012 11:44:47 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Dong Aisheng <aisheng.dong@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
In-Reply-To: <20120629093437.GK5844@shlinux2.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
 <20120629093437.GK5844@shlinux2.ap.freescale.net>
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

Hi,

Dong Aisheng writes:
> On Fri, Jun 29, 2012 at 05:29:26PM +0800, Lothar Waßmann wrote:
> > Hi,
> > 
> > Dong Aisheng writes:
> > > On Fri, Jun 29, 2012 at 10:06:52AM +0800, Shawn Guo wrote:
> > > > On Thu, Jun 28, 2012 at 11:52:05PM -0400, Huang Shijie wrote:
> > > > > From: Huang Shijie <b32955@freescale.com>
> > > > > 
> > > > > The gpmi nand driver may needs several clocks(MX6Q needs five clocks).
> > > > > 
> > > > > In the old clock framework, all these clocks are chained together,
> > > > > all you need is to manipulate the first clock.
> > > > > 
> > > > > But the kernel uses the common clk framework now, which forces us to
> > > > > get the clocks one by one. When we use them, we have to enable them
> > > > > one by one too.
> > > > > 
> > [...]
> > > > > +static char *extra_clks_for_mx6q[] = {
> > > > > +	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
> > > > > +};
> > > > > +
> > > > > +static int __devinit gpmi_get_clks(struct gpmi_nand_data *this)
> > > > > +{
> > > > > +	struct resources *r = &this->resources;
> > > > > +	char **extra_clks = NULL;
> > > > > +	struct clk *clk;
> > > > > +	int i;
> > > > > +
> > > > > +	r->clock[0] = clk_get(&this->pdev->dev, NULL);
> > > > > +	if (IS_ERR(r->clock[0]))
> > > > > +		goto err_clock;
> > > > > +
> > > > > +	/* Get extra clocks */
> > > > > +	if (GPMI_IS_MX6Q(this))
> > > > > +		extra_clks = extra_clks_for_mx6q;
> > > > 
> > > > We probably do not need this tweaking.  We can have the driver always
> > > > take all those 5 clocks, and I think the current imx28 clock driver
> > > > can just work with it, because the gpmi-nand clkdev lookup has NULL
> > > > con_id and all those 5 clocks can match the same one on imx28.
> > > > 
> > > Will mx28 fail if doing like that?
> > > clk_get will fail if no clock found.
> > > struct clk *clk_get_sys(const char *dev_id, const char *con_id)
> > > {
> > >         struct clk_lookup *cl;
> > > 
> > >         mutex_lock(&clocks_mutex);
> > >         cl = clk_find(dev_id, con_id);
> > >         if (cl && !__clk_get(cl->clk))
> > >                 cl = NULL;
> > >         mutex_unlock(&clocks_mutex);
> > > 
> > >         return cl ? cl->clk : ERR_PTR(-ENOENT);
> > > }
> > > EXPORT_SYMBOL(clk_get_sys);
> > > 
> > > Furthermore, find unnecessary clock for mx28 seems not a good choice.
> > > Probably a better way is to define each SoC required clocks and get them
> > > respectively. It's explicit and clear.
> > > 
> > No, that's silly. You would have to change the driver for each
> > new platform that the driver can support.
> > 
> If the new platform is fully compatible with exist platforms, then no.
> If need more clocks, then in either way, we have to add support in driver.
> 
Even if it had fewer clocks you would have to change the driver!


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
