Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vghiu-0005Rh-K1
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 21:11:42 +0000
Received: by mail-qc0-f169.google.com with SMTP id u18so633123qcx.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 13:11:07 -0800 (PST)
Date: Wed, 13 Nov 2013 13:11:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v3 1/4] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Message-ID: <20131113211100.GG9468@ld-irv-0074.broadcom.com>
References: <1383385576-26095-1-git-send-email-pekon@ti.com>
 <1383385576-26095-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383385576-26095-2-git-send-email-pekon@ti.com>
Cc: Philip Avinash <avinashphilip@ti.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Philip and Ivan, who did relevant work

On Sat, Nov 02, 2013 at 03:16:13PM +0530, Pekon Gupta wrote:
> chip->ecc.correct() is used for detecting and correcting bit-flips during read
> operations. In omap2-nand driver this is done usingt following functions:
> 
> - omap_correct_data(): for H/W based HAM1_ECC schemes
> 	(Un-Touched in current patch)
> 
> - omap_elm_correct_data(): for H/W based BCHx_ECC scheme
> 	Current implementation of this function is not scalable for newer ECC
> 	schemes because:
> 	- It depends on a specific byte-position in OOB area (reserved as 0x00)
> 	  to differentiates between programmed-pages and erased-pages.
> 	  This reserved byte-position cannot be accomodated in all ECC schemes.
> 	- Current code is not scalable for future ECC schemes due to tweaks for
> 	  BCH4_ECC and BCH8_ECC at multiple places.
> 	- It checks for bit-flips in Erased-pages using check_erased_page().
> 	  This is over-work, as sanity of Erased-page can be verified by just
> 	  comparing them to a pre-defined ECC-syndrome for all_0xFF data.
> 
> 	This patch optimizes omap_elm_correct_data() in following ways:
> 	(1) Removes dependency on specific reserved-byte (0x00) in OOB area,
> 	    instead Erased-page is identified by matching calc_ecc with a
> 	    pre-defined ECC syndrome of all(0xFF) data
> 	(2) merges common code for BCH4_ECC and BCH8_ECC for scalability.
> 	(3) handles incorrect elm_error_location beyond data+oob buffer.
> 	(4) removes check_erased_page(): Bit-flips in erased-page are handled
> 	    in same way as for programmed-page

Are you sure that this new scheme is equivalent to the old? i.e., is
this backwards compatible? Are you totally dropping the "reserved byte"
marker? Is this compatible with your bootloaders? I don't have a very
clear mental picture of exactly what your driver is doing to check
programmed/erased pages, and I'm certainly not familiar with your
bootloader/ROM code.

> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 247 ++++++++++++++---------------------------------
>  1 file changed, 74 insertions(+), 173 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index ec40b8d..c946f22 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -160,6 +160,7 @@ struct omap_nand_info {
>  	int				gpmc_cs;
>  	unsigned long			phys_base;
>  	unsigned long			mem_size;
> +	enum omap_ecc			ecc_opt;
>  	struct completion		comp;
>  	struct dma_chan			*dma;
>  	int				gpmc_irq_fifo;
> @@ -1291,219 +1292,118 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
>  }
>  
>  /**
> - * erased_sector_bitflips - count bit flips
> - * @data:	data sector buffer
> - * @oob:	oob buffer
> - * @info:	omap_nand_info
> - *
> - * Check the bit flips in erased page falls below correctable level.
> - * If falls below, report the page as erased with correctable bit
> - * flip, else report as uncorrectable page.
> - */
> -static int erased_sector_bitflips(u_char *data, u_char *oob,
> -		struct omap_nand_info *info)
> -{
> -	int flip_bits = 0, i;
> -
> -	for (i = 0; i < info->nand.ecc.size; i++) {
> -		flip_bits += hweight8(~data[i]);
> -		if (flip_bits > info->nand.ecc.strength)
> -			return 0;
> -	}
> -
> -	for (i = 0; i < info->nand.ecc.bytes - 1; i++) {
> -		flip_bits += hweight8(~oob[i]);
> -		if (flip_bits > info->nand.ecc.strength)
> -			return 0;
> -	}
> -
> -	/*
> -	 * Bit flips falls in correctable level.
> -	 * Fill data area with 0xFF
> -	 */
> -	if (flip_bits) {
> -		memset(data, 0xFF, info->nand.ecc.size);
> -		memset(oob, 0xFF, info->nand.ecc.bytes);
> -	}
> -
> -	return flip_bits;
> -}
> -
> -/**
>   * omap_elm_correct_data - corrects page data area in case error reported
>   * @mtd:	MTD device structure
>   * @data:	page data
>   * @read_ecc:	ecc read from nand flash
> - * @calc_ecc:	ecc read from HW ECC registers
> - *
> - * Calculated ecc vector reported as zero in case of non-error pages.
> - * In case of error/erased pages non-zero error vector is reported.
> - * In case of non-zero ecc vector, check read_ecc at fixed offset
> - * (x = 13/7 in case of BCH8/4 == 0) to find page programmed or not.
> - * To handle bit flips in this data, count the number of 0's in
> - * read_ecc[x] and check if it greater than 4. If it is less, it is
> - * programmed page, else erased page.
> - *
> - * 1. If page is erased, check with standard ecc vector (ecc vector
> - * for erased page to find any bit flip). If check fails, bit flip
> - * is present in erased page. Count the bit flips in erased page and
> - * if it falls under correctable level, report page with 0xFF and
> - * update the correctable bit information.
> - * 2. If error is reported on programmed page, update elm error
> - * vector and correct the page with ELM error correction routine.
> - *
> + * @calc_ecc:	ecc calculated after reading Data and OOB regions from flash
> + * As calc_ecc is calculated over both main & oob, so calc_ecc would be
> + * non-zero only in following cases:
> + * - bit-flips in data or oob region
> + * - erase page, where no ECC is written in OOB area
> + *   However, erased_pages can be differentiated from corrupted pages
> + *   by comparing the calculated ECC with pre-defined syndrome ECC_of_ALL(0xFF)
> + *   Bit-flips in erased-pages would also be caught by comparing, calc_ecc
> + *   with ECC_of_ALL(0xFF)
>   */
>  static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  				u_char *read_ecc, u_char *calc_ecc)
>  {
>  	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
>  			mtd);
> -	int eccsteps = info->nand.ecc.steps;
> -	int i , j, stat = 0;
> -	int eccsize, eccflag, ecc_vector_size;
> +	enum omap_ecc ecc_opt = info->ecc_opt;
> +	struct nand_chip *chip = mtd->priv;
> +	int eccsteps = chip->ecc.steps;
> +	int eccsize  = chip->ecc.size;
> +	int eccbytes = chip->ecc.bytes;
> +	int i , j, stat = 0, ret = 0, flag_read_ecc;
>  	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
> -	u_char *ecc_vec = calc_ecc;
> -	u_char *spare_ecc = read_ecc;
> -	u_char *erased_ecc_vec;
> -	enum bch_ecc type;
> +	u_char *ecc;
>  	bool is_error_reported = false;
> +	u32 bit_pos, byte_pos, error_max, pos;
>  
>  	/* Initialize elm error vector to zero */
>  	memset(err_vec, 0, sizeof(err_vec));
>  
> -	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
> -		type = BCH8_ECC;
> -		erased_ecc_vec = bch8_vector;
> -	} else {
> -		type = BCH4_ECC;
> -		erased_ecc_vec = bch4_vector;
> -	}
> -
> -	ecc_vector_size = info->nand.ecc.bytes;
> -
> -	/*
> -	 * Remove extra byte padding for BCH8 RBL
> -	 * compatibility and erased page handling
> -	 */
> -	eccsize = ecc_vector_size - 1;
> -
>  	for (i = 0; i < eccsteps ; i++) {
> -		eccflag = 0;	/* initialize eccflag */
> -
> -		/*
> -		 * Check any error reported,
> -		 * In case of error, non zero ecc reported.
> -		 */
> -
> -		for (j = 0; (j < eccsize); j++) {
> -			if (calc_ecc[j] != 0) {
> -				eccflag = 1; /* non zero ecc, error present */
> +		flag_read_ecc = 0;
> +		ecc = calc_ecc + (i * eccbytes);
> +		/* check calc_ecc */
> +		for (j = 0; j < eccbytes; j++) {
> +			if (*(ecc + j) != 0x00) {
> +				flag_read_ecc = 1;
>  				break;
>  			}
>  		}
> -
> -		if (eccflag == 1) {
> -			/*
> -			 * Set threshold to minimum of 4, half of ecc.strength/2
> -			 * to allow max bit flip in byte to 4
> -			 */
> -			unsigned int threshold = min_t(unsigned int, 4,
> -					info->nand.ecc.strength / 2);
> -
> -			/*
> -			 * Check data area is programmed by counting
> -			 * number of 0's at fixed offset in spare area.
> -			 * Checking count of 0's against threshold.
> -			 * In case programmed page expects at least threshold
> -			 * zeros in byte.
> -			 * If zeros are less than threshold for programmed page/
> -			 * zeros are more than threshold erased page, either
> -			 * case page reported as uncorrectable.
> -			 */
> -			if (hweight8(~read_ecc[eccsize]) >= threshold) {
> -				/*
> -				 * Update elm error vector as
> -				 * data area is programmed
> -				 */
> -				err_vec[i].error_reported = true;
> -				is_error_reported = true;
> -			} else {
> -				/* Error reported in erased page */
> -				int bitflip_count;
> -				u_char *buf = &data[info->nand.ecc.size * i];
> -
> -				if (memcmp(calc_ecc, erased_ecc_vec, eccsize)) {
> -					bitflip_count = erased_sector_bitflips(
> -							buf, read_ecc, info);
> -
> -					if (bitflip_count)
> -						stat += bitflip_count;
> -					else
> -						return -EINVAL;
> -				}
> +		/* check if its a erased-page */
> +		if (flag_read_ecc) {
> +			switch (ecc_opt) {
> +			case OMAP_ECC_BCH8_CODE_HW:
> +				if (memcmp(ecc, bch8_vector, eccbytes))
> +					err_vec[i].error_reported = true;
> +				break;
> +			case OMAP_ECC_BCH4_CODE_HW:
> +				if (memcmp(ecc, bch4_vector, eccbytes))
> +					err_vec[i].error_reported = true;
> +				break;
> +			default:
> +				pr_err("%s: invalid configuration",
> +								 DRIVER_NAME);
> +				return -EINVAL;
>  			}
>  		}
> -
> -		/* Update the ecc vector */
> -		calc_ecc += ecc_vector_size;
> -		read_ecc += ecc_vector_size;
> +		/* page definitely has bit-flips */
> +		if (err_vec[i].error_reported)
> +			is_error_reported = true;
>  	}
>  
> -	/* Check if any error reported */
>  	if (!is_error_reported)
>  		return 0;
> +	/* detect bit-flips using ELM module */
> +	elm_decode_bch_error_page(info->elm_dev, calc_ecc, err_vec);
>  
> -	/* Decode BCH error using ELM module */
> -	elm_decode_bch_error_page(info->elm_dev, ecc_vec, err_vec);
> -
> +	/* correct bit-flip */
>  	for (i = 0; i < eccsteps; i++) {
> -		if (err_vec[i].error_reported) {
> +		if (err_vec[i].error_uncorrectable) {
> +			ret = -EBADMSG;
> +		} else if (err_vec[i].error_reported) {
>  			for (j = 0; j < err_vec[i].error_count; j++) {
> -				u32 bit_pos, byte_pos, error_max, pos;
> -
> -				if (type == BCH8_ECC)
> -					error_max = BCH8_ECC_MAX;
> -				else
> -					error_max = BCH4_ECC_MAX;
> -
> -				if (info->nand.ecc.strength == BCH8_MAX_ERROR)
> -					pos = err_vec[i].error_loc[j];
> -				else
> +				switch (ecc_opt) {
> +				case OMAP_ECC_BCH4_CODE_HW:
> +					error_max = SECTOR_BYTES +
> +							(eccbytes - 1);
>  					/* Add 4 to take care 4 bit padding */
>  					pos = err_vec[i].error_loc[j] +
> -						BCH4_BIT_PAD;
> -
> -				/* Calculate bit position of error */
> +							BCH4_BIT_PAD;
> +					break;
> +				case OMAP_ECC_BCH8_CODE_HW:
> +					error_max = SECTOR_BYTES +
> +							(eccbytes - 1);
> +					pos = err_vec[i].error_loc[j];
> +					break;
> +				default:
> +					return -EINVAL;
> +				}
> +				/* Calculate bit & byte bit-flip position */
>  				bit_pos = pos % 8;
> -
> -				/* Calculate byte position of error */
> -				byte_pos = (error_max - pos - 1) / 8;
> -
> -				if (pos < error_max) {
> -					if (byte_pos < 512)
> -						data[byte_pos] ^= 1 << bit_pos;
> -					else
> -						spare_ecc[byte_pos - 512] ^=
> +				byte_pos = error_max - (pos / 8) - 1;
> +				if (byte_pos < SECTOR_BYTES)
> +					data[byte_pos] ^= 1 << bit_pos;
> +				else if (byte_pos < error_max)
> +					read_ecc[byte_pos - SECTOR_BYTES] ^=
>  							1 << bit_pos;
> -				}
> -				/* else, not interested to correct ecc */
> +				else
> +					ret = -EBADMSG;
>  			}
>  		}
> -
>  		/* Update number of correctable errors */
>  		stat += err_vec[i].error_count;
> -
>  		/* Update page data with sector size */
> -		data += info->nand.ecc.size;
> -		spare_ecc += ecc_vector_size;
> +		data	 += eccsize;
> +		read_ecc += eccbytes;
>  	}
>  
> -	for (i = 0; i < eccsteps; i++)
> -		/* Return error if uncorrectable error present */
> -		if (err_vec[i].error_uncorrectable)
> -			return -EINVAL;
> -
> -	return stat;
> +	return (ret < 0) ? ret : stat;
>  }
>  
>  /**
> @@ -1656,6 +1556,7 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	info->gpmc_cs		= pdata->cs;
>  	info->reg		= pdata->reg;
>  	info->of_node		= pdata->of_node;
> +	info->ecc_opt		= pdata->ecc_opt;

Now that you have this 'info->ecc_opt', you might want to replace the
later uses of 'pdata->ecc_opt' in this function. (Not necessary for the
current patch.)

>  	mtd			= &info->mtd;
>  	mtd->priv		= &info->nand;
>  	mtd->name		= dev_name(&pdev->dev);

Brian
