Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJeLW-0006GD-Vo
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 10:42:07 +0000
Subject: Re: [PATCH V2 1/3] mtd: spi-nor: add support for macronix mx25u25635f
To: John Crispin <john@phrozen.org>, Marek Vasut <marek.vasut@gmail.com>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
 <1482304990-23942-2-git-send-email-john@phrozen.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Ash Benz
 <ash.benz@bk.ru>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <106376a8-bf2a-612c-cc4e-e41a2a245cea@atmel.com>
Date: Wed, 21 Dec 2016 11:41:43 +0100
MIME-Version: 1.0
In-Reply-To: <1482304990-23942-2-git-send-email-john@phrozen.org>
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

Hi all,

Le 21/12/2016 à 08:23, John Crispin a écrit :
> From: Ash Benz <ash.benz@bk.ru>
> 
> This patch adds support for a new macronix spi flash chip. We have had this
> patch inside our tree for a while and people are actively using routers
> with this chip.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ash Benz <ash.benz@bk.ru>
> ---
> Changes in V2
> * add description
> 
>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..171adb3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, 0) },

According to its datasheet, the Macronix MX25U25635F, like the MX25U3235F,
supports Fast Read 1-1-2 (3Bh) and Fast Read 1-1-4 (6Bh) hence both
SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags should be set too.

Also extracted from the datasheet:
"Equal Sectors with 4K byte each, or Equal Blocks with 32K byte each or
Equal Blocks with 64K byte each"

Sector Erase 4K (20h) is supported hence the SECT_4K flag.

Best regards,

Cyrille


>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> 
