Received: from [2a01:4f8:101:2a4:0:bc28:b2d8:8] (helo=chuck.antcom.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZkft-00085H-Qn
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 16:23:35 +0000
Message-ID: <51892A67.1030602@antcom.de>
Date: Tue, 07 May 2013 18:23:03 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 17/26] mtd: nand: lpc32xx: remove unnecessary
 platform_set_drvdata()
References: <005501ce4aed$981487f0$c83d97d0$@samsung.com>
In-Reply-To: <005501ce4aed$981487f0$c83d97d0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/07/2013 08:39 AM, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Tested-by: Roland Stigge <stigge@antcom.de>
Acked-by: Roland Stigge <stigge@antcom.de>


> ---
>  drivers/mtd/nand/lpc32xx_mlc.c |    2 --
>  drivers/mtd/nand/lpc32xx_slc.c |    2 --
>  2 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
> index a94facb..5a5cfbc 100644
> --- a/drivers/mtd/nand/lpc32xx_mlc.c
> +++ b/drivers/mtd/nand/lpc32xx_mlc.c
> @@ -833,7 +833,6 @@ err_exit3:
>  err_exit2:
>  	clk_disable(host->clk);
>  	clk_put(host->clk);
> -	platform_set_drvdata(pdev, NULL);
>  err_exit1:
>  	lpc32xx_wp_enable(host);
>  	gpio_free(host->ncfg->wp_gpio);
> @@ -856,7 +855,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
>  
>  	clk_disable(host->clk);
>  	clk_put(host->clk);
> -	platform_set_drvdata(pdev, NULL);
>  
>  	lpc32xx_wp_enable(host);
>  	gpio_free(host->ncfg->wp_gpio);
> diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
> index be94ed5..a66f33f 100644
> --- a/drivers/mtd/nand/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/lpc32xx_slc.c
> @@ -936,7 +936,6 @@ err_exit3:
>  err_exit2:
>  	clk_disable(host->clk);
>  	clk_put(host->clk);
> -	platform_set_drvdata(pdev, NULL);
>  err_exit1:
>  	lpc32xx_wp_enable(host);
>  	gpio_free(host->ncfg->wp_gpio);
> @@ -963,7 +962,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
>  
>  	clk_disable(host->clk);
>  	clk_put(host->clk);
> -	platform_set_drvdata(pdev, NULL);
>  	lpc32xx_wp_enable(host);
>  	gpio_free(host->ncfg->wp_gpio);
>  
