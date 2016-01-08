Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHWA6-0002oA-IO
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 12:28:59 +0000
Date: Fri, 8 Jan 2016 13:28:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Harvey Hunt <harvey.hunt@imgtec.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: Re: [PATCH] mtd: jz4780_nand: replace if/else blocks with switch/case
Message-ID: <20160108132836.79fb4a81@bbrezillon>
In-Reply-To: <1452189188-139318-1-git-send-email-computersforpeace@gmail.com>
References: <1452189188-139318-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  7 Jan 2016 09:53:08 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Using switch/case helps make this logic more clear and more robust. With
> this structure:
> 
>  * it's clear that this driver only support ECC_{HW,SOFT,SOFT_BCH}; and
> 
>  * we can sanely handle new ECC unsupported modes (right now, this code
>    makes incorrect assumptions about the possible values in the
>    nand_ecc_modes_t enum; e.g., what happens with NAND_ECC_HW_OOB_FIRST?)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Cc: Harvey Hunt <harvey.hunt@imgtec.com>

LGTM

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Compile tested only
> 
>  drivers/mtd/nand/jz4780_nand.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index 17eb9f264187..aabee8f5627e 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -171,29 +171,33 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>  	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
>  				(chip->ecc.strength / 8);
>  
> -	if (nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> +	switch (chip->ecc.mode) {
> +	case NAND_ECC_HW:
> +		if (!nfc->bch) {
> +			dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> +			return -ENODEV;
> +		}
> +
>  		chip->ecc.hwctl = jz4780_nand_ecc_hwctl;
>  		chip->ecc.calculate = jz4780_nand_ecc_calculate;
>  		chip->ecc.correct = jz4780_nand_ecc_correct;
> -	} else if (!nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> -		dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> -		return -ENODEV;
> -	}
> -
> -	if (chip->ecc.mode == NAND_ECC_HW_SYNDROME) {
> -		dev_err(dev, "ECC HW syndrome not supported\n");
> -		return -EINVAL;
> -	}
> -
> -	if (chip->ecc.mode != NAND_ECC_NONE)
> +		/* fall through */
> +	case NAND_ECC_SOFT:
> +	case NAND_ECC_SOFT_BCH:
>  		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
>  			(nfc->bch) ? "hardware BCH" : "software ECC",
>  			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> -	else
> +		break;
> +	case NAND_ECC_NONE:
>  		dev_info(dev, "not using ECC\n");
> +		break;
> +	default:
> +		dev_err(dev, "ECC mode %d not supported\n", chip->ecc.mode);
> +		return -EINVAL;
> +	}
>  
> -	/* The NAND core will generate the ECC layout. */
> -	if (chip->ecc.mode == NAND_ECC_SOFT || chip->ecc.mode == NAND_ECC_SOFT_BCH)
> +	/* The NAND core will generate the ECC layout for SW ECC */
> +	if (chip->ecc.mode != NAND_ECC_HW)
>  		return 0;
>  
>  	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
