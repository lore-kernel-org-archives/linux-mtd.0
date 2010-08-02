Date: Mon, 2 Aug 2010 16:03:07 +0300
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH v3 1/4] omap3: nand: prefetch in irq mode support
Message-ID: <20100802130306.GL12293@atomide.com>
References: <1278996337-25172-1-git-send-email-s-ghorai@ti.com>
	<1278996337-25172-2-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1278996337-25172-2-git-send-email-s-ghorai@ti.com>
Cc: Vimal Singh <vimalsingh@ti.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [100713 07:39]:
> This patch enable prefetch-irq mode for NAND.

<snip>

> --- a/arch/arm/mach-omap2/board-flash.c
> +++ b/arch/arm/mach-omap2/board-flash.c
> @@ -133,6 +133,7 @@ static struct omap_nand_platform_data board_nand_data = {
>  	.nand_setup	= NULL,
>  	.gpmc_t		= &nand_timings,
>  	.dma_channel	= -1,		/* disable DMA in OMAP NAND driver */
> +	.gpmc_irq	= GPMC_IRQ_NUMBER,
>  	.dev_ready	= NULL,
>  	.devsize	= 0,	/* '0' for 8-bit, '1' for 16-bit device */
>  };
> --- a/arch/arm/mach-omap2/include/mach/board-flash.h
> +++ b/arch/arm/mach-omap2/include/mach/board-flash.h
> @@ -19,6 +19,9 @@
>  #define PDC_ONENAND	3
>  #define DBG_MPDB	4
>  
> +/* Interrupt number to the MPU Subsystem for GPMC */
> +#define GPMC_IRQ_NUMBER	20
> +

This does not look right for the IRQ. Please add it to the irqs.h and 34xx,
then set it dynamically during the init just like we handle the other
interrupt numbers.

This is because the irq numbers can change between omaps, like irqs-44xx.h
already has

#define OMAP44XX_IRQ_GPMC                       (20 + OMAP44XX_IRQ_GIC_START)

> @@ -130,6 +141,13 @@ struct omap_nand_info {
>  	unsigned long			phys_base;
>  	struct completion		comp;
>  	int				dma_ch;
> +	int				gpmc_irq;
> +	enum {
> +		NAND_IO_READ = 0,	/* read */
> +		NAND_IO_WRITE,		/* write */
> +	} iomode;
> +	u_char				*buf;
> +	int					buf_len;
>  };

These should probably be OMAP_NAND_IO_READ and OMAP_NAND_IO_WRITE?

Regards,

Tony
