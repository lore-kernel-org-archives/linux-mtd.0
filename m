Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmJYa-0005ra-2U
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 06:59:28 +0000
Date: Wed, 4 Jul 2012 08:59:14 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Select the driver via ARCH_MXC
Message-ID: <20120704065914.GG2698@pengutronix.de>
References: <1341266419-21321-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341266419-21321-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 02, 2012 at 07:00:19PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> With device tree support in place, we should not use IMX_HAVE_PLATFORM_MXC_NAND
> as a dependency for selecting the mxc_nand driver.
> 
> Use ARCH_MXC symbol instead, so that the driver can be even selected when a single device-tree
> machine is selected.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Simple solution for a problem. I don't want to add even more
dependencies. Also I think being able to compile in a driver
even if it has no possible users in the tree does not hurt,
so:

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
>  drivers/mtd/nand/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index de69978..d2a0db1 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -521,7 +521,7 @@ config MTD_NAND_MPC5121_NFC
>  
>  config MTD_NAND_MXC
>  	tristate "MXC NAND support"
> -	depends on IMX_HAVE_PLATFORM_MXC_NAND
> +	depends on ARCH_MXC
>  	help
>  	  This enables the driver for the NAND flash controller on the
>  	  MXC processors.
> -- 
> 1.7.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
