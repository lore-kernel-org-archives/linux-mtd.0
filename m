Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDCtU-0007Yf-L7
 for linux-mtd@lists.infradead.org; Wed, 15 Jun 2016 15:38:18 +0000
Received: by mail-lf0-x229.google.com with SMTP id j7so17671066lfg.1
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2016 08:37:56 -0700 (PDT)
Date: Wed, 15 Jun 2016 16:38:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mfd: lpc_ich: Add support for SPI serial flash host
 controller
Message-ID: <20160615153835.GM4948@dell>
References: <1465904589-141386-1-git-send-email-mika.westerberg@linux.intel.com>
 <1465904589-141386-3-git-send-email-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1465904589-141386-3-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 14 Jun 2016, Mika Westerberg wrote:

> Many Intel CPUs including Haswell, Broadwell and Baytrail have SPI serial
> flash host controller as part of the LPC device. This will populate an MFD
> cell suitable for the SPI host controller driver if we know that the LPC
> device has one.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mfd/lpc_ich.c       | 97 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/lpc_ich.h |  3 ++
>  2 files changed, 100 insertions(+)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index bd3aa4578346..39b7731d769a 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -83,6 +83,13 @@
>  #define ACPIBASE_GCS_OFF	0x3410
>  #define ACPIBASE_GCS_END	0x3414
>  
> +#define SPIBASE_BYT		0x54
> +#define SPIBASE_BYT_EN		BIT(1)
> +
> +#define SPIBASE_LPT		0x3800
> +#define BCR			0xdc
> +#define BCR_WPD			BIT(0)
> +
>  #define GPIOBASE_ICH0		0x58
>  #define GPIOCTRL_ICH0		0x5C
>  #define GPIOBASE_ICH6		0x48
> @@ -133,6 +140,12 @@ static struct resource gpio_ich_res[] = {
>  	},
>  };
>  
> +static struct resource intel_spi_res[] = {
> +	{
> +		.flags = IORESOURCE_MEM,
> +	}
> +};
> +
>  static struct mfd_cell lpc_ich_wdt_cell = {
>  	.name = "iTCO_wdt",
>  	.num_resources = ARRAY_SIZE(wdt_ich_res),
> @@ -147,6 +160,14 @@ static struct mfd_cell lpc_ich_gpio_cell = {
>  	.ignore_resource_conflicts = true,
>  };
>  
> +
> +static struct mfd_cell lpc_ich_spi_cell = {
> +	.name = "intel-spi",
> +	.num_resources = ARRAY_SIZE(intel_spi_res),
> +	.resources = intel_spi_res,
> +	.ignore_resource_conflicts = true,
> +};
> +
>  /* chipset related info */
>  enum lpc_chipsets {
>  	LPC_ICH = 0,	/* ICH */
> @@ -493,10 +514,12 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  	[LPC_LPT] = {
>  		.name = "Lynx Point",
>  		.iTCO_version = 2,
> +		.spi_type = INTEL_SPI_LPT,
>  	},
>  	[LPC_LPT_LP] = {
>  		.name = "Lynx Point_LP",
>  		.iTCO_version = 2,
> +		.spi_type = INTEL_SPI_LPT,
>  	},
>  	[LPC_WBG] = {
>  		.name = "Wellsburg",
> @@ -510,6 +533,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  	[LPC_BAYTRAIL] = {
>  		.name = "Bay Trail SoC",
>  		.iTCO_version = 3,
> +		.spi_type = INTEL_SPI_BYT,
>  	},
>  	[LPC_COLETO] = {
>  		.name = "Coleto Creek",
> @@ -518,10 +542,12 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  	[LPC_WPT_LP] = {
>  		.name = "Wildcat Point_LP",
>  		.iTCO_version = 2,
> +		.spi_type = INTEL_SPI_LPT,
>  	},
>  	[LPC_BRASWELL] = {
>  		.name = "Braswell SoC",
>  		.iTCO_version = 3,
> +		.spi_type = INTEL_SPI_BYT,
>  	},
>  	[LPC_LEWISBURG] = {
>  		.name = "Lewisburg",
> @@ -875,6 +901,15 @@ static void lpc_ich_finalize_gpio_cell(struct pci_dev *dev)
>  	cell->pdata_size = sizeof(struct lpc_ich_info);
>  }
>  
> +static void lpc_ich_finalize_spi_cell(struct pci_dev *dev,
> +				     struct intel_spi_boardinfo *info)
> +{
> +	struct mfd_cell *cell = &lpc_ich_spi_cell;
> +
> +	cell->platform_data = info;
> +	cell->pdata_size = sizeof(*info);
> +}

This call doesn't appear to offer anything.  In fact, it looks like it
adds more lines than is required.

>  /*
>   * We don't check for resource conflict globally. There are 2 or 3 independent
>   * GPIO groups and it's enough to have access to one of these to instantiate
> @@ -1050,6 +1085,62 @@ wdt_done:
>  	return ret;
>  }
>  
> +static int lpc_ich_init_spi(struct pci_dev *dev)
> +{
> +	struct lpc_ich_priv *priv = pci_get_drvdata(dev);
> +	struct resource *res = &intel_spi_res[0];
> +	struct intel_spi_boardinfo *info;
> +	u32 spi_base, rcba, bcr;
> +
> +	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->type = lpc_chipset_info[priv->chipset].spi_type;
> +
> +	switch (lpc_chipset_info[priv->chipset].spi_type) {

The type now exists in info->type.  I suggest you use that here
instead.

> +	case INTEL_SPI_BYT:
> +		pci_read_config_dword(dev, SPIBASE_BYT, &spi_base);
> +		if (spi_base & SPIBASE_BYT_EN) {
> +			res->start = spi_base &= 0xfffffe00;
> +			res->end = res->start + 512 - 1;

Define all of these magic numbers.

> +		}
> +		break;
> +
> +	case INTEL_SPI_LPT:
> +		pci_read_config_dword(dev, RCBABASE, &rcba);
> +		if (rcba & 1) {
> +			spi_base = rcba & 0xfffffe00;
> +			res->start = spi_base + SPIBASE_LPT;
> +			res->end = res->start + 512 - 1;

And here.

> +			/*
> +			 * Try to make the flash chip writeable now by
> +			 * setting BCR_WPD. It it fails we tell the driver
> +			 * that it can only read the chip.
> +			 */
> +			pci_read_config_dword(dev, BCR, &bcr);
> +			if (!(bcr & BCR_WPD)) {
> +				bcr |= BCR_WPD;
> +				pci_write_config_dword(dev, BCR, bcr);
> +				pci_read_config_dword(dev, BCR, &bcr);
> +			}
> +			info->writeable = !!(bcr & BCR_WPD);

I'd prefer if you didn't do that here.  In fact, is there any
technical reason why you can't move the entirety of this function into
the SPI NOR driver?

> +		}
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!res->start)
> +		return -ENODEV;
> +
> +	lpc_ich_finalize_spi_cell(dev, info);
> +	return mfd_add_devices(&dev->dev, -1, &lpc_ich_spi_cell, 1, NULL, 0,

Use the includes provided.  Look at other drivers for examples.

> +			       NULL);
> +}
> +
>  static int lpc_ich_probe(struct pci_dev *dev,
>  				const struct pci_device_id *id)
>  {
> @@ -1093,6 +1184,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
>  			cell_added = true;
>  	}
>  
> +	if (lpc_chipset_info[priv->chipset].spi_type) {
> +		ret = lpc_ich_init_spi(dev);
> +		if (!ret)
> +			cell_added = true;
> +	}
> +
>  	/*
>  	 * We only care if at least one or none of the cells registered
>  	 * successfully.
> diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
> index 2b300b44f994..fba8fcb54f8c 100644
> --- a/include/linux/mfd/lpc_ich.h
> +++ b/include/linux/mfd/lpc_ich.h
> @@ -20,6 +20,8 @@
>  #ifndef LPC_ICH_H
>  #define LPC_ICH_H
>  
> +#include <linux/platform_data/intel-spi.h>
> +
>  /* GPIO resources */
>  #define ICH_RES_GPIO	0
>  #define ICH_RES_GPE0	1
> @@ -40,6 +42,7 @@ struct lpc_ich_info {
>  	char name[32];
>  	unsigned int iTCO_version;
>  	unsigned int gpio_version;
> +	enum intel_spi_type spi_type;
>  	u8 use_gpio;
>  };
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
