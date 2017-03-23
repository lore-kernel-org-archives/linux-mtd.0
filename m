Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr3Y3-0000cf-Qv
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 14:17:11 +0000
Subject: Re: [PATCH v4 8/9] nand: spi: Add generic SPI controller support
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-9-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Marek Vasut <marex@denx.de>
Message-ID: <ec582e0d-8aa3-0694-12ed-12173a436bcc@denx.de>
Date: Thu, 23 Mar 2017 12:33:39 +0100
MIME-Version: 1.0
In-Reply-To: <1490262226-29092-9-git-send-email-peterpandong@micron.com>
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

On 03/23/2017 10:43 AM, Peter Pan wrote:
> This commit supports to use generic spi controller
> as spi nand controller.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
[...]
> +static int gen_spi_spinand_probe(struct spi_device *spi)
> +{
> +	struct spinand_device *chip;
> +	struct gen_spi_spinand_controller *controller;
> +	struct spinand_controller *spinand_controller;
> +	int ret;
> +	u32 max_speed_hz = spi->max_speed_hz;
> +
> +	chip = spinand_alloc(&spi->dev);
> +	if (IS_ERR(chip)) {
> +		ret = PTR_ERR(chip);
> +		goto err1;
> +	}
> +	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> +	if (!controller) {
> +		ret = -ENOMEM;
> +		goto err2;
> +	}
> +	controller->spi = spi;
> +	spinand_controller = &controller->ctrl;
> +	spinand_controller->ops = &gen_spi_spinand_ops;
> +	spinand_controller->caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
> +	if (spi->mode & SPI_RX_QUAD)
> +		spinand_controller->caps |= SPINAND_CAP_RD_QUAD |
> +					    SPINAND_CAP_RD_X4;
> +	if (spi->mode & SPI_RX_DUAL)
> +		spinand_controller->caps |= SPINAND_CAP_RD_DUAL |
> +					    SPINAND_CAP_RD_X2;
> +	if (spi->mode & SPI_TX_QUAD)
> +		spinand_controller->caps |= SPINAND_CAP_WR_QUAD |
> +					    SPINAND_CAP_WR_X4;
> +	if (spi->mode & SPI_TX_DUAL)
> +		spinand_controller->caps |= SPINAND_CAP_WR_DUAL |
> +					    SPINAND_CAP_WR_X2;
> +	chip->controller.controller = spinand_controller;
> +	spi_set_drvdata(spi, chip);
> +	spi->max_speed_hz = min_t(int, 25000000, max_speed_hz);

Please avoid hard-coding random numbers, make the 25 MHz into a macro
and add a comment explaining why you use 25 MHz

> +
> +	ret = spinand_register(chip);
> +	if (ret)
> +		goto err3;
> +
> +	spi->max_speed_hz = max_speed_hz;
> +
> +	return 0;
> +
> +err3:
> +	kfree(controller);
> +err2:
> +	spinand_free(chip);
> +err1:
> +	return ret;
> +}
> +
> +static int gen_spi_spinand_remove(struct spi_device *spi)
> +{
> +	struct spinand_device *chip = spi_get_drvdata(spi);
> +
> +	spinand_unregister(chip);
> +	kfree(to_gen_spi_spinand_controller(chip->controller.controller));

This looks pretty awful, introduce a variable maybe ?

> +	spinand_free(chip);
> +
> +	return 0;
> +}
> +
> +static struct spi_driver gen_spi_spinand_driver = {
> +	.driver = {
> +		.name	= "generic_spinand",
> +		.owner	= THIS_MODULE,
> +	},
> +	.probe	= gen_spi_spinand_probe,
> +	.remove	= gen_spi_spinand_remove,
> +};
> +module_spi_driver(gen_spi_spinand_driver);
> +
> +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
> +MODULE_LICENSE("GPL v2");
> 


-- 
Best regards,
Marek Vasut
