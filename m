Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayUgP-0002yZ-6T
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 01:35:58 +0000
Message-ID: <572BF4E2.1040106@denx.de>
Date: Fri, 06 May 2016 03:35:30 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: spi-nor: support GigaDevice gd25lq64c
References: <1462496421-76186-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462496421-76186-1-git-send-email-computersforpeace@gmail.com>
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

On 05/06/2016 03:00 AM, Brian Norris wrote:
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -832,6 +832,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	/* GigaDevice */
>  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128, SECT_4K | SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

It's enough to use one SECT_4K , it will work just fine :-)

>  	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },


-- 
Best regards,
Marek Vasut
