Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWNzN-0005vT-Ku
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 05:15:41 +0000
Received: by qyk11 with SMTP id 11so669264qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jul 2009 22:15:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090729165156.GA1471@mail.gnudd.com>
References: <20090729165156.GA1471@mail.gnudd.com>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 10:45:16 +0530
Message-ID: <ce9ab5790907292215s1e097dfeg35393441a665730d@mail.gmail.com>
Subject: Re: [PATCH V7] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
To: Alessandro Rubini <rubini-list@gnudd.com>, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux@arm.linux.org.uk, vimal.newwork@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Vimal Singh <vimalsingh@ti.com>

-vimal

On Wed, Jul 29, 2009 at 10:21 PM, Alessandro
Rubini<rubini-list@gnudd.com> wrote:
> From: Alessandro Rubini <rubini@unipv.it>
>
>
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>
> The patch applies to rmk's devel tree.
>
> Changes in V7:
> =A0 =A0 =A0 =A0- removed unused static function
> =A0 =A0 =A0 =A0- use linux/io.h not asm/io.h
> =A0 =A0 =A0 =A0- untabbed a too-tabbed lined
> =A0 =A0 =A0 =A0- remove wrong headers in commit message (I made a mess)
>
> changes in V6:
> =A0 =A0 =A0 =A0- blindly applied checkpatch suggestions (even if I disagr=
ee)
> =A0 =A0 =A0 =A0- switched to pm_ops
> =A0 =A0 =A0 =A0- declare soft ecc instead of hard
>
> The last point makes the driver non-working unless the patch by Vimal Sin=
gh
> at http://patchwork.ozlabs.org/patch/13697/ is applied.
>
>
> =A0arch/arm/configs/nhk8815_defconfig =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-nomadik/board-nhk8815.c =A0 =A0 | =A0 92 +++++++++++
> =A0arch/arm/mach-nomadik/include/mach/fsmc.h | =A0 29 ++++
> =A0arch/arm/mach-nomadik/include/mach/nand.h | =A0 16 ++
> =A0drivers/mtd/nand/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06=
 +
> =A0drivers/mtd/nand/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/mtd/nand/nomadik_nand.c =A0 =A0 =A0 =A0 =A0 | =A0250 +++++++++=
++++++++++++++++++++
> =A07 files changed, 395 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
> =A0create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
> =A0create mode 100644 drivers/mtd/nand/nomadik_nand.c
>
> diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk881=
5_defconfig
> index 9bb45b9..600cb27 100644
> --- a/arch/arm/configs/nhk8815_defconfig
> +++ b/arch/arm/configs/nhk8815_defconfig
> @@ -498,7 +498,7 @@ CONFIG_MTD_CFI_I2=3Dy
> =A0# CONFIG_MTD_DOC2001PLUS is not set
> =A0CONFIG_MTD_NAND=3Dy
> =A0CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> -# CONFIG_MTD_NAND_ECC_SMC is not set
> +CONFIG_MTD_NAND_ECC_SMC=3Dy
> =A0# CONFIG_MTD_NAND_MUSEUM_IDS is not set
> =A0# CONFIG_MTD_NAND_GPIO is not set
> =A0CONFIG_MTD_NAND_IDS=3Dy
> diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadi=
k/board-nhk8815.c
> index 79bdea9..0924b19 100644
> --- a/arch/arm/mach-nomadik/board-nhk8815.c
> +++ b/arch/arm/mach-nomadik/board-nhk8815.c
> @@ -16,12 +16,103 @@
> =A0#include <linux/amba/bus.h>
> =A0#include <linux/interrupt.h>
> =A0#include <linux/gpio.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <asm/sizes.h>
> =A0#include <asm/mach-types.h>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/irq.h>
> =A0#include <mach/setup.h>
> +#include <mach/nand.h>
> +#include <mach/fsmc.h>
> =A0#include "clock.h"
>
> +/* These adresses span 16MB, so use three individual pages */
> +static struct resource nhk8815_nand_resources[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "nand_addr",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D NAND_IO_ADDR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D NAND_IO_ADDR + 0xfff,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "nand_cmd",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D NAND_IO_CMD,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D NAND_IO_CMD + 0xfff,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "nand_data",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D NAND_IO_DATA,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D NAND_IO_DATA + 0xfff,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 }
> +};
> +
> +static int nhk8815_nand_init(void)
> +{
> + =A0 =A0 =A0 /* FSMC setup for nand chip select (8-bit nand in 8815NHK) =
*/
> + =A0 =A0 =A0 writel(0x0000000E, FSMC_PCR(0));
> + =A0 =A0 =A0 writel(0x000D0A00, FSMC_PMEM(0));
> + =A0 =A0 =A0 writel(0x00100A00, FSMC_PATT(0));
> +
> + =A0 =A0 =A0 /* enable access to the chip select area */
> + =A0 =A0 =A0 writel(readl(FSMC_PCR(0)) | 0x04, FSMC_PCR(0));
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/*
> + * These partitions are the same as those used in the 2.6.20 release
> + * shipped by the vendor; the first two partitions are mandated
> + * by the boot ROM, and the bootloader area is somehow oversized...
> + */
> +static struct mtd_partition nhk8815_partitions[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "X-Loader(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D SZ_256K,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "MemInit(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D MTDPART_OFS_APPEND,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D SZ_256K,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "BootLoader(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D MTDPART_OFS_APPEND,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D SZ_2M,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "Kernel zImage(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D MTDPART_OFS_APPEND,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D 3 * SZ_1M,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "Root Filesystem(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D MTDPART_OFS_APPEND,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D 22 * SZ_1M,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "User Filesystem(NAND)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =3D MTDPART_OFS_APPEND,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =3D MTDPART_SIZ_FULL,
> + =A0 =A0 =A0 }
> +};
> +
> +static struct nomadik_nand_platform_data nhk8815_nand_data =3D {
> + =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D nhk8815_partitions,
> + =A0 =A0 =A0 .nparts =A0 =A0 =A0 =A0 =3D ARRAY_SIZE(nhk8815_partitions),
> + =A0 =A0 =A0 .options =A0 =A0 =A0 =A0=3D NAND_COPYBACK | NAND_CACHEPRG |=
 NAND_NO_PADDING \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NAND_NO_READRDY | NAND_NO=
_AUTOINCR,
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D nhk8815_nand_init,
> +};
> +
> +static struct platform_device nhk8815_nand_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "nomadik_nand",
> + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &nhk8815_nand_data,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D nhk8815_nand_resources,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(nhk8815_nand_resources),
> +};
> +
> +
> =A0#define __MEM_4K_RESOURCE(x) \
> =A0 =A0 =A0 =A0.res =3D {.start =3D (x), .end =3D (x) + SZ_4K - 1, .flags=
 =3D IORESOURCE_MEM}
>
> @@ -81,6 +172,7 @@ static int __init nhk8815_eth_init(void)
> =A0device_initcall(nhk8815_eth_init);
>
> =A0static struct platform_device *nhk8815_platform_devices[] __initdata =
=3D {
> + =A0 =A0 =A0 &nhk8815_nand_device,
> =A0 =A0 =A0 =A0&nhk8815_eth_device,
> =A0 =A0 =A0 =A0/* will add more devices */
> =A0};
> diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-no=
madik/include/mach/fsmc.h
> new file mode 100644
> index 0000000..8c2c051
> --- /dev/null
> +++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
> @@ -0,0 +1,29 @@
> +
> +/* Definitions for the Nomadik FSMC "Flexible Static Memory controller" =
*/
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
> +#define FSMC_BCR(x) =A0 =A0 (NOMADIK_FSMC_VA + (x << 3))
> +#define FSMC_BTR(x) =A0 =A0 (NOMADIK_FSMC_VA + (x << 3) + 0x04)
> +
> +/* PC-card and NAND:
> + * PCR =3D control register
> + * PMEM =3D memory timing
> + * PATT =3D attribute timing
> + * PIO =3D I/O timing
> + * PECCR =3D ECC result
> + */
> +#define FSMC_PCR(x) =A0 =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x00)
> +#define FSMC_PMEM(x) =A0 =A0(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x08)
> +#define FSMC_PATT(x) =A0 =A0(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x0c)
> +#define FSMC_PIO(x) =A0 =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x10)
> +#define FSMC_PECCR(x) =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x14)
> +
> +#endif /* __ASM_ARCH_FSMC_H */
> diff --git a/arch/arm/mach-nomadik/include/mach/nand.h b/arch/arm/mach-no=
madik/include/mach/nand.h
> new file mode 100644
> index 0000000..c3c8254
> --- /dev/null
> +++ b/arch/arm/mach-nomadik/include/mach/nand.h
> @@ -0,0 +1,16 @@
> +#ifndef __ASM_ARCH_NAND_H
> +#define __ASM_ARCH_NAND_H
> +
> +struct nomadik_nand_platform_data {
> + =A0 =A0 =A0 struct mtd_partition *parts;
> + =A0 =A0 =A0 int nparts;
> + =A0 =A0 =A0 int options;
> + =A0 =A0 =A0 int (*init) (void);
> + =A0 =A0 =A0 int (*exit) (void);
> +};
> +
> +#define NAND_IO_DATA =A0 0x40000000
> +#define NAND_IO_CMD =A0 =A00x40800000
> +#define NAND_IO_ADDR =A0 0x41000000
> +
> +#endif =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* __ASM_ARCH_NAN=
D_H */
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index ce96c09..b9fa465 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -426,6 +426,12 @@ config MTD_NAND_MXC
> =A0 =A0 =A0 =A0 =A0This enables the driver for the NAND flash controller =
on the
> =A0 =A0 =A0 =A0 =A0MXC processors.
>
> +config MTD_NAND_NOMADIK
> + =A0 =A0 =A0 tristate "ST Nomadik 8815 NAND support"
> + =A0 =A0 =A0 depends on ARCH_NOMADIK
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Driver for the NAND flash controller on the Nomadik, wi=
th ECC.
> +
> =A0config MTD_NAND_SH_FLCTL
> =A0 =A0 =A0 =A0tristate "Support for NAND on Renesas SuperH FLCTL"
> =A0 =A0 =A0 =A0depends on MTD_NAND && SUPERH && CPU_SUBTYPE_SH7723
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f3a786b..0fe9a0c 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 +=3D sh_flctl.o
> =A0obj-$(CONFIG_MTD_NAND_MXC) =A0 =A0 =A0 =A0 =A0 =A0 +=3D mxc_nand.o
> =A0obj-$(CONFIG_MTD_NAND_SOCRATES) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D so=
crates_nand.o
> =A0obj-$(CONFIG_MTD_NAND_TXX9NDFMC) =A0 =A0 =A0 +=3D txx9ndfmc.o
> +obj-$(CONFIG_MTD_NAND_NOMADIK) =A0 =A0 =A0 =A0 +=3D nomadik_nand.o
>
> =A0nand-objs :=3D nand_base.o nand_bbt.o
> diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_n=
and.c
> new file mode 100644
> index 0000000..1946f6c
> --- /dev/null
> +++ b/drivers/mtd/nand/nomadik_nand.c
> @@ -0,0 +1,250 @@
> +/*
> + * =A0drivers/mtd/nand/nomadik_nand.c
> + *
> + * =A0Overview:
> + * =A0 =A0 Driver for on-board NAND flash on Nomadik Platforms
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
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <mach/nand.h>
> +#include <mach/fsmc.h>
> +
> +#include <mtd/mtd-abi.h>
> +
> +struct nomadik_nand_host {
> + =A0 =A0 =A0 struct mtd_info =A0 =A0 =A0 =A0 mtd;
> + =A0 =A0 =A0 struct nand_chip =A0 =A0 =A0 =A0nand;
> + =A0 =A0 =A0 void __iomem *data_va;
> + =A0 =A0 =A0 void __iomem *cmd_va;
> + =A0 =A0 =A0 void __iomem *addr_va;
> + =A0 =A0 =A0 struct nand_bbt_descr *bbt_desc;
> +};
> +
> +static struct nand_ecclayout nomadik_ecc_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 3 * 4,
> + =A0 =A0 =A0 .eccpos =3D { /* each subpage has 16 bytes: pos 2,3,4 hosts=
 ECC */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x02, 0x03, 0x04,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12, 0x13, 0x14,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x23, 0x24,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x32, 0x33, 0x34},
> + =A0 =A0 =A0 /* let's keep bytes 5,6,7 for us, just in case we change EC=
C algo */
> + =A0 =A0 =A0 .oobfree =3D { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0x08}, {0=
x38, 0x08} },
> +};
> +
> +static void nomadik_ecc_control(struct mtd_info *mtd, int mode)
> +{
> + =A0 =A0 =A0 /* No need to enable hw ecc, it's on by default */
> +}
> +
> +static void nomadik_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int=
 ctrl)
> +{
> + =A0 =A0 =A0 struct nand_chip *nand =3D mtd->priv;
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D nand->priv;
> +
> + =A0 =A0 =A0 if (cmd =3D=3D NAND_CMD_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 if (ctrl & NAND_CLE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->cmd_va);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->addr_va);
> +}
> +
> +static int nomadik_nand_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> + =A0 =A0 =A0 struct nomadik_nand_host *host;
> + =A0 =A0 =A0 struct mtd_info *mtd;
> + =A0 =A0 =A0 struct nand_chip *nand;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 /* Allocate memory for the device structure (and zero it) *=
/
> + =A0 =A0 =A0 host =3D kzalloc(sizeof(struct nomadik_nand_host), GFP_KERN=
EL);
> + =A0 =A0 =A0 if (!host) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to allocate dev=
ice structure.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Call the client's init function, if any */
> + =A0 =A0 =A0 if (pdata->init)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pdata->init();
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Init function failed\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* ioremap three regions */
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_addr");
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 host->addr_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_data");
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 host->data_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_cmd");
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 host->cmd_va =3D ioremap(res->start, res->end - res->start =
+ 1);
> +
> + =A0 =A0 =A0 if (!host->addr_va || !host->data_va || !host->cmd_va) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Link all private pointers */
> + =A0 =A0 =A0 mtd =3D &host->mtd;
> + =A0 =A0 =A0 nand =3D &host->nand;
> + =A0 =A0 =A0 mtd->priv =3D nand;
> + =A0 =A0 =A0 nand->priv =3D host;
> +
> + =A0 =A0 =A0 host->mtd.owner =3D THIS_MODULE;
> + =A0 =A0 =A0 nand->IO_ADDR_R =3D host->data_va;
> + =A0 =A0 =A0 nand->IO_ADDR_W =3D host->data_va;
> + =A0 =A0 =A0 nand->cmd_ctrl =3D nomadik_cmd_ctrl;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* This stanza declares ECC_HW but uses soft routines. It=
's because
> + =A0 =A0 =A0 =A0* HW claims to make the calculation but not the correcti=
on. However,
> + =A0 =A0 =A0 =A0* I haven't managed to get the desired data out of it un=
til now.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 nand->ecc.mode =3D NAND_ECC_SOFT;
> + =A0 =A0 =A0 nand->ecc.layout =3D &nomadik_ecc_layout;
> + =A0 =A0 =A0 nand->ecc.hwctl =3D nomadik_ecc_control;
> + =A0 =A0 =A0 nand->ecc.size =3D 512;
> + =A0 =A0 =A0 nand->ecc.bytes =3D 3;
> +
> + =A0 =A0 =A0 nand->options =3D pdata->options;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Scan to find existance of the device
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (nand_scan(&host->mtd, 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> + =A0 =A0 =A0 add_mtd_partitions(&host->mtd, pdata->parts, pdata->nparts)=
;
> +#else
> + =A0 =A0 =A0 pr_info("Registering %s as whole device\n", mtd->name);
> + =A0 =A0 =A0 add_mtd_device(mtd);
> +#endif
> +
> + =A0 =A0 =A0 platform_set_drvdata(pdev, host);
> + =A0 =A0 =A0 return 0;
> +
> + err_unmap:
> + =A0 =A0 =A0 if (host->cmd_va)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->cmd_va);
> + =A0 =A0 =A0 if (host->data_va)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->data_va);
> + =A0 =A0 =A0 if (host->addr_va)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->addr_va);
> + err:
> + =A0 =A0 =A0 kfree(host);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/*
> + * Clean up routine
> + */
> +static int nomadik_nand_remove(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D platform_get_drvdata(pde=
v);
> + =A0 =A0 =A0 struct nomadik_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> +
> + =A0 =A0 =A0 if (pdata->exit)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->exit();
> +
> + =A0 =A0 =A0 if (host) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->cmd_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->data_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->addr_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(host);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int nomadik_nand_suspend(struct device *dev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D dev_get_drvdata(dev);
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 if (host)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D host->mtd.suspend(&host->mtd);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int nomadik_nand_resume(struct device *dev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D dev_get_drvdata(dev);
> + =A0 =A0 =A0 if (host)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->mtd.resume(&host->mtd);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct dev_pm_ops nomadik_nand_pm_ops =3D {
> + =A0 =A0 =A0 .suspend =3D nomadik_nand_suspend,
> + =A0 =A0 =A0 .resume =3D nomadik_nand_resume,
> +};
> +
> +static struct platform_driver nomadik_nand_driver =3D {
> + =A0 =A0 =A0 .probe =3D nomadik_nand_probe,
> + =A0 =A0 =A0 .remove =3D nomadik_nand_remove,
> + =A0 =A0 =A0 .driver =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "nomadik_nand",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =3D &nomadik_nand_pm_ops,
> + =A0 =A0 =A0 },
> +};
> +
> +static int __init nand_nomadik_init(void)
> +{
> + =A0 =A0 =A0 pr_info("Nomadik NAND driver\n");
> + =A0 =A0 =A0 return platform_driver_register(&nomadik_nand_driver);
> +}
> +
> +static void __exit nand_nomadik_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&nomadik_nand_driver);
> +}
> +
> +module_init(nand_nomadik_init);
> +module_exit(nand_nomadik_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("ST Microelectronics (sachin.verma@st.com)");
> +MODULE_DESCRIPTION("NAND driver for Nomadik Platform");
> --
> 1.6.0.2
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
