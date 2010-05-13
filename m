Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCaX9-0003Gg-B6
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 15:41:12 +0000
Date: Thu, 13 May 2010 08:41:03 -0700
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH 2/3] omap3 nand: cleanup for not to use GPMC virtual
	address
Message-ID: <20100513154103.GI29368@atomide.com>
References: <s-ghorai@ti.com>
	<1273657718-12517-1-git-send-email-s-ghorai@ti.com>
	<1273657718-12517-2-git-send-email-s-ghorai@ti.com>
	<1273657718-12517-3-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273657718-12517-3-git-send-email-s-ghorai@ti.com>
Cc: sakoman@gmail.com, Artem.Bityutskiy@nokia.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [100512 02:43]:
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -64,16 +64,32 @@ static void __iomem *gpmc_base;
>  
>  static struct clk *gpmc_l3_clk;
>  
> -static void gpmc_write_reg(int idx, u32 val)
> +void gpmc_write_reg(int idx, u32 val)
>  {
>  	__raw_writel(val, gpmc_base + idx);
>  }
>  
> -static u32 gpmc_read_reg(int idx)
> +u32 gpmc_read_reg(int idx)
>  {
>  	return __raw_readl(gpmc_base + idx);
>  }
>  
> +void gpmc_cs_write_byte(int cs, int idx, u32 val)
> +{
> +	void __iomem *reg_addr;
> +
> +	reg_addr = gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) + idx;
> +	__raw_writeb(val, reg_addr);
> +}
> +
> +u8 gpmc_cs_read_byte(int cs, int idx)
> +{
> +	void __iomem *reg_addr;
> +
> +	reg_addr = gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) + idx;
> +	return __raw_readb(reg_addr);
> +}
> +

This will not improve the situation unfortunately.
We for sure don't want to export functions to mess
with the GPMC registers all over the place.

> @@ -432,15 +448,6 @@ void gpmc_prefetch_reset(void)
>  }
>  EXPORT_SYMBOL(gpmc_prefetch_reset);
>  
> -/**
> - * gpmc_prefetch_status - reads prefetch status of engine
> - */
> -int  gpmc_prefetch_status(void)
> -{
> -	return gpmc_read_reg(GPMC_PREFETCH_STATUS);
> -}
> -EXPORT_SYMBOL(gpmc_prefetch_status);
> -

And we don't want to remove GPMC functions like this,
instead we need to implement more functions like this
for the platform init code to use.

Regards,

Tony
