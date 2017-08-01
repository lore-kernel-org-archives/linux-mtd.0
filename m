Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcaMO-0004l8-M3
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 16:49:34 +0000
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: s25fl512s: Set a page size of 512
To: mark.marshall@omicronenergy.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 marek.vasut@gmail.com
Cc: richard@nod.at, dwmw2@infradead.org, markmarshall14@gmail.com,
 boris.brezillon@free-electrons.com
References: <cover.1487085166.git.mark.marshall@omicronenergy.com>
 <22ee35326eb763a0f7477c845838ef7aa1c8d1fd.1487085166.git.mark.marshall@omicronenergy.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <857dea0d-d982-1108-c411-dbeb0083035c@wedev4u.fr>
Date: Tue, 1 Aug 2017 18:49:08 +0200
MIME-Version: 1.0
In-Reply-To: <22ee35326eb763a0f7477c845838ef7aa1c8d1fd.1487085166.git.mark.marshall@omicronenergy.com>
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

Hi Mark,

Le 14/02/2017 à 16:35, mark.marshall@omicronenergy.com a écrit :
> From: Mark Marshall <mark.marshall@omicronenergy.com>
> 
> This device has a write page size of 512.  Changing this from 256 to 512
> almost doubles the write performance of the flash.

This issue should be fixed now parsing the SFDP tables of the s25fl512s
memory part. Indeed bits[7:4] of DWORD11 in the Basic Flash Parameter
Table encode the actual page size for Page Program operations.

This value overrides the one read from info->page_size.

Best regards,

Cyrille

> 
> Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 467dc93..ba4d7b7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1056,6 +1056,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25fl256s0", INFO(JEDEC_ID(0x010219, 0x4d00, 2), 256 * 1024, 128, 0) },
>  	{ "s25fl256s1", INFO(JEDEC_ID(0x010219, 0x4d01, 2),  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl512s",  INFO(JEDEC_ID(0x010220, 0x4d00, 2), 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "s25fl512s",  INFO_FULL(JEDEC_ID(0x010220, 0x4d00, 2),
> +				  256 * 1024, 256, 512, 0, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s70fl01gs",  INFO(JEDEC_ID(0x010221, 0x4d00, 2), 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(JEDEC_ID(0x012018, 0x0300, 2), 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(JEDEC_ID(0x012018, 0x0301, 2),  64 * 1024, 256, 0) },
> 
