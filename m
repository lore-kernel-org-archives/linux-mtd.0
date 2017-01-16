Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTBez-0000z1-Bx
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 18:05:39 +0000
Received: by mail-lf0-x243.google.com with SMTP id x1so8286423lff.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 10:05:16 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix mr25h* definitions
To: Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <20170116151214.11195-2-bst@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <371bf936-b854-68a1-2c65-69e426ad3aa3@gmail.com>
Date: Mon, 16 Jan 2017 17:07:17 +0100
MIME-Version: 1.0
In-Reply-To: <20170116151214.11195-2-bst@pengutronix.de>
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

On 01/16/2017 04:12 PM, Bastian Stender wrote:
> The previous definitions for mr25h* chips lead to unnecessary limits
> regarding writesize and eraseblocksize for MRAM. MRAM is random access
> memory rather than page, sector, or block organized memory.
> 
> Instead of 1 sector with 512KB the mr25h40 MRAM chip should be defined
> as 512K sectors with 1 byte each. This makes it writesize and
> eraseblocksize aligned and reflects MRAM functionality properly.

Wouldn't this degrade the performance ? ie. if you write the flash, it
will send PP opcode + 1 byte in a loop, right ?

> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c8399522c69d..6a39b18baa70 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -824,9 +824,9 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
>  
>  	/* Everspin */
> -	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> -	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> -	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +	{ "mr25h256", CAT25_INFO(1,  32 * 1024, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +	{ "mr25h10",  CAT25_INFO(1, 128 * 1024, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +	{ "mr25h40",  CAT25_INFO(1, 512 * 1024, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  
>  	/* Fujitsu */
>  	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
> 


-- 
Best regards,
Marek Vasut
