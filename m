Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSMe7-0003Yw-Vm
 for linux-mtd@lists.infradead.org; Fri, 12 Sep 2014 08:56:00 +0000
Message-ID: <5412B502.3090305@ti.com>
Date: Fri, 12 Sep 2014 11:55:30 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand: Rename OMAP NAND driver
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410443224-18477-3-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410443224-18477-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2014 04:47 PM, Ezequiel Garcia wrote:
> Rename it to a less generic name, so the module is built with a meaningful
> name instead of the previous 'omap2.ko'.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  drivers/mtd/nand/Makefile                  | 2 +-
>  drivers/mtd/nand/{omap2.c => omap2_nand.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (100%)
> 
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index b3237b7..4bcdeb0 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -26,7 +26,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
>  obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
>  obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
>  obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
> -obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
> +obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
>  obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
>  obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
>  obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2_nand.c
> similarity index 100%
> rename from drivers/mtd/nand/omap2.c
> rename to drivers/mtd/nand/omap2_nand.c
> 
