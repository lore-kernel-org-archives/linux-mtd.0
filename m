Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbpmd-0006gW-4y
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 08:06:05 +0000
Date: Wed, 29 Jun 2011 10:05:58 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V4 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Message-ID: <20110629080558.GJ6588@pengutronix.de>
References: <1309334082-9501-1-git-send-email-b32955@freescale.com>
	<1309334082-9501-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1309334082-9501-2-git-send-email-b32955@freescale.com>
Cc: s.hauer@pengutronix.de, w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 29, 2011 at 03:54:40PM +0800, Huang Shijie wrote:
> add GPMI-NFC support for imx23 and imx28.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/mach-mxs/Kconfig                 |    2 +
>  arch/arm/mach-mxs/include/mach/gpmi-nfc.h |   71 +++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-mxs/include/mach/gpmi-nfc.h
> 
> diff --git a/arch/arm/mach-mxs/Kconfig b/arch/arm/mach-mxs/Kconfig
> index 1d3985f..a5b753a 100644
> --- a/arch/arm/mach-mxs/Kconfig
> +++ b/arch/arm/mach-mxs/Kconfig
> @@ -32,6 +32,7 @@ config MACH_MX23EVK
>  	select SOC_IMX23
>  	select MXS_HAVE_AMBA_DUART
>  	select MXS_HAVE_PLATFORM_AUART
> +	select MXS_HAVE_PLATFORM_GPMI_NFC
This symbol is only introduced in patch 2, so the select doesn't belong
here.

>  	select MXS_HAVE_PLATFORM_MXS_MMC
>  	select MXS_HAVE_PLATFORM_MXSFB
>  	help
> @@ -46,6 +47,7 @@ config MACH_MX28EVK
>  	select MXS_HAVE_PLATFORM_AUART
>  	select MXS_HAVE_PLATFORM_FEC
>  	select MXS_HAVE_PLATFORM_FLEXCAN
> +	select MXS_HAVE_PLATFORM_GPMI_NFC
>  	select MXS_HAVE_PLATFORM_MXS_MMC
>  	select MXS_HAVE_PLATFORM_MXSFB
>  	select MXS_OCOTP
> diff --git a/arch/arm/mach-mxs/include/mach/gpmi-nfc.h b/arch/arm/mach-mxs/include/mach/gpmi-nfc.h
> new file mode 100644
> index 0000000..25fc605
> --- /dev/null
> +++ b/arch/arm/mach-mxs/include/mach/gpmi-nfc.h
> @@ -0,0 +1,71 @@
> +/*
> + * Copyright (C) 2011 Freescale Semiconductor, Inc. All Rights Reserved.
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
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, write to the Free Software Foundation, Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#ifndef __INCLUDE_GPMI_NFC_H
> +#define __INCLUDE_GPMI_NFC_H
Applying the scheme other files in arch/arm/mach-mxs/include/mach this
should read:

	#ifndef __MACH_MXS_GPMI_NFC_H__

(though it's not consistent, so you could choose between

	__MACH_MXS_GPMI_NFC_H__
	__MACH_GPMI_NFC_H__
	__MACH_GPMI_NFC_H

)
> +
> +/* The size of the resource is fixed. */
> +#define RES_SIZE	6
> +
> +/* Resource names for the GPMI NFC driver. */
> +#define GPMI_NFC_GPMI_REGS_ADDR_RES_NAME  "GPMI NFC GPMI Registers"
> +#define GPMI_NFC_GPMI_INTERRUPT_RES_NAME  "GPMI NFC GPMI Interrupt"
> +#define GPMI_NFC_BCH_REGS_ADDR_RES_NAME   "GPMI NFC BCH Registers"
> +#define GPMI_NFC_BCH_INTERRUPT_RES_NAME   "GPMI NFC BCH Interrupt"
> +#define GPMI_NFC_DMA_CHANNELS_RES_NAME    "GPMI NFC DMA Channels"
> +#define GPMI_NFC_DMA_INTERRUPT_RES_NAME   "GPMI NFC DMA Interrupt"
> +
> +/**
> + * struct gpmi_nfc_platform_data - GPMI NFC driver platform data.
> + *
> + * This structure communicates platform-specific information to the GPMI NFC
> + * driver that can't be expressed as resources.
> + *
> + * @platform_init:           A pointer to a function the driver will call to
> + *                           initialize the platform (e.g., set up the pin mux).
> + * @platform_exit:           A pointer to a function the driver will call to
> + *                           exit the platform (e.g., free pins).
> + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals to and
> + *                           from the NAND Flash device, in nanoseconds.
> + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals to and
> + *                           from the NAND Flash device, in nanoseconds.
> + * @max_chip_count:          The maximum number of chips for which the driver
> + *                           should configure the hardware. This value most
> + *                           likely reflects the number of pins that are
> + *                           connected to a NAND Flash device. If this is
> + *                           greater than the SoC hardware can support, the
> + *                           driver will print a message and fail to initialize.
> + * @partitions:              An optional pointer to an array of partition
> + *                           descriptions.
> + * @partition_count:         The number of elements in the partitions array.
> + */
> +struct gpmi_nfc_platform_data {
> +	/* SoC hardware information. */
> +	int		(*platform_init)(void);
> +	void		(*platform_exit)(void);
> +
> +	/* NAND Flash information. */
> +	unsigned int	min_prop_delay_in_ns;
> +	unsigned int	max_prop_delay_in_ns;
> +	unsigned int	max_chip_count;
> +
> +	/* Medium information. */
> +	struct mtd_partition *partitions;
> +	unsigned	partition_count;
> +};
> +#endif

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
