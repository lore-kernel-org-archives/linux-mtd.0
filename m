Received: from mail-oa0-x230.google.com ([2607:f8b0:4003:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2vZd-0008Om-49
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 04:25:58 +0000
Received: by mail-oa0-f48.google.com with SMTP id i11so227656oag.21
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 20:25:35 -0800 (PST)
Date: Mon, 13 Jan 2014 20:25:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 4/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Message-ID: <20140114042531.GC8919@ld-irv-0074>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
 <1388803698-26252-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388803698-26252-5-git-send-email-pekon@ti.com>
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

On Sat, Jan 04, 2014 at 08:18:16AM +0530, Pekon Gupta wrote:
> chip->ecc.correct() is used for detecting and correcting bit-flips during read
> operations. In OMAP NAND driver different ecc-schemes have different callbacks:
>  - omap_correct_data()		for HAM1_HW ecc-schemes (Untouched)
>  - nand_bch_correct_data()	for BCHx_HW_DETECTION_SW ecc-schemes (Untouched)
>  - omap_elm_correct_data()	for BCHx_HW ecc-schemes (updated)
> 
> This patch solves following problems in ECC correction for BCHx_HW ecc-schemes.
> Problem: Current implementation depends on a specific byte-position (reserved
>          as 0x00) in ecc-layout to differentiate between programmed-pages v/s
>          erased-pages.
>       1) All ecc-scheme layouts do not have such Reserved byte marker to
>          differentiate between erased-page v/s programmed-page. Thus this is a
>          customized solution.
>       2) Reserved byte can itself be subjected to bit-flips causing erased-page
>          to be misunderstood as programmed-page.
> 
> Solution: This patch removes dependency on single byte-position ini ecc-layout
>          to differentiating between erased-page v/s programeed-page.
>          This patch 'assumes' any page to be 'erased':
> 		(a) if        all(read_ecc)  == 0xff
> 		(b) else if   all(read_data) == 0xff

Your assumptions break down if somebody intentionally programmed a page
with 0xff data. Then the ECC region will not be 0xff, but the data area
may be all 0xff. Isn't this a major problem? (You can try testing this
with nandwrite/nanddump using a page of 0xff.)

> 
> Reasons for (a)
>       -  An abrupt termination of page programming (like power failure)
>          may result in partial write, leaving page in corrupted state with
>          un-stable bits. As OOB region is programmed after the data-region,
>          so if read_ecc[] == 0xff, then a page should treadted as erased.
> 
>       -  Also, as ECC is not present, any bitflips in page cannot be detected.
> 
> Reasons for (b)
>       - Due to architecture of NAND cell, bit-flips cannot change programmed
>         value from '0' -> '1'. So if all(read_data) == 0xff then its confirmed
>         that there is 'no bit-flips in data-region'. Hence, read_data[] == 0xff
>         can be safely returned.
> 
>       - if page was programmed-page with 0xff and 'calc_ecc[] != 0x00' then
>         it means that page has bit-flips in OOB-region.
> 
>       - if page was erased-page and 'read_ecc[] != ecc_of_all_0xff' then
>         it  mean that there are bit-flips in OOB-region of page.

I think several assumptions and statements you are making are flawed,
and (unless I'm wrong) you probably need to rethink the approach in this
patch and the previous one.

Are you mainly trying to (1) improve performance and (2) remove reliance
on a single byte marker? I think the first point may be misguided and
not important in this case, but the second looks like you can solve it
well. What do you think of trying to tackle (2) without (1)? You would
be keeping much of the existing hweight()-related code for determining
bitflips across the whole data+OOB, but you could still have a smaller
ECC-only check to perform a faster first pass.

> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 69 ++++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 5a6ee6b..589db4c 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1296,24 +1296,10 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
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
> + *		calc_ecc would be non-zero only in following cases:
> + *		- bit-flips in data or oob region
> + *		- erased page, where no ECC is written in OOB area
>   */
>  static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  				u_char *read_ecc, u_char *calc_ecc)
> @@ -1325,6 +1311,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  	int eccsize	= info->nand.ecc.size;
>  	int eccstrength	= info->nand.ecc.strength;
>  	int eccsteps	= info->nand.ecc.steps;
> +	bool page_is_erased;
> +	u8 *buf;
>  	int i , j, stat = 0;
>  	int eccflag, actual_eccbytes;
>  	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
> @@ -1371,24 +1359,35 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
>  		}
>  
>  		if (eccflag == 1) {
> -			/*
> -			 * Set threshold to minimum of 4, half of ecc.strength/2
> -			 * to allow max bit flip in byte to 4
> -			 */
> -			unsigned int threshold = min_t(unsigned int, 4,
> -					info->nand.ecc.strength / 2);
> +			/* (a) page can be 'assumed' erased if
> +			 * all(read_ecc) == 0xff */

Can you fix your comment style please? Note the multiline style used by
the comments you are deleting.

> +			page_is_erased = true;
> +			for (j = 0; j < (eccbytes - 1); j++) {
> +				if (read_ecc[j] != 0xff) {
> +					page_is_erased = false;
> +					break;
> +				}
> +			}
>  
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
> +			/* (b) Due to architecture of NAND cell, bit-flip cannot
> +			 * change cell-value from '0' -> '1'. So if page has
> +			 * all(read_data) == 0xff, then its confirmed that
> +			 * there are no bit-flips in its data-region. Hence,
> +			 * read_data == 0xff can be safely returned. */

Ditto.

> +			if (!page_is_erased) {
> +				page_is_erased = true;
> +				buf = &data[eccsize * i];
> +				for (j = 0; j < (eccsize - 1); j++) {
> +					if (buf[j] != 0xff) {
> +						page_is_erased = false;
> +						break;
> +					}
> +				}
> +			}
> +
> +			/* erased-page needs to be handled separately, as ELM
> +			 * engine cannot parse pages with all(ECC) == 0xff */

Ditto.

> +			if (!page_is_erased) {
>  				/*
>  				 * Update elm error vector as
>  				 * data area is programmed

Brian
