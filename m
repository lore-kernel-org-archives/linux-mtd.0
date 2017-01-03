Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOEpS-0001Lp-6N
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 02:27:59 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so84474767wma.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jan 2017 18:27:36 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: Add lock/unlock support for f25l32pa
To: Victor Shyba <victor1984@riseup.net>, linux-mtd@lists.infradead.org
References: <1483407270-4323-1-git-send-email-victor1984@riseup.net>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <93b708da-e6f4-edec-5ae7-3a95e8565bc1@gmail.com>
Date: Tue, 3 Jan 2017 03:10:52 +0100
MIME-Version: 1.0
In-Reply-To: <1483407270-4323-1-git-send-email-victor1984@riseup.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/03/2017 02:34 AM, Victor Shyba wrote:
> This chip has write protection enabled on power-up,
> so this flag is necessary to support write operations.
> 
> Signed-off-by: Victor Shyba <victor1984@riseup.net>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

I guess it can also be added for stable.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69..f325925 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -821,7 +821,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
>  
>  	/* ESMT */
> -	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
> +	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
>  
>  	/* Everspin */
>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 


-- 
Best regards,
Marek Vasut
