Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGxsu-0000LF-5M
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:52:56 +0000
Received: by mail-pa0-x22b.google.com with SMTP id do7so5662442pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 15:52:34 -0800 (PST)
Date: Wed, 6 Jan 2016 15:52:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add SPI NOR layer PM support
Message-ID: <20160106235231.GQ109450@google.com>
References: <1451033707-44170-1-git-send-email-Zhiqiang.Hou@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451033707-44170-1-git-send-email-Zhiqiang.Hou@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 25, 2015 at 04:55:06PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
> 
> Add the Power Management API in SPI NOR framework.
> The Power Management system will turn off power supply to SPI flash
> when system suspending, and then the SPI flash will be in the reset
> state after system resuming. As a result, the status&configurations
> of SPI flash driver will mismatch with its current hardware state.
> So reinitialize SPI flash to make sure it is resumed to the correct
> state.
> And the SPI NOR layer just do common configuration depending on the
> records in structure spi_nor.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
> ---
> V2:
>  - New patch
> 
>  drivers/mtd/spi-nor/spi-nor.c | 44 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4988390..4030d37c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1365,6 +1365,50 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_scan);
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int spi_nor_hw_reinit(struct spi_nor *nor)
> +{
> +	const struct flash_info *info = NULL;
> +	struct device *dev = nor->dev;
> +	int ret;
> +
> +	info = spi_nor_read_id(nor);
> +	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
> +	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(info) == SNOR_MFR_SST ||
> +	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
> +		write_enable(nor);
> +		write_sr(nor, 0);
> +	}
> +
> +	if (nor->flash_read == SPI_NOR_QUAD) {
> +		ret = set_quad_mode(nor, info);
> +		if (ret) {
> +			dev_err(dev, "quad mode not supported\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (nor->addr_width == 4 && !info->addr_width &&
> +			JEDEC_MFR(info) != SNOR_MFR_SPANSION)
> +		set_4byte(nor, info, 1);

You're duplicating a bunch of code from spi_nor_scan(). Please don't do
that. Find a good way to share it.

> +	return 0;
> +}
> +
> +int spi_nor_suspend(struct spi_nor *nor)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spi_nor_suspend);
> +
> +int spi_nor_resume(struct spi_nor *nor)
> +{
> +	return spi_nor_hw_reinit(nor);
> +}
> +EXPORT_SYMBOL_GPL(spi_nor_resume);
> +#endif /* CONFIG_PM_SLEEP */

What happens if a driver wants this with !CONFIG_PM_SLEEP? I think it's
best if you just unconditionally add spi_nor_{suspend,resume}().

Brian

> +
>  static const struct flash_info *spi_nor_match_id(const char *name)
>  {
>  	const struct flash_info *id = spi_nor_ids;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c8723b6..d3a7888 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -201,4 +201,13 @@ struct spi_nor {
>   */
>  int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode);
>  
> +/**
> + * spi_nor_suspend/resume() - the SPI NOR layer PM API
> + * @nor:	the spi_nor structure
> + *
> + * Return: 0 for success, others for failure.
> + */
> +int spi_nor_suspend(struct spi_nor *nor);
> +int spi_nor_resume(struct spi_nor *nor);
> +
>  #endif
> -- 
> 2.1.0.27.g96db324
> 
