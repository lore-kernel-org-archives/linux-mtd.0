Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Nm0-00026i-4U
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 07:42:06 +0000
Date: Tue, 18 Apr 2017 09:41:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marex@denx.de>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
Subject: Re: [PATCH v5 5/6] nand: spi: Add generic SPI controller support
Message-ID: <20170418094142.5d4d38b6@bbrezillon>
In-Reply-To: <93510c4d-9d48-f37b-21de-5fd532072b4c@denx.de>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-6-git-send-email-peterpandong@micron.com>
 <93510c4d-9d48-f37b-21de-5fd532072b4c@denx.de>
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

On Fri, 14 Apr 2017 15:26:24 +0200
Marek Vasut <marex@denx.de> wrote:

> On 04/10/2017 09:51 AM, Peter Pan wrote:
> > This commit supports to use generic spi controller
> > as spi nand controller.
> > 
> > Signed-off-by: Peter Pan <peterpandong@micron.com>
> > ---
> >  drivers/mtd/nand/spi/Kconfig                   |   2 +
> >  drivers/mtd/nand/spi/Makefile                  |   1 +
> >  drivers/mtd/nand/spi/controllers/Kconfig       |   5 +
> >  drivers/mtd/nand/spi/controllers/Makefile      |   1 +
> >  drivers/mtd/nand/spi/controllers/generic-spi.c | 159 +++++++++++++++++++++++++
> >  5 files changed, 168 insertions(+)
> >  create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
> >  create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
> >  create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c  
> 
> [...]
> 
> > +static int gen_spi_spinand_probe(struct spi_device *spi)
> > +{
> > +	struct spinand_device *chip;
> > +	struct gen_spi_spinand_controller *controller;
> > +	struct spinand_controller *spinand_controller;
> > +	struct device *dev = &spi->dev;
> > +	u16 mode = spi->mode;
> > +	int ret;
> > +
> > +	chip = spinand_alloc(dev);
> > +	if (IS_ERR(chip)) {
> > +		ret = PTR_ERR(chip);
> > +		goto err1;
> > +	}  
> 
> Would it make sense to embed the struct spinand_device into struct
> gen_spi_nand_controller , so you'd get rid of one allocation ?

I have other plans. I'd like drivers to only register their
SPI NAND controller, and let the core parse the DT (or board info) to
create the spinand devices and inform the controller that a new device
is being added (using a ->add() hook).

With this model, the core does not know anything about driver-specific
private data, and thus has to allocate a spinand device no matter what.

Even if we're not here yet, I'd like to keep that in mind, and already
force SPI NAND controller drivers to use spinand_alloc instead of
embedding the struct.

> 
> > +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> > +	if (!controller) {
> > +		ret = -ENOMEM;
> > +		goto err2;
> > +	}
> > +	controller->spi = spi;
> > +	spinand_controller = &controller->ctrl;
> > +	spinand_controller->ops = &gen_spi_spinand_ops;
> > +	spinand_controller->caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
> > +
> > +	if ((mode & SPI_RX_QUAD) && (mode & SPI_TX_QUAD))
> > +		spinand_controller->caps |= SPINAND_CAP_RD_QUAD;
> > +	if ((mode & SPI_RX_DUAL) && (mode & SPI_TX_DUAL))
> > +		spinand_controller->caps |= SPINAND_CAP_RD_DUAL;
> > +	if (mode & SPI_RX_QUAD)
> > +		spinand_controller->caps |= SPINAND_CAP_RD_X4;
> > +	if (mode & SPI_RX_DUAL)
> > +		spinand_controller->caps |= SPINAND_CAP_RD_X2;
> > +	if (mode & SPI_TX_QUAD)
> > +		spinand_controller->caps |= SPINAND_CAP_WR_QUAD |
> > +					    SPINAND_CAP_WR_X4;
> > +	if (mode & SPI_TX_DUAL)
> > +		spinand_controller->caps |= SPINAND_CAP_WR_DUAL |
> > +					    SPINAND_CAP_WR_X2;
> > +	chip->controller.controller = spinand_controller;
> > +	/*
> > +	 * generic spi controller doesn't have ecc capability,
> > +	 * so use on-die ecc.
> > +	 */
> > +	chip->ecc.type = SPINAND_ECC_ONDIE;
> > +	spi_set_drvdata(spi, chip);
> > +
> > +	ret = spinand_register(chip);
> > +	if (ret)
> > +		goto err3;
> > +
> > +	return 0;
> > +
> > +err3:
> > +	devm_kfree(dev, controller);
> > +err2:
> > +	spinand_free(chip);
> > +err1:
> > +	return ret;
> > +}
> > +
> > +static int gen_spi_spinand_remove(struct spi_device *spi)
> > +{
> > +	struct spinand_device *chip = spi_get_drvdata(spi);
> > +	struct spinand_controller *scontroller = chip->controller.controller;
> > +	struct gen_spi_spinand_controller *controller;
> > +
> > +	spinand_unregister(chip);
> > +	controller = to_gen_spi_spinand_controller(scontroller);
> > +	devm_kfree(&spi->dev, controller);
> > +	spinand_free(chip);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct spi_driver gen_spi_spinand_driver = {
> > +	.driver = {
> > +		.name	= "generic_spinand",
> > +		.owner	= THIS_MODULE,
> > +	},
> > +	.probe	= gen_spi_spinand_probe,
> > +	.remove	= gen_spi_spinand_remove,
> > +};
> > +module_spi_driver(gen_spi_spinand_driver);
> > +
> > +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
> > +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
> > +MODULE_LICENSE("GPL v2");
> >   
> 
> 
