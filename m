Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOVi-0001Md-58
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 11:51:20 +0000
Date: Tue, 17 Jul 2018 13:51:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/3] mtd: rawnand: update the controller structure
 initialization function name
Message-ID: <20180717135106.492dbb3d@bbrezillon>
In-Reply-To: <20180717095454.27935-3-miquel.raynal@bootlin.com>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-3-miquel.raynal@bootlin.com>
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

On Tue, 17 Jul 2018 11:54:53 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> After the rename of the structure nand_hw_control -> nand_controller,
> let's also rename the core function initializing it from
> nand_hw_control_init() to nand_controller_init().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I think this should go with patch 1, no need to split that in 2
patches IMO.

Other than that, I'm okay with the change, so my ack on the first patch
stands.

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c     | 2 +-
>  drivers/mtd/nand/raw/docg4.c                 | 2 +-
>  drivers/mtd/nand/raw/fsl_elbc_nand.c         | 2 +-
>  drivers/mtd/nand/raw/fsl_ifc_nand.c          | 2 +-
>  drivers/mtd/nand/raw/jz4780_nand.c           | 2 +-
>  drivers/mtd/nand/raw/marvell_nand.c          | 2 +-
>  drivers/mtd/nand/raw/nand_base.c             | 2 +-
>  drivers/mtd/nand/raw/ndfc.c                  | 2 +-
>  drivers/mtd/nand/raw/oxnas_nand.c            | 2 +-
>  drivers/mtd/nand/raw/qcom_nandc.c            | 2 +-
>  drivers/mtd/nand/raw/s3c2410.c               | 2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c            | 2 +-
>  drivers/mtd/nand/raw/tango_nand.c            | 2 +-
>  drivers/mtd/nand/raw/tegra_nand.c            | 2 +-
>  drivers/mtd/nand/raw/txx9ndfmc.c             | 2 +-
>  include/linux/mtd/rawnand.h                  | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 8fcb66df10ea..1a9b871d01c9 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1966,7 +1966,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  	struct device_node *np = dev->of_node;
>  	int ret;
>  
> -	nand_hw_control_init(&nc->base);
> +	nand_controller_init(&nc->base);
>  	INIT_LIST_HEAD(&nc->chips);
>  	nc->dev = dev;
>  	nc->caps = caps;
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 2c8e3d3977c0..2e5efa0f9ea2 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2433,7 +2433,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  
>  	init_completion(&ctrl->done);
>  	init_completion(&ctrl->dma_done);
> -	nand_hw_control_init(&ctrl->controller);
> +	nand_controller_init(&ctrl->controller);
>  	INIT_LIST_HEAD(&ctrl->host_list);
>  
>  	/* NAND register range */
> diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> index bb96cb33cd6b..02778292e1a6 100644
> --- a/drivers/mtd/nand/raw/docg4.c
> +++ b/drivers/mtd/nand/raw/docg4.c
> @@ -1258,7 +1258,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->options = NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE;
>  	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOC_IOSPACE_DATA;
>  	nand->controller = &nand->hwcontrol;
> -	nand_hw_control_init(nand->controller);
> +	nand_controller_init(nand->controller);
>  
>  	/* methods */
>  	nand->cmdfunc = docg4_command;
> diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> index 756431ec055b..0aa54a949653 100644
> --- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> @@ -879,7 +879,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
>  		}
>  		elbc_fcm_ctrl->counter++;
>  
> -		nand_hw_control_init(&elbc_fcm_ctrl->controller);
> +		nand_controller_init(&elbc_fcm_ctrl->controller);
>  		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
>  	} else {
>  		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> index 92b8b63a8b75..73a5245bddd1 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -1004,7 +1004,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
>  		ifc_nand_ctrl->addr = NULL;
>  		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
>  
> -		nand_hw_control_init(&ifc_nand_ctrl->controller);
> +		nand_controller_init(&ifc_nand_ctrl->controller);
>  	} else {
>  		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
>  	}
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index b9afd41132ac..49841dad347c 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -369,7 +369,7 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	nfc->dev = dev;
>  	nfc->num_banks = num_banks;
>  
> -	nand_hw_control_init(&nfc->controller);
> +	nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
>  
>  	ret = jz4780_nand_init_chips(nfc, pdev);
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index fa7d284ac8af..bd5f9a4b7b16 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2745,7 +2745,7 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	nfc->dev = dev;
> -	nand_hw_control_init(&nfc->controller);
> +	nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 4fa5e20d9690..e21f03ee3251 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4968,7 +4968,7 @@ static void nand_set_defaults(struct nand_chip *chip)
>  
>  	if (!chip->controller) {
>  		chip->controller = &chip->hwcontrol;
> -		nand_hw_control_init(chip->controller);
> +		nand_controller_init(chip->controller);
>  	}
>  
>  	if (!chip->buf_align)
> diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
> index fdc55fda5db6..540fa1a0ea24 100644
> --- a/drivers/mtd/nand/raw/ndfc.c
> +++ b/drivers/mtd/nand/raw/ndfc.c
> @@ -218,7 +218,7 @@ static int ndfc_probe(struct platform_device *ofdev)
>  	ndfc = &ndfc_ctrl[cs];
>  	ndfc->chip_select = cs;
>  
> -	nand_hw_control_init(&ndfc->ndfc_control);
> +	nand_controller_init(&ndfc->ndfc_control);
>  	ndfc->ofdev = ofdev;
>  	dev_set_drvdata(&ofdev->dev, ndfc);
>  
> diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
> index 3621c29e7221..01b00bb69c1e 100644
> --- a/drivers/mtd/nand/raw/oxnas_nand.c
> +++ b/drivers/mtd/nand/raw/oxnas_nand.c
> @@ -96,7 +96,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	if (!oxnas)
>  		return -ENOMEM;
>  
> -	nand_hw_control_init(&oxnas->base);
> +	nand_controller_init(&oxnas->base);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	oxnas->io_base = devm_ioremap_resource(&pdev->dev, res);
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 98800a26b2c7..cbad0980d890 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2728,7 +2728,7 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  	INIT_LIST_HEAD(&nandc->desc_list);
>  	INIT_LIST_HEAD(&nandc->host_list);
>  
> -	nand_hw_control_init(&nandc->controller);
> +	nand_controller_init(&nandc->controller);
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
> index aee043dd4fa9..f7a5fc7daa57 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -1094,7 +1094,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, info);
>  
> -	nand_hw_control_init(&info->controller);
> +	nand_controller_init(&info->controller);
>  
>  	/* get the clock source and enable it */
>  
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index de19c81a1789..41bd66a9166a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2012,7 +2012,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	nfc->dev = dev;
> -	nand_hw_control_init(&nfc->controller);
> +	nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
> index 94c8e9ac20b6..dd7a26efdf4f 100644
> --- a/drivers/mtd/nand/raw/tango_nand.c
> +++ b/drivers/mtd/nand/raw/tango_nand.c
> @@ -654,7 +654,7 @@ static int tango_nand_probe(struct platform_device *pdev)
>  		return PTR_ERR(nfc->chan);
>  
>  	platform_set_drvdata(pdev, nfc);
> -	nand_hw_control_init(&nfc->hw);
> +	nand_controller_init(&nfc->hw);
>  	nfc->freq_kHz = clk_get_rate(clk) / 1000;
>  
>  	for_each_child_of_node(pdev->dev.of_node, np) {
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
> index 1d5a646ca1e5..06402c0cbd32 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -1136,7 +1136,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ctrl->dev = &pdev->dev;
> -	nand_hw_control_init(&ctrl->controller);
> +	nand_controller_init(&ctrl->controller);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ctrl->regs = devm_ioremap_resource(&pdev->dev, res);
> diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
> index 89ec8d4c4e83..dd232d8740a2 100644
> --- a/drivers/mtd/nand/raw/txx9ndfmc.c
> +++ b/drivers/mtd/nand/raw/txx9ndfmc.c
> @@ -303,7 +303,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
>  	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
>  		 (gbusclk + 500000) / 1000000, hold, spw);
>  
> -	nand_hw_control_init(&drvdata->hw_control);
> +	nand_controller_init(&drvdata->hw_control);
>  
>  	platform_set_drvdata(dev, drvdata);
>  	txx9ndfmc_initialize(dev);
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index cfe39fc18417..f5fb9caf6dca 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -524,7 +524,7 @@ struct nand_controller {
>  	wait_queue_head_t wq;
>  };
>  
> -static inline void nand_hw_control_init(struct nand_controller *nfc)
> +static inline void nand_controller_init(struct nand_controller *nfc)
>  {
>  	nfc->active = NULL;
>  	spin_lock_init(&nfc->lock);
