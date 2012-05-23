Received: from mo3.mail-out.ovh.net ([178.32.228.3])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SX8ED-00023u-Vj
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 09:51:40 +0000
Received: from mail91.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 05306FF9EF9
 for <linux-mtd@lists.infradead.org>; Wed, 23 May 2012 11:54:29 +0200 (CEST)
Date: Wed, 23 May 2012 11:51:41 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v8 1/3] MTD: at91: extract hw ecc initialization to one
 function
Message-ID: <20120523095141.GE3377@game.jcrosoft.org>
References: <1337759274-9921-1-git-send-email-josh.wu@atmel.com>
 <1337759274-9921-2-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337759274-9921-2-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, dedekind1@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:47 Wed 23 May     , Josh Wu wrote:
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>  drivers/mtd/nand/atmel_nand.c     |  147 ++++++++++++++++++++-----------------
>  drivers/mtd/nand/atmel_nand_ecc.h |    8 +-
>  2 files changed, 85 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 2165576..9723702 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -42,20 +42,15 @@
>  
>  #include <mach/cpu.h>
>  
> +/* Hardware ECC registers */
> +#include "atmel_nand_ecc.h"
> +
>  static int use_dma = 1;
>  module_param(use_dma, int, 0);
>  
>  static int on_flash_bbt = 0;
>  module_param(on_flash_bbt, int, 0);
>  
> -/* Register access macros */
> -#define ecc_readl(add, reg)				\
> -	__raw_readl(add + ATMEL_ECC_##reg)
> -#define ecc_writel(add, reg, value)			\
> -	__raw_writel((value), add + ATMEL_ECC_##reg)
> -
> -#include "atmel_nand_ecc.h"	/* Hardware ECC registers */
> -
>  /* oob layout for large page size
>   * bad block info is on bytes 0 and 1
>   * the bytes have to be consecutives to avoid
> @@ -523,6 +518,75 @@ static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
>  }
>  #endif
>  
> +static int __init atmel_hw_nand_init_params(struct platform_device *pdev,
> +					 struct atmel_nand_host *host)
> +{
> +	struct resource		*regs;
> +	struct mtd_info		*mtd;
> +	struct nand_chip	*nand_chip;
> +
> +	nand_chip = &host->nand_chip;
> +	mtd = &host->mtd;
> +
> +	nand_chip->ecc.mode = NAND_ECC_SOFT;
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!regs) {
> +		dev_err(host->dev,
> +			"Can't get I/O resource regs, use software ECC\n");
just return 0 and avoid the if else


Best Regards,
J.
