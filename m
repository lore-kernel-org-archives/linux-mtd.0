Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMwFe-0004ch-4L
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 14:02:27 +0000
Received: by mail-wr0-x243.google.com with SMTP id w7-v6so4297961wrn.6
 for <linux-mtd@lists.infradead.org>; Sun, 27 May 2018 07:02:15 -0700 (PDT)
Subject: Re: [PATCH] new NOR flash winbond w25q16jv, jedec code 0xef7015
To: Johannes Poehlmann <johannes.poehlmann@izt-labs.de>,
 linux-mtd@lists.infradead.org
References: <20180525144811.GA27270@ppcx2.izt.loc>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d98357d1-7cdd-2a01-e1d9-06dbe3be9e36@gmail.com>
Date: Sun, 27 May 2018 14:49:35 +0200
MIME-Version: 1.0
In-Reply-To: <20180525144811.GA27270@ppcx2.izt.loc>
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

On 05/25/2018 04:48 PM, Johannes Poehlmann wrote:
> Copy values from jedec code 0xef4015, which is also the jedec code
> of Winbond w25q16db. w25q16jv is presented as follow up type in the
> data sheet. w25q16jv works with this patch.
> 
> Signed-off-by: Johannes Poehlmann <johannes.poehlmann@izt-labs.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e..9bac67b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1188,6 +1188,7 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{ "w25q16jv", INFO(0xef7015, 0, 64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

What about HAS_LOCK and HAS_TB ? Looks good otherwise.

>  	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
>  	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
> 


-- 
Best regards,
Marek Vasut
