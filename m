Message-ID: <4EE8080F.4090700@freescale.com>
Date: Wed, 14 Dec 2011 10:21:03 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/4] mtd: fix compile error for gpmi-nand
References: <1323791286-29574-1-git-send-email-shawn.guo@linaro.org>
 <1323791286-29574-4-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1323791286-29574-4-git-send-email-shawn.guo@linaro.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Vinod Koul <vinod.koul@intel.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chris Ball <cjb@laptop.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2011=C4=EA12=D4=C213=C8=D5 23:48, Shawn Guo =D0=B4=B5=C0:
> From: Huang Shijie <b32955@freescale.com>
>
> The driver gpmi-nand should compile at least.  This patch adds the
> missing gpmi-nand.h to fix the compile error below.
>
>   CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
>   CC      drivers/mtd/nand/gpmi-nand/gpmi-lib.o
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:25:33: fatal error: linux/mtd/gp=
mi-nand.h: No such file or directory
> drivers/mtd/nand/gpmi-nand/gpmi-lib.c:21:33: fatal error: linux/mtd/gpm=
i-nand.h: No such file or directory
>
> This header is grabbed from patch below, which has not been postponed
> for merging.
>
>   [PATCH v8 1/4] ARM: mxs: add GPMI-NAND support for imx23/imx28
>   http://permalink.gmane.org/gmane.linux.drivers.mtd/37338
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  include/linux/mtd/gpmi-nand.h |   68 +++++++++++++++++++++++++++++++++=
++++++++
>  1 files changed, 68 insertions(+), 0 deletions(-)
>  create mode 100644 include/linux/mtd/gpmi-nand.h
>
> diff --git a/include/linux/mtd/gpmi-nand.h b/include/linux/mtd/gpmi-nan=
d.h
> new file mode 100644
> index 0000000..69b6dbf
> --- /dev/null
> +++ b/include/linux/mtd/gpmi-nand.h
> @@ -0,0 +1,68 @@
> +/*
> + * Copyright (C) 2011 Freescale Semiconductor, Inc. All Rights Reserve=
d.
> + *
> + * This program is free software; you can redistribute it and/or modif=
y
> + * it under the terms of the GNU General Public License as published b=
y
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License a=
long
> + * with this program; if not, write to the Free Software Foundation, I=
nc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#ifndef __MACH_MXS_GPMI_NAND_H__
> +#define __MACH_MXS_GPMI_NAND_H__
> +
> +/* The size of the resources is fixed. */
> +#define GPMI_NAND_RES_SIZE	6
> +
> +/* Resource names for the GPMI NAND driver. */
> +#define GPMI_NAND_GPMI_REGS_ADDR_RES_NAME  "GPMI NAND GPMI Registers"
> +#define GPMI_NAND_GPMI_INTERRUPT_RES_NAME  "GPMI NAND GPMI Interrupt"
> +#define GPMI_NAND_BCH_REGS_ADDR_RES_NAME   "GPMI NAND BCH Registers"
> +#define GPMI_NAND_BCH_INTERRUPT_RES_NAME   "GPMI NAND BCH Interrupt"
> +#define GPMI_NAND_DMA_CHANNELS_RES_NAME    "GPMI NAND DMA Channels"
> +#define GPMI_NAND_DMA_INTERRUPT_RES_NAME   "GPMI NAND DMA Interrupt"
> +
> +/**
> + * struct gpmi_nand_platform_data - GPMI NAND driver platform data.
> + *
> + * This structure communicates platform-specific information to the GP=
MI NAND
> + * driver that can't be expressed as resources.
> + *
> + * @platform_init:           A pointer to a function the driver will c=
all to
> + *                           initialize the platform (e.g., set up the=
 pin mux).
> + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals=
 to and
> + *                           from the NAND Flash device, in nanosecond=
s.
> + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals=
 to and
> + *                           from the NAND Flash device, in nanosecond=
s.
> + * @max_chip_count:          The maximum number of chips for which the=
 driver
> + *                           should configure the hardware. This value=
 most
> + *                           likely reflects the number of pins that a=
re
> + *                           connected to a NAND Flash device. If this=
 is
> + *                           greater than the SoC hardware can support=
, the
> + *                           driver will print a message and fail to i=
nitialize.
> + * @partitions:              An optional pointer to an array of partit=
ion
> + *                           descriptions.
> + * @partition_count:         The number of elements in the partitions =
array.
> + */
> +struct gpmi_nand_platform_data {
> +	/* SoC hardware information. */
> +	int		(*platform_init)(void);
> +
> +	/* NAND Flash information. */
> +	unsigned int	min_prop_delay_in_ns;
> +	unsigned int	max_prop_delay_in_ns;
> +	unsigned int	max_chip_count;
> +
> +	/* Medium information. */
> +	struct		mtd_partition *partitions;
> +	unsigned	partition_count;
> +};
> +#endif
thanks a lot.

Huang Shijie
