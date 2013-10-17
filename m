Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWdLM-0006kp-UZ
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 02:29:45 +0000
Received: by mail-oa0-f50.google.com with SMTP id j1so1500029oag.9
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2013 19:29:23 -0700 (PDT)
Date: Wed, 16 Oct 2013 19:29:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 9/9] mtd: nand: omap: updated devm_xx for all
 resource allocation and free calls
Message-ID: <20131017022919.GD23337@ld-irv-0074.broadcom.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-10-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381816197-20477-10-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com, balbi@ti.com,
 robherring2@gmail.com, bcousson@baylibre.com, swarren@wwwdotorg.org,
 olof@lixom.net, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 11:19:57AM +0530, Pekon Gupta wrote:
> "Managed Device Resource" or devm_xx calls takes care of automatic freeing
> of the resource in case of:
> - failure during driver probe
> - failure during resource allocation
> - detaching or unloading of driver module (rmmod)
> Reference: Documentation/driver-model/devres.txt
> 
> Though OMAP NAND driver handles freeing of resource allocation in most of
> the cases, but using devm_xx provides more clean and effortless approach
> to handle all such cases.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 44 ++++++++++++++------------------------------
>  1 file changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 769ff65..0ed0d6f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c

[...]

> @@ -1796,8 +1799,9 @@ static int omap_nand_probe(struct platform_device *pdev)
>  			err = -ENODEV;
>  			goto out_release_mem_region;
>  		}
> -		err = request_irq(info->gpmc_irq_count,	omap_nand_irq,
> -					IRQF_SHARED, "gpmc-nand-count", info);
> +		err = devm_request_irq(&pdev->dev, info->gpmc_irq_count,
> +					omap_nand_irq, IRQF_SHARED,
> +					"gpmc-nand-count", info);
>  		if (err) {
>  			dev_err(&pdev->dev, "requesting irq(%d) error:%d",
>  						info->gpmc_irq_count, err);
> @@ -2010,45 +2014,25 @@ static int omap_nand_probe(struct platform_device *pdev)
>  out_release_mem_region:

Now that you've simplified this error path, you don't need so verbose of
a name (it could just be 'out'), but that's not worth another revision.

>  	if (info->dma)
>  		dma_release_channel(info->dma);
> -	if (info->gpmc_irq_count > 0)
> -		free_irq(info->gpmc_irq_count, info);
> -	if (info->gpmc_irq_fifo > 0)
> -		free_irq(info->gpmc_irq_fifo, info);
> -	release_mem_region(info->phys_base, info->mem_size);
> -out_free_info:
>  	if (info->nand.ecc.priv) {
>  		nand_bch_free(info->nand.ecc.priv);
>  		info->nand.ecc.priv = NULL;
>  	}
> -	kfree(info);
> -
>  	return err;
>  }

[...]

This patch version looks much better. Thanks for the rewrite.

Brian
