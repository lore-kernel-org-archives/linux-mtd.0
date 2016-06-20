Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bExz8-0008BS-4W
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 12:07:24 +0000
Message-ID: <1466424354.6070.41.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, maxime.ripard@free-electrons.com,
 wens@csie.org, robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com
Date: Mon, 20 Jun 2016 14:05:54 +0200
In-Reply-To: <20160619140652.07ab03c9@bbrezillon>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
 <20160619113739.30362-2-icenowy@aosc.xyz>
 <20160619140652.07ab03c9@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, den 19.06.2016, 14:06 +0200 schrieb Boris Brezillon:
> +Philipp
> 
> On Sun, 19 Jun 2016 19:37:39 +0800
> Icenowy Zheng <icenowy@aosc.xyz> wrote:
> 
> > The NAND controller on some sun8i chips needs its reset line to be deasserted
> > before they can enter working state. This commit added the reset line process
> > to the driver.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > ---
> >  drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> > index a83a690..1502748 100644
> > --- a/drivers/mtd/nand/sunxi_nand.c
> > +++ b/drivers/mtd/nand/sunxi_nand.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/gpio.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/reset.h>
> >  
> >  #define NFC_REG_CTL		0x0000
> >  #define NFC_REG_ST		0x0004
> > @@ -269,6 +270,7 @@ struct sunxi_nfc {
> >  	void __iomem *regs;
> >  	struct clk *ahb_clk;
> >  	struct clk *mod_clk;
> > +	struct reset_control *reset;
> >  	unsigned long assigned_cs;
> >  	unsigned long clk_rate;
> >  	struct list_head chips;
> > @@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto out_ahb_clk_unprepare;
> >  
> > +	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
> > +	if (PTR_ERR(nfc->reset) == -EPROBE_DEFER)
> > +		return PTR_ERR(nfc->reset);
> 
> Actually you should test for != -ENOENT, because all error codes except
> this one should stop the ->probe().
> 
> BTW, this devm_reset_control_get_optional() is really weird. While most
> _optional() methods return NULL when the element is not defined in the
> DT, this one returns -ENOTENT, which makes it impossible to
> differentiate a real error from a undefined reset line (which is a
> valid case for _optional()).

Of course it's possible, -ENOENT is only returned if the reset line is
not defined in the device tree.

Note that gpiod_get_(index_)optional do nothing more that replacing
-ENOENT with NULL. And phydev_optional_get replaces -ENODEV with NULL.
And regulator_get_optional, if I understand it correctly, never returns
NULL.

> Philipp, is there a good reason for doing that?

Historically, NULL has not been a valid value for rstc. I suppose we
could add NULL checks to the reset_control_assert/deassert/reset/status
functions and align the reset API a bit with gpiod. I just wouldn't want
to see any IS_ERR_OR_NULL error handling in the drivers.

regards
Philipp
