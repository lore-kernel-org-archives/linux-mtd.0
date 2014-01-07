Received: from mail-db8lp0186.outbound.messaging.microsoft.com
 ([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0QVs-00072e-3k
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 06:51:44 +0000
Date: Tue, 7 Jan 2014 14:17:34 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: nand: add generic READ RETRY support
Message-ID: <20140107061733.GD8109@shlinux2.ap.freescale.net>
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

you can move this pr_debug into the nand_set_read_retry().


> +
> +					ret = nand_set_read_retry(mtd,
> +							retry_mode);
> +					if (ret < 0)
> +						break;
> +
> +					/* Reset failures */
> +					mtd->ecc_stats.failed = ecc_failures;
> +					continue;
> +				} else {
> +					/* No more retry modes; real failure */
> +					ecc_fail = true;
> +				}
> +			}
> +
> +			buf += bytes;
>  		} else {
>  			memcpy(buf, chip->buffers->databuf + col, bytes);
>  			buf += bytes;
> @@ -1525,6 +1565,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  
>  		readlen -= bytes;
>  
> +		/* Reset to retry mode 0 */
> +		if (retry_mode) {
> +			ret = nand_set_read_retry(mtd, 0);
> +			if (ret < 0)
> +				break;
> +			retry_mode = 0;
> +		}
> +
>  		if (!readlen)
>  			break;
>  
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 029fe5948dc4..ef70505dade1 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -472,6 +472,8 @@ struct nand_buffers {
>   *			commands to the chip.
>   * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on
>   *			ready.
> + * @set_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
> + *			setting the read-retry mode. Mostly needed for MLC NAND.

why not use the name "read_retry"?
i think it is more clear.

thanks
Huang Shijie
