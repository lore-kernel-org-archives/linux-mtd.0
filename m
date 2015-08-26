Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUdjg-00075F-Rr
 for linux-mtd@lists.infradead.org; Wed, 26 Aug 2015 16:39:41 +0000
From: Marek Vasut <marex@denx.de>
To: vikas <vikas.manocha@st.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Wed, 26 Aug 2015 18:39:14 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <201508260819.02535.marex@denx.de> <55DDDF99.4030701@st.com>
In-Reply-To: <55DDDF99.4030701@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508261839.14769.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 26, 2015 at 05:47:37 PM, vikas wrote:
> Hi,

Hi,

> On 08/25/2015 11:19 PM, Marek Vasut wrote:
> > On Wednesday, August 26, 2015 at 12:09:50 AM, vikas wrote:
> >> Hi,
> >> 
> >> On 08/21/2015 02:20 AM, Marek Vasut wrote:
> >>> From: Graham Moore <grmoore@opensource.altera.com>
> >>> 
> >>> Add support for the Cadence QSPI controller. This controller is
> >>> present in the Altera SoCFPGA SoCs and this driver has been tested
> >>> on the Cyclone V SoC.
> >>> 
> >>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>> Cc: Alan Tull <atull@opensource.altera.com>
> >>> Cc: Brian Norris <computersforpeace@gmail.com>
> >>> Cc: David Woodhouse <dwmw2@infradead.org>
> >>> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> >>> Cc: Graham Moore <grmoore@opensource.altera.com>
> >>> Cc: Vikas MANOCHA <vikas.manocha@st.com>
> >>> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> >>> Cc: devicetree@vger.kernel.org
> >>> ---
> >>> 
> >>>  drivers/mtd/spi-nor/Kconfig           |   11 +
> >>>  drivers/mtd/spi-nor/Makefile          |    1 +
> >>>  drivers/mtd/spi-nor/cadence-quadspi.c | 1260
> >>>  +++++++++++++++++++++++++++++++++ 3 files changed, 1272 insertions(+)
> >>>  create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
> >>> 
> >>> V2: use NULL instead of modalias in spi_nor_scan call
> >>> V3: Use existing property is-decoded-cs instead of creating duplicate.
> >>> V4: Support Micron quad mode by snooping command stream for EVCR
> >>> command
> >>> 
> >>>     and subsequently configuring Cadence controller for quad mode.
> >>> 
> >>> V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
> >>> 
> >>>     quad mode.  Add comment on XIP mode bit and dummy clock cycles. 
> >>>     Set up SRAM partition at 1:1 during init.
> >>> 
> >>> V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
> >>> 
> >>>     comments regarding fifo width, SRAM partition setting, and trigger
> >>>     address.  Trigger address was added as an unsigned int, as it is
> >>>     not an IO resource per se, and does not need to be mapped. Also
> >>>     add Marek Vasut's workaround for picking up OF properties on
> >>>     subnodes.
> >>> 
> >>> V7: - Perform coding-style cleanup and type fixes. Remove ugly QSPI_*()
> >>> 
> >>>       macros and replace them with functions. Get rid of unused
> >>>       variables.
> >>>     
> >>>     - Implement support for nor->set_protocol() to handle Quad-command,
> >>>     
> >>>       this patch now depends on the following patch:
> >>>       mtd: spi-nor: notify (Q)SPI controller about protocol change
> >>>     
> >>>     - Replace that cqspi_fifo_read() disaster with plain old readsl()
> >>>     
> >>>       and cqspi_fifo_write() tentacle horror with pretty writesl().
> >>>     
> >>>     - Remove CQSPI_SUPPORT_XIP_CHIPS, which is broken.
> >>>     - Get rid of cqspi_find_chipselect() mess, instead just place the
> >>>     
> >>>       struct cqspi_st and chipselect number into struct
> >>>       cqspi_flash_pdata and set nor->priv to the struct
> >>>       cqspi_flash_pdata of that particular chip.
> >>>     
> >>>     - Replace the odd math in calculate_ticks_for_ns() with
> >>>     DIV_ROUND_UP(). - Make variables const where applicable.
> >>> 
> >>> V8: - Implement a function to wait for bit being set/unset for a given
> >>> 
> >>>       period of time and use it to replace the ad-hoc bits of code.
> >>>     
> >>>     - Configure the write underflow watermark to be 1/8 if FIFO size.
> >>>     - Extract out the SPI NOR flash probing code into separate function
> >>>     
> >>>       to clearly mark what will soon be considered a boilerplate code.
> >>>     
> >>>     - Repair the handling of mode bits, which caused instability in V7.
> >>>     - Clean up the interrupt handling
> >>>     - Fix Kconfig help text and make the patch depend on OF and
> >>>     COMPILE_TEST.
> >>> 
> >>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> >>> index 89bf4c1..ed253a2 100644
> >>> --- a/drivers/mtd/spi-nor/Kconfig
> >>> +++ b/drivers/mtd/spi-nor/Kconfig
> >>> @@ -40,4 +40,15 @@ config SPI_NXP_SPIFI
> >>> 
> >>>           Flash. Enable this option if you have a device with a SPIFI
> >>>           controller and want to access the Flash as a mtd device.
> >>> 
> >>> +config SPI_CADENCE_QUADSPI
> >>> +       tristate "Cadence Quad SPI controller"
> >>> +       depends on OF && COMPILE_TEST
> >>> +       help
> >>> +         Enable support for the Cadence Quad SPI Flash controller.
> >>> +
> >>> +         Cadence QSPI is a specialized controller for connecting an
> >>> SPI +         Flash over 1/2/4-bit wide bus. Enable this option if you
> >>> have a +         device with a Cadence QSPI controller and want to
> >>> access the +         Flash as an MTD device.
> >>> +
> >> 
> >> the patch failed to apply, please rebase it to master.
> > 
> > it's based on -next, I'm sure you can fix trivial conflicts yourself if
> > you need to apply it elsewhere. Do you have any other review comments ?
> 
> Always rebase the patch on master.

The patch applies correctly both on next/master and l2-mtd/master.
I think the problem is on your end.

> I will be reviewing the patchset this week but on a quick look it seems
> many review comments of v7 are not there.

Aha.
