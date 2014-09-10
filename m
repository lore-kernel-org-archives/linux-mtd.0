Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRjOZ-0002SK-2L
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 15:01:20 +0000
From: Marek Vasut <marex@denx.de>
To: Rostislav Lisovy <lisovy@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for Fujitsu MB85RS1MT FRAM
Date: Wed, 10 Sep 2014 16:55:19 +0200
References: <1410339230-13007-1-git-send-email-lisovy@merica.cz>
In-Reply-To: <1410339230-13007-1-git-send-email-lisovy@merica.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409101655.19155.marex@denx.de>
Cc: Rostislav Lisovy <lisovy@merica.cz>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 michal.vokac@comap.cz, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, September 10, 2014 at 10:53:50 AM, Rostislav Lisovy wrote:
> Tested with this particular FRAM chip
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b5ad6be..a914be9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -505,6 +505,9 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) }, { "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3,
> SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
> +	/* Fujitsu */
> +	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
> +
>  	/* GigaDevice */
>  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },

Looks OK,

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
