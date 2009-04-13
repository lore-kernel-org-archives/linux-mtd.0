Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtJW8-0000r9-GT
	for linux-mtd@lists.infradead.org; Mon, 13 Apr 2009 10:36:03 +0000
Date: Mon, 13 Apr 2009 12:05:18 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd@lists.infradead.org, andrea.gallo@stericsson.com,
	STEricsson_nomadik_linux@list.st.com
Subject: Re: [PATCH V2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090413100518.GJ31923@game.jcrosoft.org>
References: <20090312135604.GA673@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090312135604.GA673@mail.gnudd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14:56 Thu 12 Mar     , Alessandro Rubini wrote:
> From: Alessandro Rubini <rubini@unipv.it>
> 
> The patch is incremental over base Nomadik support
> as posted to linux-arm-kernel.
> ---
> 
> V2: rebased over cleaned-up base nomadik support.
> 
> The new nomadik patch is available in full from
> 
>   http://gnudd.com/pub/patches/nomadik/
>          Add-basic-support-for-ST-Nomadik-8815-SoC-V2.patch
> 
> The version posted to linux-arm-kernel misses the
> default configuration file for size reasons.
> 
>  arch/arm/configs/nhk15_defconfig              |    1 +
>  arch/arm/mach-nomadik/board-8815nhk.c         |   93 +++++++-
>  arch/arm/mach-nomadik/include/mach/fsmc.h     |   36 +++
>  arch/arm/mach-nomadik/include/mach/hardware.h |    5 +-
>  arch/arm/mach-nomadik/include/mach/nand.h     |   16 ++
>  drivers/mtd/nand/Kconfig                      |    6 +
>  drivers/mtd/nand/Makefile                     |    1 +
>  drivers/mtd/nand/nomadik_nand.c               |  329 +++++++++++++++++++++++++
>  8 files changed, 484 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
>  create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
>  create mode 100644 drivers/mtd/nand/nomadik_nand.c
> 
> diff --git a/arch/arm/configs/nhk15_defconfig b/arch/arm/configs/nhk15_defconfig
> index cf11d79..1697efe 100644
> --- a/arch/arm/configs/nhk15_defconfig
> +++ b/arch/arm/configs/nhk15_defconfig
> @@ -476,6 +476,7 @@ CONFIG_MTD_NAND_IDS=y
>  # CONFIG_MTD_NAND_DISKONCHIP is not set
>  # CONFIG_MTD_NAND_NANDSIM is not set
>  # CONFIG_MTD_NAND_PLATFORM is not set
> +CONFIG_MTD_NAND_NOMADIK=y
>  # CONFIG_MTD_ONENAND is not set
>  
>  #
> diff --git a/arch/arm/mach-nomadik/board-8815nhk.c b/arch/arm/mach-nomadik/board-8815nhk.c
> index 5dda007..1e5b332 100644
> --- a/arch/arm/mach-nomadik/board-8815nhk.c
> +++ b/arch/arm/mach-nomadik/board-8815nhk.c
> @@ -19,15 +19,106 @@
>  #include <linux/io.h>
>  #include <linux/param.h>
>  #include <asm/setup.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <asm/sizes.h>
>  #include <asm/mach-types.h>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/irq.h>
>  
>  #include <mach/hardware.h>
>  #include <mach/setup.h>
> +#include <mach/nand.h>
> +#include <mach/fsmc.h>
> +
> +/* These adresses span 16MB, so use three individual pages */
> +static struct resource nhk8815_nand_resources[] = {
> +	{
> +		.name = "nand_addr",
> +		.start = NAND_IO_ADDR,
> +		.end = NAND_IO_ADDR + 0xfff,
> +		.flags = IORESOURCE_MEM,
> +	}, {
> +		.name = "nand_cmd",
> +		.start = NAND_IO_CMD,
> +		.end = NAND_IO_CMD + 0xfff,
> +		.flags = IORESOURCE_MEM,
> +	}, {
> +		.name = "nand_data",
> +		.start = NAND_IO_DATA,
> +		.end = NAND_IO_DATA + 0xfff,
> +		.flags = IORESOURCE_MEM,
> +	}
> +};
> +
> +static int nhk8815_nand_init(void)
> +{
> +	/* FSMC setup for nand chip select (8-bit nand in 8815NHK) */
> +	writel(0x0000000E, FSMC_PCR0);
> +	writel(0x000D0A00, FSMC_PMEM0);
> +	writel(0x00100A00, FSMC_PATT0);
> +
> +	/* enable access to the chip select area */
> +	writel(readl(FSMC_PCR0) | 0x04, FSMC_PCR0);
> +
> +	return 0;
> +}
> +
> +static struct mtd_partition nhk8815_partitions[] = {
> +	{
> +		.name	= "X-Loader(NAND)",
> +		.offset = 0,
> +		.size	= SZ_256K,
> +	}, {
> +		.name	= "MemInit(NAND)",
> +		.offset	= MTDPART_OFS_APPEND,
> +		.size	= SZ_256K,
MemInit?
why do you need this?
> +	}, {
> +		.name	= "BootLoader(NAND)",
> +		.offset	= MTDPART_OFS_APPEND,
> +		.size	= SZ_2M,
> +	}, {
2M for U-Boot? it's quite big
> +		.name	= "Kernel zImage(NAND)",
> +		.offset	= MTDPART_OFS_APPEND,
> +		.size	= 3 * SZ_1M,
> +	}, {
> +		.name	= "Root Filesystem(NAND)",
> +		.offset	= MTDPART_OFS_APPEND,
> +		.size	= 22* SZ_1M,
> +	}, {
> +		/* This can't be SIZ_FULL as we have the u-boot env */
> +		.name	= "User Filesystem(NAND)",
> +		.offset	= MTDPART_OFS_APPEND,
> +		.size	= 100 * SZ_1M,
> +	}, {
> +		.name	= "U-Boot Environment",
> +		.offset	= 0x8000000 - SZ_128K,
> +		.size	= SZ_128K,
> +	}
> +};
> +
> +static struct nomadik_nand_platform_data nhk8815_nand_data = {
> +	.parts		= nhk8815_partitions,
> +	.nparts		= ARRAY_SIZE(nhk8815_partitions),
> +	.options	= NAND_COPYBACK | NAND_CACHEPRG | NAND_NO_PADDING \
> +			| NAND_NO_READRDY | NAND_NO_AUTOINCR,
> +	.init		= nhk8815_nand_init,
> +};
> +
> +static struct platform_device nhk8815_nand_device = {
> +	.name		= "nomadik_nand",
> +	.dev		= {
> +				.platform_data = &nhk8815_nand_data,
> +	},
> +	.resource	= nhk8815_nand_resources,
> +	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
> +};
> +
>  
>  static struct platform_device *nhk8815_platform_devices[] __initdata = {
> -	/* currently empty, will add keypad, touchscreen etc */
> +	&nhk8815_nand_device,
> +	/* will add keypad, touchscreen etc */
>  };
it will be better to create a devices file as done for at91 to simplify board
addung
>  
>  static void __init nhk8815_map_io(void)
> diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-nomadik/include/mach/fsmc.h
> new file mode 100644
> index 0000000..f81621c
> --- /dev/null
> +++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
> @@ -0,0 +1,36 @@
> +
> +/* Definitions for the Nomadik FSMC "Flexible Static Memory controller" */
> +
> +#ifndef __ASM_ARCH_FSMC_H
> +#define __ASM_ARCH_FSMC_H
> +
> +#include <mach/hardware.h>
> +/*
> + * Register list
> + */
> +
> +/* control and timing registers for CS0..CS3 */
> +#define FSMC_BCR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x00))
> +#define FSMC_BTR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x04))
> +#define FSMC_BCR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x08))
> +#define FSMC_BTR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x0c))
> +#define FSMC_BCR2	((void __iomem *)(NOMADIK_FSMC_VA + 0x10))
> +#define FSMC_BTR2	((void __iomem *)(NOMADIK_FSMC_VA + 0x14))
> +#define FSMC_BCR3	((void __iomem *)(NOMADIK_FSMC_VA + 0x18))
> +#define FSMC_BTR3	((void __iomem *)(NOMADIK_FSMC_VA + 0x1c))
why not this

/* control and timing registers for CS0..CS3 */
#define FSMC_BCR(x)	(NOMADIK_FSMC_VA + (x << 3))
#define FSMC_BTR(x)	(NOMADIK_FSMC_VA + (x << 3) + 0x04)

#define FSMC_PCR(x)	(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x00)
#define FSMC_PMEM(x)	(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x08)
#define FSMC_PATT(x)	(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x0c)
#define FSMC_PIO(x)	(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x10)
#define FSMC_PECCR(x)	(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x14)

I think void __iomem * is not needed
otherwise you will not be allow to use is in ASM as example

by the a description of each register will be nice
> +
> +
> +#endif /* __ASM_ARCH_FSMC_H */
> diff --git a/arch/arm/mach-nomadik/include/mach/hardware.h b/arch/arm/mach-nomadik/include/mach/hardware.h
> index 8cdee9b..05ea93b 100644
> --- a/arch/arm/mach-nomadik/include/mach/hardware.h
> +++ b/arch/arm/mach-nomadik/include/mach/hardware.h
> @@ -82,7 +82,8 @@
>  #define NOMADIK_HAMACA_DMEM	0xA0200000	/* HAMACA Data Memory Space */
>  
>  
> -#define NOMADIK_MTU0_VA (IO_ADDRESS(NOMADIK_MTU0_BASE))
> -#define NOMADIK_MTU1_VA (IO_ADDRESS(NOMADIK_MTU1_BASE))
> +#define NOMADIK_FSMC_VA		IO_ADDRESS(NOMADIK_FSMC_BASE)
> +#define NOMADIK_MTU0_VA		IO_ADDRESS(NOMADIK_MTU0_BASE)
> +#define NOMADIK_MTU1_VA		IO_ADDRESS(NOMADIK_MTU1_BASE)
NOMADIK_MTU_VA(x) will be better
>  
>  #endif /* __ASM_ARCH_HARDWARE_H */
> diff --git a/arch/arm/mach-nomadik/include/mach/nand.h b/arch/arm/mach-nomadik/include/mach/nand.h
> new file mode 100644
> index 0000000..c3c8254
> --- /dev/null
> +++ b/arch/arm/mach-nomadik/include/mach/nand.h
> @@ -0,0 +1,16 @@
> +#ifndef __ASM_ARCH_NAND_H
> +#define __ASM_ARCH_NAND_H
> +
> +struct nomadik_nand_platform_data {
> +	struct mtd_partition *parts;
> +	int nparts;
> +	int options;
> +	int (*init) (void);
> +	int (*exit) (void);
> +};
> +
> +#define NAND_IO_DATA	0x40000000
> +#define NAND_IO_CMD	0x40800000
> +#define NAND_IO_ADDR	0x41000000
> +
> +#endif				/* __ASM_ARCH_NAND_H */
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 8b12e6e..41b4fc7 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -420,6 +420,12 @@ config MTD_NAND_MXC
>  	  This enables the driver for the NAND flash controller on the
>  	  MXC processors.
>  
> +config MTD_NAND_NOMADIK
> +	tristate "ST Nomadik 8815 NAND support"
> +	depends on ARCH_NOMADIK
> +	help
> +	  Driver for the NAND flash controller on the Nomadik, with ECC.
> +
>  config MTD_NAND_SH_FLCTL
>  	tristate "Support for NAND on Renesas SuperH FLCTL"
>  	depends on MTD_NAND && SUPERH && CPU_SUBTYPE_SH7723
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index b661586..06acb94 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -36,5 +36,6 @@ obj-$(CONFIG_MTD_NAND_FSL_ELBC)		+= fsl_elbc_nand.o
>  obj-$(CONFIG_MTD_NAND_FSL_UPM)		+= fsl_upm.o
>  obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
>  obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
> +obj-$(CONFIG_MTD_NAND_NOMADIK)		+= nomadik_nand.o
>  
>  nand-objs := nand_base.o nand_bbt.o
> diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
> new file mode 100644
> index 0000000..bbd1925
> --- /dev/null
> +++ b/drivers/mtd/nand/nomadik_nand.c
> @@ -0,0 +1,329 @@
> +/*
> + *  drivers/mtd/nand/nomadik_nand.c
> + *
> + *  Overview:
> + *  	Driver for on-board NAND flash on Nomadik Platforms
> + *
> + * Copyright (C) 2007 STMicroelectronics Pvt. Ltd.
> + * Author: Sachin Verma <sachin.verma@st.com>
> + *
> + * Copyright (C) 2009 Alessandro Rubini
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <mach/nand.h>
> +#include <mach/fsmc.h>
> +
> +#include <mtd/mtd-abi.h>
> +
> +struct nomadik_nand_host {
> +	struct mtd_info		mtd;
> +	struct nand_chip	nand;
> +	void __iomem *data_va;
> +	void __iomem *cmd_va;
> +	void __iomem *addr_va;
> +	struct nand_bbt_descr *bbt_desc;
> +};
> +
> +static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 */
> +{
> +	b = b ^ (b >> 4);
> +	b = b ^ (b >> 2);
> +	return (b ^ (b >> 1)) & 1
> +		? ~0 : 0;
> +}
in U-Boot you chose to use the asembly implementation it will we nice if you
can keep it sync

Best Regards,
J.
