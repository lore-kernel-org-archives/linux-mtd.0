Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCaY4-0003Uj-FM
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 15:42:08 +0000
Date: Thu, 13 May 2010 08:41:59 -0700
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH 1/3] omap3: GPMC register definition at common location
Message-ID: <20100513154158.GJ29368@atomide.com>
References: <s-ghorai@ti.com>
	<1273657718-12517-1-git-send-email-s-ghorai@ti.com>
	<1273657718-12517-2-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273657718-12517-2-git-send-email-s-ghorai@ti.com>
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
> --- a/arch/arm/plat-omap/include/plat/gpmc.h
> +++ b/arch/arm/plat-omap/include/plat/gpmc.h
> @@ -25,10 +25,40 @@
>  #define GPMC_CS_NAND_ADDRESS	0x20
>  #define GPMC_CS_NAND_DATA	0x24
>  
> -#define GPMC_CONFIG		0x50
> -#define GPMC_STATUS		0x54
> +/* GPMC register offsets */
> +#define GPMC_REVISION           0x00
> +#define GPMC_SYSCONFIG          0x10
> +#define GPMC_SYSSTATUS          0x14
> +#define GPMC_IRQSTATUS          0x18
> +#define GPMC_IRQENABLE          0x1c
> +#define GPMC_TIMEOUT_CONTROL    0x40
> +#define GPMC_ERR_ADDRESS        0x44
> +#define GPMC_ERR_TYPE           0x48
> +#define GPMC_CONFIG             0x50
> +#define GPMC_STATUS             0x54
> +#define GPMC_PREFETCH_CONFIG1   0x1e0
> +#define GPMC_PREFETCH_CONFIG2   0x1e4
> +#define GPMC_PREFETCH_CONTROL   0x1ec
> +#define GPMC_PREFETCH_STATUS    0x1f0
> +#define GPMC_ECC_CONFIG         0x1f4
> +#define GPMC_ECC_CONTROL        0x1f8
> +#define GPMC_ECC_SIZE_CONFIG    0x1fc
> +#define GPMC_ECC1_RESULT        0x200
...

No thanks, that will just make the situation worse
leading into all the drivers messing with the GPMC
registers.

Tony
