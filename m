Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MVufF-00067n-Hj
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 21:56:55 +0000
Date: Tue, 28 Jul 2009 22:56:32 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Alessandro Rubini <ru@gnudd.com>
Subject: Re: [PATCH V6] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090728215632.GC3279@n2100.arm.linux.org.uk>
References: <20090728095928.GA26063@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090728095928.GA26063@mail.gnudd.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just some trivial comments, which I leave you to decide what to do with.

Either way...

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

On Tue, Jul 28, 2009 at 11:59:28AM +0200, Alessandro Rubini wrote:
>         andrea.gallo@stericsson.com
> From: Alessandro Rubini <rubini-list@gnudd.com>
> Sender: rubini-list@gnudd.com
> Cc: andrea.gallo@stericsson.com
> Cc: STEricsson_nomadik_linux@list.st.com
> Cc: linux@arm.linux.org.uk,vimal.newwork@gmail.com

Not sure what the above is, but it doesn't look like it should be part
of this patch.

> diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadik/board-nhk8815.c
> index 79bdea9..3fde972 100644
> --- a/arch/arm/mach-nomadik/board-nhk8815.c
> +++ b/arch/arm/mach-nomadik/board-nhk8815.c
> @@ -16,12 +16,103 @@
>  #include <linux/amba/bus.h>
>  #include <linux/interrupt.h>
>  #include <linux/gpio.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <asm/sizes.h>
> +#include <asm/io.h>

My mailer's setup to show asm/io.h includes in red, so it's something
I'm hot on.  This should be linux/io.h

> +static struct platform_device nhk8815_nand_device = {
> +	.name		= "nomadik_nand",
> +	.dev		= {
> +				.platform_data = &nhk8815_nand_data,

Not sure why this is tabbed so far over.  Just two tabs seems sane.

> +	},
> +	.resource	= nhk8815_nand_resources,
> +	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
> +};
> +
> +
>  #define __MEM_4K_RESOURCE(x) \
>  	.res = {.start = (x), .end = (x) + SZ_4K - 1, .flags = IORESOURCE_MEM}
>  
> @@ -81,6 +172,7 @@ static int __init nhk8815_eth_init(void)
>  device_initcall(nhk8815_eth_init);
>  
>  static struct platform_device *nhk8815_platform_devices[] __initdata = {
> +	&nhk8815_nand_device,
>  	&nhk8815_eth_device,
>  	/* will add more devices */
>  };
> diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-nomadik/include/mach/fsmc.h
> new file mode 100644
> index 0000000..8c2c051
> --- /dev/null
> +++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
> @@ -0,0 +1,29 @@
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
> +/* bus control reg. and bus timing reg. for CS0..CS3 */
> +#define FSMC_BCR(x)     (NOMADIK_FSMC_VA + (x << 3))
> +#define FSMC_BTR(x)     (NOMADIK_FSMC_VA + (x << 3) + 0x04)
> +
> +/* PC-card and NAND:
> + * PCR = control register
> + * PMEM = memory timing
> + * PATT = attribute timing
> + * PIO = I/O timing
> + * PECCR = ECC result
> + */
> +#define FSMC_PCR(x)     (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x00)
> +#define FSMC_PMEM(x)    (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x08)
> +#define FSMC_PATT(x)    (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x0c)
> +#define FSMC_PIO(x)     (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x10)
> +#define FSMC_PECCR(x)   (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x14)
> +
> +#endif /* __ASM_ARCH_FSMC_H */
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

What's 'options' - it doesn't seem to be used by the driver, other than
taking a copy.
