Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TsfL4-0008Ac-9Q
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2013 20:00:00 +0000
Received: from mail619.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id A3F71FFB964
 for <linux-mtd@lists.infradead.org>; Tue,  8 Jan 2013 21:09:17 +0100 (CET)
Date: Tue, 8 Jan 2013 20:58:26 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: mxc_nand: Make use of supplied pinctrl data
Message-ID: <20130108195826.GD7360@game.jcrosoft.org>
References: <1357568885-15507-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1357568885-15507-1-git-send-email-marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:28 Mon 07 Jan     , Marek Vasut wrote:
> The MXC NAND driver doesn't consider the pinctrl data supplied via DT, which
> will result in NAND pins not being properly configured.
> 
> Make the driver use pinctrl, but to prevent breakage on various boards, do not
> fail if the pinctrl data are not available, only print a warning message.
nack

we will at bus level

Best Regards,
J.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: Lothar Waﬂmann <LW@KARO-electronics.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 45204e4..ed805fb 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -34,6 +34,7 @@
>  #include <linux/completion.h>
>  #include <linux/of_device.h>
>  #include <linux/of_mtd.h>
> +#include <linux/pinctrl/consumer.h>
>  
>  #include <asm/mach/flash.h>
>  #include <linux/platform_data/mtd-mxc_nand.h>
> @@ -1385,6 +1386,7 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	struct mtd_info *mtd;
>  	struct mxc_nand_host *host;
>  	struct resource *res;
> +	struct pinctrl *pinctrl;
>  	int err = 0;
>  
>  	/* Allocate memory for MTD device structure and private data */
> @@ -1449,6 +1451,10 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	if (!res)
>  		return -ENODEV;
>  
> +	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
> +	if (IS_ERR(pinctrl))
> +		dev_warn(&pdev->dev, "No PINCTRL data for the NAND driver!\n");
> +
>  	host->base = devm_request_and_ioremap(&pdev->dev, res);
>  	if (!host->base)
>  		return -ENOMEM;
> -- 
> 1.7.10.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
