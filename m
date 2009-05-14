Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4TEs-0007EQ-La
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 05:12:21 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
Date: Wed, 13 May 2009 22:12:11 -0700
References: <>
	<1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905132212.11923.david-b@pacbell.net>
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 May 2009, Troy Kisky wrote:
> atmel should not need to override default

Doesn't this break compatibility with every system now
in the field?  As in, "install a new kernel, trash all
the data now in your NAND flash"??


> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
> ---
>  drivers/mtd/nand/atmel_nand.c |   34 ----------------------------------
>  1 files changed, 0 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 7b52637..8537e86 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -55,32 +55,6 @@
>  
>  #include "atmel_nand_ecc.h"	/* Hardware ECC registers */
>  
> -/* oob layout for large page size
> - * bad block info is on bytes 0 and 1
> - * the bytes have to be consecutives to avoid
> - * several NAND_CMD_RNDOUT during read
> - */
> -static const struct nand_ecclayout atmel_oobinfo_large __initdata = {
> -	.eccbytes = 4,
> -	.eccpos = {60, 61, 62, 63},
> -	.oobfree = {
> -		{2, 58}
> -	},
> -};
> -
> -/* oob layout for small page size
> - * bad block info is on bytes 4 and 5
> - * the bytes have to be consecutives to avoid
> - * several NAND_CMD_RNDOUT during read
> - */
> -static const struct nand_ecclayout atmel_oobinfo_small __initdata = {
> -	.eccbytes = 4,
> -	.eccpos = {0, 1, 2, 3},
> -	.oobfree = {
> -		{6, 10}
> -	},
> -};
> -
>  struct atmel_nand_host {
>  	struct nand_chip	nand_chip;
>  	struct mtd_info		mtd;
> @@ -477,23 +451,15 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
>  		/* set ECC page size and oob layout */
>  		switch (mtd->writesize) {
>  		case 512:
> -			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_small,
> -					sizeof(nand_chip->ecc.layout));
>  			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_528);
>  			break;
>  		case 1024:
> -			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
> -					sizeof(nand_chip->ecc.layout));
>  			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_1056);
>  			break;
>  		case 2048:
> -			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
> -					sizeof(nand_chip->ecc.layout));
>  			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
>  			break;
>  		case 4096:
> -			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
> -					sizeof(nand_chip->ecc.layout));
>  			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_4224);
>  			break;
>  		default:
> -- 
> 1.5.4.3
> 
> 
