Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bef0a-0005AB-Ne
 for linux-mtd@lists.infradead.org; Tue, 30 Aug 2016 09:07:05 +0000
Received: by mail-wm0-x22e.google.com with SMTP id o80so24154329wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2016 02:06:43 -0700 (PDT)
Date: Tue, 30 Aug 2016 10:08:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
Message-ID: <20160830090830.GF1661@dell>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 Aug 2016, Mika Westerberg wrote:

> Intel Apollo Lake SoC exposes serial SPI flash through the LPC device. The
> SPI flash host controller is not discoverable through PCI config cycles
> because P2SB (function 0 of the device 13) is hidden by the BIOS. We unhide
> the device briefly in order to read BAR 0 of the SPI host controller.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mfd/lpc_ich.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

For my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 56a0e98a5f89..b1013b3f4dee 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -56,6 +56,7 @@
>   *	document number TBD : Wildcat Point-LP
>   *	document number TBD : 9 Series
>   *	document number TBD : Lewisburg
> + *	document number TBD : Apollo Lake SoC
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -92,6 +93,8 @@
>  #define BCR			0xdc
>  #define BCR_WPD			BIT(0)
>  
> +#define SPIBASE_APL_SZ		4096
> +
>  #define GPIOBASE_ICH0		0x58
>  #define GPIOCTRL_ICH0		0x5C
>  #define GPIOBASE_ICH6		0x48
> @@ -239,6 +242,7 @@ enum lpc_chipsets {
>  	LPC_BRASWELL,	/* Braswell SoC */
>  	LPC_LEWISBURG,	/* Lewisburg */
>  	LPC_9S,		/* 9 Series */
> +	LPC_APL,	/* Apollo Lake SoC */
>  };
>  
>  static struct lpc_ich_info lpc_chipset_info[] = {
> @@ -559,6 +563,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  		.name = "9 Series",
>  		.iTCO_version = 2,
>  	},
> +	[LPC_APL] = {
> +		.name = "Apollo Lake SoC",
> +		.spi_type = INTEL_SPI_BXT,
> +	},
>  };
>  
>  /*
> @@ -707,6 +715,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
>  	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
>  	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
> +	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
>  	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
>  	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
>  	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
> @@ -1122,6 +1131,36 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
>  		}
>  		break;
>  
> +	case INTEL_SPI_BXT: {
> +		unsigned int p2sb = PCI_DEVFN(13, 0);
> +		unsigned int spi = PCI_DEVFN(13, 2);
> +		struct pci_bus *bus = dev->bus;
> +
> +		/*
> +		 * The P2SB is hidden by BIOS and we need to unhide it in
> +		 * order to read BAR of the SPI flash device. Once that is
> +		 * done we hide it again.
> +		 */
> +		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x0);
> +		pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
> +					  &spi_base);
> +		if (spi_base != ~0) {
> +			res->start = spi_base & 0xfffffff0;
> +			res->end = res->start + SPIBASE_APL_SZ - 1;
> +
> +			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
> +			if (!(bcr & BCR_WPD)) {
> +				bcr |= BCR_WPD;
> +				pci_bus_write_config_dword(bus, spi, BCR, bcr);
> +				pci_bus_read_config_dword(bus, spi, BCR, &bcr);
> +			}
> +			info->writeable = !!(bcr & BCR_WPD);
> +		}
> +
> +		pci_bus_write_config_byte(dev->bus, p2sb, 0xe1, 0x1);
> +		break;
> +	}
> +
>  	default:
>  		return -EINVAL;
>  	}

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
