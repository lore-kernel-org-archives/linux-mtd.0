Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD7CH-0004o1-Db
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 06:19:42 +0000
Received: by mail-pb0-f50.google.com with SMTP id uo5so1478923pbc.37
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 23:19:19 -0700 (PDT)
Date: Fri, 23 Aug 2013 23:19:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 4/9] mtd: gpmi: rewrite the gpmi_ecc_write_oob() to
 support the jffs2
Message-ID: <20130824061916.GC32074@brian-ubuntu>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376879478-22128-5-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 10:31:13AM +0800, Huang Shijie wrote:
> When we use the ECC info which is get from the nand chip's datasheet,
> we may have some freed oob area now.
> 
> This patch rewrites the gpmi_ecc_write_oob() to implement the ecc.write_oob().
> We also update the comment for gpmi_hw_ecclayout.
> 
> Yes! We can support the JFFS2 for the SLC nand now.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   31 ++++++++++++++++++++++---------
>  1 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 9c89e80..cc0306b 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -45,7 +45,10 @@ static struct nand_bbt_descr gpmi_bbt_descr = {
>  	.pattern	= scan_ff_pattern
>  };
>  
> -/*  We will use all the (page + OOB). */
> +/*
> + * We may change the layout if we can get the ECC info from the datasheet,
> + * else we will use all the (page + OOB).
> + */
>  static struct nand_ecclayout gpmi_hw_ecclayout = {
>  	.eccbytes = 0,
>  	.eccpos = { 0, },
> @@ -1263,14 +1266,24 @@ static int gpmi_ecc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  static int
>  gpmi_ecc_write_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
>  {
> -	/*
> -	 * The BCH will use all the (page + oob).
> -	 * Our gpmi_hw_ecclayout can only prohibit the JFFS2 to write the oob.
> -	 * But it can not stop some ioctls such MEMWRITEOOB which uses
> -	 * MTD_OPS_PLACE_OOB. So We have to implement this function to prohibit
> -	 * these ioctls too.
> -	 */
> -	return -EPERM;
> +	struct nand_oobfree *of = gpmi_hw_ecclayout.oobfree;

Why do you directly access your static layout? I think you should use
the proper indirection, through chip->ecc.layout. (There's a similar
issue with set_geometry_by_ecc_info() currently.)

[BTW, I was about to recommend nand_chip.ecclayout, but it looks like
that is just a dead field. It's not initialized anywhere, AFAICT, and if
it's used anywhere, it's more likely a bug than anything else...]

> +	int status = 0;
> +
> +	/* Do we have available oob area? */
> +	if (!of->length)
> +		return -EPERM;
> +
> +	if (!nand_is_slc(chip))
> +		return -EPERM;
> +
> +	pr_debug("page number is %d\n", page);
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize + of->offset, page);
> +	chip->write_buf(mtd, chip->oob_poi + of->offset, of->length);
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +
> +	status = chip->waitfunc(mtd, chip);
> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
>  }
>  
>  static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)

Brian
