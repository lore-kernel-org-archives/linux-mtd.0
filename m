Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cyByW-0001IL-GL
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 06:41:58 +0000
Date: Wed, 12 Apr 2017 08:41:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, zajec5@gmail.com
Subject: Re: [PATCH v3] mtd: mchp23k256: Add driver for this SPI SRAM device
Message-ID: <20170412084122.35740e82@bbrezillon>
In-Reply-To: <1491946212-9226-1-git-send-email-andrew@lunn.ch>
References: <1491946212-9226-1-git-send-email-andrew@lunn.ch>
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

On Tue, 11 Apr 2017 23:30:12 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> The Microchip 23k256 is a 32K Byte SRAM connected via SPI.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

3 minor things I didn't spot in my previous review.

[...]
> +static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
> +		       size_t *retlen, unsigned char *buf)

Align 'size_t *retlen' to the open parenthesis.

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
> +/* Set the device into sequential mode. This allows read/writes to

/*
 * Set the device ...

> + * the entire SRAM in a single operation
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
> +

Remove these 2 extra empty lines.

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
