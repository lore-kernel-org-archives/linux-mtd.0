Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coskp-0001Ds-Ka
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 14:21:22 +0000
Date: Fri, 17 Mar 2017 15:20:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v3 7/8] nand: spi: Add generic SPI controller support
Message-ID: <20170317152048.1eca677e@bbrezillon>
In-Reply-To: <1489646857-10112-8-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-8-git-send-email-peterpandong@micron.com>
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

On Thu, 16 Mar 2017 14:47:36 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit supports to use generic spi controller
> as spi nand controller.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/Kconfig                   |   2 +
>  drivers/mtd/nand/spi/Makefile                  |   1 +
>  drivers/mtd/nand/spi/controllers/Kconfig       |   5 +
>  drivers/mtd/nand/spi/controllers/Makefile      |   1 +
>  drivers/mtd/nand/spi/controllers/generic-spi.c | 158 +++++++++++++++++++++++++
>  5 files changed, 167 insertions(+)
>  create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
>  create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
>  create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c
> 
> diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
> index d77c46e..6bd1c65 100644
> --- a/drivers/mtd/nand/spi/Kconfig
> +++ b/drivers/mtd/nand/spi/Kconfig
> @@ -3,3 +3,5 @@ menuconfig MTD_SPI_NAND
>  	depends on MTD_NAND
>  	help
>  	  This is the framework for the SPI NAND device drivers.
> +
> +source "drivers/mtd/nand/spi/controllers/Kconfig"
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> index db0b91b..6ad5f24 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_MTD_SPI_NAND) += core.o
>  obj-$(CONFIG_MTD_SPI_NAND) += manufactures.o
>  obj-$(CONFIG_MTD_SPI_NAND) += micron.o
> +obj-$(CONFIG_MTD_SPI_NAND) += controllers/
> diff --git a/drivers/mtd/nand/spi/controllers/Kconfig b/drivers/mtd/nand/spi/controllers/Kconfig
> new file mode 100644
> index 0000000..8ab7023
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/controllers/Kconfig
> @@ -0,0 +1,5 @@
> +config GENERIC_SPI_NAND
> +	tristate "SPI NAND with generic SPI bus Support"
> +	depends on MTD_SPI_NAND && SPI
> +	help
> +	  This is to support SPI NAND device with generic SPI bus.
> diff --git a/drivers/mtd/nand/spi/controllers/Makefile b/drivers/mtd/nand/spi/controllers/Makefile
> new file mode 100644
> index 0000000..46cbf29
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/controllers/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_GENERIC_SPI_NAND) += generic-spi.o
> diff --git a/drivers/mtd/nand/spi/controllers/generic-spi.c b/drivers/mtd/nand/spi/controllers/generic-spi.c
> new file mode 100644
> index 0000000..38b4a56
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/controllers/generic-spi.c
> @@ -0,0 +1,158 @@
> +/*
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
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/spi/spi.h>
> +#include <linux/mtd/spinand.h>
> +
> +/*
> + * generic_spinand_cmd_fn - to process a command to send to the SPI NAND
> + * by generic SPI bus
> + * @chip: SPI NAND device structure
> + * @op: SPI NAND operation descriptor
> + */
> +static int generic_spinand_cmd_fn(struct spinand_device *chip,
> +				  struct spinand_op *op)

I'd prefer to see the controller word somewhere in the function name,
like gen_spinand_controller_exec_op().

> +{
> +	struct spi_message message;
> +	struct spi_transfer x[3];
> +	struct spi_device *spi = spinand_get_controller_data(chip);
> +
> +	spi_message_init(&message);
> +	memset(x, 0, sizeof(x));
> +	x[0].len = 1;
> +	x[0].tx_nbits = 1;
> +	x[0].tx_buf = &op->cmd;
> +	spi_message_add_tail(&x[0], &message);
> +
> +	if (op->n_addr + op->dummy_bytes) {
> +		x[1].len = op->n_addr + op->dummy_bytes;
> +		x[1].tx_nbits = op->addr_nbits;
> +		x[1].tx_buf = op->addr;
> +		spi_message_add_tail(&x[1], &message);
> +	}
> +	if (op->n_tx) {
> +		x[2].len = op->n_tx;
> +		x[2].tx_nbits = op->data_nbits;
> +		x[2].tx_buf = op->tx_buf;
> +		spi_message_add_tail(&x[2], &message);
> +	} else if (op->n_rx) {
> +		x[2].len = op->n_rx;
> +		x[2].rx_nbits = op->data_nbits;
> +		x[2].rx_buf = op->rx_buf;
> +		spi_message_add_tail(&x[2], &message);
> +	}
> +	return spi_sync(spi, &message);
> +}
> +
> +static struct spinand_controller_ops generic_spi_ops = {
> +	.exec_op = generic_spinand_cmd_fn,
> +};
> +
> +static int generic_spinand_probe(struct spi_device *spi)
> +{
> +	struct spinand_device *chip;
> +	struct mtd_info *mtd;
> +	struct spinand_controller *controller;
> +	struct spinand_ecc_engine *ecc_engine;
> +	int ret;
> +	u32 max_speed_hz = spi->max_speed_hz;
> +
> +	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
> +	if (!chip) {
> +		ret = -ENOMEM;
> +		goto err1;
> +	}
> +	mtd = spinand_to_mtd(chip);
> +	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> +	if (!controller) {
> +		ret = -ENOMEM;
> +		goto err2;
> +	}
> +	controller->ops = &generic_spi_ops;
> +	controller->caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
> +	if (spi->mode & SPI_RX_QUAD)
> +		controller->caps |= SPINAND_CAP_RD_QUAD | SPINAND_CAP_RD_X4;
> +	if (spi->mode & SPI_RX_DUAL)
> +		controller->caps |= SPINAND_CAP_RD_DUAL | SPINAND_CAP_RD_X2;
> +	if (spi->mode & SPI_TX_QUAD)
> +		controller->caps |= SPINAND_CAP_WR_QUAD | SPINAND_CAP_WR_X4;
> +	if (spi->mode & SPI_TX_DUAL)
> +		controller->caps |= SPINAND_CAP_WR_DUAL | SPINAND_CAP_WR_X2;
> +	chip->controller = controller;
> +	ecc_engine = kzalloc(sizeof(*ecc_engine), GFP_KERNEL);
> +	if (!ecc_engine) {
> +		ret = -ENOMEM;
> +		goto err3;
> +	}
> +	ecc_engine->mode = SPINAND_ECC_ONDIE;
> +	chip->ecc.engine = ecc_engine;

The ECC engine is on the chip, so you should let the core (or
manufacturer) code initialize it.

> +	spinand_set_controller_data(chip, spi);
> +	spi_set_drvdata(spi, chip);
> +	spi->max_speed_hz = min_t(int, 25000000, max_speed_hz);
> +	ret = spinand_detect(chip);
> +	if (ret)
> +		goto err4;
> +
> +	spi->max_speed_hz = max_speed_hz;
> +	ret = spinand_init(chip);
> +	if (ret)
> +		goto err5;
> +
> +	mtd_set_of_node(mtd, spi->dev.of_node);

Should be done before calling spinand_detect(), just in case some DT
props need to be parsed before the detection step.

This being said, I'm not sure we should let the spinand controller
driver do the registration step. I'm currently trying to rework the
parallel NAND framework to act like all other busses, and I think SPI
NAND controllers should also follow this road:

1/ spinand controller driver register a controller to the spinand core
  (spinand_controller_register())
2/ the core parses the DT (or board info if DT is not available) and
   creates N spinand devices (the N value depends on the number of SPI
   nands connected to the controller)
3/ for each spinand device the detection/initialization takes place
   directly in the core (the spinand_controller_ops should contain
   anything required to do the detection)
4/ for each spinand dev the spinand_controller_ops->add() is called, to
   let the controller driver attach private data to the device (if
   required), and/or let it use it's own ECC engine (optional as well).
5/ underlying MTD device registered by spinand core code and spinand
   dev added to the list of devices controlled by this controller (done
   in the core)

When removing a device, you just have the reverse steps:

1/ remove from list and unregister the MTD dev
2/ call spinand_controller_ops->remove()
3/ core/manufacturer cleanup

Not sure how feasible this is, especially for the generic SPI NAND
controller case where the SPI NAND controller does not have a node in
the DT, but that would avoid all this boiler-plate duplication we have
in the // NAND framework.

> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (!ret)
> +		return 0;
> +
> +err5:
> +	spinand_cleanup(chip);
> +err4:
> +	kfree(ecc_engine);
> +err3:
> +	kfree(controller);
> +err2:
> +	kfree(chip);
> +err1:
> +	return ret;
> +}
> +
> +static int generic_spinand_remove(struct spi_device *spi)
> +{
> +	struct spinand_device *chip = spi_get_drvdata(spi);
> +	struct mtd_info *mtd = spinand_to_mtd(chip);
> +
> +	mtd_device_unregister(mtd);
> +	spinand_cleanup(chip);
> +	kfree(chip->ecc.engine);
> +	kfree(chip->controller);
> +	kfree(chip);
> +
> +	return 0;
> +}
> +
> +static struct spi_driver generic_spinand_driver = {
> +	.driver = {
> +		.name	= "generic_spinand",
> +		.owner	= THIS_MODULE,
> +	},
> +	.probe	= generic_spinand_probe,
> +	.remove	= generic_spinand_remove,
> +};
> +module_spi_driver(generic_spinand_driver);
> +
> +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
> +MODULE_LICENSE("GPL v2");
