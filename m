Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e77e2-0004Tc-7w
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 22:26:02 +0000
Subject: Re: [PATCH] spi-nor: intel-spi: Remove EXPERT dependency
To: Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
References: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1d6395dc-d355-627e-e0f6-0e8ad7207f23@wedev4u.fr>
Date: Wed, 25 Oct 2017 00:25:34 +0200
MIME-Version: 1.0
In-Reply-To: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
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

Le 24/10/2017 à 09:40, Bin Meng a écrit :
> The idea to have the intel-spi driver dependent on EXPERT was exactly
> because we did not want ordinary users playing with the device and
> inadvertently overwrite their BIOSes (if it is not protected). This
> seems to be superfluous hence remove it.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Applied to the spi-nor/next branch of l2-mtd (reworked a little bit
since the original patch depends on "spi-nor: intel-spi: Fix Kconfig
dependency to LPC_ICH", see below).

Thanks!
> ---
> 
>  drivers/mtd/spi-nor/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index abf453a..be7cfb9 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
>  	tristate
>  
>  config SPI_INTEL_SPI_PCI
> -	tristate "Intel PCH/PCU SPI flash PCI driver" if EXPERT
> +	tristate "Intel PCH/PCU SPI flash PCI driver"
>  	depends on X86 && PCI
>  	select SPI_INTEL_SPI
>  	help
> @@ -106,7 +106,7 @@ config SPI_INTEL_SPI_PCI
>  	  will be called intel-spi-pci.
>  
>  config SPI_INTEL_SPI_PLATFORM
> -	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
> +	tristate "Intel PCH/PCU SPI flash platform driver"
>  	depends on X86 && PCI
removed " && PCI"
>  	select SPI_INTEL_SPI
>  	select LPC_ICH
removed "select LPC_ICH"
> 
