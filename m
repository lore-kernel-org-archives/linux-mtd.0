Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]
 helo=mo4.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMbih-0001Sk-T9
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 09:39:52 +0000
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with SMTP id ABBD6104FF2A
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2012 11:46:20 +0200 (CEST)
Date: Fri, 12 Oct 2012 11:37:30 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: nomadik: fixup some FSMC merge problems
Message-ID: <20121012093730.GA12801@game.jcrosoft.org>
References: <1349994182-26116-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349994182-26116-1-git-send-email-linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 00:23 Fri 12 Oct     , Linus Walleij wrote:
> 
> Due to a clash between refactoring and due to loss of a header
> file that remained in my working tree the Nomadik stopped
> compiling after switching to the FSMC driver. This patch fixes
> it up.
> 
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
> ---
>  arch/arm/mach-nomadik/board-nhk8815.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadik/board-nhk8815.c
> index a105d1b..3f97ef4 100644
> --- a/arch/arm/mach-nomadik/board-nhk8815.c
> +++ b/arch/arm/mach-nomadik/board-nhk8815.c
> @@ -37,14 +37,15 @@
>  #include <plat/mtu.h>
>  #include <plat/pincfg.h>
>  
> -#include <mach/fsmc.h>
> -
>  #include "cpu-8815.h"
>  
>  /* Initial value for SRC control register: all timers use MXTAL/8 source */
>  #define SRC_CR_INIT_MASK	0x00007fff
>  #define SRC_CR_INIT_VAL		0x2aaa8000
>  
> +#define ALE_OFF 0x1000000
> +#define CLE_OFF 0x800000
> +
>  /* These addresses span 16MB, so use three individual pages */
>  static struct resource nhk8815_nand_resources[] = {
>  	{
> @@ -53,6 +54,16 @@ static struct resource nhk8815_nand_resources[] = {
>  		.end = 0x40000000 + SZ_16K - 1,
>  		.flags = IORESOURCE_MEM,
>  	}, {
> +		.name = "nand_addr",
> +		.start = 0x40000000 + ALE_OFF,
> +		.end = 0x40000000 +ALE_OFF + SZ_16K - 1,
> +		.flags = IORESOURCE_MEM,
> +	}, {
> +		.name = "nand_cmd",
> +		.start = 0x40000000 + CLE_OFF,
> +		.end = 0x40000000 + CLE_OFF + SZ_16K - 1,
> +		.flags = IORESOURCE_MEM,
> +	}, {
>  		.name  = "fsmc_regs",
>  		.start = NOMADIK_FSMC_BASE,
>  		.end   = NOMADIK_FSMC_BASE + SZ_4K - 1,
> @@ -105,8 +116,6 @@ static struct fsmc_nand_platform_data nhk8815_nand_platform_data = {
>  	.partitions = nhk8815_partitions,
>  	.nr_partitions = ARRAY_SIZE(nhk8815_partitions),
>  	.width = FSMC_NAND_BW8,
> -	.ale_off = 0x1000000,
> -	.cle_off = 0x800000,
>  };
>  
>  static struct platform_device nhk8815_nand_device = {
> @@ -171,6 +180,10 @@ static struct platform_device nhk8815_onenand_device = {
>  	.num_resources	= ARRAY_SIZE(nhk8815_onenand_resource),
>  };
>  
> +/* bus control reg. and bus timing reg. for CS0..CS3 */
> +#define FSMC_BCR(x)	(NOMADIK_FSMC_VA + (x << 3))
> +#define FSMC_BTR(x)	(NOMADIK_FSMC_VA + (x << 3) + 0x04)
> +
>  static void __init nhk8815_onenand_init(void)
>  {
>  #ifdef CONFIG_MTD_ONENAND
> -- 
> 1.7.11.4
> 
