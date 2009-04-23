Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lx65j-0002Wp-1i
	for linux-mtd@lists.infradead.org; Thu, 23 Apr 2009 21:04:25 +0000
Date: Thu, 23 Apr 2009 22:57:03 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/6] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090423205703.GC4071@game.jcrosoft.org>
References: <cover.1240384958.git.rubini@gnudd.com>
	<afa4979bd00ccb47ba28fcbbeec29f07a60c28e5.1240384958.git.rubini@gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afa4979bd00ccb47ba28fcbbeec29f07a60c28e5.1240384958.git.rubini@gnudd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09:41 Wed 22 Apr     , Alessandro Rubini wrote:
> From: Alessandro Rubini <rubini@unipv.it>
> 
> The patch is incremental over base Nomadik support
> as posted to linux-arm-kernel.
> 
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> ---
> 
> This and one-nand are Cc: to the mtd list, the other patches
> have been sent only to linux-arm-kernel.
> 
>  arch/arm/configs/nhk15_defconfig              |    1 +
>  arch/arm/mach-nomadik/board-8815nhk.c         |   98 ++++++++-
>  arch/arm/mach-nomadik/include/mach/fsmc.h     |   29 +++
>  arch/arm/mach-nomadik/include/mach/hardware.h |    5 +-
>  arch/arm/mach-nomadik/include/mach/nand.h     |   16 ++
>  drivers/mtd/nand/Kconfig                      |    6 +
>  drivers/mtd/nand/Makefile                     |    1 +
>  drivers/mtd/nand/nomadik_nand.c               |  329 +++++++++++++++++++++++++
>  8 files changed, 482 insertions(+), 3 deletions(-)
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
> index d6483bf..b7be6c2 100644
> --- a/arch/arm/mach-nomadik/board-8815nhk.c
> +++ b/arch/arm/mach-nomadik/board-8815nhk.c
> @@ -19,12 +19,107 @@
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
use macro to generate these FSMC will make ore readable and easier to update
> +	writel(0x0000000E, FSMC_PCR(0));
> +	writel(0x000D0A00, FSMC_PMEM(0));
> +	writel(0x00100A00, FSMC_PATT(0));
> +
otherwise looks fine

Best Regards,
J.
