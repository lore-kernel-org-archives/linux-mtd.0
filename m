Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PNUaO-0002qC-PI
	for linux-mtd@lists.infradead.org; Tue, 30 Nov 2010 18:05:57 +0000
Date: Tue, 30 Nov 2010 10:05:42 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH V2] omap: nand: remove hardware ECC as default
Message-ID: <20101130180542.GP17222@atomide.com>
References: <1290177926-3526-1-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290177926-3526-1-git-send-email-s-ghorai@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [101119 06:36]:
> CONFIG_MTD_NAND_OMAP_HWECC defined wrongly in patch submitted for 2.6.36.
> This flag enables hw ecc by default. Boards like beagle and pandora uses
> sw ecc for write (e.g. binary flushed from u-boot) and read from kernel.
> https://patchwork.kernel.org/patch/111036/
> 
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>

This should go in as a fix for the -rc via MTD list if possible.

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  drivers/mtd/nand/omap2.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index cd41c58..15682ec 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -7,7 +7,6 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> -#define CONFIG_MTD_NAND_OMAP_HWECC
>  
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
> -- 
> 1.7.0.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
