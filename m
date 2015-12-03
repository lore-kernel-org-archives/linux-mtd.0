Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4HVN-00081s-AH
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2015 00:12:14 +0000
Received: by pacej9 with SMTP id ej9so54743034pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 16:11:52 -0800 (PST)
Date: Wed, 2 Dec 2015 16:11:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/3] mtd: brcmnand: Request and enable the clock if present
Message-ID: <20151203001150.GA120110@google.com>
References: <565F81A6.6060307@simon.arlott.org.uk>
 <565F81F4.8090300@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565F81F4.8090300@simon.arlott.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Simon,

On Wed, Dec 02, 2015 at 11:42:44PM +0000, Simon Arlott wrote:
> Attempt to enable a clock named "nand" as some SoCs have a clock for the
> controller that needs to be enabled.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 69 ++++++++++++++++++++++++++++--------
>  1 file changed, 54 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 2c8f67f..0a9cccf 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -11,6 +11,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/version.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -122,6 +123,9 @@ struct brcmnand_controller {
>  	/* Some SoCs provide custom interrupt status register(s) */
>  	struct brcmnand_soc	*soc;
>  
> +	/* Some SoCs have a gateable clock for the controller */
> +	struct clk		*clk;
> +
>  	int			cmd_pending;
>  	bool			dma_pending;
>  	struct completion	done;
> @@ -2136,10 +2140,24 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	if (IS_ERR(ctrl->nand_base))
>  		return PTR_ERR(ctrl->nand_base);
>  
> +	/* Enable clock before using NAND registers */
> +	ctrl->clk = devm_clk_get(dev, "nand");
> +	if (!IS_ERR(ctrl->clk)) {
> +		ret = clk_prepare_enable(ctrl->clk);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = PTR_ERR(ctrl->clk);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		ctrl->clk = NULL;
> +	}
> +
>  	/* Initialize NAND revision */
>  	ret = brcmnand_revision_init(ctrl);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	/*
>  	 * Most chips have this cache at a fixed offset within 'nand' block.
> @@ -2148,8 +2166,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-cache");
>  	if (res) {
>  		ctrl->nand_fc = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(ctrl->nand_fc))
> -			return PTR_ERR(ctrl->nand_fc);
> +		if (IS_ERR(ctrl->nand_fc)) {
> +			ret = PTR_ERR(ctrl->nand_fc);
> +			goto err;
> +		}
>  	} else {
>  		ctrl->nand_fc = ctrl->nand_base +
>  				ctrl->reg_offsets[BRCMNAND_FC_BASE];
> @@ -2159,8 +2179,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-dma");
>  	if (res) {
>  		ctrl->flash_dma_base = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(ctrl->flash_dma_base))
> -			return PTR_ERR(ctrl->flash_dma_base);
> +		if (IS_ERR(ctrl->flash_dma_base)) {
> +			ret = PTR_ERR(ctrl->flash_dma_base);
> +			goto err;
> +		}
>  
>  		flash_dma_writel(ctrl, FLASH_DMA_MODE, 1); /* linked-list */
>  		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
> @@ -2169,13 +2191,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  		ctrl->dma_desc = dmam_alloc_coherent(dev,
>  						     sizeof(*ctrl->dma_desc),
>  						     &ctrl->dma_pa, GFP_KERNEL);
> -		if (!ctrl->dma_desc)
> -			return -ENOMEM;
> +		if (!ctrl->dma_desc) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
>  
>  		ctrl->dma_irq = platform_get_irq(pdev, 1);
>  		if ((int)ctrl->dma_irq < 0) {
>  			dev_err(dev, "missing FLASH_DMA IRQ\n");
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto err;
>  		}
>  
>  		ret = devm_request_irq(dev, ctrl->dma_irq,
> @@ -2184,7 +2209,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  		if (ret < 0) {
>  			dev_err(dev, "can't allocate IRQ %d: error %d\n",
>  					ctrl->dma_irq, ret);
> -			return ret;
> +			goto err;
>  		}
>  
>  		dev_info(dev, "enabling FLASH_DMA\n");
> @@ -2208,7 +2233,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	ctrl->irq = platform_get_irq(pdev, 0);
>  	if ((int)ctrl->irq < 0) {
>  		dev_err(dev, "no IRQ defined\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err;
>  	}
>  
>  	/*
> @@ -2232,7 +2258,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	if (ret < 0) {
>  		dev_err(dev, "can't allocate IRQ %d: error %d\n",
>  			ctrl->irq, ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	for_each_available_child_of_node(dn, child) {
> @@ -2240,8 +2266,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  			struct brcmnand_host *host;
>  
>  			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -			if (!host)
> -				return -ENOMEM;
> +			if (!host) {
> +				ret = -ENOMEM;
> +				goto err;
> +			}
>  			host->pdev = pdev;
>  			host->ctrl = ctrl;
>  			host->of_node = child;

Please submit against l2-mtd.git or linux-next.git:

http://linux-mtd.infradead.org/source.html

> @@ -2255,10 +2283,18 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	}
>  
>  	/* No chip-selects could initialize properly */
> -	if (list_empty(&ctrl->host_list))
> -		return -ENODEV;
> +	if (list_empty(&ctrl->host_list)) {
> +		ret = -ENODEV;
> +		goto err;
> +	}
>  
>  	return 0;
> +
> +err:
> +	if (ctrl->clk)

This NULL check is unnecessary.

> +		clk_disable_unprepare(ctrl->clk);
> +	return ret;
> +
>  }
>  EXPORT_SYMBOL_GPL(brcmnand_probe);
>  
> @@ -2270,6 +2306,9 @@ int brcmnand_remove(struct platform_device *pdev)
>  	list_for_each_entry(host, &ctrl->host_list, node)
>  		nand_release(&host->mtd);
>  
> +	if (ctrl->clk)

Same here.

> +		clk_disable_unprepare(ctrl->clk);
> +
>  	dev_set_drvdata(&pdev->dev, NULL);
>  
>  	return 0;

Otherwise, LGTM.

Brian
