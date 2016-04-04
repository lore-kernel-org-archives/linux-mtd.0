Subject: Re: [PATCH 03/12] mtd: nand: omap2: rely on generic DT parsing done
 in nand_scan_ident()
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Tony Lindgren
 <tony@atomide.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu
 <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459515272-31011-4-git-send-email-boris.brezillon@free-electrons.com>
CC: <linux-omap@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, <linux-sunxi@googlegroups.com>, Zhou Wang
 <wangzhou1@hisilicon.com>, Alex Smith <alex.smith@imgtec.com>, Harvey Hunt
 <harvey.hunt@imgtec.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <57021658.5060901@ti.com>
Date: Mon, 4 Apr 2016 10:23:04 +0300
MIME-Version: 1.0
In-Reply-To: <1459515272-31011-4-git-send-email-boris.brezillon@free-electrons.com>
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

On 01/04/16 15:54, Boris Brezillon wrote:
> The core now takes care of parsing generic DT properties in
> nand_scan_ident() when nand_set_flash_node() has been called.
> Rely on this initialization instead of calling of_get_nand_xxx()
> manually.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger

> ---
>  drivers/memory/omap-gpmc.c | 7 -------
>  drivers/mtd/nand/omap2.c   | 9 ++++++---
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index 21825dd..85aa85e 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -25,7 +25,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_mtd.h>
>  #include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/omap-gpmc.h>
> @@ -1876,12 +1875,6 @@ static int gpmc_probe_nand_child(struct platform_device *pdev,
>  				break;
>  			}
>  
> -	gpmc_nand_data->flash_bbt = of_get_nand_on_flash_bbt(child);
> -
> -	val = of_get_nand_bus_width(child);
> -	if (val == 16)
> -		gpmc_nand_data->devsize = NAND_BUSWIDTH_16;
> -
>  	gpmc_read_timings_dt(child, &gpmc_t);
>  	gpmc_nand_init(gpmc_nand_data, &gpmc_t);
>  
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 0749ca1..8921283 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1704,9 +1704,7 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	if (pdata->flash_bbt)
> -		nand_chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> -	else
> -		nand_chip->options |= NAND_SKIP_BBTSCAN;
> +		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
>  
>  	/* scan NAND device connected to chip controller */
>  	nand_chip->options |= pdata->devsize & NAND_BUSWIDTH_16;
> @@ -1716,6 +1714,11 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		goto return_error;
>  	}
>  
> +	if (nand_chip->bbt_options & NAND_BBT_USE_FLASH)
> +		nand_chip->bbt_options |= NAND_BBT_NO_OOB;
> +	else
> +		nand_chip->options |= NAND_SKIP_BBTSCAN;
> +
>  	/* re-populate low-level callbacks based on xfer modes */
>  	switch (pdata->xfer_type) {
>  	case NAND_OMAP_PREFETCH_POLLED:
> 
