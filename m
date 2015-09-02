Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXFFE-00070f-MI
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 21:07:01 +0000
Received: by padhy1 with SMTP id hy1so22952782pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 14:06:40 -0700 (PDT)
Date: Wed, 2 Sep 2015 14:06:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar, tony@atomide.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap2: Rename shippable module to omap2_nand
Message-ID: <20150902210637.GY81844@google.com>
References: <1440153935-28927-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440153935-28927-1-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 01:45:35PM +0300, Roger Quadros wrote:
> As both omap2 onenand and omap2 nand driver modules are
> named the same i.e. "omap2.ko", only one of them gets shipped
> during MODPOST if both are configured as loadable modules.
> 
> To avoid this ambiguity let's ship the omap2 nand
> driver as "omap2_nand.ko"
> 
> Reported by Pierre Neyron via github
> https://github.com/beagleboard/linux/issues/40
> 
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/mtd/nand/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 1f897ec..075a027 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -26,7 +26,8 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
>  obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
>  obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
>  obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
> -obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
> +omap2_nand-objs := omap2.o
> +obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o

Pushed to l2-mtd.git. I suppose this one should go out for 4.3, as
there's little downside to it, and it's kind of a bugfix.

Brian

>  obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
>  obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
>  obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
> -- 
> 2.1.4
> 
