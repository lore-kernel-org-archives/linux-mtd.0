Received: from smtp3-g21.free.fr ([212.27.42.3])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRJoa-0002UO-To
 for linux-mtd@lists.infradead.org; Tue, 19 Dec 2017 15:28:22 +0000
Subject: Re: [PATCH] mtd: spi-nor: Added ISSI is25lp080d support
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexander.sverdlin@nokia.com, pascal.fabreges@nokia.com
References: <20171219134325.3315-1-romain.porte@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <5078fce7-b4fe-dc4f-b5f7-a2c0b579714b@wedev4u.fr>
Date: Tue, 19 Dec 2017 16:27:59 +0100
MIME-Version: 1.0
In-Reply-To: <20171219134325.3315-1-romain.porte@nokia.com>
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

Hi Romain,

Le 19/12/2017 à 14:43, Romain Porte a écrit :
> This patch adds support for a new ISSI 1MB SPI NOR chip that was tested in our
> lab. Datasheet is available at: http://www.issi.com/WW/pdf/25LP-WP080D.pdf
> 
> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc266f70a15b..92cd62f02176 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1021,6 +1021,7 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ISSI */
>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> +	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16, SECT_4K) },
>

Based on the provided datasheet, both SPI_NOR_DUAL_READ (3Bh) and
SPI_NOR_QUAD_READ (6Bh) are missing. Besides adding at least one them will
enable the parsing of SFDP tables, which are also supported by this memory
part.

Then please add both SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ with SECT_4K.

Also, please rebase your patch on the spi-nor/next branch of l2-mtd (moving
to linux-mtd ?) as another patch has already added an entry for is25lp128

Best regards,

Cyrille
  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> 
