Received: from 11.mo6.mail-out.ovh.net ([188.165.38.119])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNRzr-0000eW-3V
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 22:51:45 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 87E65ED8A8
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 00:51:05 +0200 (CEST)
Subject: Re: [PATCH 2/4] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Robert Lippert <rlippert@google.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Robert Lippert <roblip@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-3-git-send-email-clg@kaod.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <38e7d4b9-9a0b-301a-ad06-3716a1ee91e0@wedev4u.fr>
Date: Wed, 21 Jun 2017 00:50:54 +0200
MIME-Version: 1.0
In-Reply-To: <1492689397-4704-3-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cédric,


Le 20/04/2017 à 13:56, Cédric Le Goater a écrit :
> From: Robert Lippert <roblip@gmail.com>
> 
> Implements support for the dual IO read mode on aspeed SMC/FMC
> controllers which uses both MISO and MOSI lines for data during a read
> to double the read bandwidth.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> [clg: adapted to mainline driver ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 2940f2098420..183d950e621b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -372,12 +372,20 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>  	struct aspeed_smc_chip *chip = nor->priv;
>  	int i;
>  	u8 dummy = 0xFF;
> +	u32 ctl;
>  
>  	aspeed_smc_start_user(nor);
>  	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>  	for (i = 0; i < chip->nor.read_dummy / 8; i++)
>  		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
>  
> +	if (chip->nor.flash_read == SPI_NOR_DUAL) {
> +		/* Switch to dual I/O mode for data cycle */
> +		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
> +		ctl |= CONTROL_IO_DUAL_DATA;
> +		writel(ctl, chip->ctl);
> +	}
> +

As expected this patch doesn't apply as is to the spi-nor/next branch of
l2-mtd because flash_read and SPI_NOR_{DUAL|QUAD} enums no longer exists.

Besides it looks like the Aspeed controller can support SPI 1-2-2 as
well as SPI 1-1-2.

I see:
#define CONTROL_IO_DUAL_DATA		BIT(29)
#define CONTROL_IO_DUAL_ADDR_DATA	(BIT(29) | BIT(28))

Now spi_nor_scan() makes the difference between these 2 SPI protocols.

Besides, you may also want to use the compatible DT string to make the
difference between Aspeed controllers also supporting SPI 1-1-4 and SPI
1-4-4 and other controllers supporting only Dual SPI protocols so you
could fill the hwcaps parameter of spi_nor_scan() as needed.

So I think we should spend a little more time to rework this patch.

Best regards,

Cyrille


>  	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>  	aspeed_smc_stop_user(nor);
>  	return len;
> @@ -591,6 +599,9 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>  	case SPI_NOR_FAST:
>  		cmd = CONTROL_COMMAND_MODE_FREAD;
>  		break;
> +	case SPI_NOR_DUAL:
> +		cmd = CONTROL_COMMAND_MODE_FREAD | CONTROL_IO_DUAL_DATA;
> +		break;
>  	default:
>  		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>  		return -EINVAL;
> @@ -599,7 +610,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>  	chip->ctl_val[smc_read] |= cmd |
>  		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
>  
> -	dev_dbg(controller->dev, "base control register: %08x\n",
> +	dev_dbg(controller->dev, "read control register: %08x\n",
>  		chip->ctl_val[smc_read]);
>  	return 0;
>  }
> @@ -670,11 +681,9 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>  			break;
>  
>  		/*
> -		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
> -		 * attach when board support is present as determined
> -		 * by of property.
> +		 * Aspeed SoCs only support Dual mode
>  		 */
> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
>  		if (ret)
>  			break;
>  
> 
