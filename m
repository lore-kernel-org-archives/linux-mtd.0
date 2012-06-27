Received: from caramon.arm.linux.org.uk ([78.32.30.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjxka-0003AF-0p
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 19:18:05 +0000
Date: Wed, 27 Jun 2012 20:15:42 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Message-ID: <20120627191542.GC25319@n2100.arm.linux.org.uk>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340812275-1197-1-git-send-email-stigge@antcom.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux-doc@vger.kernel.org,
 leiwen@marvell.com, devicetree-discuss@lists.ozlabs.org, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org, aletes.xgr@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 27, 2012 at 05:51:12PM +0200, Roland Stigge wrote:
> From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> 
> Since this driver depends on the amba pl08x dma driver, select it in Kconfig.
> 
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> Signed-off-by: Roland Stigge <stigge@antcom.de>
> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index de69978..a9e8b73 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
>  config MTD_NAND_SLC_LPC32XX
>  	tristate "NXP LPC32xx SLC Controller"
>  	depends on ARCH_LPC32XX
> +	select AMBA_PL08X
>  	help
>  	  Enables support for NXP's LPC32XX SLC (i.e. for Single Level Cell
>  	  chips) NAND controller. This is the default for the PHYTEC 3250

Surely not?  Drivers using DMA engine really should not depend on any
particular DMA engine implementation.
