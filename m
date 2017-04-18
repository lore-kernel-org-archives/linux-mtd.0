Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0NaL-0001n9-W2
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 07:30:03 +0000
Date: Tue, 18 Apr 2017 09:29:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 1/6] nand: spi: add basic blocks for infrastructure
Message-ID: <20170418092940.522154c5@bbrezillon>
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
> + * spinand_alloc - [SPI NAND Interface] allocate SPI NAND device instance
> + * @dev: pointer to device model structure
> + */
> +struct spinand_device *spinand_alloc(struct device *dev)

Since you're using devm_kzalloc() here, can we rename the function
devm_spinand_alloc()?

> +{
> +	struct spinand_device *chip;
> +	struct mtd_info *mtd;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spinand_set_of_node(chip, dev->of_node);
> +	mutex_init(&chip->lock);
> +	chip->dev = dev;
> +	mtd = spinand_to_mtd(chip);
> +	mtd->dev.parent = dev;
> +
> +	return chip;
> +}
> +EXPORT_SYMBOL_GPL(spinand_alloc);
