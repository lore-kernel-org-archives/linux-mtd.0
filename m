Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnZyo-00008Y-Rp
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 14:25:35 +0000
Message-ID: <48ECC2D9.1070606@teltonika.lt>
Date: Wed, 08 Oct 2008 17:25:29 +0300
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
References: <48EC4CC5.5030809@compulab.co.il>
In-Reply-To: <48EC4CC5.5030809@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	Ben Dooks <ben-linux-arm@fluff.org>, David Woodhouse <dwmw2@infradead.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Rapoport wrote:
> David,
> Can you please review and ACK the below patch?
> 
> The patch adds support for NAND flashes connected to GPIOs.
> 
>  drivers/mtd/nand/Kconfig      |    6 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/gpio.c       |  367 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand-gpio.h |   19 ++
>  4 files changed, 393 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 41f361c..73e7a6e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -56,6 +56,12 @@ config MTD_NAND_H1900
>  	help
>  	  This enables the driver for the iPAQ h1900 flash.
> 
> +config MTD_NAND_GPIO
> +	tristate "GPIO NAND Flash driver"
> +	depends on ARM

&& GENERIC_GPIO

> +	help
> +	  This enables a GPIO based NAND flash driver.
> +
>  config MTD_NAND_SPIA
>  	tristate "NAND Flash device on SPIA board"
>  	depends on ARCH_P720T
