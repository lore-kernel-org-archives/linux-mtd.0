Received: from mail-bl2lp0206.outbound.protection.outlook.com
 ([207.46.163.206] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcW6Z-0003qD-Dr
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 08:31:04 +0000
Date: Tue, 22 Apr 2014 15:33:58 +0800
From: Huang Shijie <b32955@freescale.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Message-ID: <20140422073355.GA32474@localhost>
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
 <201404171624.36700.marex@denx.de>
 <20140417160515.GB14819@localhost.localdomain>
 <201404211726.07963.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201404211726.07963.marex@denx.de>
Cc: angus.clark@st.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 sourav.poddar@ti.com, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 21, 2014 at 05:26:07PM +0200, Marek Vasut wrote:
> On Thursday, April 17, 2014 at 06:05:17 PM, Huang Shijie wrote:
> > On Thu, Apr 17, 2014 at 04:24:36PM +0200, Marek Vasut wrote:
> > > On Wednesday, April 16, 2014 at 11:47:21 AM, Huang Shijie wrote:
> > > [...]
> > > 
> > > > @@ -74,6 +74,11 @@ static int read_cr(struct spi_nor *nor)
> > > > 
> > > >  static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
> > > >  {
> > > >  
> > > >  	switch (nor->flash_read) {
> > > > 
> > > > +	case SPI_NOR_DDR_QUAD:
> > > > +		/*
> > > > +		 * We set 8 for the DDR Quad read, the SPI NOR controller
> > > > +		 * can change it to 6 or 4 with DeviceTree property.
> > > > +		 */
> > > 
> > > Isn't the number of dummy cycles a property of the chip ?
> > 
> > I want to add DT node, such as "ddr_quad_read_dummy".
> > But I do not know which Document file to put the DT node to.
> > 
> > the spi-bus.txt ? or the spi-nor.txt?
> 
> It's a property of the chip, therefore spi-nor.txt , no ?

[1] For the m25p80.c, the @nor->dev points to a spi_device{}.

   If the spi core can support the DDR QUAD read, we can add the DT node to
  the spi-bus.txt. Please see the spi-bus.txt:
  
  ----------------------------------------------------------------------
  SPI slave nodes must be children of the SPI master node and can
  contain the following properties.
  - reg             - (required) chip select address of device.
  - compatible      - (required) name of SPI device following generic names
      		recommended practice
  - spi-max-frequency - (required) Maximum SPI clocking speed of device in Hz
  - spi-cpol        - (optional) Empty property indicating device requires
      		inverse clock polarity (CPOL) mode
  - spi-cpha        - (optional) Empty property indicating device requires
      		shifted clock phase (CPHA) mode
  - spi-cs-high     - (optional) Empty property indicating device requires
      		chip select active high
  - spi-3wire       - (optional) Empty property indicating device requires
  ----------------------------------------------------------------------
  
  As a SPI slave DT node, we can put the "ddr_quad_read_dummy" to the spi-bus.txt.
  
  But unfortunately, I am not sure if the SPI core can support the DDR quad read
  or not. :( IMHO, it can _NOT_ support. 

[2] For the SPI NOR controller(such as fsl-quadspi.c), the @nor->dev points
   to a platform_device{}.  I did not allocate a device{} for the NOR flash.
   so i could add the "ddr_quad_read_dummy" to the fsl-quadspi.txt.

   what's your opinion?

thanks   
Huang Shijie

		
