Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz1Nz-0007Gb-S1
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 13:35:41 +0000
Subject: Re: [PATCH v5 4/6] nand: spi: add Micron spi nand support
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-5-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Marek Vasut <marex@denx.de>
Message-ID: <3ba08731-e8bb-381f-4f5e-3fdc4dad8619@denx.de>
Date: Fri, 14 Apr 2017 15:23:46 +0200
MIME-Version: 1.0
In-Reply-To: <1491810713-27795-5-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2017 09:51 AM, Peter Pan wrote:
> This commit is to add support for Micron MT29F2G01ABAGD
> spi nand chip.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/Makefile |   1 +
>  drivers/mtd/nand/spi/core.c   |   4 +-
>  drivers/mtd/nand/spi/micron.c | 254 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h   |   2 +
>  4 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mtd/nand/spi/micron.c
> 
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> index a677a4d..df6c2ea 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_MTD_SPI_NAND) += core.o
> +obj-$(CONFIG_MTD_SPI_NAND) += micron.o
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 52113fc..b2530fa 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1252,7 +1252,9 @@ static int spinand_scan_bbt(struct spinand_device *chip)
>  	return nand_scan_bbt(nand);
>  }
>  
> -static const struct spinand_manufacturer *spinand_manufacturers[] = {};
> +static const struct spinand_manufacturer *spinand_manufacturers[] = {
> +	&micron_spinand_manufacture
> +};
>  
>  /*
>   * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> new file mode 100644
> index 0000000..f134194
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -0,0 +1,254 @@
> +/*
> + *
> + * Copyright (c) 2009-2017 Micron Technology, Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mtd/spinand.h>
> +
> +#define SPINAND_MFR_MICRON		0x2C
> +
> +#define SPI_NAND_M7XA_ECC_MASK		0x70
> +#define SPI_NAND_M7XA_ECC_0_BIT		0x00
> +#define SPI_NAND_M7XA_ECC_1_3_BIT	0x10
> +#define SPI_NAND_M7XA_ECC_4_6_BIT	0x30
> +#define SPI_NAND_M7XA_ECC_7_8_BIT	0x50
> +#define SPI_NAND_M7XA_ECC_UNCORR	0x20
> +
> +struct micron_spinand_info {
> +	char *name;
> +	u8 dev_id;
> +	u32 page_size;
> +	u32 oob_size;
> +	u32 pages_per_blk;
> +	u32 blks_per_lun;
> +	u32 luns_per_chip;
> +	u32 ecc_strength;
> +	u32 ecc_steps;
> +	u32 rw_mode;
> +	const struct mtd_ooblayout_ops *ooblayout_ops;
> +	const struct spinand_ecc_engine_ops *ecc_engine_ops;
> +};
> +
> +#define MICRON_SPI_NAND_INFO(nm, did, pagesz, oobsz, pg_per_blk,	\
> +			     blk_per_lun, lun_per_chip, ecc_stren,	\
> +			     ecc_stps, rwmode, ooblayoutops,		\
> +			     ecc_ops)		\
> +	{	\
> +		.name = (nm), .dev_id = (did),		\
> +		.page_size = (pagesz), .oob_size = (oobsz),		\

Nit: Keep each entry on a separate line please.

> +		.pages_per_blk = (pg_per_blk),		\
> +		.blks_per_lun = (blk_per_lun),		\
> +		.luns_per_chip = (lun_per_chip),	\
> +		.ecc_strength = (ecc_stren),	\
> +		.ecc_steps = (ecc_stps),	\
> +		.rw_mode = (rwmode),		\
> +		.ooblayout_ops = (ooblayoutops),	\
> +		.ecc_engine_ops = (ecc_ops)	\
> +	}

[...]

-- 
Best regards,
Marek Vasut
