Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz0iw-0005CU-NV
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 12:53:17 +0000
Received: from player776.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1995B48D93
 for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2017 14:52:51 +0200 (CEST)
Subject: Re: [patchv4] mtd: mchp23k256: Add driver for this SPI SRAM device
To: Andrew Lunn <andrew@lunn.ch>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
References: <1492011271-15099-1-git-send-email-andrew@lunn.ch>
Cc: zajec5@gmail.com, linux-mtd@lists.infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <231d9be0-9843-1649-c34c-c44fab9c73fc@wedev4u.fr>
Date: Fri, 14 Apr 2017 14:52:43 +0200
MIME-Version: 1.0
In-Reply-To: <1492011271-15099-1-git-send-email-andrew@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/04/2017 à 17:34, Andrew Lunn a écrit :
> The Microchip 23k256 is a 32K Byte SRAM connected via SPI.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

> ---
> v4:
> Fix block comment format
> Fix parameter indentation
> Remove double blank line
> ---
>  drivers/mtd/devices/Kconfig      |  10 +++
>  drivers/mtd/devices/Makefile     |   1 +
>  drivers/mtd/devices/mchp23k256.c | 182 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/mtd/devices/mchp23k256.c
> 
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 58329d2dacd1..6def5445e03e 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -95,6 +95,16 @@ config MTD_M25P80
>  	  if you want to specify device partitioning or to use a device which
>  	  doesn't support the JEDEC ID instruction.
>  
> +config MTD_MCHP23K256
> +	tristate "Microchip 23K256 SRAM"
> +	depends on SPI_MASTER
> +	help
> +	  This enables access to Microchip 23K256 SRAM chips, using SPI.
> +
> +	  Set up your spi devices with the right board-specific
> +	  platform data, or a device tree description if you want to
> +	  specify device partitioning
> +
>  config MTD_SPEAR_SMI
>  	tristate "SPEAR MTD NOR Support through SMI controller"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
> index 7912d3a0ee34..f0f767624cc6 100644
> --- a/drivers/mtd/devices/Makefile
> +++ b/drivers/mtd/devices/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_MTD_LART)		+= lart.o
>  obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
>  obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
>  obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
> +obj-$(CONFIG_MTD_MCHP23K256)	+= mchp23k256.o
>  obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
>  obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
>  obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> new file mode 100644
> index 000000000000..ed3d1724e5de
> --- /dev/null
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -0,0 +1,182 @@
> +/*
> + * mchp23k256.c
> + *
> + * Driver for Microchip 23k256 SPI RAM chips
> + *
> + * Copyright © 20016 Andrew Lunn <andrew@lunn.ch>
> + *
> + * This code is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mutex.h>
> +#include <linux/sched.h>
> +#include <linux/sizes.h>
> +#include <linux/spi/flash.h>
> +#include <linux/spi/spi.h>
> +
> +struct mchp23k256_flash {
> +	struct spi_device	*spi;
> +	struct mutex		lock;
> +	struct mtd_info		mtd;
> +};
> +
> +#define MCHP23K256_CMD_WRITE_STATUS	0x01
> +#define MCHP23K256_CMD_WRITE		0x02
> +#define MCHP23K256_CMD_READ		0x03
> +#define MCHP23K256_MODE_SEQ		BIT(6)
> +
> +#define to_mchp23k256_flash(x) container_of(x, struct mchp23k256_flash, mtd)
> +
> +static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
> +			    size_t *retlen, const unsigned char *buf)
> +{
> +	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
> +	struct spi_transfer transfer[2] = {};
> +	struct spi_message message;
> +	unsigned char command[3];
> +
> +	spi_message_init(&message);
> +
> +	command[0] = MCHP23K256_CMD_WRITE;
> +	command[1] = to >> 8;
> +	command[2] = to;
> +
> +	transfer[0].tx_buf = command;
> +	transfer[0].len = sizeof(command);
> +	spi_message_add_tail(&transfer[0], &message);
> +
> +	transfer[1].tx_buf = buf;
> +	transfer[1].len = len;
> +	spi_message_add_tail(&transfer[1], &message);
> +
> +	mutex_lock(&flash->lock);
> +
> +	spi_sync(flash->spi, &message);
> +
> +	if (retlen && message.actual_length > sizeof(command))
> +		*retlen += message.actual_length - sizeof(command);
> +
> +	mutex_unlock(&flash->lock);
> +	return 0;
> +}
> +
> +static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
> +			   size_t *retlen, unsigned char *buf)
> +{
> +	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
> +	struct spi_transfer transfer[2] = {};
> +	struct spi_message message;
> +	unsigned char command[3];
> +
> +	spi_message_init(&message);
> +
> +	memset(&transfer, 0, sizeof(transfer));
> +	command[0] = MCHP23K256_CMD_READ;
> +	command[1] = from >> 8;
> +	command[2] = from;
> +
> +	transfer[0].tx_buf = command;
> +	transfer[0].len = sizeof(command);
> +	spi_message_add_tail(&transfer[0], &message);
> +
> +	transfer[1].rx_buf = buf;
> +	transfer[1].len = len;
> +	spi_message_add_tail(&transfer[1], &message);
> +
> +	mutex_lock(&flash->lock);
> +
> +	spi_sync(flash->spi, &message);
> +
> +	if (retlen && message.actual_length > sizeof(command))
> +		*retlen += message.actual_length - sizeof(command);
> +
> +	mutex_unlock(&flash->lock);
> +	return 0;
> +}
> +
> +/*
> + * Set the device into sequential mode. This allows read/writes to the
> + * entire SRAM in a single operation
> + */
> +static int mchp23k256_set_mode(struct spi_device *spi)
> +{
> +	struct spi_transfer transfer = {};
> +	struct spi_message message;
> +	unsigned char command[2];
> +
> +	spi_message_init(&message);
> +
> +	command[0] = MCHP23K256_CMD_WRITE_STATUS;
> +	command[1] = MCHP23K256_MODE_SEQ;
> +
> +	transfer.tx_buf = command;
> +	transfer.len = sizeof(command);
> +	spi_message_add_tail(&transfer, &message);
> +
> +	return spi_sync(spi, &message);
> +}
> +
> +static int mchp23k256_probe(struct spi_device *spi)
> +{
> +	struct mchp23k256_flash *flash;
> +	struct flash_platform_data *data;
> +	int err;
> +
> +	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
> +	if (!flash)
> +		return -ENOMEM;
> +
> +	flash->spi = spi;
> +	mutex_init(&flash->lock);
> +	spi_set_drvdata(spi, flash);
> +
> +	err = mchp23k256_set_mode(spi);
> +	if (err)
> +		return err;
> +
> +	data = dev_get_platdata(&spi->dev);
> +
> +	flash->mtd.dev.parent	= &spi->dev;
> +	flash->mtd.type		= MTD_RAM;
> +	flash->mtd.flags	= MTD_CAP_RAM;
> +	flash->mtd.writesize	= 1;
> +	flash->mtd.size		= SZ_32K;
> +	flash->mtd._read	= mchp23k256_read;
> +	flash->mtd._write	= mchp23k256_write;
> +
> +	err = mtd_device_parse_register(&flash->mtd, NULL, NULL,
> +					data ? data->parts : NULL,
> +					data ? data->nr_parts : 0);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int mchp23k256_remove(struct spi_device *spi)
> +{
> +	struct mchp23k256_flash *flash = spi_get_drvdata(spi);
> +
> +	return mtd_device_unregister(&flash->mtd);
> +}
> +
> +static struct spi_driver mchp23k256_driver = {
> +	.driver = {
> +		.name	= "mchp23k256",
> +	},
> +	.probe		= mchp23k256_probe,
> +	.remove		= mchp23k256_remove,
> +};
> +
> +module_spi_driver(mchp23k256_driver);
> +
> +MODULE_DESCRIPTION("MTD SPI driver for MCHP23K256 RAM chips");
> +MODULE_AUTHOR("Andrew Lunn <andre@lunn.ch>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:mchp23k256");
> 
