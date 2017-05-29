Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFRsp-0005F1-MH
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 21:07:25 +0000
Date: Mon, 29 May 2017 23:06:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 09/15] mtd: nand: make sure mtd_oob_ops consistent in
 bbt
Message-ID: <20170529230651.41670304@bbrezillon>
In-Reply-To: <1495609631-18880-10-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-10-git-send-email-peterpandong@micron.com>
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

On Wed, 24 May 2017 15:07:05 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit makes sure struct mtd_oob_ops passed to mtd_read/write_ops()
> is consistent, which means .datbuf = NULL and .len = 0 when not reading
> page; .oobbuf = NULL and .ooblen = 0 when not reading oob. If no, (ie.
> ops.datbuf = NULL, while ops.len != 0.), nand_for_each_page() will run
> forever.

This should be done before making bbt core generic, and this is
something I can already apply in this release.

> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/bbt.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
> index 56115d5..96d4e14 100644
> --- a/drivers/mtd/nand/bbt.c
> +++ b/drivers/mtd/nand/bbt.c
> @@ -328,7 +328,7 @@ static int scan_read_oob(struct nand_device *this, uint8_t *buf, loff_t offs,
>  			 size_t len)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {};
>  	int res, ret = 0;
>  
>  	ops.mode = MTD_OPS_PLACE_OOB;
> @@ -369,11 +369,12 @@ static int scan_write_bbt(struct nand_device *this, loff_t offs, size_t len,
>  			  uint8_t *buf, uint8_t *oob)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	struct mtd_oob_ops ops;
> +	struct mtd_oob_ops ops = {};
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
> +	struct mtd_oob_ops ops = {};
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
> +	struct mtd_oob_ops ops = {};
>  
>  	ops.ooblen = nand_per_page_oobsize(this);
>  	ops.ooboffs = 0;
> -	ops.datbuf = NULL;
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
>  	if (!rcode)
