Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbUff-00071W-C3
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 17:37:29 +0000
Date: Fri, 6 Jul 2018 19:37:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v6 5/6] mtd: rawnand: micron: support 8/512 on-die ECC
Message-ID: <20180706193715.5b2d8bdd@bbrezillon>
In-Reply-To: <20180624224448.21872-6-chris.packham@alliedtelesis.co.nz>
References: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
 <20180624224448.21872-6-chris.packham@alliedtelesis.co.nz>
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

On Mon, 25 Jun 2018 10:44:47 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Micron MT29F1G08ABAFAWP-ITE:F supports an on-die ECC with 8 bits
> per 512 bytes. Add support for this combination.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - New
> Changes in v3:
> - Handle reporting of corrected errors that don't require a rewrite, expand
>   comment for the ECC status bits.
> Changes in v4:
> - Use a switch statement for handling ECC status
> - Update ecc_stats.corrected
> Changes in v5:
> - Move status checking to different routines for 4/512 and 8/512 assume
>   the highest number of bit flips for a given status value.
> Changes in v6:
> - Add review from Boris
> 
>  drivers/mtd/nand/raw/nand_micron.c | 100 +++++++++++++++++++++++------
>  1 file changed, 79 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index d30bd4df9b12..f83053562925 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -18,10 +18,30 @@
>  #include <linux/mtd/rawnand.h>
>  
>  /*
> - * Special Micron status bit that indicates when the block has been
> - * corrected by on-die ECC and should be rewritten
> + * Special Micron status bit 3 indicates that the block has been
> + * corrected by on-die ECC and should be rewritten.
>   */
> -#define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)
> +#define NAND_ECC_STATUS_WRITE_RECOMMENDED	BIT(3)
> +
> +/*
> + * On chips with 8-bit ECC and additional bit can be used to distinguish
> + * cases where a errors were corrected without needing a rewrite
> + *
> + * Bit 4 Bit 3 Bit 0 Description
> + * ----- ----- ----- -----------
> + * 0     0     0     No Errors
> + * 0     0     1     Multiple uncorrected errors
> + * 0     1     0     4 - 6 errors corrected, recommend rewrite
> + * 0     1     1     Reserved
> + * 1     0     0     1 - 3 errors corrected
> + * 1     0     1     Reserved
> + * 1     1     0     7 - 8 errors corrected, recommend rewrite
> + */
> +#define NAND_ECC_STATUS_MASK		(BIT(4) | BIT(3) | BIT(0))
> +#define NAND_ECC_STATUS_UNCORRECTABLE	BIT(0)
> +#define NAND_ECC_STATUS_4_6_CORRECTED	BIT(3)
> +#define NAND_ECC_STATUS_1_3_CORRECTED	BIT(4)
> +#define NAND_ECC_STATUS_7_8_CORRECTED	(BIT(4) | BIT(3))
>  
>  struct nand_onfi_vendor_micron {
>  	u8 two_plane_read;
> @@ -113,6 +133,54 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
>  	return nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
>  }
>  
> +
> +static int micron_nand_on_die_ecc_status_4(struct mtd_info *mtd,
> +					   struct nand_chip *chip, u8 status)
> +{
> +	/*
> +	 * The internal ECC doesn't tell us the number of bitflips
> +	 * that have been corrected, but tells us if it recommends to
> +	 * rewrite the block. If it's the case, then we pretend we had
> +	 * a number of bitflips equal to the ECC strength, which will
> +	 * hint the NAND core to rewrite the block.
> +	 */
> +	if (status & NAND_STATUS_FAIL) {
> +		mtd->ecc_stats.failed++;
> +	} else if (status & NAND_ECC_STATUS_WRITE_RECOMMENDED) {
> +		mtd->ecc_stats.corrected += chip->ecc.strength;
> +		return chip->ecc.strength;
> +	}
> +
> +	return 0;
> +}
> +
> +static int micron_nand_on_die_ecc_status_8(struct mtd_info *mtd,
> +					   struct nand_chip *chip, u8 status)
> +{
> +	/*
> +	 * With 8/512 we have more information but still don't know precisely
> +	 * how many bit-flips were seen.
> +	 */
> +	switch (status & NAND_ECC_STATUS_MASK) {
> +	case NAND_ECC_STATUS_UNCORRECTABLE:
> +		mtd->ecc_stats.failed++;
> +		return 0;
> +	case NAND_ECC_STATUS_1_3_CORRECTED:
> +		mtd->ecc_stats.corrected += 3;
> +		return 3;
> +	case NAND_ECC_STATUS_4_6_CORRECTED:
> +		mtd->ecc_stats.corrected += 6;
> +		/* rewrite recommended */
> +		return 6;
> +	case NAND_ECC_STATUS_7_8_CORRECTED:
> +		mtd->ecc_stats.corrected += 8;
> +		/* rewrite recommended */
> +		return 8;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int
>  micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
>  				 uint8_t *buf, int oob_required,
> @@ -137,19 +205,10 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (ret)
>  		goto out;
>  
> -	if (status & NAND_STATUS_FAIL) {
> -		mtd->ecc_stats.failed++;
> -	} else if (status & NAND_STATUS_WRITE_RECOMMENDED) {
> -		/*
> -		 * The internal ECC doesn't tell us the number of bitflips
> -		 * that have been corrected, but tells us if it recommends to
> -		 * rewrite the block. If it's the case, then we pretend we had
> -		 * a number of bitflips equal to the ECC strength, which will
> -		 * hint the NAND core to rewrite the block.
> -		 */
> -		mtd->ecc_stats.corrected += chip->ecc.strength;
> -		max_bitflips = chip->ecc.strength;
> -	}
> +	if (chip->ecc.strength == 4)
> +		max_bitflips = micron_nand_on_die_ecc_status_4(mtd, chip, status);
> +	else
> +		max_bitflips = micron_nand_on_die_ecc_status_8(mtd, chip, status);
>  
>  	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
>  	if (!ret && oob_required)
> @@ -240,10 +299,9 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>  		return MICRON_ON_DIE_MANDATORY;
>  
>  	/*
> -	 * Some Micron NANDs have an on-die ECC of 4/512, some other
> -	 * 8/512. We only support the former.
> +	 * We only support on-die ECC of 4/512 or 8/512
>  	 */
> -	if (chip->ecc_strength_ds != 4)
> +	if  (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
>  		return MICRON_ON_DIE_UNSUPPORTED;
>  
>  	return MICRON_ON_DIE_SUPPORTED;
> @@ -275,9 +333,9 @@ static int micron_nand_init(struct nand_chip *chip)
>  			return -EINVAL;
>  		}
>  
> -		chip->ecc.bytes = 8;
> +		chip->ecc.bytes = chip->ecc_strength_ds * 2;

Just had a quick look at the MT29F1G08ABAFAWP datasheet, and the layout
is different: you have all ECC bytes placed at the end of OOB area (64
bytes), and all the free bytes placed at the beginning (64 bytes). You
should define a new mtd_ooblayout_ops for this case.

>  		chip->ecc.size = 512;
> -		chip->ecc.strength = 4;
> +		chip->ecc.strength = chip->ecc_strength_ds;
>  		chip->ecc.algo = NAND_ECC_BCH;
>  		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
>  		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
