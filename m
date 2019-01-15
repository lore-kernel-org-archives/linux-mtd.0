Message-ID: <1547539075.18705.3.camel@mtkswgap22>
Subject: Re: [PATCH v1 3/3] mtd: spi-nor: mtk-quadspi: rename config to a
 common one
From: Ryder Lee <ryder.lee@mediatek.com>
To: <Tudor.Ambarus@microchip.com>
CC: <marek.vasut@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <robh+dt@kernel.org>,
 <weijie.gao@mediatek.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 15 Jan 2019 15:57:55 +0800
In-Reply-To: <fc95a69a-6a2e-fc98-d047-b0c93843fc56@microchip.com>
References: <67e650ca4fcaaddbbc98bf4e1cbe04647c990dc3.1547442452.git.ryder.lee@mediatek.com>
 <45dc2817e7f4baf5113de247b1a2cb30bf252d93.1547442452.git.ryder.lee@mediatek.com>
 <fc95a69a-6a2e-fc98-d047-b0c93843fc56@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2019-01-15 at 07:34 +0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Ryder,
> 
> On 01/14/2019 07:12 AM, Ryder Lee wrote:
> > The quadspi is a generic communication interface which could be shared
> > with other MediaTek SoCs. Hence rename it to a common one.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> > Changes since v1: rebase to v5.0-rc1. 
> 
> The patch doesn't apply on v5.0-rc1 or rc2.
> > ---
> >  drivers/mtd/spi-nor/Kconfig  | 16 ++++++++--------
> >  drivers/mtd/spi-nor/Makefile |  2 +-
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index b433e5f..99d9d53 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -7,14 +7,6 @@ menuconfig MTD_SPI_NOR
> >  
> >  if MTD_SPI_NOR
> >  
> > -config MTD_MT81xx_NOR
> > -	tristate "Mediatek MT81xx SPI NOR flash controller"
> > -	depends on HAS_IOMEM
> > -	help
> > -	  This enables access to SPI NOR flash, using MT81xx SPI NOR flash
> > -	  controller. This controller does not support generic SPI BUS, it only
> > -	  supports SPI NOR Flash.
> > -
> >  config MTD_SPI_NOR_USE_4K_SECTORS
> >  	bool "Use small 4096 B erase sectors"
> >  	default y
> > @@ -68,6 +60,14 @@ config SPI_NXP_SPIFI
> >  	  Flash. Enable this option if you have a device with a SPIFI
> >  	  controller and want to access the Flash as a mtd device.
> >  
> > +config SPI_MTK_QUADSPI
> 
> Since you are moving the config into the file, would you mind to put your config
> in an alphabetical order?
> 
> Thanks,
> ta

Okay, I will send a new one to fix them.

Thanks,
Ryder

> > +	tristate "MediaTek Quad SPI controller"
> > +	depends on HAS_IOMEM
> > +	help
> > +	  This enables support for the Quad SPI controller in master mode.
> > +	  This controller does not support generic SPI. It only supports
> > +	  SPI NOR.
> > +
> >  config SPI_INTEL_SPI
> >  	tristate
> >  
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index 2adedbe..189a15c 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -3,7 +3,7 @@ obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
> >  obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
> >  obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
> >  obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
> > -obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
> > +obj-$(CONFIG_SPI_MTK_QUADSPI)    += mtk-quadspi.o
> >  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> >  obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
> >  obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
> > 
