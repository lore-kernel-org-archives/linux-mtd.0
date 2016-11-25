Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKRM-0004i0-J8
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:37:39 +0000
Received: by mail-wj0-x244.google.com with SMTP id xy5so6363770wjc.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 09:37:17 -0800 (PST)
Subject: Re: [PATCH v5 2/3] mfd: lpc_ich: Add support for SPI serial flash
 host controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
References: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
 <20161114102447.131602-3-mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <54d54e00-dd6d-a33e-1239-fc64bc5a0afc@gmail.com>
Date: Fri, 25 Nov 2016 18:28:30 +0100
MIME-Version: 1.0
In-Reply-To: <20161114102447.131602-3-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/14/2016 11:24 AM, Mika Westerberg wrote:
> Many Intel CPUs including Haswell, Broadwell and Baytrail have SPI serial
> flash host controller as part of the LPC device. This will populate an MFD
> cell suitable for the SPI host controller driver if we know that the LPC
> device has one.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/lpc_ich.c       | 92 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/lpc_ich.h |  3 ++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index c8dee47b45d9..985bda575849 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -83,6 +83,15 @@
>  #define ACPIBASE_GCS_OFF	0x3410
>  #define ACPIBASE_GCS_END	0x3414
>  
> +#define SPIBASE_BYT		0x54
> +#define SPIBASE_BYT_SZ		512
> +#define SPIBASE_BYT_EN		BIT(1)
> +
> +#define SPIBASE_LPT		0x3800
> +#define SPIBASE_LPT_SZ		512
> +#define BCR			0xdc
> +#define BCR_WPD			BIT(0)
> +
>  #define GPIOBASE_ICH0		0x58
>  #define GPIOCTRL_ICH0		0x5C
>  #define GPIOBASE_ICH6		0x48
> @@ -133,6 +142,12 @@ static struct resource gpio_ich_res[] = {
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
> @@ -147,6 +162,14 @@ static struct mfd_cell lpc_ich_gpio_cell = {
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
> @@ -493,10 +516,12 @@ static struct lpc_ich_info lpc_chipset_info[] = {
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
> @@ -510,6 +535,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  	[LPC_BAYTRAIL] = {
>  		.name = "Bay Trail SoC",
>  		.iTCO_version = 3,
> +		.spi_type = INTEL_SPI_BYT,
>  	},
>  	[LPC_COLETO] = {
>  		.name = "Coleto Creek",
> @@ -518,10 +544,12 @@ static struct lpc_ich_info lpc_chipset_info[] = {
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
> @@ -1054,6 +1082,64 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
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
> +	switch (info->type) {
> +	case INTEL_SPI_BYT:
> +		pci_read_config_dword(dev, SPIBASE_BYT, &spi_base);
> +		if (spi_base & SPIBASE_BYT_EN) {
> +			res->start = spi_base & ~(SPIBASE_BYT_SZ - 1);
> +			res->end = res->start + SPIBASE_BYT_SZ - 1;
> +		}
> +		break;
> +
> +	case INTEL_SPI_LPT:
> +		pci_read_config_dword(dev, RCBABASE, &rcba);
> +		if (rcba & 1) {
> +			spi_base = rcba & ~(SPIBASE_LPT_SZ - 1);

Use the round_down() macro here ?

> +			res->start = spi_base + SPIBASE_LPT;
> +			res->end = res->start + SPIBASE_LPT_SZ - 1;

[...]


-- 
Best regards,
Marek Vasut
