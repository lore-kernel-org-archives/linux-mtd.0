Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFSZq-0003O9-FU
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 21:51:52 +0000
Date: Mon, 29 May 2017 23:51:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 10/15] nand: spi: add basic blocks for infrastructure
Message-ID: <20170529235118.0096ac2a@bbrezillon>
In-Reply-To: <1495609631-18880-11-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-11-git-send-email-peterpandong@micron.com>
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

On Wed, 24 May 2017 15:07:06 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This is the first commit for spi nand framkework.

					^ framework

> This commit is to add add basic building blocks

	      is adding basic ...

> for the SPI NAND infrastructure.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---

[...]

> +
> +/**
> + * devm_spinand_alloc - [SPI NAND Interface] allocate SPI NAND device instance

Let's drop those [SPI NAND Interface] specifier. It's pretty obvious
that this is part of the spi-nand API, since those symbols are exported.

> + * @dev: pointer to device model structure
> + */
> +struct spinand_device *devm_spinand_alloc(struct device *dev)

You can pass a pointer to the nand_controller object driving the
nand_device here.

> +{
> +	struct spinand_device *spinand;
> +	struct mtd_info *mtd;
> +
> +	spinand = devm_kzalloc(dev, sizeof(*spinand), GFP_KERNEL);
> +	if (!spinand)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spinand_set_of_node(spinand, dev->of_node);
> +	mutex_init(&spinand->lock);
> +	spinand->dev = dev;

Hm, I don't think this is correct. The device here is likely to
represent the controller not the SPI NAND device. For the generic spi
nand controller, I agree, it's the same, but, in case you have one
controller that is attached several spi devices, it's not.

How about putting the struct device pointer in nand_controller and then
pass the controller to this spinand_alloc() function.

> +	mtd = spinand_to_mtd(spinand);
> +	mtd->dev.parent = dev;
> +
> +	return spinand;
> +}
> +EXPORT_SYMBOL_GPL(devm_spinand_alloc);
> +
> +/**
> + * spinand_init - [SPI NAND Interface] initialize the SPI NAND device
> + * @spinand: SPI NAND device structure
> + */
> +int spinand_init(struct spinand_device *spinand)
> +{
> +	struct mtd_info *mtd = spinand_to_mtd(spinand);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	int ret;
> +
> +	ret = spinand_detect(spinand);
> +	if (ret) {
> +		dev_err(spinand->dev,
> +			"Detect SPI NAND failed with error %d.\n", ret);
> +		goto err_out;

		return ret;


> +	}

I'd still prefer to move the detection step out of this _init()
function even if this implies duplicating the _detect()+_init()
sequence in all drivers. Maybe you can provide a wrapper called
spinand_detect_and_init() to do both in one go.

> +
> +	spinand_set_rd_wr_op(spinand);
> +
> +	/*
> +	 * Use kzalloc() instead of devm_kzalloc() here, beacause some drivers
> +	 * may use this buffer for DMA access.
> +	 * Memory allocated by devm_ does not guarantee DMA-safe alignment.
> +	 */
> +	spinand->buf = kzalloc(nand_page_size(nand) +
> +			       nand_per_page_oobsize(nand),
> +			       GFP_KERNEL);
> +	if (!spinand->buf) {
> +		ret = -ENOMEM;
> +		goto err_out;

		return -ENOMEM;

> +	}
> +
> +	spinand->oobbuf = spinand->buf + nand_page_size(nand);
> +
> +	ret = spinand_manufacturer_init(spinand);
> +	if (ret) {
> +		dev_err(spinand->dev,
> +			"Manufacurer init SPI NAND failed with err %d.\n",
> +			ret);
> +		goto err_free_buf;
> +	}
> +
> +	mtd->name = spinand->name;
> +	mtd->size = nand_size(nand);
> +	mtd->erasesize = nand_eraseblock_size(nand);
> +	mtd->writesize = nand_page_size(nand);
> +	mtd->writebufsize = mtd->writesize;
> +	mtd->owner = THIS_MODULE;
> +	mtd->type = MTD_NANDFLASH;
> +	mtd->flags = MTD_CAP_NANDFLASH;
> +	mtd->oobsize = nand_per_page_oobsize(nand);
> +	/*
> +	 * Right now, we don't support ECC, so let the whole oob
> +	 * area is available for user.
> +	 */
> +	mtd->oobavail = mtd->oobsize;
> +
> +	/* After power up, all blocks are locked, so unlock it here. */
> +	spinand_lock_block(spinand, BL_ALL_UNLOCKED);
> +
> +	return 0;
> +
> +err_free_buf:
> +	kfree(spinand->buf);
> +err_out:

You can get rid of err_out.

> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spinand_init);
> +
