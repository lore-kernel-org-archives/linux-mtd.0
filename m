Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0SRn-0000PW-Bn
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 08:55:39 +0000
Date: Tue, 7 Jan 2014 16:21:28 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: nand: add generic READ RETRY support
Message-ID: <20140107082126.GA23761@shlinux2.ap.freescale.net>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388795828-24808-3-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:37:06PM -0800, Brian Norris wrote:
> Modern MLC (and even SLC?) NAND can experience a large number of
> bitflips (beyond the recommended correctability capacity) due to drifts
> in the voltage threshold (Vt). These bitflips can cause ECC errors to
> occur well within the expected lifetime of the flash. To account for
> this, some manufacturers provide a mechanism for shifting the Vt
> threshold after a corrupted read.
> 
> The generic pattern seems to be that a particular flash has N read retry
> modes (where N = 0, traditionally), and after an ECC failure, the host
> should reconfigure the flash to use the next available mode, then retry
> the read operation. This process repeats until all bitfips can be
> corrected or until the host has tried all available retry modes.
> 
> This patch adds the infrastructure support for a
> vendor-specific/flash-specific callback, used for setting the read-retry
> mode (i.e., voltage threshold).
> 
> For now, this patch always returns the flash to mode 0 (the default
> mode) after a successful read-retry, according to the flowchart found in
> Micron's datasheets. This may need to change in the future if it is
> determined that eventually, mode 0 is insufficient for the majority of
> the flash cells (and so for performance reasons, we should leave the
> flash in mode 1, 2, etc.).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v1 -> v2: fix a logic error when incrementing retry_mode, which caused -EINVAL
>           failures on flash that didn't need READ RETRY
> 
> v2 -> v3: split out the generic callback support as a separate patch; adjust #
>           of retry modes bounds check
> 
>  drivers/mtd/nand/nand_base.c | 56 ++++++++++++++++++++++++++++++++++++++++----
>  include/linux/mtd/nand.h     |  6 +++++
>  2 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e85b07f4293d..d47c5bbca2b3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1410,6 +1410,28 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
>  }
>  
>  /**
> + * nand_set_read_retry - [INTERN] Set the READ RETRY mode
> + * @mtd: MTD device structure
> + * @retry_mode: the retry mode to use
> + *
> + * Some vendors supply a special command to shift the Vt threshold, to be used
> + * when there are too many bitflips in a page (i.e., ECC error). After setting
> + * a new threshold, the host should retry reading the page.
> + */
> +static int nand_set_read_retry(struct mtd_info *mtd, int retry_mode)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +
> +	if (retry_mode >= chip->read_retries)
> +		return -EINVAL;
> +
> +	if (!chip->set_read_retry)
> +		return -EOPNOTSUPP;
> +
> +	return chip->set_read_retry(mtd, retry_mode);
> +}
> +
> +/**
>   * nand_do_read_ops - [INTERN] Read data with ECC
>   * @mtd: MTD device structure
>   * @from: offset to read from
> @@ -1431,6 +1453,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  	uint8_t *bufpoi, *oob, *buf;
>  	unsigned int max_bitflips = 0;
>  
> +	int retry_mode = 0;
>  	bool ecc_fail = false;
>  
>  	chipnr = (int)(from >> chip->chip_shift);
> @@ -1494,8 +1517,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  				memcpy(buf, chip->buffers->databuf + col, bytes);
>  			}
>  
> -			buf += bytes;
> -
>  			if (unlikely(oob)) {
>  				int toread = min(oobreadlen, max_oobsize);
>  
> @@ -1514,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  					nand_wait_ready(mtd);
>  			}
>  
> -			if (mtd->ecc_stats.failed - ecc_failures)
> -				ecc_fail = true;
> +			if (mtd->ecc_stats.failed - ecc_failures) {
> +				if (retry_mode + 1 <= chip->read_retries) {
> +					retry_mode++;
> +					pr_debug("ECC error; performing READ RETRY %d\n",
> +							retry_mode);
> +
> +					ret = nand_set_read_retry(mtd,
> +							retry_mode);
> +					if (ret < 0)
> +						break;
> +
> +					/* Reset failures */
> +					mtd->ecc_stats.failed = ecc_failures;
> +					continue;
IMHO, use a "goto" here makes it more readable.
and the "goto" makes the code runs faster.

such as:

-------------------------------------------------------------------------

+read_retry:
			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);

			/*
			 * Now read the page into the buffer.  Absent an error,
			 * the read methods return max bitflips per ecc step.
			 */
			if (unlikely(ops->mode == MTD_OPS_RAW))
				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
							      oob_required,
							      page);
			else if (!aligned && NAND_HAS_SUBPAGE_READ(chip) &&
				 !oob)
				ret = chip->ecc.read_subpage(mtd, chip,
							col, bytes, bufpoi,
							page);
			else
				ret = chip->ecc.read_page(mtd, chip, bufpoi,
							  oob_required, page);
                        ....................
+			if (mtd->ecc_stats.failed - ecc_failures) {
+				if (retry_mode + 1 <= chip->read_retries) {
+					retry_mode++;
+					pr_debug("ECC error; performing READ RETRY %d\n",
+							retry_mode);
+
+					ret = nand_set_read_retry(mtd,
+							retry_mode);
+					if (ret < 0)
+						break;
+
+					/* Reset failures */
+					mtd->ecc_stats.failed = ecc_failures;
+					goto read_retry;

--------------------------------------------------------------------


thanks
Huang Shijie
