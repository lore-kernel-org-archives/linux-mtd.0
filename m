Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL4OG-0000My-Bh
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 03:52:25 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
Date: Mon, 8 Oct 2012 05:52:20 +0200
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>
 <CAOMZO5B4c+qaKrz2skB_vGCRBW-9mUhhOaCUtiEqtv36V8i5eQ@mail.gmail.com>
 <CAOMZO5CYgDi3Rj7gKJAr-nMrUSec4YAxLCkPPf-amA6nXP7_EA@mail.gmail.com>
In-Reply-To: <CAOMZO5CYgDi3Rj7gKJAr-nMrUSec4YAxLCkPPf-amA6nXP7_EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210080552.20661.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> On Mon, Oct 8, 2012 at 12:31 AM, Fabio Estevam <festevam@gmail.com> wrote:
> > On Mon, Oct 8, 2012 at 12:32 AM, Huang Shijie <b32955@freescale.com> wrote:
> >> This patch is really not needed.
> >> 
> >> The clk_get() can get the right clock in the mx23/mx28. I tested them.
> > 
> > Please test it on linux-next.
> > 
> > gpmi nand can not event be probed.
> 
> What about this?

I don't like this one ... such condition shouldn't be in the driver.

> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -495,7 +495,11 @@ static int __devinit gpmi_get_clks(struct
> gpmi_nand_data *this)
>         int i;
> 
>         /* The main clock is stored in the first. */
> -       r->clock[0] = clk_get(this->dev, "gpmi_io");
> +       if (GPMI_IS_MX6Q(this))
> +               r->clock[0] = clk_get(this->dev, "gpmi_io");
> +       else
> +               r->clock[0] = clk_get(this->dev, NULL);
> +
>         if (IS_ERR(r->clock[0]))
>                 goto err_clock;

Best regards,
Marek Vasut
