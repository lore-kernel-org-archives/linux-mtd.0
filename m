Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpQqD-00051y-VK
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 01:08:26 +0000
Received: by padhk11 with SMTP id hk11so101755958pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2015 18:08:00 -0700 (PDT)
Date: Thu, 22 Oct 2015 18:07:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Han Xu <b45815@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Han Xu <b45815@freescale.com>
Subject: Re: [PATCH -next] mtd: fsl-quadspi: Never build on SPARC
Message-ID: <20151023010757.GI13239@google.com>
References: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Han

On Wed, Oct 21, 2015 at 07:31:46AM -0700, Guenter Roeck wrote:
> Attempts to build fsl-quadspi on SPARC fail with
> 
> drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
> drivers/mtd/spi-nor/fsl-quadspi.c:369:1: error:
> 	'LUT_0' undeclared (first use in this function)
> drivers/mtd/spi-nor/fsl-quadspi.c:418:1: error:
> 	pasting "LUT_" and "(" does not give a valid preprocessing token
> drivers/mtd/spi-nor/fsl-quadspi.c:418:2: error:
> 	implicit declaration of function 'LUT_'

I don't think this is only a SPARC problem. The macro concatenation is
generally suspect.

I see that READ and WRITE are problems at least. If something like
<linux/fs.h> gets included somehow, then these tokens resolve to
integers or expressions before they fall through to literal
concatentation, so we get 'LUT_0' or 'LUT_(1ULL << __REQ_WRITE)' instead
of 'LUT_READ' and 'LUT_WRITE'.

Han, are you up for fixing, or should I?

Brian

> Never build it on SPARC, even if COMPILE_TEST is enabled.
> 
> Fixes: d26a22d06708 ("mtd: fsl-quadspi: allow building for other ARCHes
> 	with COMPILE_TEST")
> Cc: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/mtd/spi-nor/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 2fe2a7e90fa9..fceb2886bfd1 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -23,7 +23,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>  
>  config SPI_FSL_QUADSPI
>  	tristate "Freescale Quad SPI controller"
> -	depends on ARCH_MXC || COMPILE_TEST
> +	depends on ARCH_MXC || (COMPILE_TEST && !SPARC)
>  	depends on HAS_IOMEM
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
> -- 
> 2.1.4
> 
