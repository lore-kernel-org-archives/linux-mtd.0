Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNE3r-00034D-9d
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 07:58:58 +0000
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 018687E0C5
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 09:58:26 +0200 (CEST)
Subject: Re: [PATCH v3] spi-nor: Add Winbond w25q512jv
To: Joel Stanley <joel@jms.id.au>, Marek Vasut <marek.vasut@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20170620062028.7520-1-joel@jms.id.au>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1612427b-ac29-6c7a-5111-be6087421f35@wedev4u.fr>
Date: Tue, 20 Jun 2017 09:58:17 +0200
MIME-Version: 1.0
In-Reply-To: <20170620062028.7520-1-joel@jms.id.au>
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

Hi all,

Le 20/06/2017 à 08:20, Joel Stanley a écrit :
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Similar to the other ones, different size. The "JV" suffix is in
> the datasheet, I haven't seen mentions of a different one.
> 
> The the datasheet indicates DUAL and QUAD are supported.
> 
> http://www.winbond.com/resource-files/w25m512jv%20revc%2001062017.pdf
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>  - Added the DUAL and QUAD flags for ben. Tested with aspeed-smc driver.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index eef55b597ec7..ad46dc82c8d1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1146,6 +1146,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
> +	{ "w25q512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
> +			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>

This looks good, I'll try to apply it this evening.

Best regards,

Cyrille

>  	/* Catalyst / On Semiconductor -- non-JEDEC */
>  	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
