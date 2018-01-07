Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYHct-0006sP-EH
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 20:33:05 +0000
Subject: Re: [PATCH 2/3] spi-nor: intel-spi: Explicitly mark the driver as
 dangerous in Kconfig
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <20180104090744.67654-2-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <22d53b77-7c57-e86b-e8f5-465513382647@wedev4u.fr>
Date: Sun, 7 Jan 2018 21:32:46 +0100
MIME-Version: 1.0
In-Reply-To: <20180104090744.67654-2-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
> The driver is not meant for normal users at all but instead such users
> who really know what they are doing and are able to build their own
> kernel to enable it. Mark both driver Kconfig entries as dangerous to
> make sure the driver is not accidentally enabled without understanding
> possible issues in doing so.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 89da88e59121..f480b227a6b8 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
>  	tristate
>  
>  config SPI_INTEL_SPI_PCI
> -	tristate "Intel PCH/PCU SPI flash PCI driver"
> +	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"

I guess it might be even better and safer to add "default n" too, don't
you agree? Adding only the "DANGEROUS" word would not prevent build
scripts to select this driver when creating a kernel config from scratch.

Best regards,

Cyrille

>  	depends on X86 && PCI
>  	select SPI_INTEL_SPI
>  	help
> @@ -106,7 +106,7 @@ config SPI_INTEL_SPI_PCI
>  	  will be called intel-spi-pci.
>  
>  config SPI_INTEL_SPI_PLATFORM
> -	tristate "Intel PCH/PCU SPI flash platform driver"
> +	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
>  	depends on X86
>  	select SPI_INTEL_SPI
>  	help
> 
