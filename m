Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQuDt-0006da-Ka
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 06:13:50 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so161165vbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2012 23:13:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350147809-19616-1-git-send-email-shijie8@gmail.com>
References: <1350147809-19616-1-git-send-email-shijie8@gmail.com>
Date: Wed, 24 Oct 2012 14:13:46 +0800
Message-ID: <CAMiH66E8WtAj3BedPEWaOPZzz8qamhGAZg_te4Rkqey4UB33Dg@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: remove unneccessary header
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping.

On Sun, Oct 14, 2012 at 1:03 AM, Huang Shijie <shijie8@gmail.com> wrote:
> The whole gpmi-nand driver has turned to pure devicetree supported.
> So the linux/mtd/gpmi-nand.h is not neccessary now. Just remove it,
> and move some macros to the gpmi-nand driver itself.
>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |    1 -
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    7 +++-
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 -
>  include/linux/mtd/gpmi-nand.h          |   68 --------------------------------
>  4 files changed, 6 insertions(+), 71 deletions(-)
>  delete mode 100644 include/linux/mtd/gpmi-nand.h
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 3502acc..1585c5b 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -18,7 +18,6 @@
>   * with this program; if not, write to the Free Software Foundation, Inc.,
>   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */
> -#include <linux/mtd/gpmi-nand.h>
>  #include <linux/delay.h>
>  #include <linux/clk.h>
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index e2c56fc..d376198 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -25,7 +25,6 @@
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/mtd/gpmi-nand.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/of.h>
> @@ -33,6 +32,12 @@
>  #include <linux/of_mtd.h>
>  #include "gpmi-nand.h"
>
> +/* Resource names for the GPMI NAND driver. */
> +#define GPMI_NAND_GPMI_REGS_ADDR_RES_NAME  "gpmi-nand"
> +#define GPMI_NAND_BCH_REGS_ADDR_RES_NAME   "bch"
> +#define GPMI_NAND_BCH_INTERRUPT_RES_NAME   "bch"
> +#define GPMI_NAND_DMA_INTERRUPT_RES_NAME   "gpmi-dma"
> +
>  /* add our owner bbt descriptor */
>  static uint8_t scan_ff_pattern[] = { 0xff };
>  static struct nand_bbt_descr gpmi_bbt_descr = {
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index 7ac25c1..3d93a5e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -130,7 +130,6 @@ struct gpmi_nand_data {
>         /* System Interface */
>         struct device           *dev;
>         struct platform_device  *pdev;
> -       struct gpmi_nand_platform_data  *pdata;
>
>         /* Resources */
>         struct resources        resources;
> diff --git a/include/linux/mtd/gpmi-nand.h b/include/linux/mtd/gpmi-nand.h
> deleted file mode 100644
> index ed3c4e0..0000000
> --- a/include/linux/mtd/gpmi-nand.h
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -/*
> - * Copyright (C) 2011 Freescale Semiconductor, Inc. All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write to the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - */
> -
> -#ifndef __MACH_MXS_GPMI_NAND_H__
> -#define __MACH_MXS_GPMI_NAND_H__
> -
> -/* The size of the resources is fixed. */
> -#define GPMI_NAND_RES_SIZE     6
> -
> -/* Resource names for the GPMI NAND driver. */
> -#define GPMI_NAND_GPMI_REGS_ADDR_RES_NAME  "gpmi-nand"
> -#define GPMI_NAND_GPMI_INTERRUPT_RES_NAME  "GPMI NAND GPMI Interrupt"
> -#define GPMI_NAND_BCH_REGS_ADDR_RES_NAME   "bch"
> -#define GPMI_NAND_BCH_INTERRUPT_RES_NAME   "bch"
> -#define GPMI_NAND_DMA_CHANNELS_RES_NAME    "GPMI NAND DMA Channels"
> -#define GPMI_NAND_DMA_INTERRUPT_RES_NAME   "gpmi-dma"
> -
> -/**
> - * struct gpmi_nand_platform_data - GPMI NAND driver platform data.
> - *
> - * This structure communicates platform-specific information to the GPMI NAND
> - * driver that can't be expressed as resources.
> - *
> - * @platform_init:           A pointer to a function the driver will call to
> - *                           initialize the platform (e.g., set up the pin mux).
> - * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals to and
> - *                           from the NAND Flash device, in nanoseconds.
> - * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals to and
> - *                           from the NAND Flash device, in nanoseconds.
> - * @max_chip_count:          The maximum number of chips for which the driver
> - *                           should configure the hardware. This value most
> - *                           likely reflects the number of pins that are
> - *                           connected to a NAND Flash device. If this is
> - *                           greater than the SoC hardware can support, the
> - *                           driver will print a message and fail to initialize.
> - * @partitions:              An optional pointer to an array of partition
> - *                           descriptions.
> - * @partition_count:         The number of elements in the partitions array.
> - */
> -struct gpmi_nand_platform_data {
> -       /* SoC hardware information. */
> -       int             (*platform_init)(void);
> -
> -       /* NAND Flash information. */
> -       unsigned int    min_prop_delay_in_ns;
> -       unsigned int    max_prop_delay_in_ns;
> -       unsigned int    max_chip_count;
> -
> -       /* Medium information. */
> -       struct          mtd_partition *partitions;
> -       unsigned        partition_count;
> -};
> -#endif
> --
> 1.7.4.4
>
