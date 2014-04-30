Received: from mail-bl2lp0206.outbound.protection.outlook.com
 ([207.46.163.206] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfKQ8-0003z9-IG
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 02:38:53 +0000
Date: Wed, 30 Apr 2014 09:40:18 +0800
From: Huang Shijie <b32955@freescale.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140430014015.GA19458@localhost>
References: <1398716871-14371-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1398716871-14371-1-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 04:27:51PM -0400, Kamal Dasu wrote:
> nand_base can be passed a kmap()'d buffers from highmem by
> filesystems like jffs2. This results in failure to map the
> physical address of the DMA buffer on various contoller
> driver on different platforms. This change adds a chip option
> to use preallocated databuf as bounce buffers used in
> nand_do_read_ops() and nand_do_write_ops().
> This allows for specific nand controller driver to set this
> option as needed.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
> 
> Changes since v3 :
> * print the right highmem buffer address in pr_debug in
>   nand_do_read_ops 
> 
>  drivers/mtd/nand/nand_base.c | 31 ++++++++++++++++++++++++-------
>  include/linux/mtd/nand.h     |  5 +++++
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9d01c4d..69ef5d9 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -37,6 +37,7 @@
>  #include <linux/err.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>  #include <linux/types.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
> @@ -1501,6 +1502,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  		mtd->oobavail : mtd->oobsize;
>  
>  	uint8_t *bufpoi, *oob, *buf;
> +	int use_bufpoi;
>  	unsigned int max_bitflips = 0;
>  	int retry_mode = 0;
>  	bool ecc_fail = false;
> @@ -1522,10 +1524,17 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  
>  		bytes = min(mtd->writesize - col, readlen);
>  		aligned = (bytes == mtd->writesize);
> +		use_bufpoi = (chip->options & NAND_USE_BOUNCE_BUFFER) ?
> +				!virt_addr_valid(buf) : 0;
>  
>  		/* Is the current page in the buffer? */
>  		if (realpage != chip->pagebuf || oob) {
> -			bufpoi = aligned ? buf : chip->buffers->databuf;
> +			bufpoi = (aligned && !use_bufpoi) ? buf :
> +				chip->buffers->databuf;
> +
> +			if (use_bufpoi && aligned)
> +				pr_debug("%s: using read bounce buffer for buf@%p\n",
> +						 __func__, buf);
>  
>  read_retry:
>  			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> @@ -1547,7 +1556,7 @@ read_retry:
>  				ret = chip->ecc.read_page(mtd, chip, bufpoi,
>  							  oob_required, page);
>  			if (ret < 0) {
> -				if (!aligned)
> +				if (!aligned || use_bufpoi)
>  					/* Invalidate page cache */
>  					chip->pagebuf = -1;
>  				break;
> @@ -1556,7 +1565,7 @@ read_retry:
>  			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>  
>  			/* Transfer not aligned data */
> -			if (!aligned) {
> +			if (!aligned || use_bufpoi) {
>  				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
>  				    !(mtd->ecc_stats.failed - ecc_failures) &&
>  				    (ops->mode != MTD_OPS_RAW)) {
> @@ -2376,11 +2385,19 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>  		int bytes = mtd->writesize;
>  		int cached = writelen > bytes && page != blockmask;
>  		uint8_t *wbuf = buf;
> -
> -		/* Partial page write? */
> -		if (unlikely(column || writelen < (mtd->writesize - 1))) {
> +		int use_bufpoi = (chip->options & NAND_USE_BOUNCE_BUFFER ?
> +				  !virt_addr_valid(buf) : 0);
> +		int part_pagewr = unlikely(column ||
> +					   writelen < (mtd->writesize - 1));
> +
> +		/* Partial page write?, or need to use bounce buffer */
> +		if (part_pagewr || use_bufpoi) {
> +			pr_debug("%s: using write bounce buffer for buf@%p\n",
> +					 __func__, buf);
>  			cached = 0;
> -			bytes = min_t(int, bytes - column, (int) writelen);
> +			if (part_pagewr)
> +				bytes = min_t(int,
> +					      bytes - column, (int) writelen);
>  			chip->pagebuf = -1;
>  			memset(chip->buffers->databuf, 0xff, mtd->writesize);
>  			memcpy(&chip->buffers->databuf[column], buf, bytes);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 450d61e..bb3e064 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -176,6 +176,11 @@ typedef enum {
>  /* Chip may not exist, so silence any errors in scan */
>  #define NAND_SCAN_SILENT_NODEV	0x00040000
>  /*
> + * This option is defined to protect against kmapped buffers

Could we change this to a more accurate comment?

Not only the kmapped buffers, also the vmalloc buffers are the highmem we
will meet.

So I suggest write the comment like this:
  
  "This option is defined to protect against the highmem buffers when using DMA,
   such as the kmapped buffers or the buffers allocated by vmalloc()."


You can change the above more readable :)

thanks
Huang Shijie


> + * being passed from highmem when using DMA
> + */
> +#define NAND_USE_BOUNCE_BUFFER	0x00080000
