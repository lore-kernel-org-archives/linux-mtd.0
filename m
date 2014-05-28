Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpkJ3-0004eh-VN
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 20:18:38 +0000
Received: by mail-pb0-f47.google.com with SMTP id rp16so11754830pbb.20
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 13:18:17 -0700 (PDT)
Date: Wed, 28 May 2014 13:18:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ted Juan <ted.juan@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop
 error
Message-ID: <20140528201813.GB3599@ld-irv-0074>
References: <20140528090933.GD4285@norris-Latitude-E6410>
 <1401287586-5443-1-git-send-email-ted.juan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401287586-5443-1-git-send-email-ted.juan@gmail.com>
Cc: linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ted,

On Wed, May 28, 2014 at 10:33:06PM +0800, Ted Juan wrote:
> >>Sorry, this patch does not apply to l2-mtd.git. I think it conflicts
> >>with some recent changes from Pekon. Please rebase and resend.
> 
> ok, this should fix it.

This is better. It still doesn't work out perfectly, since you included
this conversation within the commit area. In the future, you might try
testing your email by applying using 'git am' to your own tree first,
just to see how it looks.

> >>Can you format your name properly, without the dot, for proper
> >>authorship attribution?
> 
> ok, thank you.
> 
> 
>  Fixes:  2c9f2365d1e1d0e318b068f683f18c99515b80f8
>  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in omap_calculate_ecc_bch
> 
>  Fixes: 7bcd1dca1d587ad29f9825ba4414620440e8c8da
>  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in omap_calculate_ecc_bch
> 
> CC: <stable@vger.kernel.org> # 3.13.x+
> Signed-off-by: Ted Juan <ted.juan@gmail.com>
> Acked-by: Pekon Gupta <pekon@ti.com>

I fixed up the commit message slightly and pushed to l2-mtd.git. Thanks!

> ---
>  drivers/mtd/nand/omap2.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index cbe87a8..f0ed92e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1180,7 +1180,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>  	u8 *ecc_code;
>  	unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
>  	u32 val;
> -	int i;
> +	int i, j;
>  
>  	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
>  	for (i = 0; i < nsectors; i++) {
> @@ -1263,8 +1263,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>  		case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>  			/* Add constant polynomial to remainder, so that
>  			 * ECC of blank pages results in 0x0 on reading back */
> -			for (i = 0; i < eccbytes; i++)
> -				ecc_calc[i] ^= bch4_polynomial[i];
> +			for (j = 0; j < eccbytes; j++)
> +				ecc_calc[j] ^= bch4_polynomial[j];
>  			break;
>  		case OMAP_ECC_BCH4_CODE_HW:
>  			/* Set  8th ECC byte as 0x0 for ROM compatibility */
> @@ -1273,8 +1273,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>  		case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>  			/* Add constant polynomial to remainder, so that
>  			 * ECC of blank pages results in 0x0 on reading back */
> -			for (i = 0; i < eccbytes; i++)
> -				ecc_calc[i] ^= bch8_polynomial[i];
> +			for (j = 0; j < eccbytes; j++)
> +				ecc_calc[j] ^= bch8_polynomial[j];
>  			break;
>  		case OMAP_ECC_BCH8_CODE_HW:
>  			/* Set 14th ECC byte as 0x0 for ROM compatibility */

Brian
