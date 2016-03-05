Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac1xX-0003QX-DY
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 02:28:48 +0000
Received: by mail-pf0-x231.google.com with SMTP id x188so21307627pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 18:28:26 -0800 (PST)
Date: Fri, 4 Mar 2016 18:28:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, fcooper@ti.com, nsekhar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/26] mtd: nand: omap: Clean up device tree support
Message-ID: <20160305022823.GO55664@google.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-10-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455916548-3441-10-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, another small thing I noticed.

On Fri, Feb 19, 2016 at 11:15:31PM +0200, Roger Quadros wrote:
> Move NAND specific device tree parsing to NAND driver.
> 
> The NAND controller node must have a compatible id, register space
> resource and interrupt resource.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
[...]

> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 9e99199..0a637c4 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_mtd.h>
>  
>  #include <linux/mtd/nand_bch.h>
>  #include <linux/platform_data/elm.h>
> @@ -177,10 +178,11 @@ struct omap_nand_info {
>  	struct gpmc_nand_regs		reg;
>  	struct gpmc_nand_ops		*ops;
>  	/* generated at runtime depending on ECC algorithm and layout selected */

^^^ I don't think that comment describes the following line. You
probably meant to delete this one?

> +	bool				flash_bbt;
> +	/* generated at runtime depending on ECC algorithm and layout */
>  	struct nand_ecclayout		oobinfo;
>  	/* fields specific for BCHx_HW ECC scheme */
>  	struct device			*elm_dev;
> -	struct device_node		*of_node;
>  };
>  
>  static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)

[...]

Brian
