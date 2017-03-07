Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clN8V-0001Bd-Rv
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 21:59:18 +0000
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1F71E5F63F
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 22:58:50 +0100 (CET)
Subject: Re: [PATCH v3] mtd: spi-nor: add support for GD25Q256
To: Andy Yan <andy.yan@rock-chips.com>, cyrille.pitchen@atmel.com,
 marek.vasut@gmail.com
References: <1487153738-1096-1-git-send-email-andy.yan@rock-chips.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <75bf48fe-e149-b101-5776-cef16baccda5@wedev4u.fr>
Date: Tue, 7 Mar 2017 22:58:40 +0100
MIME-Version: 1.0
In-Reply-To: <1487153738-1096-1-git-send-email-andy.yan@rock-chips.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andy,

Le 15/02/2017 à 11:15, Andy Yan a écrit :
> GD25Q256 is a 32MiB SPI Nor flash from Gigadevice.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - rebase on top of spi-nor tree
> - add SPI_NOR_4B_OPCODES flag
> 
> Changes in v2:
> - drop one line unnecessary modification
> 
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 70e52ff..34327ab 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -995,6 +995,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_4B_OPCODES)
> +	},

I didn't check in the GD25Q256 datasheet to confirm but I guess we
should also add the SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB info->flags as
for all other GigaDevice SPI NOR memories. Could you please check this
point?

Otherwise, the patch looks good and almost ready to be merged :)

Best regards,

Cyrille

>  
>  	/* Intel/Numonyx -- xxxs33b */
>  	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> 
