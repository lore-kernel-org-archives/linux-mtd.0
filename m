Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMFUK-0002x5-Pp
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 13:09:09 +0000
Date: Mon, 3 Aug 2015 06:08:42 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, bcousson@baylibre.com,
 ezequiel@vanguardiasur.com.ar, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20150803130842.GP16878@atomide.com>
References: <1436531019-18088-1-git-send-email-rogerq@ti.com>
 <1436531019-18088-4-git-send-email-rogerq@ti.com>
 <20150713071008.GC26485@atomide.com> <55A38D2E.9010500@ti.com>
 <20150713124059.GF26485@atomide.com> <55B8C1D5.3090807@ti.com>
 <55BB4C1D.5080905@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55BB4C1D.5080905@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [150731 03:24]:
> 
> One more observation I've had is that using irqchip modelling for
> the 2 NAND events causes a performance impact.
> 
> Using mtd_oobtest I see the following on dra7-evm
> 
> 1) v4.2-rc4 with prefetch-polled (no IRQs used)
> mtd_speedtest: eraseblock write speed is 7142 KiB/s
> mtd_speedtest: eraseblock read speed is 13721 KiB/s
> 
> 2) v4.2-rc4 with prefetch-irq (IRQchip model)
> eraseblock write speed is 5475 KiB/s
> eraseblock read speed is 6420 KiB/s
> 
> 3) this series (*) with prefetch-irq (no IRQchip model, nand driver
> directly accesses irqstatus/irqenable)
> eraseblock write speed is 6564 KiB/s
> eraseblock read speed is 10850 KiB/s
> 
> (*) diff at the end is required on top to fix an issue with this series.
> 
> So should we continue IRQchip modelling for the NAND events
> or use the GPMC interrupt as shared and add APIs to access
> the NAND bits of the IRQSTATUS/ENABLE register.

In the long run chained IRQ would be the most flexible solution
for sure.

It might be worth checking why we have so much overhead with
the irqchip modelling compared to shared IRQ. If the overhead
is really all the extra IRQ handling then it seems the shared
interrupt plus an API to access IRQSTATUS/ENABLE is the way
to go. Up to you.

Regards,

Tony

 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index fecc054..26ef2bd 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1832,13 +1832,14 @@ static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
>  		for (i = 0; i < ARRAY_SIZE(nand_xfer_types); i++) {
>  			if (!strcasecmp(s, nand_xfer_types[i])) {
>  				info->xfer_type = i;
> -				break;
> +				goto next;
>  			}
>  		}
>  
>  		dev_err(dev, "unrecognized value for ti,nand-xfer-type\n");
>  		return -EINVAL;
>  	}
> +next:
>  
>  	of_get_nand_on_flash_bbt(child);
>  
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 26ef2bd..e8bdff5 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -670,17 +670,12 @@ static irqreturn_t omap_nand_irq(int this_irq, void *dev)
>  			goto done;
>  	}
>  
> -	/* Clear FIFOEVENT STATUS */
> -	irqstatus &= ~GPMC_IRQ_FIFOEVENT;
> -	writel(irqstatus, info->reg.gpmc_irqstatus);
> -
>  	return IRQ_HANDLED;
>  
>  done:
>  	complete(&info->comp);
>  
> -	/* Clear FIFOEVENT and TERMCOUNT STATUS */
> -	irqstatus &= ~(GPMC_IRQ_TERMCOUNT | GPMC_IRQ_FIFOEVENT);
> +	/* Clear IRQ STATUS */
>  	writel(irqstatus, info->reg.gpmc_irqstatus);
>  
>  	/* Disable Interrupt generation */
> 
