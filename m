Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8GAV-0003mL-03
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 20:53:48 +0000
Received: by mail-pb0-f54.google.com with SMTP id ro12so5575894pbb.13
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 13:53:25 -0700 (PDT)
Date: Sat, 10 Aug 2013 13:53:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 05/15] mtd: nand: pxa3xx: Support command buffer #3
Message-ID: <20130810205312.GB14331@norris.computersforpeace.net>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 10, 2013 at 04:34:55PM -0300, Ezequiel Garcia wrote:
> Some newer controllers support a fourth command buffer. This additional
> command buffer allows to set an arbitrary length count, using the
> NDCB3.NDLENCNT field, to perform non-standard length operations
> such as the ONFI parameter page read.
> 
> In controllers without this register, the operation has no effect.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-by: Daniel Mack <zonque@gmail.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 3a3e042..83a7187 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -197,6 +197,7 @@ struct pxa3xx_nand_info {
>  	uint32_t		ndcb0;
>  	uint32_t		ndcb1;
>  	uint32_t		ndcb2;
> +	uint32_t		ndcb3;
>  };
>  
>  static bool use_dma = 1;
> @@ -496,6 +497,10 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>  		nand_writel(info, NDCB0, info->ndcb0);
>  		nand_writel(info, NDCB0, info->ndcb1);
>  		nand_writel(info, NDCB0, info->ndcb2);
> +
> +		/* NDCB3 register is available in NFCv2 (Armada 370/XP SoC) */
> +		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +			nand_writel(info, NDCB0, info->ndcb3);

Pardon my unfamiliarity with your hardware, but why do you have the
following three register definitions if you're only using NDCB0?

#define NDCB0           (0x48) /* Command Buffer0 */
#define NDCB1           (0x4C) /* Command Buffer1 */
#define NDCB2           (0x50) /* Command Buffer2 */

>  	}
>  
>  	/* clear NDSR to let the controller exit the IRQ */
> @@ -554,6 +559,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
>  	default:
>  		info->ndcb1 = 0;
>  		info->ndcb2 = 0;
> +		info->ndcb3 = 0;
>  		break;
>  	}
>  

Brian
