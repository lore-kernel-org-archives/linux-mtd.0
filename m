Received: from mail-bn1bon0139.outbound.protection.outlook.com
 ([157.56.111.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlQxy-0005zf-Us
 for linux-mtd@lists.infradead.org; Mon, 03 Nov 2014 23:23:20 +0000
Message-ID: <1415056966.23458.305.camel@snotra.buserror.net>
Subject: Re: [PATCH 1/1][v2] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Jaiprakash Singh <b44839@freescale.com>
Date: Mon, 3 Nov 2014 17:22:46 -0600
In-Reply-To: <1413785506-443-1-git-send-email-b44839@freescale.com>
References: <1413785506-443-1-git-send-email-b44839@freescale.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, linux-mtd@lists.infradead.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-20 at 11:41 +0530, Jaiprakash Singh wrote:
> From: Jaiprakash Singh <b44839@freescale.com>
> 
> IFC registers can be of type Little Endian
> or big Endian depending upon Freescale SoC.
> Here SoC defines the register type of
> IFC IP.So update accessors functions with
> common IFC accessors functions to take
> care both type of endianness.
> 
> IFC IO accressor are set at run time based
> on IFC IP registers endianness.IFC node in
> DTS file contains information about
> endianness.
> 
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> ---
> Changes for v2
> 	- Moved IFC accessor function to fsl_ifc.h
> 	from fsl_ifc.c and make them inline static
> 
> .../bindings/memory-controllers/fsl/ifc.txt        |    2 +
>  drivers/memory/fsl_ifc.c                           |   72 ++++++----
>  drivers/mtd/nand/fsl_ifc_nand.c                    |  151 +++++++++++---------
>  include/linux/fsl_ifc.h                            |   42 ++++++
>  4 files changed, 167 insertions(+), 100 deletions(-)

Given that this spans MTD and non-MTD files, whose tree should this go
through?

> diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> index d5e3704..ee6226b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> @@ -18,6 +18,8 @@ Properties:
>                interrupt (NAND_EVTER_STAT).  If there is only one,
>                that interrupt reports both types of event.
>  
> +- little-endian : If this property is absent, the big-endian mode will
> +                  be in use as default for registers.
>  
>  - ranges : Each range corresponds to a single chipselect, and covers
>             the entire access window as configured.
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index 3d5d792..5689e9b 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@ -62,7 +62,8 @@ int fsl_ifc_find(phys_addr_t addr_base)
>  		return -ENODEV;
>  
>  	for (i = 0; i < ARRAY_SIZE(fsl_ifc_ctrl_dev->regs->cspr_cs); i++) {
> -		u32 cspr = in_be32(&fsl_ifc_ctrl_dev->regs->cspr_cs[i].cspr);
> +		u32 cspr = ifc_in32(
> +				&fsl_ifc_ctrl_dev->regs->cspr_cs[i].cspr);
>  		if (cspr & CSPR_V && (cspr & CSPR_BA) ==
>  				convert_ifc_address(addr_base))
>  			return i;
> @@ -79,16 +80,16 @@ static int fsl_ifc_ctrl_init(struct fsl_ifc_ctrl *ctrl)
>  	/*
>  	 * Clear all the common status and event registers
>  	 */
> -	if (in_be32(&ifc->cm_evter_stat) & IFC_CM_EVTER_STAT_CSER)
> -		out_be32(&ifc->cm_evter_stat, IFC_CM_EVTER_STAT_CSER);
> +	if (ifc_in32(&ifc->cm_evter_stat) & IFC_CM_EVTER_STAT_CSER)
> +		ifc_out32(IFC_CM_EVTER_STAT_CSER, &ifc->cm_evter_stat);
>  
>  	/* enable all error and events */
> -	out_be32(&ifc->cm_evter_en, IFC_CM_EVTER_EN_CSEREN);
> +	ifc_out32(IFC_CM_EVTER_EN_CSEREN, &ifc->cm_evter_en);
>  
>  	/* enable all error and event interrupts */
> -	out_be32(&ifc->cm_evter_intr_en, IFC_CM_EVTER_INTR_EN_CSERIREN);
> -	out_be32(&ifc->cm_erattr0, 0x0);
> -	out_be32(&ifc->cm_erattr1, 0x0);
> +	ifc_out32(IFC_CM_EVTER_INTR_EN_CSERIREN, &ifc->cm_evter_intr_en);
> +	ifc_out32(0x0, &ifc->cm_erattr0);
> +	ifc_out32(0x0, &ifc->cm_erattr1);
>  
>  	return 0;
>  }
> @@ -127,9 +128,9 @@ static u32 check_nand_stat(struct fsl_ifc_ctrl *ctrl)
>  
>  	spin_lock_irqsave(&nand_irq_lock, flags);
>  
> -	stat = in_be32(&ifc->ifc_nand.nand_evter_stat);
> +	stat = ifc_in32(&ifc->ifc_nand.nand_evter_stat);
>  	if (stat) {
> -		out_be32(&ifc->ifc_nand.nand_evter_stat, stat);
> +		ifc_out32(stat, &ifc->ifc_nand.nand_evter_stat);
>  		ctrl->nand_stat = stat;
>  		wake_up(&ctrl->nand_wait);
>  	}
> @@ -161,36 +162,37 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
>  	irqreturn_t ret = IRQ_NONE;
>  
>  	/* read for chip select error */
> -	cs_err = in_be32(&ifc->cm_evter_stat);
> +	cs_err = ifc_in32(&ifc->cm_evter_stat);
>  	if (cs_err) {
> -		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to"
> -				"any memory bank 0x%08X\n", cs_err);
> +		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to");
> +		dev_err(ctrl->dev, " any memory bank 0x%08X\n", cs_err);

This is an unrelated and unexplained change.

>  		/* clear the chip select error */
> -		out_be32(&ifc->cm_evter_stat, IFC_CM_EVTER_STAT_CSER);
> +		ifc_out32(IFC_CM_EVTER_STAT_CSER, &ifc->cm_evter_stat);
>  
>  		/* read error attribute registers print the error information */
> -		status = in_be32(&ifc->cm_erattr0);
> -		err_addr = in_be32(&ifc->cm_erattr1);
> -
> -		if (status & IFC_CM_ERATTR0_ERTYP_READ)
> -			dev_err(ctrl->dev, "Read transaction error"
> -				"CM_ERATTR0 0x%08X\n", status);
> -		else
> -			dev_err(ctrl->dev, "Write transaction error"
> -				"CM_ERATTR0 0x%08X\n", status);
> -
> +		status = ifc_in32(&ifc->cm_erattr0);
> +		err_addr = ifc_in32(&ifc->cm_erattr1);
> +
> +		if (status & IFC_CM_ERATTR0_ERTYP_READ) {
> +			dev_err(ctrl->dev, "Read transaction error");
> +			dev_err(ctrl->dev, " CM_ERATTR0 0x%08X\n", status);
> +		} else {
> +			dev_err(ctrl->dev, "Write transaction error");
> +			dev_err(ctrl->dev, " CM_ERATTR0 0x%08X\n", status);
> +		}
>  		err_axiid = (status & IFC_CM_ERATTR0_ERAID) >>
>  					IFC_CM_ERATTR0_ERAID_SHIFT;
> -		dev_err(ctrl->dev, "AXI ID of the error"
> -					"transaction 0x%08X\n", err_axiid);
> +		dev_err(ctrl->dev, "AXI ID of the erro");
> +		dev_err(ctrl->dev, " transaction 0x%08X\n", err_axiid);

"erro"?

Why are you splitting all of these into two dev_err() calls?  And you
don't have a newline after the first of each pair, which means the
device ID prefix is going to go in the middle of the string, without
even a space after the last word of the previous line -- and then you'll
have an extra space between the device ID prefix and the second string.
Did you test this change?

> @@ -302,19 +303,20 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  	int i;
>  
>  	/* set the chip select for NAND Transaction */
> -	iowrite32be(priv->bank << IFC_NAND_CSEL_SHIFT,
> +	ifc_out32(priv->bank << IFC_NAND_CSEL_SHIFT,
>  		    &ifc->ifc_nand.nand_csel);

The continuation line was aligned with priv->bank -- please preserve
that after the rename.  Likewise elsewhere.

> @@ -592,15 +596,21 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  		 * write-protected, even when it is not.
>  		 */
>  		if (chip->options & NAND_BUSWIDTH_16)
> -			setbits16(ifc_nand_ctrl->addr, NAND_STATUS_WP);
> +			ifc_out16(
> +			(ifc_in16(ifc_nand_ctrl->addr)
> +			| (NAND_STATUS_WP)),
> +			ifc_nand_ctrl->addr);
>  		else
> -			setbits8(ifc_nand_ctrl->addr, NAND_STATUS_WP);
> +			ifc_out8(
> +			(ifc_in8(ifc_nand_ctrl->addr)
> +			| (NAND_STATUS_WP)),
> +			ifc_nand_ctrl->addr);

Please do something better than this with the whitespace.  Probably
don't try to keep it all in one statement.

> -	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes) {
> -		offset = ifc_nand_ctrl->index++;
> -		return in_8(ifc_nand_ctrl->addr + offset);
> -	}
> +	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes)
> +		return ifc_in8(
> +				&ifc_nand_ctrl->addr[ifc_nand_ctrl->index++]);

Unnecessary newline.

>  	dev_err(priv->dev, "%s: beyond end of buffer\n", __func__);
>  	return ERR_BYTE;
> @@ -681,7 +689,8 @@ static uint8_t fsl_ifc_read_byte16(struct mtd_info *mtd)
>  	 * next byte.
>  	 */
>  	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes) {
> -		data = in_be16(ifc_nand_ctrl->addr + ifc_nand_ctrl->index);
> +		data = ifc_in16((uint16_t __iomem *)&ifc_nand_ctrl->
> +			       addr[ifc_nand_ctrl->index]);

Why do you need the cast with ifc_in16() but not in_be16()?

> @@ -885,7 +896,8 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  
>  	/* fill in nand_chip structure */
>  	/* set up function call table */
> -	if ((ioread32be(&ifc->cspr_cs[priv->bank].cspr)) & CSPR_PORT_SIZE_16)
> +	if ((ifc_in32(&ifc->cspr_cs[priv->bank].cspr)) &
> +			CSPR_PORT_SIZE_16)
>  		chip->read_byte = fsl_ifc_read_byte16;

If this didn't need to be wrapped with the longer name, why are you
wrapping it now?  Likewise elsewhere.

-Scott
