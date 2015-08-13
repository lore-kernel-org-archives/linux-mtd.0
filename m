Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPiwx-0003RN-0z
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 03:13:03 +0000
Received: by pacgr6 with SMTP id gr6so27609284pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 20:12:42 -0700 (PDT)
Date: Wed, 12 Aug 2015 20:12:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: han.xu@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH] spi-nor: Kconfig: Remove unneeded help message
Message-ID: <20150813031239.GF108786@google.com>
References: <1439378899-5660-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439378899-5660-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 12, 2015 at 08:28:19AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> The "We only connect the NOR to this controller now" phrase
> is not really useful for a Kconfig help text, so remove it.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 64a4f0e..baa8442 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -26,6 +26,5 @@ config SPI_FSL_QUADSPI
>  	depends on ARCH_MXC
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
> -	  We only connect the NOR to this controller now.

I'm inclined to accept this patch, but I'm curious what the intention
for the original statement was. Does this mean "this controller could
support generic SPI, but this driver only bothers to implement the NOR
flash protocol"?

>  
>  endif # MTD_SPI_NOR
> -- 
> 1.9.1
> 

Brian
