Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0NRP-0006YG-Es
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 07:20:49 +0000
Date: Tue, 18 Apr 2017 09:20:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 4/6] nand: spi: add Micron spi nand support
Message-ID: <20170418092022.5bd26861@bbrezillon>
In-Reply-To: <1491810713-27795-5-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-5-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 Apr 2017 15:51:51 +0800
Peter Pan <peterpandong@micron.com> wrote:

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

			^ manufacturer

> +};
>  

[...]

> +
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
> +	struct micron_spinand_info *item = NULL;
> +	struct nand_memory_organization *memorg = &nand->memorg;
> +	struct spinand_ecc_engine *ecc_engine = NULL;
> +	int i = 0;
> +
> +	for (; i < ARRAY_SIZE(micron_spinand_table); i++) {
> +		item = (struct micron_spinand_info *)micron_spinand_table + i;
> +		if (dev_id != item->dev_id)
> +			continue;
> +		chip->name = item->name;
> +		memorg->eraseblocksize = item->page_size * item->pages_per_blk;
> +		memorg->pagesize = item->page_size;
> +		memorg->oobsize = item->oob_size;
> +		memorg->diesize = memorg->eraseblocksize * item->blks_per_lun;
> +		memorg->ndies = item->luns_per_chip;
> +		if (chip->ecc.type == SPINAND_ECC_ONDIE) {
> +			ecc_engine = devm_kzalloc(chip->dev,
> +						  sizeof(*ecc_engine),
> +						  GFP_KERNEL);
> +			if (!ecc_engine) {
> +				dev_err(chip->dev,
> +					"fail to allocate ecc engine.\n");
> +				return false;
> +			}
> +			ecc_engine->ops = item->ecc_engine_ops;
> +			ecc_engine->strength = item->ecc_strength;
> +			ecc_engine->steps = item->ecc_steps;
> +			mtd_set_ooblayout(mtd, item->ooblayout_ops);
> +			chip->ecc.engine = ecc_engine;
> +		}

I'd prefer to have the ECC initialization done in ->init().

> +		chip->rw_mode = item->rw_mode;
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
> + * micron_spinand_cleanup -  free manufacutre related resources
> + * @chip: SPI NAND device structure
> + */
> +static void micron_spinand_cleanup(struct spinand_device *chip)
> +{
> +	if (chip->ecc.type == SPINAND_ECC_ONDIE)
> +		devm_kfree(chip->dev, chip->ecc.engine);

Not needed.

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
> +	.cleanup = micron_spinand_cleanup,
> +	.prepare_op = micron_spinand_prepare_op,
> +};
> +
> +const struct spinand_manufacturer micron_spinand_manufacture = {
> +	.id = SPINAND_MFR_MICRON,
> +	.name = "Micron",
> +	.ops = &micron_spinand_manuf_ops,
> +};
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 5c8bb70..3c6dd48 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -111,6 +111,8 @@ struct spinand_manufacturer {
>  	const struct spinand_manufacturer_ops *ops;
>  };
>  
> +extern const struct spinand_manufacturer micron_spinand_manufacture;

Same typo here:
s/micron_spinand_manufacture/micron_spinand_manufacturer/

> +
>  struct spinand_ecc_engine_ops {
>  	void (*get_ecc_status)(struct spinand_device *chip,
>  			       unsigned int status, unsigned int *corrected,
