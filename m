Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEeFA-0001Y1-1p
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 17:11:49 +0000
Received: by mail-wr0-x243.google.com with SMTP id p18-v6so21831455wrm.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2018 10:11:28 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: add support for Microchip 25LC256
To: Radu Pirea <radu.pirea@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Zhiqiang.Hou@nxp.com, pp@emlix.com, richard@nod.at,
 boris.brezillon@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
References: <20180504155404.5285-1-radu.pirea@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d0d9d950-4566-40c6-a471-0ab6e3cc9524@gmail.com>
Date: Fri, 4 May 2018 19:11:25 +0200
MIME-Version: 1.0
In-Reply-To: <20180504155404.5285-1-radu.pirea@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/04/2018 05:54 PM, Radu Pirea wrote:
> Added geometry description for Microchip 25LC256 memory.

Are you sure this is a SPI NOR ? I don't see any RDID instruction in the
datasheet, only some 6 instructions to read/write the array and lock it.
Isn't the AT25 driver a better fit for this EEPROM ?

> Signed-off-by: Radu Pirea <radu.pirea@microchip.com>
> ---
>  drivers/mtd/devices/m25p80.c  | 3 +++
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index a4e18f6aaa33..1e359d811261 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -372,6 +372,9 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "mr25h10" },  /*   1 Mib, 40 MHz */
>  	{ "mr25h40" },  /*   4 Mib, 40 MHz */
>  
> +	/* Microchip */
> +	{ "25lc256" },
> +
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d445a4d3b770..6341c86be647 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1076,6 +1076,9 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>  
> +	/* Microchip */
> +	{ "25lc256", CAT25_INFO(32 * 1024, 1, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +
>  	/* Micron */
>  	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut
