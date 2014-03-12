Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNevP-0001xj-SY
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 08:54:08 +0000
Date: Wed, 12 Mar 2014 16:06:07 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140312080605.GB30808@shlinux2.ap.freescale.net>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 11, 2014 at 02:11:51AM -0700, Brian Norris wrote:
> +static int nand_verify_erased_page(struct mtd_info *mtd, uint8_t *buf, int page)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	int i, oobbits, databits;
> +	uint8_t *data = buf, *oob = chip->oob_poi;
> +	unsigned int max_bitflips = 0;
> +	int oob_step = mtd->oobsize / chip->ecc.steps;
> +	int ret;
> +
> +	oobbits = oob_step * 8;
> +	databits = chip->ecc.size * 8;
> +
> +	/* read without ECC for verification */
> +	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
> +	if (ret)
> +		return ret;
> +
> +	/* Check each ECC step individually */
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		unsigned int flips = databits + oobbits;
> +
> +		flips -= bitmap_weight((unsigned long *)oob, oobbits);
> +		flips -= bitmap_weight((unsigned long *)data, databits);
> +
> +		/* Too many bitflips */
> +		if (flips > chip->ecc.strength)
> +			return -EBADMSG;
> +
> +		max_bitflips = max(max_bitflips, flips);
> +
> +		data += chip->ecc.size;
The gpmi uses a NAND layout like this:

	 *    +---+----------+-+----------+-+----------+-+----------+-+
	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|
	 *    +---+----------+-+----------+-+----------+-+----------+-+

        M : The metadata, which is 10 by default.	 
 	E : The ECC parity for "data" or "data + M".

If you want to count each sector, it makes the code very complicated. :(


> +		oob += oob_step;
> +	}
> +
> +	pr_debug("correcting bitflips in erased page (max %u)\n",
> +			max_bitflips);
> +
> +	memset(buf, 0xff, mtd->writesize);
> +	memset(oob, 0xff, mtd->oobsize);
> +
> +	return max_bitflips;
> +}
> +/**
>   * nand_do_read_ops - [INTERN] Read data with ECC
>   * @mtd: MTD device structure
>   * @from: offset to read from
> @@ -1554,6 +1610,18 @@ read_retry:
>  				break;
>  			}
>  
> +			/* Check an ECC error for 0xff + bitflips? */
> +			if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
> +					mtd->ecc_stats.failed - ecc_failures) {
> +				ret = nand_verify_erased_page(mtd, bufpoi,
> +						page);
I think we can merge this code into the read-retry check like:
	---------------------------------------------
			if (mtd->ecc_stats.failed - ecc_failures) {

				// step 1: count the bitflips, assume N.
				N = bitflips_count();
				// step 2:  
				if (N < ecc_strength) {
					do the erase-page-check;
				} else
					do the read-retry.


				if (retry_mode + 1 <= chip->read_retries) {
					retry_mode++;
					ret = nand_setup_read_retry(mtd,
							retry_mode);
					if (ret < 0)
						break;

					/* Reset failures; retry */
					mtd->ecc_stats.failed = ecc_failures;
					goto read_retry;
				} else {
					/* No more retry modes; real failure */
					ecc_fail = true;
				}
			}
	---------------------------------------------


thanks
Huang Shijie
