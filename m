Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc16i-0000v8-O0
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 02:38:47 +0000
Received: by mail-pf0-x241.google.com with SMTP id e4so1440020pfg.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 18:38:22 -0800 (PST)
Date: Thu, 9 Feb 2017 18:38:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: fixup gemini/versatile dependencies
Message-ID: <20170210023819.GP94627@google.com>
References: <20170209020937.62339-1-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170209020937.62339-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

Any thoughts? It's either revert your patches, or apply something like
this. I'm going to need to decide that in the next <24 hours or so.

On Wed, Feb 08, 2017 at 06:09:37PM -0800, Brian Norris wrote:
> physmap_of sort of depends on the gemini and versatile modules (when
> they're enabled), but this isn't expressed in Kconfig. Let's just merge
> the modules all together, when enabled. Then we can avoid exporting a
> few symbols, and the versatile and gemini code can now be modular again
> (the below commit accidentally made them built-in only).
> 
> Resolves errors like this:
> 
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> ERROR: "of_flash_probe_gemini" [drivers/mtd/maps/physmap_of.ko] undefined!
> 
> Fixes: 56ff337ea433 ("mtd: physmap_of: add a hook for Gemini flash probing")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/maps/Makefile               | 8 ++++++--
>  drivers/mtd/maps/physmap_of_gemini.c    | 1 -
>  drivers/mtd/maps/physmap_of_versatile.c | 1 -
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 2fec1e0c2371..aef1846b4de2 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -17,9 +17,13 @@ obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
>  obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
>  obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
>  obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
> +ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
> +physmap_of-objs += physmap_of_versatile.o
> +endif
> +ifdef CONFIG_MTD_PHYSMAP_OF_GEMINI
> +physmap_of-objs += physmap_of_gemini.o
> +endif
>  obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
> -obj-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE)	+= physmap_of_versatile.o
> -obj-$(CONFIG_MTD_PHYSMAP_OF_GEMINI)	+= physmap_of_gemini.o
>  obj-$(CONFIG_MTD_PISMO)		+= pismo.o
>  obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
>  obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
> diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/physmap_of_gemini.c
> index e99db772143b..9d371cd728ea 100644
> --- a/drivers/mtd/maps/physmap_of_gemini.c
> +++ b/drivers/mtd/maps/physmap_of_gemini.c
> @@ -115,4 +115,3 @@ int of_flash_probe_gemini(struct platform_device *pdev,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(of_flash_probe_gemini);
> diff --git a/drivers/mtd/maps/physmap_of_versatile.c b/drivers/mtd/maps/physmap_of_versatile.c
> index 0f39b2a015f4..8c6ccded9be8 100644
> --- a/drivers/mtd/maps/physmap_of_versatile.c
> +++ b/drivers/mtd/maps/physmap_of_versatile.c
> @@ -252,4 +252,3 @@ int of_flash_probe_versatile(struct platform_device *pdev,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(of_flash_probe_versatile);
> -- 
> 2.11.0.483.g087da7b7c-goog
> 
