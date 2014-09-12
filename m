Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSMeB-0003aW-2T
 for linux-mtd@lists.infradead.org; Fri, 12 Sep 2014 08:56:03 +0000
Message-ID: <5412B4EA.6080201@ti.com>
Date: Fri, 12 Sep 2014 11:55:06 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Move ELM driver and rename as omap_elm
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410443224-18477-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410443224-18477-2-git-send-email-ezequiel@vanguardiasur.com.ar>
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
> The ELM driver is only used by the OMAP NAND driver, so let's move it
> to the nand/ directory. Additionally, let's rename it to a less confusing
> name, so the module is built with a meaningful name, instead of the previous
> 'elm.ko'.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  drivers/mtd/devices/Makefile                   | 1 -
>  drivers/mtd/nand/Makefile                      | 1 +
>  drivers/mtd/{devices/elm.c => nand/omap_elm.c} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/mtd/{devices/elm.c => nand/omap_elm.c} (100%)
> 
> diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
> index c68868f..f0b0e61 100644
> --- a/drivers/mtd/devices/Makefile
> +++ b/drivers/mtd/devices/Makefile
> @@ -12,7 +12,6 @@ obj-$(CONFIG_MTD_LART)		+= lart.o
>  obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
>  obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
>  obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
> -obj-$(CONFIG_MTD_NAND_OMAP_BCH)	+= elm.o
>  obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
>  obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
>  obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index a035e7c..b3237b7 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
>  obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
>  obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
>  obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
> +obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
>  obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
>  obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
>  obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/nand/omap_elm.c
> similarity index 100%
> rename from drivers/mtd/devices/elm.c
> rename to drivers/mtd/nand/omap_elm.c
> 
