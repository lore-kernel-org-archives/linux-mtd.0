Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq4Bn-0000fy-Ll
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 11:37:45 +0000
Date: Sat, 4 Apr 2009 13:37:25 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Vladimir Barinov <vbarinov@embeddedalley.com>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v2)
Message-ID: <20090404113725.GD23731@pengutronix.de>
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>
	<1238748195-10757-1-git-send-email-vbarinov@embeddedalley.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1238748195-10757-1-git-send-email-vbarinov@embeddedalley.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Lothar Wassmann <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 03, 2009 at 12:43:15PM +0400, Vladimir Barinov wrote:
> The following patch fixes:
>  - re-initialization of host->col_addr which is used as byte index
>    between the successive READID flash commands.
>  - compile error when CONFIG_PM is enabled
>  - pass on the error code from clk_get()
>  - return -ENOMEM in case of failed ioremap()
>  - pass on the return value of platform_driver_probe() directly
>  - remove excessive printk
>  - let command line partition table parsing with mxc_nand name.
>    The cmd_line parsing is done via <mtd-id> name that differs
>    from mxc_nand by default and looks like "NAND 256MiB 1,8V 8-bit"
> 
> Signed-off-by: Vladimir Barinov <vbarinov@embeddedalley.com>
> Signed-off-by: Lothar Wassmann <LW@KARO-electronics.de>
> ---
>  drivers/mtd/nand/mxc_nand.c |   45 +++++++++++++++++++++++-------------------
>  1 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index bad048a..7ecfde0 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -831,6 +831,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>  		break;
>  
>  	case NAND_CMD_READID:
> +		host->col_addr = 0;
>  		send_read_id(host);
>  		break;
>  
> @@ -881,8 +882,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  	this->verify_buf = mxc_nand_verify_buf;
>  
>  	host->clk = clk_get(&pdev->dev, "nfc");
> -	if (IS_ERR(host->clk))
> +	if (IS_ERR(host->clk)) {
> +		err = PTR_ERR(host->clk);
>  		goto eclk;
> +	}
>  
>  	clk_enable(host->clk);
>  	host->clk_act = 1;
> @@ -895,7 +898,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  
>  	host->regs = ioremap(res->start, res->end - res->start + 1);
>  	if (!host->regs) {
> -		err = -EIO;
> +		err = -ENOMEM;
>  		goto eres;
>  	}
>  
> @@ -964,6 +967,9 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  
>  	/* Register the partitions */
>  #ifdef CONFIG_MTD_PARTITIONS
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +	mtd->name = "mxc_nand";
> +#endif

Thinking about it I'm totally against this ifdef. The name should not
depend on command line partition support being compiled into the kernel
or not. Just because it's compiled in does not mean that the user
actually wants to use it and it's quite confusing that the name changes
when a totally unrelated option is changed. I think it should not even
be inside CONFIG_MTD_PARTITIONS.

The rest of the patch seems ok to me.

Sascha

>  	nr_parts =
>  	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
>  	if (nr_parts > 0)
> @@ -1010,30 +1016,35 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM
>  static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>  {
> -	struct mtd_info *info = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = platform_get_drvdata(pdev);
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct mxc_nand_host *host = nand_chip->priv;
>  	int ret = 0;
>  
>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
> -	if (info)
> -		ret = info->suspend(info);
> -
> -	/* Disable the NFC clock */
> -	clk_disable(nfc_clk);	/* FIXME */
> +	if (mtd) {
> +		ret = mtd->suspend(mtd);
> +		/* Disable the NFC clock */
> +		clk_disable(host->clk);
> +	}
>  
>  	return ret;
>  }
>  
>  static int mxcnd_resume(struct platform_device *pdev)
>  {
> -	struct mtd_info *info = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = platform_get_drvdata(pdev);
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct mxc_nand_host *host = nand_chip->priv;
>  	int ret = 0;
>  
>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
> -	/* Enable the NFC clock */
> -	clk_enable(nfc_clk);	/* FIXME */
>  
> -	if (info)
> -		info->resume(info);
> +	if (mtd) {
> +		/* Enable the NFC clock */
> +		clk_enable(host->clk);
> +		mtd->resume(mtd);
> +	}
>  
>  	return ret;
>  }
> @@ -1054,13 +1065,7 @@ static struct platform_driver mxcnd_driver = {
>  
>  static int __init mxc_nd_init(void)
>  {
> -	/* Register the device driver structure. */
> -	pr_info("MXC MTD nand Driver\n");
> -	if (platform_driver_probe(&mxcnd_driver, mxcnd_probe) != 0) {
> -		printk(KERN_ERR "Driver register failed for mxcnd_driver\n");
> -		return -ENODEV;
> -	}
> -	return 0;
> +	return platform_driver_probe(&mxcnd_driver, mxcnd_probe);
>  }
>  
>  static void __exit mxc_nd_cleanup(void)
> -- 
> 1.5.6
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
