Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxUhL-00086T-AF
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 08:29:21 +0000
Date: Mon, 10 Apr 2017 10:28:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 1/6] nand: spi: add basic blocks for infrastructure
Message-ID: <20170410102856.6c9f7608@bbrezillon>
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

Hi Peter,

On Mon, 10 Apr 2017 15:51:48 +0800
Peter Pan <peterpandong@micron.com> wrote:

> +
> +/*
> + * spinand_free - [SPI NAND Interface] free SPI NAND device instance
> + * @chip: SPI NAND device structure
> + */
> +void spinand_free(struct spinand_device *chip)
> +{
> +	devm_kfree(chip->dev, chip);

This is unneeded. Everything allocated with devm_kmalloc() should be
automatically freed when the underlying device is released.

> +}
> +EXPORT_SYMBOL_GPL(spinand_free);
> +
> +/*
> + * spinand_register - [SPI NAND Interface] register SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +int spinand_register(struct spinand_device *chip)
> +{
> +	int ret;
> +
> +	ret = spinand_detect(chip);
> +	if (ret) {
> +		dev_err(chip->dev,
> +			"Detect SPI NAND failed with error %d.\n", ret);
> +		return ret;
> +	}
> +
> +	ret = spinand_init(chip);
> +	if (ret)
> +		dev_err(chip->dev,
> +			"Init SPI NAND failed with error %d.\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spinand_register);
> +
> +/*
> + * spinand_unregister - [SPI NAND Interface] unregister SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +int spinand_unregister(struct spinand_device *chip)
> +{
> +	struct nand_device *nand = &chip->base;
> +
> +	nand_unregister(nand);

I realize nand_unregister() is not propagating the error returned by
mtd_device_unregister(), which is wrong. Can you fix that and make sure
you propagate the error here?

> +	spinand_manufacturer_cleanup(chip);
> +	devm_kfree(chip->dev, chip->buf);

Why calling devm_kfree() on something that will anyway be freed
automatically.

BTW, you should not allocate the buffer with devm_kzalloc(), just in
case some drivers want to use it for DMA accesses (see [1] for a
better explanation).

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spinand_unregister);

Sorry, I didn't have time to properly review your v4, and I realize
I'm not happy with these new spinand_register/unregister() functions.

I initially suggested to have a model where you register a SPI NAND
controller (spinand_controller_register()) and the core takes care of
populating the devices connected to this controller for you, I don't
think I suggested to add the spinand_register/unregister() helpers.
As initially replied to Arnaud, the introduction of
spinand_controller_register() is not a hard requirement, so let's keep
that for later.

Back to your spinand_register/unregister() functions. The main problem
I see is the fact that these functions are asymmetric:
spinand_unregister() path is calling nand_unregister() while
spinand_register() is not calling nand_register(). This kind of
asymmetry is disturbing and usually leads to bugs in drivers.

This leaves 2 solutions:

1/ only expose spinand_init/cleanup() functions (spinand_init() should
   call spinand_detect() in this case) and let the driver call
   mtd_device_register/unregister() manually
2/ call mtd_device_register() from spinand_register() even if this
   implies hardcoding advanced parameters like the default partitions
   of the part probe types

#1 is probably safer for now since SPI NAND controller drivers might
want to tweak the config set in spinand_init() (for example to pass
controller side ECC engine ops).

I still need to review the rest of the series carefully, so please don't
send a new version until this is done. Just ping me if you don't have
any news from me after 2 weeks ;).

Regards,

Boris

[1]https://lkml.org/lkml/2017/3/30/168
