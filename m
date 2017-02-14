Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdVIj-0007al-OV
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 05:05:20 +0000
Received: by mail-wr0-x243.google.com with SMTP id i10so26248134wrb.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2017 21:04:56 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: add support for GD25Q256
To: Andy Yan <andy.yan@rock-chips.com>, cyrille.pitchen@atmel.com
References: <1487032584-3990-1-git-send-email-andy.yan@rock-chips.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8f6ea8a6-df54-5c4a-d5ea-fbee110491df@gmail.com>
Date: Tue, 14 Feb 2017 05:44:33 +0100
MIME-Version: 1.0
In-Reply-To: <1487032584-3990-1-git-send-email-andy.yan@rock-chips.com>
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

On 02/14/2017 01:36 AM, Andy Yan wrote:
> GD25Q256 is a 32MiB SPI Nor flash from Gigadevice.

That's great, and what is this patch doing with it ? Adding support for
it, right? Then it should be in the commit message.

> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/spi-nor/spi-nor.c
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> old mode 100644
> new mode 100755
> index da7cd69..0917dd3
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -852,6 +852,10 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +	},
>  
>  	/* Intel/Numonyx -- xxxs33b */
>  	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> @@ -1483,7 +1487,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	else if (mtd->size > 0x1000000) {
>  		/* enable 4-byte addressing if the device exceeds 16MiB */
>  		nor->addr_width = 4;
> -		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
> +		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
> +		    JEDEC_MFR(info) == SNOR_MFR_GIGADEVICE) {
>  			/* Dedicated 4-byte command set */
>  			switch (nor->flash_read) {
>  			case SPI_NOR_QUAD:
> @@ -1519,7 +1524,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);
> -

Drop this one new line.

>  	dev_dbg(dev,
>  		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
>  		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
> 


-- 
Best regards,
Marek Vasut
