Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiLwH-00059n-G8
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:42:59 +0000
Date: Wed, 25 Jul 2018 17:42:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 05/17] mtd: rawnand: atmel: clarify NAND
 addition/removal paths
Message-ID: <20180725174210.3a1c0535@bbrezillon>
In-Reply-To: <20180725133152.30898-6-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Jul 2018 15:31:40 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> No need for an atmel_nand_register() function, let's move the code in
> it directly where the function was called: in
> atmel_nand_controller_add_nand(). Also, for more coherence, rename
> atmel_nand_unregister() as atmel_nand_controller_remove_nand(), as
> opposed as the previously mentioned function.

How about replacing the last sentence (which is not clear at all) by:

"
To make things consistent, also rename atmel_nand_unregister() into
atmel_nand_controller_remove_nand().
"

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 102 ++++++++++++---------------
>  1 file changed, 45 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 4d27401f1299..143d029710f0 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1573,7 +1573,7 @@ static int atmel_nand_detect(struct atmel_nand *nand)
>  	return ret;
>  }
>  
> -static int atmel_nand_unregister(struct atmel_nand *nand)
> +static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
>  {
>  	struct nand_chip *chip = &nand->base;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -1589,60 +1589,6 @@ static int atmel_nand_unregister(struct atmel_nand *nand)
>  	return 0;
>  }
>  
> -static int atmel_nand_register(struct atmel_nand *nand)
> -{
> -	struct nand_chip *chip = &nand->base;
> -	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct atmel_nand_controller *nc;
> -	int ret;
> -
> -	nc = to_nand_controller(chip->controller);
> -
> -	if (nc->caps->legacy_of_bindings || !nc->dev->of_node) {
> -		/*
> -		 * We keep the MTD name unchanged to avoid breaking platforms
> -		 * where the MTD cmdline parser is used and the bootloader
> -		 * has not been updated to use the new naming scheme.
> -		 */
> -		mtd->name = "atmel_nand";
> -	} else if (!mtd->name) {
> -		/*
> -		 * If the new bindings are used and the bootloader has not been
> -		 * updated to pass a new mtdparts parameter on the cmdline, you
> -		 * should define the following property in your nand node:
> -		 *
> -		 *	label = "atmel_nand";
> -		 *
> -		 * This way, mtd->name will be set by the core when
> -		 * nand_set_flash_node() is called.
> -		 */
> -		mtd->name = devm_kasprintf(nc->dev, GFP_KERNEL,
> -					   "%s:nand.%d", dev_name(nc->dev),
> -					   nand->cs[0].id);
> -		if (!mtd->name) {
> -			dev_err(nc->dev, "Failed to allocate mtd->name\n");
> -			return -ENOMEM;
> -		}
> -	}
> -
> -	ret = nand_scan_tail(mtd);
> -	if (ret) {
> -		dev_err(nc->dev, "nand_scan_tail() failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = mtd_device_register(mtd, NULL, 0);
> -	if (ret) {
> -		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
> -		nand_cleanup(chip);
> -		return ret;
> -	}
> -
> -	list_add_tail(&nand->node, &nc->chips);
> -
> -	return 0;
> -}
> -
>  static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
>  					    struct device_node *np,
>  					    int reg_cells)
> @@ -1772,7 +1718,49 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
>  	if (ret)
>  		return ret;
>  
> -	return atmel_nand_register(nand);
> +	if (nc->caps->legacy_of_bindings || !nc->dev->of_node) {
> +		/*
> +		 * We keep the MTD name unchanged to avoid breaking platforms
> +		 * where the MTD cmdline parser is used and the bootloader
> +		 * has not been updated to use the new naming scheme.
> +		 */
> +		mtd->name = "atmel_nand";
> +	} else if (!mtd->name) {
> +		/*
> +		 * If the new bindings are used and the bootloader has not been
> +		 * updated to pass a new mtdparts parameter on the cmdline, you
> +		 * should define the following property in your nand node:
> +		 *
> +		 *	label = "atmel_nand";
> +		 *
> +		 * This way, mtd->name will be set by the core when
> +		 * nand_set_flash_node() is called.
> +		 */
> +		mtd->name = devm_kasprintf(nc->dev, GFP_KERNEL,
> +					   "%s:nand.%d", dev_name(nc->dev),
> +					   nand->cs[0].id);
> +		if (!mtd->name) {
> +			dev_err(nc->dev, "Failed to allocate mtd->name\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret) {
> +		dev_err(nc->dev, "nand_scan_tail() failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
> +		nand_cleanup(chip);
> +		return ret;
> +	}
> +
> +	list_add_tail(&nand->node, &nc->chips);
> +
> +	return 0;
>  }
>  
>  static int
> @@ -1782,7 +1770,7 @@ atmel_nand_controller_remove_nands(struct atmel_nand_controller *nc)
>  	int ret;
>  
>  	list_for_each_entry_safe(nand, tmp, &nc->chips, node) {
> -		ret = atmel_nand_unregister(nand);
> +		ret = atmel_nand_controller_remove_nand(nand);
>  		if (ret)
>  			return ret;
>  	}
