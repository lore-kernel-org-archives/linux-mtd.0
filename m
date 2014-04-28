Received: from mail-bn1ln0166.outbound.protection.outlook.com
 ([2a01:111:f400:7c10::166] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WeiaK-0004QK-EZ
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 10:14:53 +0000
Date: Mon, 28 Apr 2014 17:16:40 +0800
From: Huang Shijie <b32955@freescale.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140428091638.GB21064@localhost>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 24, 2014 at 05:40:34PM -0400, Kamal Dasu wrote:
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
> Changes since v1:
>  * Fix bytes to write calculation in nand_do_write_ops
> 
>  drivers/mtd/nand/nand_base.c | 28 +++++++++++++++++++++-------
>  include/linux/mtd/nand.h     |  5 +++++
>  2 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9d01c4d..d94242a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1501,6 +1501,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  		mtd->oobavail : mtd->oobsize;
>  
>  	uint8_t *bufpoi, *oob, *buf;
> +	int use_bufpoi;
>  	unsigned int max_bitflips = 0;
>  	int retry_mode = 0;
>  	bool ecc_fail = false;
> @@ -1522,10 +1523,16 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  
>  		bytes = min(mtd->writesize - col, readlen);
>  		aligned = (bytes == mtd->writesize);
> +		use_bufpoi = (chip->options & NAND_USE_BOUNCE_BUFFER) ?
> +				!virt_addr_valid(buf) : 0;
I met a compiler error here in the ARM platform.

I think you should add some header.
>  
>  		/* Is the current page in the buffer? */
>  		if (realpage != chip->pagebuf || oob) {
> -			bufpoi = aligned ? buf : chip->buffers->databuf;
> +			bufpoi = (aligned && !use_bufpoi) ? buf :
> +				chip->buffers->databuf;
> +
> +			if (use_bufpoi && aligned)
> +				pr_debug("%s: using bounce buffer\n", __func__);
print more info here, such as:
		pr_debug("%s: using bounce buffer for buf:%p\n", __func__, buf);

>  
>  read_retry:
>  			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> @@ -1547,7 +1554,7 @@ read_retry:
>  				ret = chip->ecc.read_page(mtd, chip, bufpoi,
>  							  oob_required, page);
>  			if (ret < 0) {
> -				if (!aligned)
> +				if (!aligned || use_bufpoi)
>  					/* Invalidate page cache */
>  					chip->pagebuf = -1;
>  				break;
> @@ -1556,7 +1563,7 @@ read_retry:
>  			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>  
>  			/* Transfer not aligned data */
> -			if (!aligned) {
> +			if (!aligned || use_bufpoi) {

  In actually, the " if (!aligned || use_bufpoi) " is equal to 
	  "if (bufpoi == chip->buffers->databuf)) {"

  I am not sure which is more readable. :)

  But I prefer to the later.

  Let Brian to judge it.

  thanks
  Huang Shijie
