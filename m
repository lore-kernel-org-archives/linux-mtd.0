Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6vPE-0006nn-AU
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 09:21:53 +0000
Date: Tue, 24 Oct 2017 12:21:27 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Message-ID: <20171024092127.GB29656@lahna.fi.intel.com>
References: <1508828379-3479-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508828379-3479-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 23, 2017 at 11:59:39PM -0700, Bin Meng wrote:
> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
> data. Select it in the Kconfig.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Enforce dependency on PCI
> 
>  drivers/mtd/spi-nor/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index f26aaa6..abf453a 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -107,8 +107,9 @@ config SPI_INTEL_SPI_PCI
>  
>  config SPI_INTEL_SPI_PLATFORM
>  	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
> -	depends on X86
> +	depends on X86 && PCI

It is kind of weird to depend on PCI if we want to enable *platform*
driver but whatever. I would still prefer to have dependency for LPC_ICH
instead.

No strong feelings though - as long as it builds and works fine :-)

>  	select SPI_INTEL_SPI
> +	select LPC_ICH
>  	help
>  	  This enables platform support for the Intel PCH/PCU SPI
>  	  controller in master mode. This controller is present in modern
> -- 
> 2.7.4
