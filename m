Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqV1J-0002Do-4A
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 23:15:58 +0000
Received: by pabsx10 with SMTP id sx10so52596754pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 16:15:35 -0700 (PDT)
Date: Thu, 7 May 2015 16:15:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Tomas Hlavacek <tmshlvck@gmail.com>
Subject: Re: [RFC] mtd: fsl_elbc_nand Add ECC mode selection in DT
Message-ID: <20150507231530.GT32500@ld-irv-0074>
References: <1429690690-15057-1-git-send-email-tmshlvck@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429690690-15057-1-git-send-email-tmshlvck@gmail.com>
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 22, 2015 at 10:18:10AM +0200, Tomas Hlavacek wrote:
> Add device tree parameters to turn off the HW ECC and force own ECC mode
> and ECC parameters. New entries are: nand-ecc-mode, nand-ecc-step-size
> and nand-ecc-strength.
> 
> Add RNDOUT operation which is required for SOFT and SOFT_BCH modes.
> 
> Do not set write_subpage function pointer from the driver when it initializes
> in SOFT and SOFT_BCH modes.
> 
> Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c | 47 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index 04b22fd..76ab2e2 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -335,6 +335,14 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  		fsl_elbc_run_command(mtd);
>  		return;
>  
> +	case NAND_CMD_RNDOUT:
> +		dev_vdbg(priv->dev,
> +			 "fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, column: 0x%x.\n",
> +			 column);
> +
> +		elbc_fcm_ctrl->index = column;
> +		return;
> +
>  	/* READOOB reads only the OOB because no ECC is performed. */
>  	case NAND_CMD_READOOB:
>  		dev_vdbg(priv->dev,
> @@ -656,6 +664,10 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
>  	        chip->ecc.steps);
>  	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.bytes = %d\n",
>  	        chip->ecc.bytes);
> +	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.size = %d\n",
> +		chip->ecc.size);
> +	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.strength = %d\n",
> +		chip->ecc.strength);
>  	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.total = %d\n",
>  	        chip->ecc.total);
>  	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.layout = %p\n",
> @@ -677,8 +689,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
>  		priv->page_size = 1;
>  		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
>  		/* adjust ecc setup if needed */
> -		if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
> -		    BR_DECC_CHK_GEN) {
> +		if (((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
> +		    BR_DECC_CHK_GEN) && (chip->ecc.mode == NAND_ECC_HW)) {
>  			chip->ecc.size = 512;
>  			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
>  			                   &fsl_elbc_oob_lp_eccm1 :
> @@ -742,6 +754,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
>  	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
>  	struct nand_chip *chip = &priv->chip;
> +	struct device_node *node = priv->dev->of_node;
> +	const char *ecc_mode;
>  
>  	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
>  
> @@ -774,11 +788,38 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  
>  	chip->ecc.read_page = fsl_elbc_read_page;
>  	chip->ecc.write_page = fsl_elbc_write_page;
> -	chip->ecc.write_subpage = fsl_elbc_write_subpage;
> +
> +	/* Override default HW ECC according to settings in DT */
> +	if (!of_property_read_string(node, "nand-ecc-mode", &ecc_mode)) {
> +		if (!strncmp("none", ecc_mode, 4)) {
> +			chip->ecc.mode = NAND_ECC_NONE;
> +			return 0;
> +		}
> +
> +		if (!strncmp("soft_bch", ecc_mode, 8)) {
> +			chip->ecc.mode = NAND_ECC_SOFT_BCH;
> +			chip->ecc.size = 512;
> +			chip->ecc.strength = 4;
> +
> +			of_property_read_u32(node, "nand-ecc-step-size",
> +						&chip->ecc.size);
> +			of_property_read_u32(node, "nand-ecc-strength",
> +						&chip->ecc.strength);

We have helpers for these in drivers/of/of_mtd.c.

> +			chip->ecc.bytes = ((fls(1+8*chip->ecc.size)*
> +				chip->ecc.strength)/8);

Do you actually need this? I think nand_scan_tail() calculates this for
you.

> +			return 0;
> +		}
> +
> +		if (!strncmp("soft", ecc_mode, 4)) {
> +			chip->ecc.mode = NAND_ECC_SOFT;

There's a helper for this too.

> +			return 0;
> +		}
> +	}

In fact, I think most of this could be superseded by using this patch:

http://patchwork.ozlabs.org/patch/469092/

Then you can assign

	chip->dn = node;
	
and maybe validate a few parameters in this driver to make sure
everything is sane.

>  
>  	/* If CS Base Register selects full hardware ECC then use it */
>  	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
>  	    BR_DECC_CHK_GEN) {
> +		chip->ecc.write_subpage = fsl_elbc_write_subpage;
>  		chip->ecc.mode = NAND_ECC_HW;
>  		/* put in small page settings and adjust later if needed */
>  		chip->ecc.layout = (priv->fmr & FMR_ECCM) ?

Brian
