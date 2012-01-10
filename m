Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=TX2EHSOBE005.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkQC1-0003Pg-OI
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 01:08:03 +0000
Message-ID: <4F0B8F6B.5070305@freescale.com>
Date: Mon, 9 Jan 2012 19:07:55 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: Re: [PATCH 1/2][v2] mtd/nand:Fix wrong address read in is_blank()
References: <1326111847-13085-1-git-send-email-prabhakar@freescale.com>
In-Reply-To: <1326111847-13085-1-git-send-email-prabhakar@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Poonam Aggrwal <poonam.aggrwal@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/09/2012 06:24 AM, Prabhakar Kushwaha wrote:
> @@ -215,12 +215,15 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
>  static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
>  			  u32 *eccstat, unsigned int bufnum)
>  {
> +	struct nand_chip *chip = mtd->priv;
> +	int bufperpage = mtd->writesize / chip->ecc.size;
> +	int eccbuf_num = bufnum + (bufnum / bufperpage) * bufperpage;

This is unnecessarily complicated (and introduces two more, dependent,
runtime divisions).  I don't think there are any changes required in
this function.  You're awkwardly compensating for the fact that the
caller hasn't been updated for the new definition of bufnum.

bufperpage used in fsl_ifc_run_command should be doubled to account for
the OOB buffers.  We should probably rename it from "buf" to something
else (chunk? subpage?) to avoid confusion with bufnum_mask, which refers
to page-sized buffers.

>  	u32 reg = eccstat[bufnum / 4];
>  	int errors = (reg >> ((3 - bufnum % 4) * 8)) & 15;
>  
>  	if (errors == 15) { /* uncorrectable */
>  		/* Blank pages fail hw ECC checks */
> -		if (is_blank(mtd, bufnum))
> +		if (is_blank(mtd, eccbuf_num))
>  			return 1;
>  
>  		/*
> @@ -273,7 +276,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  		dev_err(priv->dev, "NAND Flash Write Protect Error\n");
>  
>  	if (nctrl->eccread) {
> -		int bufperpage = mtd->writesize / 512;
> +		int bufperpage = mtd->writesize / chip->ecc.size;
>  		int bufnum = (nctrl->page & priv->bufnum_mask) * bufperpage;
>  		int bufnum_end = bufnum + bufperpage - 1;
>  

Again, please calculate bufperpage (chunksperpage? subsperpage? perbuf?)
at driver init, as is done with bufnum_mask.

-Scott
