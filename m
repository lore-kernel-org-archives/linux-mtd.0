Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cr10K-0000st-L8
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 11:34:10 +0000
Subject: Re: [RESEND PATCH v2 52/53] mtd: nand: denali: use non-managed
 kmalloc() for DMA buffer
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-26-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Lars-Peter Clausen <lars@metafoo.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8fa877a7-c43a-76e7-2252-3463c8c3afcd@arm.com>
Date: Thu, 23 Mar 2017 11:33:42 +0000
MIME-Version: 1.0
In-Reply-To: <1490228282-10805-26-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/03/17 00:18, Masahiro Yamada wrote:
> As Russell and Lars stated in the discussion [1], using
> devm_k*alloc() with DMA is not a good idea.
> 
> Let's use kmalloc (not kzalloc because no need for zero-out).
> Also, allocate the buffer as late as possible because it must be
> freed for any error that follows.

I still think the way the driver actually uses this buffer looks very
suspect - keeping it permanently mapped for bidirectional (AKA "I don't
know") streaming DMA across multiple operations doesn't add up. If the
device might access it at any time (or the driver simply doesn't want to
have to care) it should be a coherent allocation. Otherwise, it should
just be mapped/unmapped with the appropriate direction around each
operation.

Either way though, this patch at least makes things somewhat *less*
incorrect, so:

Acked-by: Robin Murphy <robin.murphy@arm.com>

> [1] https://lkml.org/lkml/2017/3/8/693
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/denali.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 4900745..28622a9 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -23,6 +23,7 @@
>  #include <linux/mutex.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/module.h>
> +#include <linux/slab.h>
>  
>  #include "denali.h"
>  
> @@ -1343,13 +1344,6 @@ int denali_init(struct denali_nand_info *denali)
>  	if (ret)
>  		goto disable_irq;
>  
> -	denali->buf = devm_kzalloc(denali->dev, mtd->writesize + mtd->oobsize,
> -				   GFP_KERNEL);
> -	if (!denali->buf) {
> -		ret = -ENOMEM;
> -		goto disable_irq;
> -	}
> -
>  	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__DMA)
>  		denali->dma_avail = 1;
>  
> @@ -1460,17 +1454,29 @@ int denali_init(struct denali_nand_info *denali)
>  	if (ret)
>  		goto disable_irq;
>  
> +	/*
> +	 * This buffer may be DMA-mapped.  Do not use devm_kmalloc() because
> +	 * the memory allocated by devm_ is not cache line aligned.
> +	 */
> +	denali->buf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
> +	if (!denali->buf) {
> +		ret = -ENOMEM;
> +		goto disable_irq;
> +	}
> +
>  	ret = nand_scan_tail(mtd);
>  	if (ret)
> -		goto disable_irq;
> +		goto free_buf;
>  
>  	ret = mtd_device_register(mtd, NULL, 0);
>  	if (ret) {
>  		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
> -		goto disable_irq;
> +		goto free_buf;
>  	}
>  	return 0;
>  
> +free_buf:
> +	kfree(denali->buf);
>  disable_irq:
>  	denali_disable_irq(denali);
>  
> @@ -1490,6 +1496,7 @@ void denali_remove(struct denali_nand_info *denali)
>  	int bufsize = mtd->writesize + mtd->oobsize;
>  
>  	nand_release(mtd);
> +	kfree(denali->buf);
>  	denali_disable_irq(denali);
>  	dma_unmap_single(denali->dev, denali->dma_addr, bufsize,
>  			 DMA_BIDIRECTIONAL);
> 
