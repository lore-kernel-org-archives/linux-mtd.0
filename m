Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZGm-0008Nq-NL
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:28:15 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so670453pde.11
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:27:51 -0700 (PDT)
Date: Thu, 20 Mar 2014 02:27:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 3/5] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Message-ID: <20140320092746.GH31517@norris-Latitude-E6410>
References: <1395149206-23713-1-git-send-email-pekon@ti.com>
 <1395149206-23713-4-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395149206-23713-4-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

Thanks for reworking this. I see one issue, but it's not actually a new
issue with your patch. Maybe it deserves a follow-up patch?

On Tue, Mar 18, 2014 at 06:56:44PM +0530, Pekon Gupta wrote:
> As erased-pages do not have ECC stored in their OOB area, so they need to be
> seperated out from programmed-pages, before doing BCH ECC correction.
> 
> In current implementation of omap_elm_correct_data() which does ECC correction
> for BCHx ECC schemes, this erased-pages are detected based on specific marker
> byte (reserved as 0x00) in ecc-layout.
> However, this approach has some limitation like;
>  1) All ecc-scheme layouts do not have such Reserved byte marker to
>     differentiate between erased-page v/s programmed-page. Thus this is a
>     customized solution.
>  2) Reserved marker byte can itself be subjected to bit-flips causing
>     erased-page to be misunderstood as programmed-page.
> 
> This patch removes dependency on any marker byte in ecc-layout, instead it
> compares calc_ecc[] with pattern of ECC-of-all(0xff). This implicitely
> means that both 'data + oob == all(0xff).
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 85 +++++++++++++++++++-----------------------------
>  1 file changed, 33 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 4bf2f76d..a6c979f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1338,21 +1338,8 @@ static int erased_sector_bitflips(u_char *data, u_char *oob,
>   * @calc_ecc:	ecc read from HW ECC registers
>   *
>   * Calculated ecc vector reported as zero in case of non-error pages.
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
> + * In case of non-zero ecc vector, first filter out erased-pages, and
> + * then process data via ELM to detect bit-flips.
>   */
>  static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  				u_char *read_ecc, u_char *calc_ecc)
> @@ -1367,6 +1354,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  	u_char *ecc_vec = calc_ecc;
>  	u_char *spare_ecc = read_ecc;
>  	u_char *erased_ecc_vec;
> +	u_char *buf;
> +	int bitflip_count;
>  	enum bch_ecc type;
>  	bool is_error_reported = false;
>  
> @@ -1374,10 +1363,12 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  	case OMAP_ECC_BCH4_CODE_HW:
>  		/* omit  7th ECC byte reserved for ROM code compatibility */
>  		actual_eccbytes = ecc->bytes - 1;
> +		erased_ecc_vec = bch4_vector;
>  		break;
>  	case OMAP_ECC_BCH8_CODE_HW:
>  		/* omit 14th ECC byte reserved for ROM code compatibility */
>  		actual_eccbytes = ecc->bytes - 1;
> +		erased_ecc_vec = bch8_vector;
>  		break;
>  	default:
>  		pr_err("invalid driver configuration\n");
> @@ -1389,10 +1380,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  
>  	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
>  		type = BCH8_ECC;
> -		erased_ecc_vec = bch8_vector;
>  	} else {
>  		type = BCH4_ECC;
> -		erased_ecc_vec = bch4_vector;
>  	}
>  
>  	for (i = 0; i < eccsteps ; i++) {
> @@ -1410,44 +1399,36 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  		}
>  
>  		if (eccflag == 1) {
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
> -			if (hweight8(~read_ecc[actual_eccbytes]) >= threshold) {
> +			if (memcmp(calc_ecc, erased_ecc_vec,
> +						actual_eccbytes) == 0) {
>  				/*
> -				 * Update elm error vector as
> -				 * data area is programmed
> +				 * calc_ecc[] matches pattern for ECC(all 0xff)
> +				 * so this is definitely an erased-page
>  				 */
> -				err_vec[i].error_reported = true;
> -				is_error_reported = true;
>  			} else {
> -				/* Error reported in erased page */
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
> +				buf = &data[info->nand.ecc.size * i];
> +				/*
> +				 * count number of 0-bits in read_buf.
> +				 * This check can be removed once a similar
> +				 * check is introduced in generic NAND driver
> +				 */
> +				bitflip_count = erased_sector_bitflips(
> +						buf, read_ecc, info);
> +				if (bitflip_count) {
> +					/*
> +					 * number of 0-bits within ECC limits
> +					 * So this may be an erased-page
> +					 */
> +					stat += bitflip_count;

I see we update 'stat', but in the case that this is a correctable
erased page, don't we just ignore it? i.e., you'll hit this case below
(not shown here):

	/* Check if any error reported */
	if (!is_error_reported)
		return 0;

Perhaps this should be changed to:

	if (!is_error_reported)
		return stat;

?

> +				} else {
> +					/*
> +					 * Too many 0-bits. It may be a
> +					 * - programmed-page, OR
> +					 * - erased-page with many bit-flips
> +					 * So this page requires check by ELM
> +					 */
> +					err_vec[i].error_reported = true;
> +					is_error_reported = true;
>  				}
>  			}
>  		}

Brian
