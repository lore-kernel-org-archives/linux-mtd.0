Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVcH4-0003KH-79
 for linux-mtd@lists.infradead.org; Sat, 29 Aug 2015 09:18:11 +0000
Date: Sat, 29 Aug 2015 11:17:40 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 1/6] mtd: nand: gpmi: add gpmi dsm supend/resume support
Message-ID: <20150829091740.GC5594@opentech.at>
References: <1440790365-28072-1-git-send-email-b45815@freescale.com>
 <1440790365-28072-2-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440790365-28072-2-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 28 Aug 2015, Han Xu wrote:

> From: Huang Shijie <b32955@freescale.com>
> 
> i.MX6SX supports deep sleep mode(DSM) that may turn off GPMI/BCH power
> during suspend, add gpmi nand suspend/resume function to release DMA
> channel in suspend function and re-init GPMI/BCH controller during
> resume function.
>

Just a question regarding gpmi_pm_resume() errror reporting
Is there a reason that the retrun value of gpmi_extra_init() is not checked ?
gpmi_extra_init() can retrun -ENOMEM or -EINVAL via return enable_edo_mode(),
while the -EINVAL would produce a dev_err message, -ENOMEM does not so maybe
this also wants to include a if(ret) {...} ? - something like the below
 
> Although it is not necessary to restore GPMI/BCH registers value for
> i.MX6QDL, the code doesn't distinguish different platforms to keep the
> code simple.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 45 +++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 1b8f350..dfd0ba1 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1,7 +1,7 @@
>  /*
>   * Freescale GPMI NAND Flash Driver
>   *
> - * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
> + * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
>   * Copyright (C) 2008 Embedded Alley Solutions, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -2036,9 +2036,52 @@ static int gpmi_nand_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int gpmi_pm_suspend(struct device *dev)
> +{
> +	struct gpmi_nand_data *this = dev_get_drvdata(dev);
> +
> +	release_dma_channels(this);
> +	return 0;
> +}
> +
> +static int gpmi_pm_resume(struct device *dev)
> +{
> +	struct gpmi_nand_data *this = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = acquire_dma_channels(this);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* re-init the GPMI registers */
> +	this->flags &= ~GPMI_TIMING_INIT_OK;
> +	ret = gpmi_init(this);
> +	if (ret) {
> +		dev_err(this->dev, "Error setting GPMI : %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* re-init the BCH registers */
> +	ret = bch_set_geometry(this);
> +	if (ret) {
> +		dev_err(this->dev, "Error setting BCH : %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* re-init others */
> +	gpmi_extra_init(this);

report failure of enable_edo_mode() ?

	if (ret) {
		dev_err(this->dev, "Error enabling EDO mode : %d\n", ret);
		return ret;
	}

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops gpmi_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
> +};
> +
>  static struct platform_driver gpmi_nand_driver = {
>  	.driver = {
>  		.name = "gpmi-nand",
> +		.pm = &gpmi_pm_ops,
>  		.of_match_table = gpmi_nand_id_table,
>  	},
>  	.probe   = gpmi_nand_probe,
> -- 
> 1.9.1
> 
