Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsQHk-0000Na-IQ
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2013 05:00:05 +0000
Date: Mon, 16 Dec 2013 12:30:41 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131216043040.GB27109@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 15, 2013 at 07:44:21PM +0100, Elie De Brauwer wrote:
> The BCH block typically used with a i.MX28 and GPMI block is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings).
> 
> This patch configures the BCH block to mark a block as 'erased' if
> no more than ecc_strength bitflips are found. Next HW_BCH_STATUS0:ALLONES
> is used to check if the data read were all ones. If this was not
> the case a slow path is entered where bitflips are counted and
> corrected in software, allowing the upper layers to take proper actions.
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  |    2 ++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   17 +++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   43 +++++++++++++++++++++++++++++---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
>  4 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 588f537..a30502f 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,9 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
>  
>  #define HW_BCH_STATUS0				0x00000010
> +#define BM_BCH_STATUS0_ALLONES_MASK		(1 << 4)
>  #define HW_BCH_MODE				0x00000020
> +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
>  #define HW_BCH_ENCODEPTR			0x00000030
>  #define HW_BCH_DATAPTR				0x00000040
>  #define HW_BCH_METAPTR				0x00000050
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index aaced29..4551a38 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>  
> +	/*
> +	 * Set the tolerance for bitflips when reading erased blocks
> +	 * equal to the ecc_strength.
> +	 */
Please also add the following comment :
   "We even detect the bitflips for SLC nand."

> +	writel(bch_geo->ecc_strength & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
> +		r->bch_regs + HW_BCH_MODE);
> +

After discuss with the IC owner, we could set the bch_geo->gf_len here.

The bch_geo->gf_len is 13 or 14 now.

For the sake of safe, I suggest to set (bch_geo->gf_len / 2) for the ERASE_THRESHOLD.

I think this value is enough for us.


>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>  
> @@ -1094,6 +1101,16 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
>  	return reg & mask;
>  }
>  
> +/* Returns 1 if the last transaction consisted only out of ones. */
> +int gpmi_allones(struct gpmi_nand_data *this)
> +{
> +	struct resources *r = &this->resources;
> +	uint32_t reg = readl(r->gpmi_regs + HW_BCH_STATUS0);
please add a empty line here.
> +	if (reg & BM_BCH_STATUS0_ALLONES_MASK)
> +		return 1;
> +	return 0;
We can simplify the code to:
	return reg & BM_BCH_STATUS0_ALLONES_MASK;

> +}
> +
>  static inline void set_dma_type(struct gpmi_nand_data *this,
>  					enum dma_ops_type type)
>  {
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index dabbc14..82eac9b 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1012,6 +1012,30 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
>  	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
>  }
>  
> +/*
> + * Count the number of 0 bits in a supposed to be
> + * erased region and correct them. Return the number
> + * of bitflips or zero when the region was correct.
> + */
> +static unsigned int erased_sector_bitflips(unsigned char *data,
> +					unsigned int chunk,
> +					struct bch_geometry *geo)
> +{
> +	unsigned int flip_bits = 0;
> +	int i;
> +	int base = geo->ecc_chunk_size * chunk;
> +
> +	/* Count bitflips */
> +	for (i = 0; i < geo->ecc_chunk_size; i++)
> +		flip_bits += hweight8(~data[base + i]);
> +
> +	/* Correct bitflips by 0xFF'ing this chunk. */
> +	if (flip_bits)
> +		memset(&data[base], 0xFF, geo->ecc_chunk_size);
> +
> +	return flip_bits;
> +}
> +
>  static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				uint8_t *buf, int oob_required, int page)
>  {
> @@ -1023,6 +1047,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	dma_addr_t    auxiliary_phys;
>  	unsigned int  i;
>  	unsigned char *status;
> +	unsigned int  flips;
>  	unsigned int  max_bitflips = 0;
>  	int           ret;
>  
> @@ -1057,15 +1082,27 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
>  
>  	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
> +		if (*status == STATUS_GOOD)
>  			continue;
>  
>  		if (*status == STATUS_UNCORRECTABLE) {
>  			mtd->ecc_stats.failed++;
>  			continue;
>  		}
> -		mtd->ecc_stats.corrected += *status;
> -		max_bitflips = max_t(unsigned int, max_bitflips, *status);
> +
> +		if (*status == STATUS_ERASED)
> +			if (gpmi_allones(this))
> +				continue;
> +			else
> +				/* Erased block with bitflips. */
> +				flips = erased_sector_bitflips(payload_virt, i,
> +							       nfc_geo);
> +		else
> +			/* BCH block corrected some errors for us. */
> +			flips = *status;

Please read the Documentation/CodeingStyle.
The code should like this:
  ........................................................
		if (*status == STATUS_ERASED) {
			if (gpmi_allones(this))
				continue;
			else
				/* Erased block with bitflips. */
				flips = erased_sector_bitflips(payload_virt, i,
							       nfc_geo);
		} else {
			/* BCH block corrected some errors for us. */
			flips = *status;
		}
  ........................................................
		
thanks
Huang Shijie	
