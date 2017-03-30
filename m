Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZFT-0004r8-Uq
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:32:22 +0000
Received: by mail-wr0-x241.google.com with SMTP id u18so11717942wrc.0
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 05:31:58 -0700 (PDT)
Subject: Re: [PATCH v4 7/9] nand: spi: add Micron spi nand support
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, marex@denx.de,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-8-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <f2215f3c-dbbc-3580-50bc-fa1190d96fc4@gmail.com>
Date: Thu, 30 Mar 2017 14:31:54 +0200
MIME-Version: 1.0
In-Reply-To: <1490262226-29092-8-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 23/03/2017 10:43, Peter Pan wrote:
> This commit is to add support for Micron MT29F2G01ABAGD
> spi nand chip.
>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>   drivers/mtd/nand/spi/Makefile       |   1 +
>   drivers/mtd/nand/spi/manufactures.c |   3 +
>   drivers/mtd/nand/spi/micron.c       | 226 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 230 insertions(+)
>   create mode 100644 drivers/mtd/nand/spi/micron.c
>
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> index eabdb81..db0b91b 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,2 +1,3 @@
>   obj-$(CONFIG_MTD_SPI_NAND) += core.o
>   obj-$(CONFIG_MTD_SPI_NAND) += manufactures.o
> +obj-$(CONFIG_MTD_SPI_NAND) += micron.o
> diff --git a/drivers/mtd/nand/spi/manufactures.c b/drivers/mtd/nand/spi/manufactures.c
> index 7e0b42d..40dae11 100644
> --- a/drivers/mtd/nand/spi/manufactures.c
> +++ b/drivers/mtd/nand/spi/manufactures.c
> @@ -16,9 +16,12 @@
>   #include <linux/module.h>
>   #include <linux/mtd/spinand.h>
>   
> +extern struct spinand_manufacturer micron_spinand_manufacture;
> +
>   struct spinand_manufacturer spinand_manufacturer_end = {0x0, "Unknown", NULL};
>   
>   struct spinand_manufacturer *spinand_manufacturers[] = {
> +	&micron_spinand_manufacture,
>   	&spinand_manufacturer_end,
>   };
>   EXPORT_SYMBOL(spinand_manufacturers);
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> new file mode 100644
> index 0000000..0c360e0
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -0,0 +1,226 @@
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
> +#include <linux/mtd/spinand.h>
> +
> +#define SPINAND_MFR_MICRON		0x2C
> +
> +#define SPI_NAND_MT29F_ECC_MASK		0x70
> +#define SPI_NAND_MT29F_ECC_0_BIT	0x00
> +#define SPI_NAND_MT29F_ECC_1_3_BIT	0x10
> +#define SPI_NAND_MT29F_ECC_4_6_BIT	0x30
> +#define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
> +#define SPI_NAND_MT29F_ECC_UNCORR	0x20
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
> +	u32 rw_mode;
> +	const struct mtd_ooblayout_ops *ooblayout_ops;
> +};
> +
> +#define MICRON_SPI_NAND_INFO(nm, did, pagesz, oobsz, pg_per_blk,	\
> +			     blk_per_lun, lun_per_chip, ecc_stren,	\
> +			     rwmode, ooblayoutops)		\
> +	{	\
> +		.name = (nm), .dev_id = (did),		\
> +		.page_size = (pagesz), .oob_size = (oobsz),		\
> +		.pages_per_blk = (pg_per_blk),		\
> +		.blks_per_lun = (blk_per_lun),		\
> +		.luns_per_chip = (lun_per_chip),	\
> +		.ecc_strength = (ecc_stren),	\
> +		.rw_mode = (rwmode),		\
> +		.ooblayout_ops = (ooblayoutops)	\
> +	}
> +
> +static int micron_ooblayout_ecc_128(struct mtd_info *mtd, int section,
> +				    struct mtd_oob_region *oobregion)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = 64;
> +	oobregion->offset = 64;
> +
> +	return 0;
> +}
> +
> +static int micron_ooblayout_free_128(struct mtd_info *mtd, int section,
> +				     struct mtd_oob_region *oobregion)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = 62;
> +	oobregion->offset = 2;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops micron_ooblayout_128_ops = {
> +	.ecc = micron_ooblayout_ecc_128,
> +	.free = micron_ooblayout_free_128,
> +};
> +
> +static const struct micron_spinand_info micron_spinand_table[] = {
> +	MICRON_SPI_NAND_INFO("MT29F2G01ABAGD", 0x24, 2048, 128, 64, 2048, 1,
> +			     8, SPINAND_OP_COMMON, &micron_ooblayout_128_ops),
> +	{.name = NULL},
> +};
> +
> +static int micron_spinand_get_dummy(struct spinand_device *chip,
> +				    struct spinand_op *op)
> +{
> +	u8 opcode = op->cmd;
> +
> +	switch (opcode) {
> +	case SPINAND_CMD_READ_FROM_CACHE:
> +	case SPINAND_CMD_READ_FROM_CACHE_FAST:
> +	case SPINAND_CMD_READ_FROM_CACHE_X2:
> +	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
> +	case SPINAND_CMD_READ_FROM_CACHE_X4:
> +	case SPINAND_CMD_READ_ID:
> +		return 1;
> +	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
> +		return 2;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/*
> + * mt29f_get_ecc_status - get ecc correction information from status register
> + * @chip: SPI NAND device structure
> + * @status: status register value
> + * @corrected: corrected bit flip number
> + * @ecc_error: ecc correction error or not
> + */
> +static void mt29f_get_ecc_status(struct spinand_device *chip,
> +				 unsigned int status, unsigned int *corrected,
> +				 unsigned int *ecc_error)
> +{
> +	unsigned int ecc_status = status & SPI_NAND_MT29F_ECC_MASK;
> +
> +	*ecc_error = (ecc_status == SPI_NAND_MT29F_ECC_UNCORR);
> +	switch (ecc_status) {
> +	case SPI_NAND_MT29F_ECC_0_BIT:
> +		*corrected = 0;
> +		break;
> +	case SPI_NAND_MT29F_ECC_1_3_BIT:
> +		*corrected = 3;
> +		break;
> +	case SPI_NAND_MT29F_ECC_4_6_BIT:
> +		*corrected = 6;
> +		break;
> +	case SPI_NAND_MT29F_ECC_7_8_BIT:
> +		*corrected = 8;
> +		break;
> +	}
> +}
> +
> +static struct spinand_ecc_engine_ops generic_spi_ecc_engine_ops = {
> +	.get_ecc_status = mt29f_get_ecc_status,
> +};
> +

MT29F1G01AAADD already has a different ecc status mask (only 2 bits) 
requiring a different get_ecc_status op.
Maybe you should add directly an entry in MICRON_SPI_NAND_INFO(...) 
macro to specify the ecc_engine_ops.

Also, shouldn't this generic_spi_ecc_engine_ops be a "static const struct" ?

Arnaud
> +/*
> + * micron_spinand_scan_id_table - scan chip info in id table
> + * @chip: SPI-NAND device structure
> + * @id: point to manufacture id and device id
> + * Description:
> + *   If found in id table, config chip with table information.
> + */
> +static bool micron_spinand_scan_id_table(struct spinand_device *chip, u8 dev_id)
> +{
> +	struct mtd_info *mtd = spinand_to_mtd(chip);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	struct micron_spinand_info *type = NULL;
> +	struct nand_memory_organization *memorg = &nand->memorg;
> +	struct spinand_ecc_engine *ecc_engine = chip->ecc.engine;
> +
> +	for (type = (struct micron_spinand_info *)micron_spinand_table;
> +	     type->name; type++) {
> +		if (dev_id != type->dev_id)
> +			continue;
> +		chip->name = type->name;
> +		memorg->eraseblocksize = type->page_size
> +				* type->pages_per_blk;
> +		memorg->pagesize = type->page_size;
> +		memorg->oobsize = type->oob_size;
> +		memorg->diesize = memorg->eraseblocksize * type->blks_per_lun;
> +		memorg->ndies = type->luns_per_chip;
> +		if (ecc_engine->mode == SPINAND_ECC_ONDIE) {
> +			ecc_engine->ops = &generic_spi_ecc_engine_ops;
> +			ecc_engine->strength = type->ecc_strength;
> +			mtd_set_ooblayout(mtd, type->ooblayout_ops);
> +		}
> +		chip->rw_mode = type->rw_mode;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * micron_spinand_detect - initialize device related part in spinand_device
> + * struct if it is Micron device.
> + * @chip: SPI NAND device structure
> + */
> +static bool micron_spinand_detect(struct spinand_device *chip)
> +{
> +	u8 *id = chip->id.data;
> +
> +	/*
> +	 * Micron SPI NAND read ID need a dummy byte,
> +	 * so the first byte in raw_id is dummy.
> +	 */
> +	if (id[1] != SPINAND_MFR_MICRON)
> +		return false;
> +
> +	return micron_spinand_scan_id_table(chip, id[2]);
> +}
> +
> +/*
> + * micron_spinand_prepare_op - Fix address for cache operation.
> + * @chip: SPI NAND device structure
> + * @op: pointer to spinand_op struct
> + * @page: page address
> + * @column: column address
> + */
> +static void micron_spinand_prepare_op(struct spinand_device *chip,
> +				      struct spinand_op *op, u32 page,
> +				      u32 column)
> +{
> +	op->addr[0] |= (u8)((nand_page_to_eraseblock(&chip->base, page)
> +			     & 0x1) << 4);
> +	op->n_addr += micron_spinand_get_dummy(chip, op);
> +}
> +
> +static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
> +	.detect = micron_spinand_detect,
> +	.prepare_op = micron_spinand_prepare_op,
> +};
> +
> +const struct spinand_manufacturer micron_spinand_manufacture = {
> +	.id = SPINAND_MFR_MICRON,
> +	.name = "Micron",
> +	.ops = &micron_spinand_manuf_ops,
> +};
