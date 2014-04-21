Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcLn3-0006yk-0c
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 21:30:14 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Date: Mon, 21 Apr 2014 17:26:07 +0200
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
 <201404171624.36700.marex@denx.de>
 <20140417160515.GB14819@localhost.localdomain>
In-Reply-To: <20140417160515.GB14819@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404211726.07963.marex@denx.de>
Cc: angus.clark@st.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 17, 2014 at 06:05:17 PM, Huang Shijie wrote:
> On Thu, Apr 17, 2014 at 04:24:36PM +0200, Marek Vasut wrote:
> > On Wednesday, April 16, 2014 at 11:47:21 AM, Huang Shijie wrote:
> > [...]
> > 
> > > @@ -74,6 +74,11 @@ static int read_cr(struct spi_nor *nor)
> > > 
> > >  static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
> > >  {
> > >  
> > >  	switch (nor->flash_read) {
> > > 
> > > +	case SPI_NOR_DDR_QUAD:
> > > +		/*
> > > +		 * We set 8 for the DDR Quad read, the SPI NOR controller
> > > +		 * can change it to 6 or 4 with DeviceTree property.
> > > +		 */
> > 
> > Isn't the number of dummy cycles a property of the chip ?
> 
> I want to add DT node, such as "ddr_quad_read_dummy".
> But I do not know which Document file to put the DT node to.
> 
> the spi-bus.txt ? or the spi-nor.txt?

It's a property of the chip, therefore spi-nor.txt , no ?
[...]

I replied about the failing-to-lower-mode in the other email.

Best regards,
Marek Vasut
