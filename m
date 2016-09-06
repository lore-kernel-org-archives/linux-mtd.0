Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhMO1-0004Ir-9k
 for linux-mtd@lists.infradead.org; Tue, 06 Sep 2016 19:50:26 +0000
Date: Tue, 6 Sep 2016 21:50:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: linux-mtd@lists.infradead.org, Dipen.Dudhat@freescale.com, Ronak Desai
 <ronak.desai@rockwellcollins.com>
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
Message-ID: <20160906215003.1b6eb095@bbrezillon>
In-Reply-To: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
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

On Tue,  6 Sep 2016 14:13:17 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch adds random output enable command support in IFC nand
> controller driver. This command implements change read
> column (05h-E0h).
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 4e9e5fd..230919f 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  
>  		/*
>  		 * although currently it's 8 bytes for READID, we always read
> -		 * the maximum 256 bytes(for PARAM)
> +		 * the maximum 8192 bytes(for PARAM) supported by IFC controller
> +		 * as extended page may be available for some NAND devices.
>  		 */
> -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> -		ifc_nand_ctrl->read_bytes = 256;
> +		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole page */
> +		ifc_nand_ctrl->read_bytes = 8192; /* Maximum supported page by IFC */

And this exactly why letting drivers implement their own ->cmdfunc()
method is a bad idea.
->cmdfunc() does not provide enough information to guess how much data
should be read or written. Actually it's not supposed to be used this
way, but drivers usually abuse it.

I know you're just adding support for a new feature here, and I don't
blame you, but this kind of things make the whole NAND framework
impossible to maintain.

>  
>  		set_addr(mtd, 0, 0, 0);
>  		fsl_ifc_run_command(mtd);
> @@ -530,6 +531,29 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  		fsl_ifc_run_command(mtd);
>  		return;
>  
> +	case NAND_CMD_RNDOUT: {
> +		__le16 Tccs = 0;
> +		chip->onfi_version ? (Tccs = chip->onfi_params.t_ccs)
> +					: (Tccs = chip->jedec_params.t_ccs);
> +		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
> +				(IFC_FIR_OP_CA0 << IFC_NAND_FIR0_OP1_SHIFT) |
> +				(IFC_FIR_OP_CMD1 << IFC_NAND_FIR0_OP2_SHIFT) |
> +				(IFC_FIR_OP_NWAIT << IFC_NAND_FIR0_OP3_SHIFT),
> +				&ifc->ifc_nand.nand_fir0);
> +
> +		ifc_out32((NAND_CMD_RNDOUT << IFC_NAND_FCR0_CMD0_SHIFT) |
> +				(NAND_CMD_RNDOUTSTART << IFC_NAND_FCR0_CMD1_SHIFT),
> +				&ifc->ifc_nand.nand_fcr0);
> +
> +		/* Wait for minimum change column set-up time. But it does not harm
> +		 * to wait more time, so calculated based on 333.3 MHz input IFC clock
> +		 */

Can't you know the clk rate at runtime instead of basing your
calculation on the hypothetic clk rate?

> +		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc->ifc_nand.ncfgr);

Why is it done in ->cmdfunc()? I mean, this timing parameter should be
set for all operations, and applied as soon as ->select_chip() is
called.

> +		set_addr(mtd, column, 0, 0);
> +		fsl_ifc_run_command(mtd);
> +		return;
> +	}
> +
>  	default:
>  		dev_err(priv->dev, "%s: error, unsupported command 0x%x.\n",
>  					__func__, command);
