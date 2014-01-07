Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0RD6-0007TD-LT
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 07:36:25 +0000
Date: Tue, 7 Jan 2014 15:02:10 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/5] mtd: nand: localize ECC failures per page
Message-ID: <20140107070209.GF8109@shlinux2.ap.freescale.net>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:37:04PM -0800, Brian Norris wrote:
> ECC failures can be tracked at the page level, not the do_read_ops level
> (i.e., a potentially multi-page transaction).
> 
> This helps prepare for READ RETRY support.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> No changes since v1
> 
>  drivers/mtd/nand/nand_base.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9b3bb3c519e9..e85b07f4293d 100644
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
> @@ -1432,7 +1431,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  	uint8_t *bufpoi, *oob, *buf;
>  	unsigned int max_bitflips = 0;
>  
> -	stats = mtd->ecc_stats;
> +	bool ecc_fail = false;

Please do not put this line here, put it in the above lines.

>  
>  	chipnr = (int)(from >> chip->chip_shift);
>  	chip->select_chip(mtd, chipnr);
> @@ -1447,6 +1446,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  	oob_required = oob ? 1 : 0;
>  
>  	while (1) {
> +		unsigned int ecc_failures = mtd->ecc_stats.failed;
please add a white line here.


thanks
Huang Shijie
