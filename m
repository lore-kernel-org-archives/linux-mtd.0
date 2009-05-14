Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4Vkd-0007Fv-1Y
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 07:53:13 +0000
Date: Thu, 14 May 2009 09:53:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Magnus Lilja <lilja.magnus@gmail.com>
Subject: Re: [PATCH] MXC_NAND: Add correct dev_id parameter to free_irq()
	calls.
Message-ID: <20090514075309.GZ29278@pengutronix.de>
References: <17fbadcd7f353348afa4c56f92e0423c5b9708df.1241812369.git.lilja.magnus@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17fbadcd7f353348afa4c56f92e0423c5b9708df.1241812369.git.lilja.magnus@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Can you pickup this one aswell?

Sascha

On Fri, May 08, 2009 at 09:57:47PM +0200, Magnus Lilja wrote:
> Make sure to pass the same dev_id data to free_irq() that was
> used when calling request_irq(), otherwise we get a warning about
> freeing an already free IRQ.
> 
> Signed-off-by: Magnus Lilja <lilja.magnus@gmail.com>
> ---
> 
> For -rc perhaps?
> 
> Got the following warning prior to fixing this:
> WARNING: at /opt/git/linux-2.6/kernel/irq/manage.c:736 __free_irq+0x88/
> 0x1ac()
> Trying to free already-free IRQ 33
> Modules linked in: mxc_nand(-)
> [<c0025660>] (unwind_backtrace+0x0/0xd4) from [<c0036860>] (warn_slowpath+0x68/0
> x8c)
> [<c0036860>] (warn_slowpath+0x68/0x8c) from [<c0060324>] (__free_irq+0x88/0x1ac)
> [<c0060324>] (__free_irq+0x88/0x1ac) from [<c0060454>] (free_irq+0xc/0x18)
> [<c0060454>] (free_irq+0xc/0x18) from [<bf000c24>] (mxcnd_remove+0x30/0x48 [mxc_
> nand])
> unwind: Index not found bf000c24
> 
>  drivers/mtd/nand/mxc_nand.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index f3548d0..8a93913 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -981,7 +981,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  	return 0;
>  
>  escan:
> -	free_irq(host->irq, NULL);
> +	free_irq(host->irq, host);
>  eirq:
>  	iounmap(host->regs);
>  eres:
> @@ -1001,7 +1001,7 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, NULL);
>  
>  	nand_release(&host->mtd);
> -	free_irq(host->irq, NULL);
> +	free_irq(host->irq, host);
>  	iounmap(host->regs);
>  	kfree(host);
>  
> -- 
> 1.5.6
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
