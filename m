Received: from mail-ig0-f173.google.com ([209.85.213.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WM80b-0004qD-2t
 for linux-mtd@lists.infradead.org; Sat, 08 Mar 2014 03:33:10 +0000
Received: by mail-ig0-f173.google.com with SMTP id t19so3720748igi.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2014 19:32:45 -0800 (PST)
Date: Fri, 7 Mar 2014 19:32:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140308033238.GD5232@ld-irv-0074>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389602838-25212-1-git-send-email-b32955@freescale.com>
Cc: eliedebrauwer@gmail.com, bpringlemeir@nbsps.com,
 Vikram.Narayanan@in.bosch.com, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Pekon

On Mon, Jan 13, 2014 at 04:47:18PM +0800, Huang Shijie wrote:
> We may meet the bitflips in reading an erased page(contains all 0xFF),
> this may causes the UBIFS corrupt, please see the log from Elie:
> 
> -----------------------------------------------------------------
> [    3.831323] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.845026] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.858710] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.872408] UBI error: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read 16384 bytes
> ...
> [    4.011529] UBIFS error (pid 36): ubifs_recover_leb: corrupt empty space LEB 27:237568, corruption starts at 9815
> [    4.021897] UBIFS error (pid 36): ubifs_scanned_corruption: corruption at LEB 27:247383
> [    4.030000] UBIFS error (pid 36): ubifs_scanned_corruption: first 6569 bytes from LEB 27:247383
> -----------------------------------------------------------------
> 
> This patch does a check for the uncorrectable failure in the following steps:
> 
>    [0] set the threshold.
>        The threshold is set based on the truth:
>          "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
>           do the ECC."
> 
>        For the sake of safe, we will set the threshold with half the gf_len, and
>        do not make it bigger the ECC strength.

This threshold looks wrong here.

>    [1] count the bitflips of the current ECC chunk, assume it is N.
> 
>    [2] if the (N <= threshold) is true, we continue to read out the page with
>        ECC disabled. and we count the bitflips again, assume it is N2.
>        (We read out the whole page, not just a chunk, this makes the check
>         more strictly, and make the code more simple.)

You can read a whole page, but the counting should not be against the
whole page; it should allow 'threshold' # of bitflips in each sector.

>    [3] if the (N2 <= threshold) is true again, we can regard this is a erased
>        page. This is because a real erased page is full of 0xFF(maybe also has
>        several bitflips), while a page contains the 0xFF data will definitely
>        has many bitflips in the ECC parity areas.

This threshold definitely shouldn't be based on gf_len; it should be
based on ECC strength.

>    [4] if the [3] fails, we can regard this is a page filled with the '0xFF'
>        data.
> 
> Tested-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Reported-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> v3 --> v4:
> 	[1] update the mtd->ecc_stats.corrected when we detect an erased page.
> 	[2] add the shortcut when counting bitflips for non-ECC buffer.
> 	[3] add more comments about why read a whole page, but not a chunk.
> 
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   58 ++++++++++++++++++++++++++++++++
>  1 files changed, 58 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index e2f5820..6b6e707 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -958,6 +958,60 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
>  	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
>  }
>  
> +static bool gpmi_erased_check(struct gpmi_nand_data *this,
> +			unsigned char *data, unsigned int chunk, int page,
> +			unsigned int *max_bitflips)
> +{
> +	struct nand_chip *chip = &this->nand;
> +	struct mtd_info	*mtd = &this->mtd;
> +	struct bch_geometry *geo = &this->bch_geometry;
> +	int base = geo->ecc_chunk_size * chunk;
> +	unsigned int flip_bits = 0, flip_bits_noecc = 0;
> +	uint64_t *buf = (uint64_t *)this->data_buffer_dma;
> +	unsigned int threshold;
> +	int i;
> +
> +	threshold = geo->gf_len / 2;
> +	if (threshold > geo->ecc_strength)
> +		threshold = geo->ecc_strength;
> +
> +	/* Count bitflips */
> +	for (i = 0; i < geo->ecc_chunk_size; i++) {
> +		flip_bits += hweight8(~data[base + i]);
> +		if (flip_bits > threshold)
> +			return false;
> +	}

^^^ This is the only part that's unique to this patch, I think, but it's
not really special to GPMI. And it's not correct, either. Suppose I have
a high ECC strength flash (20-bit correction?) but gf_len is 14. Then
threshold == 7. Now, if we see 10 bitflips in an erased page, we will
return false here, saying this page was not erased. But 10 is easily
within the ECC spec for this flash. That's a problem, no?

So this check should be based on the ECC strength. But is this a good
optimization in the first place? I think it could be thrown out for
simplicity in the generic case (e.g., in my sample pasted below).

> +
> +	/*
> +	 * Read out the whole page with ECC disabled, and check it again,
> +	 * This is more strict then just read out a chunk, and it makes
> +	 * the code more simple.
> +	 */
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +	chip->read_buf(mtd, (uint8_t *)buf, mtd->writesize);
> +
> +	/* Count the bitflips for the no ECC buffer */
> +	for (i = 0; i < mtd->writesize / 8; i++) {
> +		flip_bits_noecc += hweight64(~buf[i]);
> +		if (flip_bits_noecc > threshold)
> +			return false;
> +	}

^^^ this loop should be broken up into sectors, so that you actually
count max_bitflips per sector, not for the whole page.

> +
> +	/* Tell the upper layer the bitflips we corrected. */
> +	mtd->ecc_stats.corrected += flip_bits;
> +	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);

This is wrong. You don't want to use the existing *max_bitflips value
from the previous read (remember, you're re-reading the data). You
should be doing a max() over each sector in the raw page, as mentioned
above.

> +
> +	/*
> +	 * The geo->payload_size maybe not equal to the page size
> +	 * when the Subpage-Read is enabled.
> +	 */
> +	memset(data, 0xff, geo->payload_size);
> +
> +	dev_dbg(this->dev, "The page(%d) is an erased page(%d,%d,%d,%d).\n",
> +			page, chunk, threshold, flip_bits, flip_bits_noecc);
> +	return true;
> +}
> +
>  static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				uint8_t *buf, int oob_required, int page)
>  {
> @@ -1007,6 +1061,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			continue;
>  
>  		if (*status == STATUS_UNCORRECTABLE) {
> +			if (gpmi_erased_check(this, payload_virt, i,
> +						page, &max_bitflips))
> +				break;
> +
>  			mtd->ecc_stats.failed++;
>  			continue;
>  		}

I'll post my alternate implementation below. I can work this up as a
real patch if you want. It could probably be optimized a bit to error
out quicker, but I don't think that is actually a performance concern
here.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>

/*
 * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
 * error
 *
 * On a real error, return a negative error code (-EBADMSG for ECC error), and
 * buf will contain raw data.
 * Otherwise, fill buf with 0xff and return the maximum number of
 * bitflips-per-ECC-sector to the caller.
 *
 */
static int nand_verify_erased_page(struct mtd_info *mtd,
		  struct nand_chip *chip, u32 *buf, u64 addr)
{
	int i, oob_step, oob_nbits, data_nbits;
	u8 *oob_buf = (u8 *) chip->oob_poi;
	unsigned int max_bitflips = 0;
	int page = addr >> chip->page_shift;
	int ret;

	oob_step = mtd->oobsize / chip->ecc.steps;
	oob_nbits = oob_step << 3;
	data_nbits = chip->ecc.size << 3;

	/* read without ecc for verification */
	ret = chip->ecc.read_page_raw(mtd, chip, (u8 *)buf, true, page);
	if (ret)
		return ret;

	for (i = 0; i < chip->ecc.steps; i++, oob_buf += oob_step) {
		unsigned int bitflips = 0;

		bitflips += oob_nbits -
			bitmap_weight((unsigned long *)oob_buf, oob_nbits);
		bitflips += data_nbits -
			bitmap_weight((unsigned long *)buf, data_nbits);

		buf += chip->ecc.size;
		addr += chip->ecc.size;

		/* Too many bitflips */
		if (bitflips > chip->ecc.strength)
			return -EBADMSG;

		max_bitflips = max(max_bitflips, bitflips);
	}

	pr_debug("correcting bitflips in erased page (max %u)\n",
			max_bitflips);

	return max_bitflips;
}
