Received: from fmmailgate03.web.de ([217.72.192.234])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUOZ3-00042a-5Z
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 18:00:33 +0000
Date: Mon, 11 Jan 2010 19:00:23 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mxc-nand: no need to check for validity of platform
	drive data
Message-ID: <20100111180023.GA6923@pengutronix.de>
References: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: saschahauer@web.de
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 11, 2010 at 03:05:35PM +0100, Uwe Kleine-König wrote:
> The probe function calls platform_set_drvdata with a valid pointer when
> the probe is successful.  As mxcnd_suspend and mxcnd_resume are only
> called on bound devices, platform_get_drvdata always returns non-NULL.
> 
> This fix isn't critical as the pointer is always valid so it doesn't
> matter if the compiler generated code for it or not.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reported-by: David Binderman <dcb314@hotmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Vladimir Barinov <vova.barinov@gmail.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
>  drivers/mtd/nand/mxc_nand.c |   17 +++++++----------
>  1 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 45dec57..84f3635 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -886,11 +886,10 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>  	int ret = 0;
>  
>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
> -	if (mtd) {
> -		ret = mtd->suspend(mtd);
> -		/* Disable the NFC clock */
> -		clk_disable(host->clk);
> -	}
> +
> +	ret = mtd->suspend(mtd);
> +	/* Disable the NFC clock */
> +	clk_disable(host->clk);
>  
>  	return ret;
>  }
> @@ -904,11 +903,9 @@ static int mxcnd_resume(struct platform_device *pdev)
>  
>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
>  
> -	if (mtd) {
> -		/* Enable the NFC clock */
> -		clk_enable(host->clk);
> -		mtd->resume(mtd);
> -	}
> +	/* Enable the NFC clock */
> +	clk_enable(host->clk);
> +	mtd->resume(mtd);
>  
>  	return ret;
>  }
> -- 
> 1.6.5.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
