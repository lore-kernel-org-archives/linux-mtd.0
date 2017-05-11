Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8rhH-0006d9-CC
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 17:16:16 +0000
Received: by mail-pf0-x243.google.com with SMTP id u26so3934026pfd.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 10:15:54 -0700 (PDT)
Date: Thu, 11 May 2017 10:15:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [patchv4] mtd: mchp23k256: Add driver for this SPI SRAM device
Message-ID: <20170511171551.GF70297@google.com>
References: <1492011271-15099-1-git-send-email-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1492011271-15099-1-git-send-email-andrew@lunn.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Apr 12, 2017 at 05:34:31PM +0200, Andrew Lunn wrote:
> The Microchip 23k256 is a 32K Byte SRAM connected via SPI.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

I've applied this to l2-mtd.git/next, for 4.13, with one small tweak,
and some other small comments below.

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

...

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

Whoa, you have a time machine, and you used it to write this driver??
I'm in awe!

I've deleted a zero from this :)

> + *
> + * This code is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */

...

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

Isn't this memset redundant, since you're initialized the struct above?

(I haven't touched this when applying.)

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

...

Brian
