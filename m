Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSMkk-0007E6-DB
 for linux-mtd@lists.infradead.org; Fri, 12 Sep 2014 09:02:51 +0000
Message-ID: <5412B66F.8050505@ti.com>
Date: Fri, 12 Sep 2014 12:01:35 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: Force omap_elm to be built as a module
 if omap2_nand is a module
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410443224-18477-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410443224-18477-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, pekon <pekon@pek-sem.com>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2014 04:47 PM, Ezequiel Garcia wrote:
> This commit adds a hidden option to build the omap_elm as a module, if
> omap2_nand is a module (and similarly in the built-in case).
> 
> This fixes the following build error when omap2_nand is chosen built-in,
> and omap_elm is chosen as a module:
> 
> drivers/built-in.o: In function `omap_nand_probe':
> /work/linux-2.6/drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
> drivers/built-in.o: In function `omap_elm_correct_data':
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/Kconfig  | 8 +++++++-
>  drivers/mtd/nand/Makefile | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f1cf503..12e8ee8 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -96,7 +96,7 @@ config MTD_NAND_OMAP2
>  
>  config MTD_NAND_OMAP_BCH
>  	depends on MTD_NAND_OMAP2
> -	tristate "Support hardware based BCH error correction"
> +	bool "Support hardware based BCH error correction"
>  	default n
>  	select BCH
>  	help
> @@ -106,6 +106,12 @@ config MTD_NAND_OMAP_BCH
>  	  legacy OMAP families like OMAP2xxx, OMAP3xxx do not have ELM engine
>  	  so they should not enable this config symbol.
>  
> +config MTD_NAND_OMAP_BCH_BUILD
> +	tristate
> +	depends on MTD_NAND_OMAP2
> +	default m if MTD_NAND_OMAP2=m && MTD_NAND_OMAP_BCH
> +	default y if MTD_NAND_OMAP2=y && MTD_NAND_OMAP_BCH
> +
>  config MTD_NAND_IDS
>  	tristate
>  
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 4bcdeb0..3580188 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -27,7 +27,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
>  obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
>  obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
>  obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
> -obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
> +obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
>  obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
>  obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
>  obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
> 

The overall logic seems to work but I still see the following issue.

In menuconfig, the OMAP_BCH option is still visible as a boolean even though
the ELM module finally gets built as a module.
This can be confusing to the user and I'd avoid that behaviour.

cheers,
-roger
