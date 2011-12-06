Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=AM1EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXydv-0003TO-66
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 17:17:24 +0000
Message-ID: <4EDE4E1D.4030408@freescale.com>
Date: Tue, 6 Dec 2011 11:17:17 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH 2/2 v2] mtd/nand: Add ONFI support for FSL NAND controller
References: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
 <1323161655-19050-2-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1323161655-19050-2-git-send-email-Shengzhou.Liu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kumar.gala@freescale.com,
 linuxppc-dev@lists.ozlabs.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/06/2011 02:54 AM, Shengzhou Liu wrote:
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index 4f405a0..b4db407 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -349,19 +349,24 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  		fsl_elbc_run_command(mtd);
>  		return;
>  
> -	/* READID must read all 5 possible bytes while CEB is active */
>  	case NAND_CMD_READID:
> -		dev_vdbg(priv->dev, "fsl_elbc_cmdfunc: NAND_CMD_READID.\n");
> +	case NAND_CMD_PARAM:
> +		dev_vdbg(priv->dev, "fsl_elbc_cmdfunc: NAND_CMD %x\n", command);
>  
>  		out_be32(&lbc->fir, (FIR_OP_CM0 << FIR_OP0_SHIFT) |
>  		                    (FIR_OP_UA  << FIR_OP1_SHIFT) |
>  		                    (FIR_OP_RBW << FIR_OP2_SHIFT));
> -		out_be32(&lbc->fcr, NAND_CMD_READID << FCR_CMD0_SHIFT);
> -		/* nand_get_flash_type() reads 8 bytes of entire ID string */
> -		out_be32(&lbc->fbcr, 8);
> -		elbc_fcm_ctrl->read_bytes = 8;
> +		out_be32(&lbc->fcr, command << FCR_CMD0_SHIFT);
> +		/* reads 8 bytes of entire ID string */
> +		if (NAND_CMD_READID == command) {

if (command == NAND_CMD_READID) {

> +			out_be32(&lbc->fbcr, 8);
> +			elbc_fcm_ctrl->read_bytes = 8;
> +		} else {
> +			out_be32(&lbc->fbcr, 256);
> +			elbc_fcm_ctrl->read_bytes = 256;
> +		}

Any harm in always using 256?

-Scott
