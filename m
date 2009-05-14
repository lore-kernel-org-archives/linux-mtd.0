Received: from n26.bullet.mail.mud.yahoo.com ([68.142.206.221])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4TKx-0006zX-U3
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 05:18:50 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH 4/5] mtd: nand: cafe_nand: use default ecc layout
Date: Wed, 13 May 2009 22:18:28 -0700
References: <>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905132218.28687.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 May 2009, Troy Kisky wrote:
> The bad block marker is at 14, but oobfree also
> starts at 14. This doesn't make sense to me,

On-chip bad-block tables stick the "Bbt0" (etc)
tags into the OOB data area, and don't need to
share that area with anything else.  It's OK.


> so I don't know if this patch is good or not.

Isn't this one of the drivers using NAND_ECC_HW_SYNDROME?
So that the ecclayout is fully defined by prepad==0?

This is a case where you *could* safely generate the
current ecclayout structs using simple rules.


> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
> ---
>  drivers/mtd/nand/cafe_nand.c |   16 ----------------
>  1 files changed, 0 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index c6c7f51..6048bd9 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -456,12 +456,6 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	return 0;
>  }
>  
> -static const struct nand_ecclayout cafe_oobinfo_2048 __devinitdata = {
> -	.eccbytes = 14,
> -	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
> -	.oobfree = {{14, 50}}
> -};
> -
>  /* Ick. The BBT code really ought to be able to work this bit out
>     for itself from the above, at least for the 2KiB case */
>  static uint8_t cafe_bbt_pattern_2048[] = { 'B', 'b', 't', '0' };
> @@ -491,12 +485,6 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_2048 = {
>  	.pattern = cafe_mirror_pattern_2048
>  };
>  
> -static const struct nand_ecclayout cafe_oobinfo_512 __devinitdata = {
> -	.eccbytes = 14,
> -	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
> -	.oobfree = {{14, 2}}
> -};
> -
>  static struct nand_bbt_descr cafe_bbt_main_descr_512 = {
>  	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
>  		| NAND_BBT_2BIT | NAND_BBT_VERSION,
> @@ -772,13 +760,9 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
>  
>  	/* Set up ECC according to the type of chip we found */
>  	if (mtd->writesize == 2048) {
> -		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_2048,
> -				sizeof(cafe->nand.ecc.layout));
>  		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
>  		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
>  	} else if (mtd->writesize == 512) {
> -		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_512,
> -				sizeof(cafe->nand.ecc.layout));
>  		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
>  		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
>  	} else {
> -- 
> 1.5.4.3
> 
> 
