Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqM63-0008WS-RS
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 14:48:50 +0000
Received: by mail-qk0-x22c.google.com with SMTP id n130so20417328qke.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 07:48:27 -0700 (PDT)
Date: Wed, 13 Apr 2016 11:48:22 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>, linux-omap@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Zhou Wang <wangzhou1@hisilicon.com>, Alex Smith <alex.smith@imgtec.com>,
 Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH 10/12] mtd: nand: pxa3xx: rely on generic DT parsing done
 in nand_scan_ident()
Message-ID: <20160413144822.GA1065@laptop.cereza>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459515272-31011-11-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459515272-31011-11-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01 Apr 02:54 PM, Boris Brezillon wrote:
> The core now takes care of parsing generic DT properties in
> nand_scan_ident() when nand_set_flash_node() has been called.
> Rely on this initialization instead of calling of_get_nand_xxx()
> manually.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index d650885..38d26ab 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -29,7 +29,6 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/of_mtd.h>
>  #include <linux/platform_data/mtd-nand-pxa3xx.h>
>  
>  #define	CHIP_DELAY_TIMEOUT	msecs_to_jiffies(200)
> @@ -1651,6 +1650,12 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
>  		nand_writel(info, NDECCCTRL, 0x0);
>  
> +	if (pdata->flash_bbt)
> +		chip->bbt_options |= NAND_BBT_USE_FLASH;
> +
> +	chip->ecc.strength = pdata->ecc_strength;
> +	chip->ecc.size = pdata->ecc_step_size;
> +
>  	if (nand_scan_ident(mtd, 1, NULL))
>  		return -ENODEV;
>  
> @@ -1663,13 +1668,12 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  		}
>  	}
>  
> -	if (pdata->flash_bbt) {
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
>  		/*
>  		 * We'll use a bad block table stored in-flash and don't
>  		 * allow writing the bad block marker to the flash.
>  		 */
> -		chip->bbt_options |= NAND_BBT_USE_FLASH |
> -				     NAND_BBT_NO_OOB_BBM;
> +		chip->bbt_options |= NAND_BBT_NO_OOB_BBM;
>  		chip->bbt_td = &bbt_main_descr;
>  		chip->bbt_md = &bbt_mirror_descr;
>  	}
> @@ -1689,10 +1693,9 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  		}
>  	}
>  
> -	if (pdata->ecc_strength && pdata->ecc_step_size) {
> -		ecc_strength = pdata->ecc_strength;
> -		ecc_step = pdata->ecc_step_size;
> -	} else {
> +	ecc_strength = chip->ecc.strength;
> +	ecc_step = chip->ecc.size;
> +	if (!ecc_strength || !ecc_step) {
>  		ecc_strength = chip->ecc_strength_ds;
>  		ecc_step = chip->ecc_step_ds;
>  	}
> @@ -1903,15 +1906,6 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>  	if (of_get_property(np, "marvell,nand-keep-config", NULL))
>  		pdata->keep_config = 1;
>  	of_property_read_u32(np, "num-cs", &pdata->num_cs);
> -	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
> -
> -	pdata->ecc_strength = of_get_nand_ecc_strength(np);
> -	if (pdata->ecc_strength < 0)
> -		pdata->ecc_strength = 0;
> -
> -	pdata->ecc_step_size = of_get_nand_ecc_step_size(np);
> -	if (pdata->ecc_step_size < 0)
> -		pdata->ecc_step_size = 0;
>  
>  	pdev->dev.platform_data = pdata;
>  
> -- 
> 2.5.0
> 

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
