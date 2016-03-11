Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeNVm-00029K-By
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 13:53:51 +0000
Subject: Re: [PATCH v4 1/7] ARM: OMAP2+: gpmc-nand: Set omap2-nand's parent
 dev to GPMC dev
To: Franklin S Cooper Jr <fcooper@ti.com>, <nsekhar@ti.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <tony@atomide.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-2-git-send-email-fcooper@ti.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56E2CDB7.2080306@ti.com>
Date: Fri, 11 Mar 2016 15:52:55 +0200
MIME-Version: 1.0
In-Reply-To: <1457654203-20856-2-git-send-email-fcooper@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Franklin,

On 11/03/16 01:56, Franklin S Cooper Jr wrote:
> The dma channel information is located within the GPMC node which is the
> NAND's parent node. The NAND driver requires a handle to the GPMC's dev
> to properly parse the DMA properties. Therefore, set the NAND's parent dev
> to the GPMC's dev so it can be referenced within the driver.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 4 changes:
> Instead of storing the GPMC dev in a new property simply grab a reference
> to it and set omap2-nand's dev.parent to it.
> 
>  arch/arm/mach-omap2/gpmc-nand.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
> index 72918c4..77e453c 100644
> --- a/arch/arm/mach-omap2/gpmc-nand.c
> +++ b/arch/arm/mach-omap2/gpmc-nand.c
> @@ -15,6 +15,7 @@
>  #include <linux/omap-gpmc.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/platform_data/mtd-nand-omap2.h>
> +#include <linux/of_platform.h>
>  
>  #include <asm/mach/flash.h>
>  
> @@ -77,6 +78,9 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
>  	int err	= 0;
>  	struct gpmc_settings s;
>  	struct platform_device *pdev;
> +	struct platform_device *gpmc_dev;
> +	struct device_node *gpmc_node;
> +
>  	struct resource gpmc_nand_res[] = {
>  		{ .flags = IORESOURCE_MEM, },
>  		{ .flags = IORESOURCE_IRQ, },
> @@ -134,8 +138,18 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
>  	if (pdev) {
>  		err = platform_device_add_resources(pdev, gpmc_nand_res,
>  						    ARRAY_SIZE(gpmc_nand_res));
> -		if (!err)
> +		if (!err) {
>  			pdev->dev.platform_data = gpmc_nand_data;
> +
> +			gpmc_node = of_get_parent(gpmc_nand_data->of_node);

I'm afraid that we can't use this method as we want to restrict
gpmc_nand_init() to non-DT boots.

> +
> +			if (gpmc_node) {
> +				gpmc_dev = of_find_device_by_node(gpmc_node);
> +
> +				if (gpmc_dev)
> +					pdev->dev.parent = &gpmc_dev->dev;
> +			}
> +		}
>  	} else {
>  		err = -ENOMEM;
>  	}
> 

cheers,
-roger
