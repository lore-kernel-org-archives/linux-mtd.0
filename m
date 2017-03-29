Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctJaF-0004NZ-HV
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 19:48:45 +0000
Date: Wed, 29 Mar 2017 21:48:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v4 2/9] mtd: nand: make sure mtd_oob_ops consistent in bbt
Message-ID: <20170329214811.00a4a314@bbrezillon>
In-Reply-To: <1490262226-29092-3-git-send-email-peterpandong@micron.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-3-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Mar 2017 17:43:39 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit makes sure struct mtd_oob_ops passed to mtd_read/write_ops()
> is consistent, which means .datbuf = NULL and .len = 0 when not reading
> page; .oobbuf = NULL and .ooblen = 0 when not reading oob. If no, (ie.
> ops.datbuf = NULL, while ops.len != 0.), nand_for_each_page() will run
> forever.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/bbt.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
> index 94cd3e5..c35a6e8 100644
> --- a/drivers/mtd/nand/bbt.c
> +++ b/drivers/mtd/nand/bbt.c
> @@ -328,7 +328,7 @@ static int scan_read_oob(struct nand_device *this, uint8_t *buf, loff_t offs,
>  			 size_t len)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {0};

	struct mtd_oob_ops ops = { };

>  	int res, ret = 0;
>  
>  	ops.mode = MTD_OPS_PLACE_OOB;
> @@ -369,11 +369,12 @@ static int scan_write_bbt(struct nand_device *this, loff_t offs, size_t len,
>  			  uint8_t *buf, uint8_t *oob)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {0};
>  
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  	ops.ooboffs = 0;
> -	ops.ooblen = nand_per_page_oobsize(this);
> +	/* oob from caller may be NULL */
> +	ops.ooblen = oob ? nand_per_page_oobsize(this) : 0;
>  	ops.datbuf = buf;
>  	ops.oobbuf = oob;
>  	ops.len = len;
> @@ -428,13 +429,12 @@ static int scan_block_fast(struct nand_device *this, struct nand_bbt_descr *bd,
>  			   loff_t offs, uint8_t *buf, int numpages)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {0};
>  	int j, ret;
>  
>  	ops.ooblen = nand_per_page_oobsize(this);
>  	ops.oobbuf = buf;
>  	ops.ooboffs = 0;
> -	ops.datbuf = NULL;
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
>  	for (j = 0; j < numpages; j++) {
> @@ -734,11 +734,10 @@ static int write_bbt(struct nand_device *this, uint8_t *buf,
>  	uint8_t rcode = td->reserved_block_code;
>  	size_t retlen, len = 0;
>  	loff_t to;
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {0};
>  
>  	ops.ooblen = nand_per_page_oobsize(this);
>  	ops.ooboffs = 0;
> -	ops.datbuf = NULL;
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
>  	if (!rcode)
