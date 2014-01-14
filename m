Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2vGe-0007n4-5T
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 04:06:21 +0000
Received: by mail-ie0-f176.google.com with SMTP id lx4so2238146iec.35
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 20:05:57 -0800 (PST)
Date: Mon, 13 Jan 2014 20:05:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 3/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page bit-flip correction for H/W ECC
 schemes
Message-ID: <20140114040554.GB8919@ld-irv-0074>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
 <1388803698-26252-4-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388803698-26252-4-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 balbi@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Sat, Jan 04, 2014 at 08:18:15AM +0530, Pekon Gupta wrote:
> chip->ecc.correct() is used for detecting and correcting bit-flips during read
> operations. In OMAP NAND driver different ecc-schemes have different callbacks:
>  - omap_correct_data()		for HAM1_HW ecc-schemes (Untouched)
>  - nand_bch_correct_data()	for BCHx_HW_DETECTION_SW ecc-schemes (Untouched)
>  - omap_elm_correct_data()	for BCHx_HW ecc-schemes (updated)
> 
> This patch solves following problems in ECC correction for BCHx_HW ecc-schemes.
> Problem: In current implementation, number of bit-flips in erased-pages is
>          calculated comparing each byte of Data & OOB with 0xff in
>          function check_erased_page().
>          But, with growing density of NAND devices (especially for MLC NAND)
>          where pagesize is of 4k or more bytes, occurence of bit-flips is
>          very common. Thus comparing each byte of both main-area and OOB
>          with 0xff decreases NAND performance due to CPU overhead.

But the overhead from this check is only incurred if you are getting
uncorrectable errors, right? This shouldn't commonly occur on programmed
pages, so you're only focusing on high number of bitflips in erased
pages. But UBIFS reads erased pages only when trying to recover at
power-up, right? And I don't think there are really any common cases
where this should occur.

> Known attributes of an erased-page
>  - Bit-flips in erased-page can't be corrected because there is no ECC
>    present in OOB.
>  - Irrespective of number of bit-flips an erased-page will only contain
>    all(0xff), So its safe to return error-code -EUCLEAN with data_buf=0xff,
>    instead of -EBADMSG.

Are you saying that all bitflips in erased pages should yield -EUCLEAN?
I agree that they shouldn't return -EBADMSG (up to the strength
threshold), but I also think that we should still be able to report the
number of bitflips "corrected" in our erased page handling. That way,
pages with small numbers of bitflips can still be corrected.

Put another way: what if every page starts to experience at least one
bitflip? Do you want UBIFS to scrub the page every time? Rather, I think
you want to calculate the proper count so that MTD can mask the bitflips
if they are under the threshold. See my comment labeled [***] in the
patch context below.

>  - And incrementing ecc_stat->corrected makes chip->read_page() return -EUCLEAN.

It only returns -EUCLEAN if the 'corrected' exceeds the threshold. Per
my comment above, I think you want to retain this distinction if
possible.

> Solution: In NAND based file-systems like UBIFS, each page is checked for
>          bit-flips before writing to it.

No, UBIFS only checks pages like this when it thinks it doesn't have a
consistent state (Artem can correct me if I'm wrong). Particularly, it
does this at attach time, when it suspects power-cut issues. At other
times, UBIFS should be smart enough to know which pages have not been
written since erasure.

> If correctable bit-flips are found
>          in erased-page then -EUCLEAN error-code is returned which causes
>          UBIFS to re-erase the complete block. So, its unnecessary to get
>          exact count of bit-flips in an erased-page.

I dispute this point above.

>          Hence this patch just compares calc_ecc[] with known
>          ECC-syndromp-of-all(0xff), to confirm if erased-page has bit-flips.
>          - if bit-flips are found, then
>              read buffer is set to all(0xff) and
>              correctable bit-flips = max(ecc-strength) is reported back to
>              upper layer to take preventive action (like re-erasing block).
>          - else
>               read-data is returned normally.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 87 ++++++++++++++++++------------------------------
>  1 file changed, 32 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 2c73389..5a6ee6b 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1292,45 +1292,6 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
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
> @@ -1359,14 +1320,16 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  {
>  	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
>  			mtd);
> +	enum omap_ecc ecc_opt	= info->ecc_opt;
>  	int eccbytes	= info->nand.ecc.bytes;
> -	int eccsteps = info->nand.ecc.steps;
> +	int eccsize	= info->nand.ecc.size;
> +	int eccstrength	= info->nand.ecc.strength;
> +	int eccsteps	= info->nand.ecc.steps;

Rather than 4 variables which all reference info->nand.ecc, can't you do
this?

	struct nand_ecc_ctrl *ecc = &info->nand.ecc;

Then all the other references can still be pretty short. i.e.:

  eccbytes    ===>  ecc->bytes
  eccsize     ===>  ecc->size
  eccstrength ===>  ecc->strength
  eccsteps    ===>  ecc->steps

>  	int i , j, stat = 0;
>  	int eccflag, actual_eccbytes;
>  	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
>  	u_char *ecc_vec = calc_ecc;
>  	u_char *spare_ecc = read_ecc;
> -	u_char *erased_ecc_vec;
>  	enum bch_ecc type;
>  	bool is_error_reported = false;
>  
> @@ -1389,10 +1352,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  
>  	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
>  		type = BCH8_ECC;
> -		erased_ecc_vec = bch8_vector;
>  	} else {
>  		type = BCH4_ECC;
> -		erased_ecc_vec = bch4_vector;

Why are you dropping this vector assignment out of this if/else (which
you later convert to a switch/case)? After this patch series, you seem
to have effectively duplicated the same switch/case statement in two
places. I think the vector assignment should just stay here unless you
see some other good reason.

>  	}
>  
>  	for (i = 0; i < eccsteps ; i++) {
> @@ -1436,19 +1397,35 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  				is_error_reported = true;
>  			} else {
>  				/* Error reported in erased page */
> -				int bitflip_count;
> -				u_char *buf = &data[info->nand.ecc.size * i];
> -
> -				if (memcmp(calc_ecc, erased_ecc_vec,
> -							 actual_eccbytes)) {
> -					bitflip_count = erased_sector_bitflips(
> -							buf, read_ecc, info);
> -
> -					if (bitflip_count)
> -						stat += bitflip_count;
> -					else
> -						return -EINVAL;
> +				/* check bit-flips in erased-pages
> +				 * - Instead of comparing each byte of main-area
> +				 *   with 0xff, comparing just calc_ecc[] with
> +				 *   known ECC-syndrome-of-all(0xff). This
> +				 *   confirms that main-area + OOB are all(0xff)
> +				 *   This will save CPU cycles.
> +				 * - Bit-flips in erased-page can't be corrected
> +				 *   because there is no ECC present in OOB
> +				 * - Irrespective of number of bit-flips an
> +				 *   erased-page will only contain all(0xff),
> +				 *   So its safe to return error-code -EUCLEAN
> +				 *   with data_buf=0xff, instead of -EBADMSG
> +				 * - And incrementing ecc_stat->corrected makes
> +				 *   chip->read_page() return -EUCLEAN */

/*
 * Can you reformat your multiline comments to fit this style? (With
 * asterisks on their own lines.) You use this style a few times.
 */

> +				switch (ecc_opt) {
> +				case OMAP_ECC_BCH4_CODE_HW:
> +					if (memcmp(calc_ecc, bch4_vector,
> +							 actual_eccbytes))
> +						stat += eccstrength;
> +					break;
> +				case OMAP_ECC_BCH8_CODE_HW:
> +					if (memcmp(calc_ecc, bch8_vector,
> +							 actual_eccbytes))
> +						stat += eccstrength;
> +					break;
> +				default:
> +					return -EINVAL;
>  				}
> +				memset(&data[i * eccsize], 0xff, eccsize);
>  			}
>  		}
>  

Brian
