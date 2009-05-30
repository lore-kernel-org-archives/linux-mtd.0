Received: from smtp104.sbc.mail.gq1.yahoo.com ([67.195.15.63])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MACR3-00033b-1x
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 00:28:35 +0000
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: davinci: update clock naming
Date: Fri, 29 May 2009 17:28:23 -0700
References: <1243641862-1404-1-git-send-email-khilman@deeprootsystems.com>
In-Reply-To: <1243641862-1404-1-git-send-email-khilman@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905291728.23672.david-b@pacbell.net>
Cc: Kevin Hilman <khilman@deeprootsystems.com>,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 29 May 2009, Kevin Hilman wrote:
> DaVinci clock support has been updated in mainline.
> Update clock names accordingly.

... and before 2.6.30-final ships, please.

Acked-by: David Brownell <dbrownell@users.sourceforge.net>


> 
> Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 0119220..02700f7 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -407,16 +407,17 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>  	}
>  	info->chip.ecc.mode = ecc_mode;
>  
> -	info->clk = clk_get(&pdev->dev, "AEMIFCLK");
> +	info->clk = clk_get(&pdev->dev, "aemif");
>  	if (IS_ERR(info->clk)) {
>  		ret = PTR_ERR(info->clk);
> -		dev_dbg(&pdev->dev, "unable to get AEMIFCLK, err %d\n", ret);
> +		dev_dbg(&pdev->dev, "unable to get AEMIF clock, err %d\n", ret);
>  		goto err_clk;
>  	}
>  
>  	ret = clk_enable(info->clk);
>  	if (ret < 0) {
> -		dev_dbg(&pdev->dev, "unable to enable AEMIFCLK, err %d\n", ret);
> +		dev_dbg(&pdev->dev, "unable to enable AEMIF clock, err %d\n",
> +			ret);
>  		goto err_clk_enable;
>  	}
>  
> -- 
> 1.6.2.2
> 
> 
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
> 
> 
