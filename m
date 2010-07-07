Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWRl4-0002zM-Of
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 10:21:39 +0000
Date: Wed, 7 Jul 2010 13:21:32 +0300
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH v5 2/3] omap3 nand: cleanup virtual address usages
Message-ID: <20100707102131.GG1920@atomide.com>
References: <s-ghorai@ti.com> <1275637205-489-1-git-send-email-s-ghorai@ti.com>
	<1275637205-489-2-git-send-email-s-ghorai@ti.com>
	<1275637205-489-3-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1275637205-489-3-git-send-email-s-ghorai@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [100604 10:34]:
> --- a/arch/arm/plat-omap/include/plat/gpmc.h
> +++ b/arch/arm/plat-omap/include/plat/gpmc.h
> @@ -63,7 +60,6 @@
>  #define GPMC_CONFIG1_DEVICESIZE_16      GPMC_CONFIG1_DEVICESIZE(1)
>  #define GPMC_CONFIG1_DEVICETYPE(val)    ((val & 3) << 10)
>  #define GPMC_CONFIG1_DEVICETYPE_NOR     GPMC_CONFIG1_DEVICETYPE(0)
> -#define GPMC_CONFIG1_DEVICETYPE_NAND    GPMC_CONFIG1_DEVICETYPE(2)
>  #define GPMC_CONFIG1_MUXADDDATA         (1 << 9)
>  #define GPMC_CONFIG1_TIME_PARA_GRAN     (1 << 4)
>  #define GPMC_CONFIG1_FCLK_DIV(val)      (val & 3)

Is this no longer needed?

> --- a/arch/arm/plat-omap/include/plat/nand.h
> +++ b/arch/arm/plat-omap/include/plat/nand.h
> @@ -21,13 +21,11 @@ struct omap_nand_platform_data {
>  	int			(*dev_ready)(struct omap_nand_platform_data *);
>  	int			dma_channel;
>  	unsigned long		phys_base;
> -	void __iomem		*gpmc_cs_baseaddr;
> -	void __iomem		*gpmc_baseaddr;
>  	int			devsize;
>  };

Glad to see these finally going away!

Regards,

Tony 
