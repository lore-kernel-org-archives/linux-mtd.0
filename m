Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKbIr-0005pa-SP
	for linux-mtd@lists.infradead.org; Tue, 15 Dec 2009 17:35:22 +0000
Date: Tue, 15 Dec 2009 09:35:10 -0800
From: Tony Lindgren <tony@atomide.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH] OMAP: NAND: Adding config option to enable/disable HW
	ECC mode
Message-ID: <20091215173510.GH4575@atomide.com>
References: <ce9ab5790912150746t29be1640g817ab883b16860a3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce9ab5790912150746t29be1640g817ab883b16860a3@mail.gmail.com>
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Vimal Singh <vimal.newwork@gmail.com> [091215 07:45]:
> OMAP NAND driver got HW ECC implemented.
> 
> From d5e28c9fdbc6b0a95c1259fac7add207f9c294d7 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Tue, 15 Dec 2009 21:10:54 +0530
> Subject: [PATCH] OMAP: NAND: Adding config option to enable/disable HW ECC mode
> 
> This patch adds config option to select/deselect HW ECC feature
> on OMAP NAND driver. This is a feature provided by OMAP GPMC for
> NAND devices.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  drivers/mtd/nand/Kconfig |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 34598e9..6c4b27c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -97,6 +97,16 @@ config MTD_NAND_OMAP_PREFETCH_DMA
>  	 or in DMA interrupt mode.
>  	 Say y for DMA mode or MPU mode will be used
> 
> +config MTD_NAND_OMAP_HWECC
> +	bool "The Hardware ECC support"
> +	depends on MTD_NAND && MTD_NAND_OMAP2
> +	default n
> +	help
> +	 The ECC compuatation for the data to be written/read can be either by
> +	 software or omap has Hw ecc engine which calculates it.
> +	 MTD_NAND_OMAP_HWECC = y which enables the hw ecc
> +	 MTD_NAND_OMAP_HWECC = n enables software ecc
> +
>  config MTD_NAND_TS7250
>  	tristate "NAND Flash device on TS-7250 board"
>  	depends on MACH_TS72XX

This sounds like it should be an option passed from the board-*.c
files as platform_data rather than a Kconfig option.

Tony
