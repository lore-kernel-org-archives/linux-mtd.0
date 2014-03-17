Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPcaz-0003cP-C5
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 18:49:11 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so6139348pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 11:48:45 -0700 (PDT)
Date: Mon, 17 Mar 2014 11:41:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [RFC PATCH v2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140317184130.GA3834@ld-irv-0074>
References: <1394803700-29467-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394803700-29467-1-git-send-email-pekon@ti.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Frederic HOUR <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 14, 2014 at 06:58:20PM +0530, Pekon Gupta wrote:
> From: Brian Norris <computersforpeace@gmail.com>
> 
> 
> *changes v1 -> v2*
> Tried optimizing for performance by making following updates
>  - *read_data and *read_oob passed as arguments to nand_verify_erased_page()
>    to avoid re-reading the page from device chip->ecc.read_page_raw()

This is not valid for all drivers. See the 'oob_required' parameter to
read_page(). This means that if we can't verify for sure that it's
uncorrectable without looking at the OOB, we have to re-read to include
the OOB.

>  - exit nand_verify_erased_page() as-soon-as bitflips > ecc.strength

Thanks, that's probably good.

>  - using hweightN() only for non-0xff data

I'm not convinced that's a great optimization. I would write the simpler
version without the 0xff check, then add it if it really makes sense.
hweightN() is actually a pretty simple computation, and adding extra
branches might be more harmful than helpful.

>  - if erased-page is detected then clean only read_data
>    ?? need to see if OOB cleaning affects file-system metadata like JFFS2 cleanmarker

Nak. We must clean both OOB and data buffers if we are doing this
"correction". We don't put FS-specific hacks here. I don't know the
specifics of JFFS2 cleanmarkers, but JFFS2 should have valid ECC bytes
present whenever it expects a (non-raw) read to retain a few 0 bits. Or
else it should be using a raw read mode.

> 
> Further possible enhancements
>  - compare data and OOB in chunks of 32 bits(WORD)
> 	if (*(*u32 *)&oob[j] != 0xffffffff)
> 		bitflips += hweight32(~(* (u32 *)&oob[j]));
> 	if (*(*u32 *)&data[j] != 0xffffffff)
> 		bitflips += hweight32(~(*(u32 *)&data[j]));

I certainly agree that hweight8() is a bad choice. Either
hweight32(), hweight64(), or hweight_long().

> Testing Procedure
> NAND Device= Block-size=256K, Page-size=4K, OOBsize=224B
>  - 8-bits bit-flips introduced at each 512 bytes (64 bit-flips/page)
>  - Test Partition=502 (completely blank), ECC-schme=BCH16
>  - with existing patches [2]
> 	LOG: TIME_TAKEN=94 THROUGHPUT=5.59 MB/s
> 	LOG: TIME_TAKEN=93 THROUGHPUT=5.66 MB/s
>  - with current patch
> 	LOG: TIME_TAKEN=96 THROUGHPUT=5.48 MB/s

Your patch in [2] is incorrect. Please do not make any performance
comparisons with [2].

Can you compare against the current omap2.c head for some
configurations? It seems like there are still some platform-specific
hacks in omap2.c that likely give it a performance advantage.

> *original v1*
> Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
> will return all 1's (0xff). However, modern NAND (MLC, and even some
> SLC) experience bitflips in unprogrammed pages, and so they may not read
> back all 1's. This is problematic for drivers whose ECC cannot correct
> bitflips in an all-0xff page, as they will report an ECC error
> (-EBADMSG) when they come across such a page. This appears to UBIFS as
> "corrupt empty space".
> 
> Several others [1][2] are attempting to solve this problem, but none is
> generically useful, and most (all?) have subtle bugs in their reasoning. Let's
> implement a simple, generic, and correct solution instead.
> 
> To handle such situations, we should implement the following software
> workaround for drivers that need it: when the hardware driver reports an
> ECC error, nand_base should "verify" this error by
> 
>  * Re-reading the page without ECC
>  * counting the number of 0 bits in each ECC sector (N[i], for i = 0, 1,
>    ..., chip->ecc.steps)
>  * If any N[i] exceeds the ECC strength (and thus, the maximum allowable
>    bitflips) then we consider this to be an uncorrectable sector.
>  * If all N[i] are less than the ECC strength, then we "correct" the
>    output to all-0xff and report max-bitflips appropriately
> 
> Obviously, this sequence can be compute intensive if applied heavily.
> Ideally, MTD users should not need to read un-programmed pages very
> often and would require this software check, for instance, only during
> attach/mount checks or certain recovery situations.
> 
> Drivers can request support for this new feature by OR'ing
> NAND_ECC_NEED_CHECK_FF into their chip->options.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.html
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/nand.h     |  5 ++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c4f2cc9..305ba03 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1483,6 +1483,50 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
>  }
>  
>  /**
> + * nand_verify_erased_page - [INTERN] Check a page for 0xff + bitflips
> + * @mtd: MTD device structure
> + * @data: should contain read_data (either raw or "corrected")
> + * @oob:  should contain read_oob  (either raw or "corrected")
> + *
> + * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
> + * error, by counting number of zero-bits in both data and oob buffers.
> + * if number of bitflips in any ecc-step exceeds ecc.strength then it returns
> + * without checking the complete page, because its a genuine error
> + */
> +static int nand_verify_erased_page(struct mtd_info *mtd, struct nand_chip *chip,
> +					const uint8_t *data, const uint8_t *oob)
> +{
> +	unsigned int max_bitflips = 0, bitflips;
> +	int oob_step = mtd->oobsize / chip->ecc.steps;
> +	int ecc_strength = chip->ecc.strength;
> +	int ecc_size = chip->ecc.size;
> +	int i, j;
> +
> +	/* Check each ECC step individually */
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		bitflips = 0;
> +		for (j = 0; bitflips <= ecc_strength && j < oob_step; j++)
> +			if (oob[j] != 0xff)
> +				bitflips += hweight8(~oob[j]);
> +
> +		for (j = 0; bitflips <= ecc_strength && j < ecc_size; j++)
> +			if (data[j] != 0xff)
> +				bitflips += hweight8(~data[j]);
> +
> +		/* Too many bitflips */
> +		if (bitflips > ecc_strength)
> +			return bitflips;
> +
> +		max_bitflips = max(max_bitflips, bitflips);
> +
> +		data += ecc_size;
> +		oob += oob_step;
> +	}
> +
> +	return max_bitflips;
> +}
> +
> +/**
>   * nand_do_read_ops - [INTERN] Read data with ECC
>   * @mtd: MTD device structure
>   * @from: offset to read from
> @@ -1544,9 +1588,26 @@ read_retry:
>  				ret = chip->ecc.read_subpage(mtd, chip,
>  							col, bytes, bufpoi,
>  							page);
> -			else
> +			else {
>  				ret = chip->ecc.read_page(mtd, chip, bufpoi,
>  							  oob_required, page);
> +				/* Check if its an erased-page with bit-flips */
> +				if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
> +					mtd->ecc_stats.failed - ecc_failures) {
> +					ret = nand_verify_erased_page(mtd, chip,
> +							bufpoi, chip->oob_poi);

You have corrupted my patch so that now it does not handle the subpage
case.

Also, it's not safe to use data from chip->oob_poi if
oob_required==false.

> +					if (ret <= chip->ecc.strength) {

It's preferable if we don't have to duplicate the ecc.strength check
here and inside nand_verify_erased_page(). Huang and others have pointed
out that ecc.strength is not the best threshold, so I'd like to keep
this "threshold" defined in exactly one place.

> +						/* it's an erased-page */
> +						mtd->ecc_stats.failed =
> +								ecc_failures;
> +						memset(bufpoi, 0xff,
> +								mtd->writesize);
> +					} else {
> +						pr_warn("found uncorrectable bit-flips\n");
> +						ret = 0;
> +					}
> +				}
> +			}
>  			if (ret < 0) {
>  				if (!aligned)
>  					/* Invalidate page cache */
> @@ -1554,6 +1615,7 @@ read_retry:
>  				break;
>  			}
>  
> +
>  			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>  
>  			/* Transfer not aligned data */

Anyway, I have already heard comments from several people (including
you), but you have only addressed some of them in your version of my
patch. Please, let me send my own patches, and you can provide your
feedback there.

If you want to do several patch iterations with performance comparisons
(NOT against patches that are performing unsound optimizations, like
[2]), then post a summary email with links to the patches you test
(e.g., with and without the "break early" checks; with hweight8() vs.
hweight_long(); etc.). You don't have to formally submit every patch you
test for performance, as this adds confusion. You could place them on
github, for instance, and we can integrate feeback based on the best
approach.

Brian
