Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clVOW-0006VH-9p
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 06:48:22 +0000
Received: by mail-lf0-x244.google.com with SMTP id v2so1686704lfi.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2017 22:47:58 -0800 (PST)
Subject: Re: [PATCH] mtd: mchp23k256: Add driver for this SPI SRAM device
To: Andrew Lunn <andrew@lunn.ch>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
References: <1488823117-30270-1-git-send-email-andrew@lunn.ch>
Cc: linux-mtd@lists.infradead.org
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <e837a6f9-b6b3-1215-6d8c-90b3d5a3f607@gmail.com>
Date: Wed, 8 Mar 2017 07:47:55 +0100
MIME-Version: 1.0
In-Reply-To: <1488823117-30270-1-git-send-email-andrew@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/06/2017 06:58 PM, Andrew Lunn wrote:
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> new file mode 100644
> index 000000000000..482a101fe887
> --- /dev/null
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -0,0 +1,183 @@
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

So is this driver GPL v2 licensed?


> +/* Set the device into sequential mode. This allows read/writes to
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
> +
> +static int mchp23k256_probe(struct spi_device *spi)

Just one empty line between functions please.


> +MODULE_DESCRIPTION("MTD SPI driver for MCHP23K256 RAM chips");
> +MODULE_AUTHOR("Andrew Lunn <andre@lunn.ch>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("spi:mchp23k256");

Or is it GPL v2 or later? Please pick one and be consistent.
