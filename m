Received: from ducie-dc1.codethink.co.uk ([37.128.190.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0qQj-0000PU-Im
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 10:32:11 +0000
Message-ID: <52CD290F.6050103@codethink.co.uk>
Date: Wed, 08 Jan 2014 10:31:43 +0000
From: Ian Molton <ian.molton@codethink.co.uk>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>,
 'Brian Norris' <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 8/8] mtd: tmio_nand: Use devm_*() functions
References: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
 <008001cf01dc$37ae5ac0$a70b1040$%han@samsung.com>
In-Reply-To: <008001cf01dc$37ae5ac0$a70b1040$%han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26/12/13 01:45, Jingoo Han wrote:
> Use devm_*() functions to make cleanup paths simpler.

This patch seems to have resulted in a combination of both goto and 
multiple-return exit patch styles.

I see no point in using goto, if you're going to use multiple returns 
and it'll make introducing errors more likely in future.

please pick just one method :-)

-Ian


> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> No change since v2.
>
>   drivers/mtd/nand/tmio_nand.c |   46 ++++++++++++------------------------------
>   1 file changed, 13 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
> index a3747c9..fb8fd35 100644
> --- a/drivers/mtd/nand/tmio_nand.c
> +++ b/drivers/mtd/nand/tmio_nand.c
> @@ -371,11 +371,9 @@ static int tmio_probe(struct platform_device *dev)
>   	if (data == NULL)
>   		dev_warn(&dev->dev, "NULL platform data!\n");
>
> -	tmio = kzalloc(sizeof *tmio, GFP_KERNEL);
> -	if (!tmio) {
> -		retval = -ENOMEM;
> -		goto err_kzalloc;
> -	}
> +	tmio = devm_kzalloc(&dev->dev, sizeof(*tmio), GFP_KERNEL);
> +	if (!tmio)
> +		return -ENOMEM;
>
>   	tmio->dev = dev;
>
> @@ -385,22 +383,18 @@ static int tmio_probe(struct platform_device *dev)
>   	mtd->priv = nand_chip;
>   	mtd->name = "tmio-nand";
>
> -	tmio->ccr = ioremap(ccr->start, resource_size(ccr));
> -	if (!tmio->ccr) {
> -		retval = -EIO;
> -		goto err_iomap_ccr;
> -	}
> +	tmio->ccr = devm_ioremap(&dev->dev, ccr->start, resource_size(ccr));
> +	if (!tmio->ccr)
> +		return -EIO;
>
>   	tmio->fcr_base = fcr->start & 0xfffff;
> -	tmio->fcr = ioremap(fcr->start, resource_size(fcr));
> -	if (!tmio->fcr) {
> -		retval = -EIO;
> -		goto err_iomap_fcr;
> -	}
> +	tmio->fcr = devm_ioremap(&dev->dev, fcr->start, resource_size(fcr));
> +	if (!tmio->fcr)
> +		return -EIO;
>
>   	retval = tmio_hw_init(dev, tmio);
>   	if (retval)
> -		goto err_hwinit;
> +		return retval;
>
>   	/* Set address of NAND IO lines */
>   	nand_chip->IO_ADDR_R = tmio->fcr;
> @@ -428,7 +422,8 @@ static int tmio_probe(struct platform_device *dev)
>   	/* 15 us command delay time */
>   	nand_chip->chip_delay = 15;
>
> -	retval = request_irq(irq, &tmio_irq, 0, dev_name(&dev->dev), tmio);
> +	retval = devm_request_irq(&dev->dev, irq, &tmio_irq, 0,
> +				  dev_name(&dev->dev), tmio);
>   	if (retval) {
>   		dev_err(&dev->dev, "request_irq error %d\n", retval);
>   		goto err_irq;
> @@ -440,7 +435,7 @@ static int tmio_probe(struct platform_device *dev)
>   	/* Scan to find existence of the device */
>   	if (nand_scan(mtd, 1)) {
>   		retval = -ENODEV;
> -		goto err_scan;
> +		goto err_irq;
>   	}
>   	/* Register the partitions */
>   	retval = mtd_device_parse_register(mtd, NULL, NULL,
> @@ -451,18 +446,8 @@ static int tmio_probe(struct platform_device *dev)
>
>   	nand_release(mtd);
>
> -err_scan:
> -	if (tmio->irq)
> -		free_irq(tmio->irq, tmio);
>   err_irq:
>   	tmio_hw_stop(dev, tmio);
> -err_hwinit:
> -	iounmap(tmio->fcr);
> -err_iomap_fcr:
> -	iounmap(tmio->ccr);
> -err_iomap_ccr:
> -	kfree(tmio);
> -err_kzalloc:
>   	return retval;
>   }
>
> @@ -471,12 +456,7 @@ static int tmio_remove(struct platform_device *dev)
>   	struct tmio_nand *tmio = platform_get_drvdata(dev);
>
>   	nand_release(&tmio->mtd);
> -	if (tmio->irq)
> -		free_irq(tmio->irq, tmio);
>   	tmio_hw_stop(dev, tmio);
> -	iounmap(tmio->fcr);
> -	iounmap(tmio->ccr);
> -	kfree(tmio);
>   	return 0;
>   }
>
>
