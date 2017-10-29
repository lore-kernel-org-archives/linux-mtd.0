Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8tf9-0005wx-NE
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 19:54:29 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: fix style issue
To: Philipp Puschmann <pp@emlix.com>, linux-mtd@lists.infradead.org
References: <20171019081231.5394-1-pp@emlix.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <a2490f9c-a85f-e294-61d1-4e37ff81cc1b@wedev4u.fr>
Date: Sun, 29 Oct 2017 20:54:04 +0100
MIME-Version: 1.0
In-Reply-To: <20171019081231.5394-1-pp@emlix.com>
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

Hi Philipp

Le 19/10/2017 à 10:12, Philipp Puschmann a écrit :
> Fixed a space coding style issue, found via checkpatch.
> 
> Signed-off-by: Philipp Puschmann <pp@emlix.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 19c000722cbc..386de64e5a86 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -964,7 +964,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
>  
>  	/* Everspin */
> -	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },

Indeed, submitted patches should always pass the checkpatch test but
let's say entries of the spi_nor_ids[] are are exceptions here: it is
more easy to read if data are aligned hence I won't apply this patch.

Best regards,

Cyrille

>  	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  
> 
