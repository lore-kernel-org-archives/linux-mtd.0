Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIzM1-0007yi-QT
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 13:51:23 +0000
From: Marek Vasut <marex@denx.de>
To: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 12 Jan 2016 14:49:49 +0100
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <5693D3B4.2090304@opensource.altera.com> <569483DE.4070901@ti.com>
In-Reply-To: <569483DE.4070901@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201601121449.49266.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 12, 2016 at 05:41:02 AM, Vignesh R wrote:
> On 01/11/2016 09:39 PM, Dinh Nguyen wrote:
> > On 01/10/2016 10:34 PM, Marek Vasut wrote:
> >> From: Graham Moore <grmoore@opensource.altera.com>
> >> 
> >> Add support for the Cadence QSPI controller. This controller is
> >> present in the Altera SoCFPGA SoCs and this driver has been tested
> >> on the Cyclone V SoC.
> 
> [...]
> 
> >> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> >> index 43bafde..7e29050 100644
> >> --- a/drivers/mtd/spi-nor/Kconfig
> >> +++ b/drivers/mtd/spi-nor/Kconfig
> >> @@ -50,4 +50,15 @@ config SPI_NXP_SPIFI
> >> 
> >>  	  Flash. Enable this option if you have a device with a SPIFI
> >>  	  controller and want to access the Flash as a mtd device.
> >> 
> >> +config SPI_CADENCE_QUADSPI
> >> +	tristate "Cadence Quad SPI controller"
> >> +	depends on OF && (ARCH_SOCFPGA || COMPILE_TEST)
> > 
> > I think you can remove the ARCH_SOCFPGA dependency as this driver is
> > used on a TI EVM as well.
> 
> I think above usage is correct. This will enable SPI_CADENCE_QUADSPI to
> be selected when ARCH_SOCFPGA=y without having to enable COMPILE_TEST.
> AFAIK, COMPILE_TEST is used usually to build test the driver w/o having
> to enable ARCH specific configs (usually by maintainers).
> For TI EVM, I would patch this file to add my architecture later(i.e
> along with DT patch to my board).

I changed this to OF && (ARM || COMPILE_TEST) , so that should be enough.

Best regards,
Marek Vasut
