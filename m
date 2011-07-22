Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkKn9-0000Hn-Tj
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 18:49:44 +0000
Date: Fri, 22 Jul 2011 13:49:38 -0500
From: Scott Wood <scottwood@freescale.com>
To: Michael Hench <michaelhench@gmail.com>
Subject: Re: RFC fsl_elbc_nand.c does not update mtd->ecc_stats
Message-ID: <20110722134938.4e8268ee@schlenkerla.am.freescale.net>
In-Reply-To: <CAHyXW60RcO4poP8VXkm5Q0+9ACui1i_og2kDis8RKs=pxKB18w@mail.gmail.com>
References: <CAHyXW60RcO4poP8VXkm5Q0+9ACui1i_og2kDis8RKs=pxKB18w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, MatthewLCreech@eaton.com,
	linux-mtd@lists.infradead.org, mhench@elutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 Jul 2011 08:06:53 -0500
Michael Hench <michaelhench@gmail.com> wrote:

> when using the fsl_elbc_nand driver, mtd->ecc_stats does not appear to
> get updated

It gets updated for uncorrectable errors (so no need to use lteccr for
that), but not correctable.

> diff -purN orig/drivers/mtd/nand/fsl_elbc_nand.c
> linux-3.0-rc7/drivers/mtd/nand/fsl_elbc_nand.c
> --- orig/drivers/mtd/nand/fsl_elbc_nand.c	2011-07-22 07:02:37.908778052 -0500
> +++ linux-3.0-rc7/drivers/mtd/nand/fsl_elbc_nand.c	2011-07-22
> 06:56:09.655002047 -0500
> @@ -748,12 +748,43 @@ static int fsl_elbc_read_page(struct mtd
>  			      uint8_t *buf,
>  			      int page)
>  {
> +	struct fsl_elbc_mtd *priv = chip->priv;
> +	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
> +	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
> +	uint32_t lteccr;
> +
>  	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
>  	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> 
>  	if (fsl_elbc_wait(mtd, chip) & NAND_STATUS_FAIL)
>  		mtd->ecc_stats.failed++;
> 
> +	if(chip->ecc.mode != NAND_ECC_HW)
> +		return(0);
> +
> +	/* get the hardware ECC results */
> +	lteccr = in_be32(&lbc->lteccr);

Older versions of eLBC have LTECCR, though on the ones that don't have it,
it appears to read as zero and not be modifyable, so it shouldn't make
anything worse.

> +	if(lteccr & 0x000F000F) {
> +		int i;
> +
> +		out_be32(&lbc->lteccr, -1); /* clear lteccr */

We should read and clear lteccr in fsl_elbc_run_command, and test the
stored value here.  That way we don't have leftover bits set in lteccr from
a read that didn't use read_page (such as MTD_OOB_RAW).

> +		printk(KERN_ERR "ECC RESULT %x n=%d",
> +			lteccr, mtd->ecc_stats.corrected);

I assume this is temporary?

-Scott
