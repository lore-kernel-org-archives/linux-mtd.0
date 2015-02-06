Received: from mail-pd0-f178.google.com ([209.85.192.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJX8v-0005rl-K2
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 00:51:34 +0000
Received: by pdbfl12 with SMTP id fl12so11069387pdb.6
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 16:51:12 -0800 (PST)
Date: Thu, 5 Feb 2015 16:51:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mtd: nand: pxa3xx: fix build on ARM64
Message-ID: <20150206005101.GA30781@ld-irv-0074>
References: <1423004776-17825-1-git-send-email-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423004776-17825-1-git-send-email-robh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 03, 2015 at 05:06:16PM -0600, Rob Herring wrote:
> In preparation to enable ARCH_MMP on ARM64, a couple of fixes are needed
> to build the pxa3xx_nand driver:
> 
> Legacy DMA will only used on ARM, so also make it condtional on
> CONFIG_ARM.
> __raw_{read,write}sl are not available on ARM64 or generically, so use
> the readsl/writesl variants instead.

Hmm, why the non __raw naming? I seems a little misleading that all the
other (non-raw) {read,write}{w,l}() helpers have endian swapping and
barriers, but this helper has neither.

Anyway, I think the patch looks good. Thomas or Ezequiel, can I get an
ack?

> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d..404d390 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -28,7 +28,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_mtd.h>
>  
> -#if defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP)
> +#if defined(CONFIG_ARM) && (defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP))
>  #define ARCH_HAS_DMA
>  #endif
>  
> @@ -486,24 +486,24 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
>  
>  	switch (info->state) {
>  	case STATE_PIO_WRITING:
> -		__raw_writesl(info->mmio_base + NDDB,
> -			      info->data_buff + info->data_buff_pos,
> -			      DIV_ROUND_UP(do_bytes, 4));
> +		writesl(info->mmio_base + NDDB,
> +			info->data_buff + info->data_buff_pos,
> +			DIV_ROUND_UP(do_bytes, 4));
>  
>  		if (info->oob_size > 0)
> -			__raw_writesl(info->mmio_base + NDDB,
> -				      info->oob_buff + info->oob_buff_pos,
> -				      DIV_ROUND_UP(info->oob_size, 4));
> +			writesl(info->mmio_base + NDDB,
> +				info->oob_buff + info->oob_buff_pos,
> +				DIV_ROUND_UP(info->oob_size, 4));
>  		break;
>  	case STATE_PIO_READING:
> -		__raw_readsl(info->mmio_base + NDDB,
> -			     info->data_buff + info->data_buff_pos,
> -			     DIV_ROUND_UP(do_bytes, 4));
> +		readsl(info->mmio_base + NDDB,
> +		       info->data_buff + info->data_buff_pos,
> +		       DIV_ROUND_UP(do_bytes, 4));
>  
>  		if (info->oob_size > 0)
> -			__raw_readsl(info->mmio_base + NDDB,
> -				     info->oob_buff + info->oob_buff_pos,
> -				     DIV_ROUND_UP(info->oob_size, 4));
> +			readsl(info->mmio_base + NDDB,
> +			       info->oob_buff + info->oob_buff_pos,
> +			       DIV_ROUND_UP(info->oob_size, 4));
>  		break;
>  	default:
>  		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
> @@ -1580,7 +1580,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  	info->pdev = pdev;
>  	info->variant = pxa3xx_nand_get_variant(pdev);
>  	for (cs = 0; cs < pdata->num_cs; cs++) {
> -		mtd = (struct mtd_info *)((unsigned int)&info[1] +
> +		mtd = (struct mtd_info *)((void *)&info[1] +
>  		      (sizeof(*mtd) + sizeof(*host)) * cs);
>  		chip = (struct nand_chip *)(&mtd[1]);
>  		host = (struct pxa3xx_nand_host *)chip;

Brian
