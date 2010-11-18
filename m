Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ8nv-000817-Be
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 18:01:56 +0000
Date: Thu, 18 Nov 2010 10:01:37 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH] omap: nand: remove hardware ECC as default
Message-ID: <20101118180137.GG9264@atomide.com>
References: <1290090130-20835-1-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290090130-20835-1-git-send-email-s-ghorai@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [101118 06:12]:
> CONFIG_MTD_NAND_OMAP_HWECC defined wronly in patch submitted during 2.6.36
> that using the hardware ECC by default
> 
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
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

This looks like a fix for the -rc cycle. Can you please update
the description a bit to specify which commit broke it and
what the error is now?

Regards,

Tony
