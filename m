Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjuXc-0000LM-CU
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 18:01:32 +0000
Received: by mail-pa0-f41.google.com with SMTP id lj1so9022539pab.14
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 11:01:08 -0700 (PDT)
Date: Mon, 12 May 2014 11:01:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: pxa3xx: Use ECC strength and step size
 devicetree binding
Message-ID: <20140512180104.GJ28907@ld-irv-0074>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395401690-25221-4-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395401690-25221-4-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Fri, Mar 21, 2014 at 08:34:49AM -0300, Ezequiel Garcia wrote:
> This commit adds support for the user to specify the ECC strength
> and step size through the devicetree. We keep the previous behavior,
> when there is no DT parameter provided.
> 
> Also, if there is an ONFI-specified minimum ECC strength requirement,
> and the DT-specified ECC strength is weaker, print a warning and try to
> select a strength compatible with the ONFI requirement.

Are you sure you want to override? That seems contrary to the idea of a
DT property for specifying ECC. But maybe you have a good reason?

If you'd rather just warn the user, it's possible we could move that to
common code in nand_base.c.

> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c                | 47 +++++++++++++++++++--------
>  include/linux/platform_data/mtd-nand-pxa3xx.h |  3 ++
>  2 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index cf7d757..cc13896 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1344,8 +1344,30 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
>  }
>  
>  static int pxa_ecc_init(struct pxa3xx_nand_info *info,
> -			struct nand_ecc_ctrl *ecc, int strength, int page_size)
> +			struct nand_chip *chip,
> +			struct pxa3xx_nand_platform_data *pdata,
> +			unsigned int page_size)
>  {
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	unsigned int strength, onfi_strength;
> +
> +	/* We need to normalize the ECC strengths, in order to compare them. */
> +	strength = (pdata->ecc_strength * 512) / pdata->ecc_step_size;
> +	onfi_strength = (chip->ecc_strength_ds * 512) / chip->ecc_step_ds;

This is not necessarily an "ONFI" property; we also have the full-ID
table in which a minimum ECC strength can be specified. Maybe you can
match the existing naming with "strength" and "strength_ds" (for
"datasheet").

> +
> +	/*
> +	 * The user requested ECC strength cannot be weaker than the ONFI
> +	 * minimum specified ECC strength.
> +	 */
> +	if (strength && strength < onfi_strength) {
> +		dev_warn(&info->pdev->dev,
> +			 "requested ECC strength is too weak\n");
> +		strength = onfi_strength;
> +	}
> +
> +	if (!strength)
> +		strength = onfi_strength ? onfi_strength : 1;
> +

I'm also not sure your "normalization" is generally correct. You can't
really normalize correction strengths to get a fully valid comparison.
Remember, 4-bit/2048B correction is not the same as 1-bit/512B
correction; it is at least as strong, yes. But then, the reverse is
*not* a good comparison. So your code might say that a flash which
requires 4-bit/2KB can be satisfied by 1-bit/512B. (These numbers may
not be seen in practice, but you get my point, right?)

By my understanding, a correct comparison requires two parts, which I've
summarized like this in my own code:

        /*
         * Does the given configuration meet the requirements?
         *
         * If our configuration corrects A bits per B bytes and the minimum
         * required correction level is X bits per Y bytes, then we must ensure
         * both of the following are true:
         *
         * (1) A / B >= X / Y
         * (2) A >= X
         *
         * Requirement (1) ensures we can correct for the required bitflip
         * density.
         * Requirement (2) ensures we can correct even when all bitflips are
         * clumped in the same sector.
         */

I think you are doing (1), but not (2).

>  	if (strength == 1 && page_size == 2048) {
>  		info->chunk_size = 2048;
>  		info->spare_size = 40;
> @@ -1375,7 +1397,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
>  		ecc->size = info->chunk_size;
>  		ecc->layout = &ecc_layout_2KB_bch4bit;
>  		ecc->strength = 16;
> -		return 1;
>  
>  	} else if (strength == 4 && page_size == 4096) {
>  		info->ecc_bch = 1;
> @@ -1424,7 +1445,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	uint32_t id = -1;
>  	uint64_t chipsize;
>  	int i, ret, num;
> -	uint16_t ecc_strength, ecc_step;
>  
>  	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
>  		goto KEEP_CONFIG;
> @@ -1519,17 +1539,8 @@ KEEP_CONFIG:
>  		}
>  	}
>  
> -	ecc_strength = chip->ecc_strength_ds;
> -	ecc_step = chip->ecc_step_ds;
> -
> -	/* Set default ECC strength requirements on non-ONFI devices */
> -	if (ecc_strength < 1 && ecc_step < 1) {
> -		ecc_strength = 1;
> -		ecc_step = 512;
> -	}
> -
> -	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * 512) / ecc_step,
> -			   mtd->writesize);
> +	/* Selects an ECC and fills pxa3xx_nand_info and nand_chip */
> +	ret = pxa_ecc_init(info, chip, pdata, mtd->writesize);
>  	if (ret)
>  		return ret;
>  
> @@ -1729,6 +1740,14 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>  	of_property_read_u32(np, "num-cs", &pdata->num_cs);
>  	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
>  
> +	pdata->ecc_strength = of_get_nand_ecc_strength(np);
> +	if (pdata->ecc_strength < 0)

ecc_strength is unsigned, so this error check doesn't work. Maybe you
want a local 'int ret' to temporarily stash the return value?

> +		pdata->ecc_strength = 0;
> +
> +	pdata->ecc_step_size = of_get_nand_ecc_step_size(np);
> +	if (pdata->ecc_step_size < 0)

Ditto for ecc_step_size.

> +		pdata->ecc_step_size = 0;
> +
>  	pdev->dev.platform_data = pdata;
>  
>  	return 0;
> diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
> index a941471..5c0f2e3 100644
> --- a/include/linux/platform_data/mtd-nand-pxa3xx.h
> +++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
> @@ -58,6 +58,9 @@ struct pxa3xx_nand_platform_data {
>  	/* use an flash-based bad block table */
>  	bool	flash_bbt;
>  
> +	/* requested ECC strength and ECC step size */
> +	unsigned int ecc_strength, ecc_step_size;
> +
>  	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
>  	unsigned int				nr_parts[NUM_CHIP_SELECT];
>  

Brian
