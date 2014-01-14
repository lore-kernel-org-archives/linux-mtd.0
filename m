Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2uOU-0006W1-Nq
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 03:10:24 +0000
Date: Tue, 14 Jan 2014 10:34:40 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: localize ECC failures per page
Message-ID: <20140114023439.GA22730@shlinux2.ap.freescale.net>
References: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 11:44:36AM -0800, Brian Norris wrote:
> ECC failures can be tracked at the page level, not the do_read_ops level
> (i.e., a potentially multi-page transaction).
> 
> This helps prepare for READ RETRY support.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v3 -> v4: adjust whitespace
> 
> (Earlier versions: no changes)
> 
>  drivers/mtd/nand/nand_base.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 404e83d7e3da..b5c3768b32ae 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1422,7 +1422,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  {
>  	int chipnr, page, realpage, col, bytes, aligned, oob_required;
>  	struct nand_chip *chip = mtd->priv;
> -	struct mtd_ecc_stats stats;
>  	int ret = 0;
>  	uint32_t readlen = ops->len;
>  	uint32_t oobreadlen = ops->ooblen;
> @@ -1431,8 +1430,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  
>  	uint8_t *bufpoi, *oob, *buf;
>  	unsigned int max_bitflips = 0;
> -
> -	stats = mtd->ecc_stats;
> +	bool ecc_fail = false;
>  
>  	chipnr = (int)(from >> chip->chip_shift);
>  	chip->select_chip(mtd, chipnr);
> @@ -1447,6 +1445,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  	oob_required = oob ? 1 : 0;
>  
>  	while (1) {
> +		unsigned int ecc_failures = mtd->ecc_stats.failed;
> +
>  		bytes = min(mtd->writesize - col, readlen);
>  		aligned = (bytes == mtd->writesize);
>  
> @@ -1483,7 +1483,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  			/* Transfer not aligned data */
>  			if (!aligned) {
>  				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
> -				    !(mtd->ecc_stats.failed - stats.failed) &&
> +				    !(mtd->ecc_stats.failed - ecc_failures) &&
>  				    (ops->mode != MTD_OPS_RAW)) {
>  					chip->pagebuf = realpage;
>  					chip->pagebuf_bitflips = ret;
> @@ -1513,6 +1513,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  				else
>  					nand_wait_ready(mtd);
>  			}
> +
> +			if (mtd->ecc_stats.failed - ecc_failures)
> +				ecc_fail = true;
>  		} else {
>  			memcpy(buf, chip->buffers->databuf + col, bytes);
>  			buf += bytes;
> @@ -1547,7 +1550,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (mtd->ecc_stats.failed - stats.failed)
> +	if (ecc_fail)
>  		return -EBADMSG;
>  
>  	return max_bitflips;
> -- 
> 1.8.3.2
> 
> 
> 
thanks

Please add my acks to all the patch set:
Acked-by: Huang Shijie <b32955@freescale.com>
