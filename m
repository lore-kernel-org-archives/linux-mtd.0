Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0DM7-0000go-TB
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 20:34:43 +0000
Date: Mon, 17 Apr 2017 22:34:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 1/6] nand: spi: add basic blocks for infrastructure
Message-ID: <20170417223404.195a0812@bbrezillon>
In-Reply-To: <1491810713-27795-2-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-2-git-send-email-peterpandong@micron.com>
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

On Mon, 10 Apr 2017 15:51:48 +0800
Peter Pan <peterpandong@micron.com> wrote:

> +/*
> + * spinand_dt_init - Initialize SPI NAND by device tree node
> + * @chip: SPI NAND device structure
> + *
> + * TODO: put ecc_mode, ecc_strength, ecc_step, bbt, etc in here
> + * and move it in generic NAND core.
> + */
> +static void spinand_dt_init(struct spinand_device *chip)
> +{
> +}

Please drop this function until you really have something to put in
there.

> +
> +/*
> + * spinand_detect - detect the SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +static int spinand_detect(struct spinand_device *chip)
> +{
> +	struct nand_device *nand = &chip->base;
> +	int ret;
> +
> +	spinand_reset(chip);
> +	spinand_read_id(chip, chip->id.data);
> +	chip->id.len = SPINAND_MAX_ID_LEN;
> +
> +	ret = spinand_manufacturer_detect(chip);
> +	if (ret) {
> +		dev_err(chip->dev, "unknown raw ID %*phN\n",
> +			SPINAND_MAX_ID_LEN, chip->id.data);
> +		goto out;
> +	}
> +
> +	dev_info(chip->dev, "%s (%s) is found.\n", chip->name,
> +		 chip->manufacturer.manu->name);
> +	dev_info(chip->dev,
> +		 "%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
> +		 (int)(nand_size(nand) >> 20), nand_eraseblock_size(nand) >> 10,
> +		 nand_page_size(nand), nand_per_page_oobsize(nand));
> +
> +out:
> +	return ret;
> +}
> +
> +/*
> + * spinand_init - initialize the SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +static int spinand_init(struct spinand_device *chip)
> +{
> +	struct mtd_info *mtd = spinand_to_mtd(chip);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	struct spinand_ecc_engine *ecc_engine;
> +	int ret;
> +
> +	spinand_dt_init(chip);
> +	spinand_set_rd_wr_op(chip);
> +
> +	chip->buf = devm_kzalloc(chip->dev,
> +				 nand_page_size(nand) +
> +				 nand_per_page_oobsize(nand),
> +				 GFP_KERNEL);
> +	if (!chip->buf) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	chip->oobbuf = chip->buf + nand_page_size(nand);
> +
> +	spinand_manufacturer_init(chip);
> +
> +	mtd->name = chip->name;
> +	mtd->size = nand_size(nand);
> +	mtd->erasesize = nand_eraseblock_size(nand);
> +	mtd->writesize = nand_page_size(nand);
> +	mtd->writebufsize = mtd->writesize;
> +	mtd->owner = THIS_MODULE;
> +	mtd->type = MTD_NANDFLASH;
> +	mtd->flags = MTD_CAP_NANDFLASH;
> +	if (!mtd->ecc_strength)
> +		mtd->ecc_strength = ecc_engine->strength ?
> +				    ecc_engine->strength : 1;

Why 1 if the engine strength is 0?

> +
> +	mtd->oobsize = nand_per_page_oobsize(nand);
> +	ret = mtd_ooblayout_count_freebytes(mtd);
> +	if (ret < 0)
> +		ret = 0;
> +	mtd->oobavail = ret;
> +
> +	if (!mtd->bitflip_threshold)
> +		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
> +						      4);
> +	/* After power up, all blocks are locked, so unlock it here. */
> +	spinand_lock_block(chip, BL_ALL_UNLOCKED);
> +
> +	return nand_register(nand);
> +
> +err:
> +	return ret;
> +}
> +

[...]

> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> new file mode 100644
> index 0000000..78ea9a6
> --- /dev/null
> +++ b/include/linux/mtd/spinand.h
> @@ -0,0 +1,257 @@

[...]

> +
> +struct spinand_controller_ops {
> +	int (*exec_op)(struct spinand_device *chip,
> +		       struct spinand_op *op);
> +};
> +
> +struct spinand_manufacturer_ops {
> +	/*
> +	 * Firstly, ->detect() should not be NULL.
> +	 * ->detect() implementation for manufacturer A never sends
> +	 * any manufacturer specific SPI command to a SPI NAND from
> +	 * manufacturer B, so the proper way is to decode the raw id
> +	 * data in chip->id.data first, if manufacture ID dismatch,
> +	 * return directly and let others to detect.
> +	 */
> +	bool (*detect)(struct spinand_device *chip);
> +	int (*init)(struct spinand_device *chip);
> +	void (*cleanup)(struct spinand_device *chip);
> +};
> +
> +struct spinand_manufacturer {
> +	u8 id;
> +	char *name;
> +	const struct spinand_manufacturer_ops *ops;
> +};
> +
> +struct spinand_ecc_engine_ops {
> +	void (*get_ecc_status)(struct spinand_device *chip,
> +			       unsigned int status, unsigned int *corrected,
> +			       unsigned int *ecc_errors);
> +	void (*disable_ecc)(struct spinand_device *chip);
> +	void (*enable_ecc)(struct spinand_device *chip);
> +};
> +
> +enum spinand_ecc_type {
> +	SPINAND_ECC_ONDIE,
> +	SPINAND_ECC_HW,
> +};
> +
> +struct spinand_ecc_engine {
> +	u32 strength;
> +	u32 steps;
> +	const struct spinand_ecc_engine_ops *ops;
> +};
> +
> +#define SPINAND_CAP_RD_X1	BIT(0)
> +#define SPINAND_CAP_RD_X2	BIT(1)
> +#define SPINAND_CAP_RD_X4	BIT(2)
> +#define SPINAND_CAP_RD_DUAL	BIT(3)
> +#define SPINAND_CAP_RD_QUAD	BIT(4)
> +#define SPINAND_CAP_WR_X1	BIT(5)
> +#define SPINAND_CAP_WR_X2	BIT(6)
> +#define SPINAND_CAP_WR_X4	BIT(7)
> +#define SPINAND_CAP_WR_DUAL	BIT(8)
> +#define SPINAND_CAP_WR_QUAD	BIT(9)
> +#define SPINAND_CAP_HW_ECC	BIT(10)
> +
> +struct spinand_controller {
> +	struct spinand_controller_ops *ops;
> +	u32 caps;
> +};

Can you please document all structures using kernel-doc headers?
