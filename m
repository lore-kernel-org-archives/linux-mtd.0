Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel4b-0000Fi-TY
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:45:16 +0000
Date: Wed, 13 Jun 2012 03:45:06 -0700
From: Tony Lindgren <tony@atomide.com>
To: Afzal Mohammed <afzal@ti.com>
Subject: Re: [PATCH 03/10] mtd: nand: omap2: handle nand on gpmc
Message-ID: <20120613104505.GI12766@atomide.com>
References: <cover.1338790117.git.afzal@ti.com>
 <f39c9f3c8403d1ddc925ddcb6bf03ce1fe805c59.1338790117.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f39c9f3c8403d1ddc925ddcb6bf03ce1fe805c59.1338790117.git.afzal@ti.com>
Cc: artem.bityutskiy@linux.intel.com, ivan.djelic@parrot.com,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Afzal Mohammed <afzal@ti.com> [120604 00:06]:
> +static int omap_prefetch_enable(int cs, int fifo_th, int dma_mode,
> +	unsigned int u32_count, int is_write, struct omap_nand_info *info)
> +{
> +	u32 val;
> +
> +	if (fifo_th > PREFETCH_FIFOTHRESHOLD_MAX) {
> +		pr_err("gpmc: fifo threshold is not supported\n");
> +		return -1;
> +	} else if (!(readl(info->reg.gpmc_prefetch_control))) {
> +		/* Set the amount of bytes to be prefetched */
> +		writel(u32_count, info->reg.gpmc_prefetch_config2);
> +
> +		/* Set dma/mpu mode, the prefetch read / post write and
> +		 * enable the engine. Set which cs is has requested for.
> +		 */
> +		val = ((cs << PREFETCH_CONFIG1_CS_SHIFT) |
> +					PREFETCH_FIFOTHRESHOLD(fifo_th) |
> +					ENABLE_PREFETCH |
> +					(dma_mode << DMA_MPU_MODE_SHIFT) |
> +					(0x1 & is_write));
> +		writel(val, info->reg.gpmc_prefetch_config1);
> +
> +		/*  Start the prefetch engine */
> +		writel(0x1, info->reg.gpmc_prefetch_control);
> +	} else {
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}

You can simplify the above by leaving out the if else stuff by
returning early:

	if (fifo_th > PREFETCH_FIFOTHRESHOLD_MAX)
		return -1;

	if (readl(info->reg.gpmc_prefetch_control))
		return -EBUSY;

	/* Set the amount of bytes to be prefetched */
	writel(u32_count, info->reg.gpmc_prefetch_config2);
	...

	return 0;

Regards,

Tony
