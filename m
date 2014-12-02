Received: from mail-by2on0113.outbound.protection.outlook.com
 ([207.46.100.113] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvffH-0000Bs-VE
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 05:06:20 +0000
Message-ID: <1417496750.15957.212.camel@freescale.com>
Subject: Re: [PATCH 1/1][v3] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Jaiprakash Singh <b44839@freescale.com>
Date: Mon, 1 Dec 2014 23:05:50 -0600
In-Reply-To: <1417432523-2573-1-git-send-email-b44839@freescale.com>
References: <1417432523-2573-1-git-send-email-b44839@freescale.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, B32579@freescale.com, linux-mtd@lists.infradead.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-12-01 at 16:45 +0530, Jaiprakash Singh wrote:
> @@ -377,31 +377,31 @@ static void fsl_ifc_do_read(struct nand_chip *chip,
>  
>  	/* Program FIR/IFC_NAND_FCR0 for Small/Large page */
>  	if (mtd->writesize > 512) {
> -		iowrite32be((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
> +		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
>  			    (IFC_FIR_OP_CA0 << IFC_NAND_FIR0_OP1_SHIFT) |
>  			    (IFC_FIR_OP_RA0 << IFC_NAND_FIR0_OP2_SHIFT) |
>  			    (IFC_FIR_OP_CMD1 << IFC_NAND_FIR0_OP3_SHIFT) |
>  			    (IFC_FIR_OP_RBCD << IFC_NAND_FIR0_OP4_SHIFT),
>  			    &ifc->ifc_nand.nand_fir0);

You're still breaking continuation line alignment, here and elsewhere...

> +		addr = ifc_nand_ctrl->addr;
>  		if (chip->options & NAND_BUSWIDTH_16)
> -			setbits16(ifc_nand_ctrl->addr, NAND_STATUS_WP);
> +			ifc_out16((ifc_in16(addr) | (NAND_STATUS_WP)), addr);
>  		else
> -			setbits8(ifc_nand_ctrl->addr, NAND_STATUS_WP);
> +			ifc_out8((ifc_in8(addr) | (NAND_STATUS_WP)), addr);
>  		return;

Unnecessary parentheses

-Scott
