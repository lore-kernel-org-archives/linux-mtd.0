Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYrDt-0005ke-St
 for linux-mtd@lists.infradead.org; Sun, 14 Aug 2016 08:56:51 +0000
Date: Sun, 14 Aug 2016 10:56:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] mtd: nand: import nand_hw_control_init()
Message-ID: <20160814105614.05ebffd6@bbrezillon>
In-Reply-To: <57987DA8.4010002@sigmadesigns.com>
References: <57987DA8.4010002@sigmadesigns.com>
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

On Wed, 27 Jul 2016 11:23:52 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> The code to initialize a struct nand_hw_control is duplicated across
> several drivers. Factorize it using an inline function.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Applied.

Thanks,

Boris

> ---
> I hacked drivers/mtd/nand/Makefile to forcefully compile the modified
> drivers, but some have dependencies. I'd be grateful if anyone could
> compile-test this change.
> ---
>  drivers/mtd/nand/bf5xx_nand.c        | 3 +--
>  drivers/mtd/nand/brcmnand/brcmnand.c | 3 +--
>  drivers/mtd/nand/docg4.c             | 3 +--
>  drivers/mtd/nand/fsl_elbc_nand.c     | 3 +--
>  drivers/mtd/nand/fsl_ifc_nand.c      | 3 +--
>  drivers/mtd/nand/jz4780_nand.c       | 3 +--
>  drivers/mtd/nand/nand_base.c         | 3 +--
>  drivers/mtd/nand/ndfc.c              | 3 +--
>  drivers/mtd/nand/pxa3xx_nand.c       | 3 +--
>  drivers/mtd/nand/qcom_nandc.c        | 3 +--
>  drivers/mtd/nand/s3c2410.c           | 3 +--
>  drivers/mtd/nand/sunxi_nand.c        | 3 +--
>  drivers/mtd/nand/txx9ndfmc.c         | 3 +--
>  include/linux/mtd/nand.h             | 7 +++++++
>  14 files changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> index 37da4236ab90..3962f55bd034 100644
> --- a/drivers/mtd/nand/bf5xx_nand.c
> +++ b/drivers/mtd/nand/bf5xx_nand.c
> @@ -761,8 +761,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, info);
>  
> -	spin_lock_init(&info->controller.lock);
> -	init_waitqueue_head(&info->controller.wq);
> +	nand_hw_control_init(&info->controller);
>  
>  	info->device     = &pdev->dev;
>  	info->platform   = plat;
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index b76ad7c0144f..a1a588604fe5 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -2227,8 +2227,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  
>  	init_completion(&ctrl->done);
>  	init_completion(&ctrl->dma_done);
> -	spin_lock_init(&ctrl->controller.lock);
> -	init_waitqueue_head(&ctrl->controller.wq);
> +	nand_hw_control_init(&ctrl->controller);
>  	INIT_LIST_HEAD(&ctrl->host_list);
>  
>  	/* NAND register range */
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index 47316998017f..7af2a3cd949e 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1249,8 +1249,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->options = NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE;
>  	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOC_IOSPACE_DATA;
>  	nand->controller = &nand->hwcontrol;
> -	spin_lock_init(&nand->controller->lock);
> -	init_waitqueue_head(&nand->controller->wq);
> +	nand_hw_control_init(nand->controller);
>  
>  	/* methods */
>  	nand->cmdfunc = docg4_command;
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index 60a88f24c6b3..113f76e59937 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -879,8 +879,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
>  		}
>  		elbc_fcm_ctrl->counter++;
>  
> -		spin_lock_init(&elbc_fcm_ctrl->controller.lock);
> -		init_waitqueue_head(&elbc_fcm_ctrl->controller.wq);
> +		nand_hw_control_init(&elbc_fcm_ctrl->controller);
>  		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
>  	} else {
>  		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 4e9e5fd8faf3..0a177b1bfe3e 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -987,8 +987,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
>  		ifc_nand_ctrl->addr = NULL;
>  		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
>  
> -		spin_lock_init(&ifc_nand_ctrl->controller.lock);
> -		init_waitqueue_head(&ifc_nand_ctrl->controller.wq);
> +		nand_hw_control_init(&ifc_nand_ctrl->controller);
>  	} else {
>  		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
>  	}
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index daf3c4217f4d..b2c3dd2ac6fc 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -368,9 +368,8 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	nfc->dev = dev;
>  	nfc->num_banks = num_banks;
>  
> -	spin_lock_init(&nfc->controller.lock);
> +	nand_hw_control_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
> -	init_waitqueue_head(&nfc->controller.wq);
>  
>  	ret = jz4780_nand_init_chips(nfc, pdev);
>  	if (ret) {
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0b0dc29d2af7..518b5039a4c3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3191,8 +3191,7 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  
>  	if (!chip->controller) {
>  		chip->controller = &chip->hwcontrol;
> -		spin_lock_init(&chip->controller->lock);
> -		init_waitqueue_head(&chip->controller->wq);
> +		nand_hw_control_init(chip->controller);
>  	}
>  
>  }
> diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
> index 218c789ca7ab..28e6118362f7 100644
> --- a/drivers/mtd/nand/ndfc.c
> +++ b/drivers/mtd/nand/ndfc.c
> @@ -218,8 +218,7 @@ static int ndfc_probe(struct platform_device *ofdev)
>  	ndfc = &ndfc_ctrl[cs];
>  	ndfc->chip_select = cs;
>  
> -	spin_lock_init(&ndfc->ndfc_control.lock);
> -	init_waitqueue_head(&ndfc->ndfc_control.wq);
> +	nand_hw_control_init(&ndfc->ndfc_control);
>  	ndfc->ofdev = ofdev;
>  	dev_set_drvdata(&ofdev->dev, ndfc);
>  
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 436dd6dc11f4..b121bf4ed73a 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1810,8 +1810,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  		chip->cmdfunc		= nand_cmdfunc;
>  	}
>  
> -	spin_lock_init(&chip->controller->lock);
> -	init_waitqueue_head(&chip->controller->wq);
> +	nand_hw_control_init(chip->controller);
>  	info->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(info->clk)) {
>  		dev_err(&pdev->dev, "failed to get nand clock\n");
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index de7d28e62d4e..57d483ac5765 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1957,8 +1957,7 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  	INIT_LIST_HEAD(&nandc->desc_list);
>  	INIT_LIST_HEAD(&nandc->host_list);
>  
> -	spin_lock_init(&nandc->controller.lock);
> -	init_waitqueue_head(&nandc->controller.wq);
> +	nand_hw_control_init(&nandc->controller);
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index d9309cf0ce2e..b1734d76cbc1 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -977,8 +977,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, info);
>  
> -	spin_lock_init(&info->controller.lock);
> -	init_waitqueue_head(&info->controller.wq);
> +	nand_hw_control_init(&info->controller);
>  
>  	/* get the clock source and enable it */
>  
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index a83a690688b4..5c9de7357a33 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -1835,8 +1835,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	nfc->dev = dev;
> -	spin_lock_init(&nfc->controller.lock);
> -	init_waitqueue_head(&nfc->controller.wq);
> +	nand_hw_control_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
> index 04d63f56baa4..0a14fda2e41b 100644
> --- a/drivers/mtd/nand/txx9ndfmc.c
> +++ b/drivers/mtd/nand/txx9ndfmc.c
> @@ -303,8 +303,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
>  	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
>  		 (gbusclk + 500000) / 1000000, hold, spw);
>  
> -	spin_lock_init(&drvdata->hw_control.lock);
> -	init_waitqueue_head(&drvdata->hw_control.wq);
> +	nand_hw_control_init(&drvdata->hw_control);
>  
>  	platform_set_drvdata(dev, drvdata);
>  	txx9ndfmc_initialize(dev);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index fbe8e164a4ee..d36ac491877f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -460,6 +460,13 @@ struct nand_hw_control {
>  	wait_queue_head_t wq;
>  };
>  
> +static inline void nand_hw_control_init(struct nand_hw_control *nfc)
> +{
> +	nfc->active = NULL;
> +	spin_lock_init(&nfc->lock);
> +	init_waitqueue_head(&nfc->wq);
> +}
> +
>  /**
>   * struct nand_ecc_ctrl - Control structure for ECC
>   * @mode:	ECC mode
