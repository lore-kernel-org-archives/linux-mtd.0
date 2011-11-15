Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQNBQ-0001Tm-HX
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 17:52:37 +0000
Date: Tue, 15 Nov 2011 17:52:20 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Shubhrajyoti D <shubhrajyoti@ti.com>
Subject: Re: [PATCH] MTD: nand: Making  MTD_NAND_OMAP2 depend on ARCH_OMAP2PLUS
Message-ID: <20111115175220.GA11274@n2100.arm.linux.org.uk>
References: <1321352556-7080-1-git-send-email-shubhrajyoti@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321352556-7080-1-git-send-email-shubhrajyoti@ti.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 15, 2011 at 03:52:36PM +0530, Shubhrajyoti D wrote:
> Making  MTD_NAND_OMAP2 depend on ARCH_OMAP2PLUS instead of
> oring with ARCH2/3/4.
> 
> Reported-by: Russell King <linux@arm.linux.org.uk>

Thanks, but please make this rmk+kernel@arm.linux.org.uk.

> Signed-off-by: Shubhrajyoti D <shubhrajyoti@ti.com>
> ---
>  drivers/mtd/nand/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index cce7b70..b68dd5e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -110,7 +110,7 @@ config MTD_NAND_AMS_DELTA
>  
>  config MTD_NAND_OMAP2
>  	tristate "NAND Flash device on OMAP2, OMAP3 and OMAP4"
> -	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3 || ARCH_OMAP4)
> +	depends on ARCH_OMAP2PLUS
>  	help
>            Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
>  	  platforms.
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
