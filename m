Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC607-0002FS-55
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 14:36:48 +0000
Subject: Re: [PATCH] mtd: spi-nor: cqspi: Fix build on arches missing
 readsl/writesl
To: Marek Vasut <marex@denx.de>, <linux-mtd@lists.infradead.org>
References: <1470143447-11351-1-git-send-email-marex@denx.de>
CC: Vignesh R <vigneshr@ti.com>, Alan Tull <atull@opensource.altera.com>,
 "Yves Vandervennet" <yvanderv@opensource.altera.com>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Graham Moore
 <grmoore@opensource.altera.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <8b6cd0fa-70d3-34e9-404a-c9c591a2f59c@atmel.com>
Date: Wed, 30 Nov 2016 15:36:23 +0100
MIME-Version: 1.0
In-Reply-To: <1470143447-11351-1-git-send-email-marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 02/08/2016 à 15:10, Marek Vasut a écrit :
> The x86-64 and some other architectures are missing readsl/writesl
> functions, so this driver won't build on them. Use a more portable
> ioread32_rep()/iowrite32_rep() instead.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Suggested-by: Stefan Roese <sr@denx.de>
Applied to git://github.com/spi-nor/linux.git

Thanks!

> ---
>  drivers/mtd/spi-nor/Kconfig           | 2 +-
>  drivers/mtd/spi-nor/cadence-quadspi.c | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 4a682ee..1e6f037 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -40,7 +40,7 @@ config SPI_ATMEL_QUADSPI
>  
>  config SPI_CADENCE_QUADSPI
>  	tristate "Cadence Quad SPI controller"
> -	depends on OF && ARM
> +	depends on OF && (ARM || COMPILE_TEST)
>  	help
>  	  Enable support for the Cadence Quad SPI Flash controller.
>  
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index d403ba7..08c9483 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -526,7 +526,8 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor,
>  			bytes_to_read *= cqspi->fifo_width;
>  			bytes_to_read = bytes_to_read > remaining ?
>  					remaining : bytes_to_read;
> -			readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
> +			ioread32_rep(ahb_base, rxbuf,
> +				     DIV_ROUND_UP(bytes_to_read, 4));
>  			rxbuf += bytes_to_read;
>  			remaining -= bytes_to_read;
>  			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> @@ -610,7 +611,8 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor,
>  
>  	while (remaining > 0) {
>  		write_bytes = remaining > page_size ? page_size : remaining;
> -		writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
> +		iowrite32_rep(cqspi->ahb_base, txbuf,
> +			      DIV_ROUND_UP(write_bytes, 4));
>  
>  		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
>  						  msecs_to_jiffies
> 
