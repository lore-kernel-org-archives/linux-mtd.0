From: Marek Vasut <marex@denx.de>
To: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
Subject: Re: [LINUX RFC v2 0/4] spi: add dual parallel mode support in Zynq
 MPSoC GQSPI controller
Date: Thu, 3 Sep 2015 15:38:04 +0200
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 "zajec5@gmail.com" <zajec5@gmail.com>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "knut.wohlrab@de.bosch.com" <knut.wohlrab@de.bosch.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <201509022056.09635.marex@denx.de>
 <7CFCFE83B8145347A1D424EC939F1C3C014B08B2@XAP-PVEXMBX01.xlnx.xilinx.com>
In-Reply-To: <7CFCFE83B8145347A1D424EC939F1C3C014B08B2@XAP-PVEXMBX01.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509031538.04915.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, September 03, 2015 at 03:25:00 PM, Ranjit Abhimanyu Waghmode wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Marek Vasut [mailto:marex@denx.de]
> > Sent: Thursday, September 03, 2015 12:26 AM
> > To: Ranjit Abhimanyu Waghmode
> > Cc: dwmw2@infradead.org; computersforpeace@gmail.com;
> > broonie@kernel.org; Michal Simek; Soren Brinkmann; zajec5@gmail.com;
> > ben@decadent.org.uk; b32955@freescale.com; knut.wohlrab@de.bosch.com;
> > juhosg@openwrt.org; beanhuo@micron.com; linux-mtd@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-spi@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; Harini Katakam; Punnaiah Choudary Kalluri
> > Subject: Re: [LINUX RFC v2 0/4] spi: add dual parallel mode support in
> > Zynq MPSoC GQSPI controller
> > 
> > On Wednesday, September 02, 2015 at 07:12:14 PM, Ranjit Abhimanyu
> > Waghmode
> > 
> > wrote:
> > > Hi Marek,
> > > 
> > > > -----Original Message-----
> > > > From: Marek Vasut [mailto:marex@denx.de]
> > > > Sent: Wednesday, August 26, 2015 12:26 PM
> > > > To: Ranjit Abhimanyu Waghmode
> > > > Cc: dwmw2@infradead.org; computersforpeace@gmail.com;
> > > > broonie@kernel.org; Michal Simek; Soren Brinkmann; zajec5@gmail.com;
> > > > ben@decadent.org.uk; b32955@freescale.com;
> > > > knut.wohlrab@de.bosch.com; juhosg@openwrt.org;
> > 
> > beanhuo@micron.com;
> > 
> > > > linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > > linux-spi@vger.kernel.org; linux-arm- kernel@lists.infradead.org;
> > > > Harini Katakam; Punnaiah Choudary Kalluri
> > > > Subject: Re: [LINUX RFC v2 0/4] spi: add dual parallel mode support
> > > > in Zynq MPSoC GQSPI controller
> > > > 
> > > > On Wednesday, August 26, 2015 at 08:26:03 AM, Ranjit Waghmode wrote:
> > > > > This series adds dual parallel mode support for Zynq Ultrascale+
> > > > > MPSoC GQSPI controller driver.
> > > > > 
> > > > > What is dual parallel mode?
> > > > > ---------------------------
> > > > > ZynqMP GQSPI controller supports Dual Parallel mode with following
> > > > > functionalities: 1) Supporting two SPI flash memories operating in
> > > > > parallel. 8 I/O lines. 2) Chip selects and clock are shared to
> > > > > both the flash devices
> > > > > 3) This mode is targeted for faster read/write speed and also
> > > > > doubles the size 4) Commands/data can be transmitted/received from
> > > > > both the devices(mirror), or only upper or only lower flash memory
> > 
> > devices.
> > 
> > > > > 5) Data arrangement:
> > > > >    With stripe enabled,
> > > > >    Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
> > > > >    Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.
> > > > 
> > > > This might be a dumb question, but why don't you just treat this as
> > > > an SPI NOR flash with 8-bit bus ?
> > > 
> > > In case of dual parallel configuration of this controller there are
> > > different modes like single, dual and quad mode. Whatever you are
> > > suggesting would fit only in the case of Quad mode operation as both
> > > buses would have 4 lines each. In case of single mode of parallel
> > > configuration, there would be two buses; but the line on each bus
> > > would one. So altogether there will be two lines. And in case of dual
> > > mode of parallel configuration each bus will be having two lines. So
> > > altogether 4 lines will be there. So keeping 8 lines would not support
> > > above two modes of parallel configuration correctly.
> > > 
> > > Logically it is a single flash with 8 IO lines but physically it's a
> > > two flash devices and each has 4 IO lines. So, in this case, read and
> > > write addresses should be always even and minimum data that can be
> > > accessed is 2 bytes.
> > 
> > Oh, I see what the issue is now. It has to do with configuring the flash
> > into correct bus-width mode, right ?
> 
> Yes.

Thanks!
