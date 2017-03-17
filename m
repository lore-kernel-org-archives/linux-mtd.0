Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cos5j-0001vU-E0
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 13:38:53 +0000
Date: Fri, 17 Mar 2017 14:38:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v3 3/8] nand: spi: add basic blocks for infrastructure
Message-ID: <20170317143819.0ac3049c@bbrezillon>
In-Reply-To: <1489646857-10112-4-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-4-git-send-email-peterpandong@micron.com>
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

On Thu, 16 Mar 2017 14:47:32 +0800
Peter Pan <peterpandong@micron.com> wrote:


> +
> +/*
> + * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
> + * @chip: SPI NAND device structure
> + * @raw_id: raw id buffer. raw id is read by spinand_read_id(), should be
> + *          decoded by manufacturers
> + * @id: real id buffer. manufacturer's ->detect() should put real id in
> + *      this buffer.
> + *
> + * ->detect() should decode raw id and initialize device related part in
> + * spinand_device structure if it is the right device.
> + * ->detect() can not be NULL.
> + */
> +static int spinand_manufacturer_detect(struct spinand_device *chip,
> +				       u8 *raw_id, u8 *id)
> +{
> +	int i = 0;
> +
> +	for (; spinand_manufacturers[i]->id != 0x0; i++) {
> +		if (spinand_manufacturers[i]->ops &&
> +		    spinand_manufacturers[i]->ops->detect) {

AFAIU, ->detect() is mandatory, otherwise you have no way to attach a
NAND to this manufacturer which makes it useless.
Am I missing something?

If I'm right, you should assume that ->detect() is never NULL and
complain loudly if it is.

> +			if (spinand_manufacturers[i]->ops->detect(chip,
> +								  raw_id, id))
> +				return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +/*
> + * spinand_manufacturer_init - manufacturer initialization function.
> + * @chip: SPI NAND device structure
> + *
> + * Manufacturer drivers should put all their specific initialization code in
> + * their ->init() hook.
> + */
> +static int spinand_manufacturer_init(struct spinand_device *chip)
> +{
> +	if (chip->manufacturer.manu->ops && chip->manufacturer.manu->ops->init)
> +		return chip->manufacturer.manu->ops->init(chip);
> +
> +	return 0;
> +}
> +
> +/*
> + * spinand_manufacturer_cleanup - manufacturer cleanup function.
> + * @chip: SPI NAND device structure
> + *
> + * Manufacturer drivers should put all their specific cleanup code in their
> + * ->cleanup() hook.
> + */
> +static void spinand_manufacturer_cleanup(struct spinand_device *chip)
> +{
> +	/* Release manufacturer private data */
> +	if (chip->manufacturer.manu->ops &&
> +	    chip->manufacturer.manu->ops->cleanup)
> +		return chip->manufacturer.manu->ops->cleanup(chip);
> +}
> +
> +/*
> + * spinand_fill_id - fill id in spinand_device structure.
> + * @chip: SPI NAND device structure
> + * @id: id buffer
> + */
> +static void spinand_fill_id(struct spinand_device *chip, u8 *id)
> +{
> +	memcpy(chip->id.data, id, SPINAND_MAX_ID_LEN);
> +	chip->id.len = SPINAND_MAX_ID_LEN;
> +}
> +
> +/*
> + * spinand_get_mfr_id - get device's manufacturer ID.
> + * @chip: SPI NAND device structure
> + */
> +static u8 spinand_get_mfr_id(struct spinand_device *chip)
> +{
> +	return chip->id.data[SPINAND_MFR_ID];
> +}
> +
> +/*
> + * spinand_get_dev_id - get device's device ID.
> + * @chip: SPI NAND device structure
> + */
> +static u8 spinand_get_dev_id(struct spinand_device *chip)
> +{
> +	return chip->id.data[SPINAND_DEV_ID];
> +}

As said below, I'm not sure we need to identify the manufacturer and
device ID bytes if we go for the raw-id approach.

> +
> +/*
> + * spinand_set_manufacturer_ops - set manufacture ops in spinand_device
> + * structure.
> + * @chip: SPI NAND device structure
> + * @mfr_id: device's manufacturer ID
> + */
> +static void spinand_set_manufacturer_ops(struct spinand_device *chip,
> +					 u8 mfr_id)
> +{
> +	int i = 0;
> +
> +	for (; spinand_manufacturers[i]->id != 0x0; i++) {
> +		if (spinand_manufacturers[i]->id == mfr_id)
> +			break;
> +	}
> +
> +	chip->manufacturer.manu = spinand_manufacturers[i];

Clearly something that should be done in spinand_manufacturer_detect()
when the ->detect() method returns true.

> +}
> +
> +/*
> + * spinand_detect - [SPI NAND Interface] detect the SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +int spinand_detect(struct spinand_device *chip)
> +{
> +	struct nand_device *nand = &chip->base;
> +	u8 raw_id[SPINAND_MAX_ID_LEN] = {0};
> +	u8 id[SPINAND_MAX_ID_LEN] = {0};
> +	int ret;
> +
> +	spinand_reset(chip);
> +	spinand_read_id(chip, raw_id);

Directly store the raw id in chip->id.data.

> +	ret = spinand_manufacturer_detect(chip, raw_id, id);

Why do you need to differentiate raw and non-raw IDs. If we consider the
ID to be the 4 first bytes without any dummy-cycles, then we'd better
store this one in chip->id.data and let manufacturer code parse it.

> +	if (ret)
> +		return ret;
> +
> +	spinand_fill_id(chip, id);
> +
> +	pr_info("SPI NAND: %s is found.\n", chip->name);
> +	pr_info("Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
> +		spinand_get_mfr_id(chip), spinand_get_dev_id(chip));

Is this really important to print those raw IDs? How about printing the
manufacturer name (which should be part of struct spinand_manufacturer)
and the model name (a readable string that can be extracted from the
device id during detect).

> +	pr_info("%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
> +		(int)(nand_size(nand) >> 20), nand_eraseblock_size(nand) >> 10,
> +		nand_page_size(nand), nand_per_page_oobsize(nand));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spinand_detect);


> +struct spinand_manufacturer_ops {
> +	bool (*detect)(struct spinand_device *chip, u8 *raw_id, u8 *id);

Just pass chip, the id should be stored in chip->id.

> +	int (*init)(struct spinand_device *chip);
> +	void (*cleanup)(struct spinand_device *chip);
> +};
> +
