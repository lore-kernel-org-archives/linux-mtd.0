Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YewSa-0000R7-78
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 02:08:20 +0000
Received: by pabsx10 with SMTP id sx10so29836233pab.3
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 19:07:59 -0700 (PDT)
Date: Sun, 5 Apr 2015 19:07:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Gabor Juhos <juhosg@openwrt.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for the Winbond W25X05 flash
Message-ID: <20150406020756.GN2677@norris-Latitude-E6410>
References: <1427410682-22753-1-git-send-email-juhosg@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427410682-22753-1-git-send-email-juhosg@openwrt.org>
Cc: Luka Perkov <luka@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2015 at 11:58:02PM +0100, Gabor Juhos wrote:
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Signed-off-by: Luka Perkov <luka@openwrt.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b6a5a0c..1f51924 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -648,6 +648,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
>  
>  	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
> +	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
>  	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
>  	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
>  	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },

Pushed to l2-mtd.git.

Brian
