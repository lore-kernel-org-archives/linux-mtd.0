Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXXQ5-0006dO-6G
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:31:26 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Date: Thu, 3 Sep 2015 18:21:46 +0200
Cc: linux-mtd@lists.infradead.org
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <20150902003814.GO81844@google.com>
In-Reply-To: <20150902003814.GO81844@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509031821.46602.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, September 02, 2015 at 02:38:14 AM, Brian Norris wrote:
> On Fri, Aug 21, 2015 at 11:09:20AM +0200, Marek Vasut wrote:
> > The problem this patch is trying to address is such, that SPI NOR flash
> > devices attached to a dedicated SPI NOR controller cannot read their
> > properties from the associated struct device_node.
> > 
> > A couple of facts first:
> > 1) Each SPI NOR flash has a struct spi_nor associated with it.
> > 2) Each SPI NOR flash has certain device properties associated
> > 
> >    with it, for example the OF property 'm25p,fast-read' is a
> >    good pick. These properties are used by the SPI NOR core to
> >    select which opcodes are sent to such SPI NOR flash. These
> >    properties are coming from spi_nor .dev->device_node .
> > 
> > The problem is, that for SPI NOR controllers, the struct spi_nor .dev
> > element points to the struct device of the SPI NOR controller, not the
> > SPI NOR flash. Therefore, the associated dev->device_node also is the
> > one of the controller and therefore the SPI NOR core code is trying to
> > parse the SPI NOR controller's properties, not the properties of the
> > SPI NOR flash.
> > 
> > Note: The m25p80 driver is not affected, because the controller and
> > 
> >       the flash are the same device, so the associated device_node
> >       of the controller and the flash are the same.
> > 
> > This patch adjusts the SPI NOR core such that the device_node is not
> > picked from spi_nor .dev directly, but from a new separate spi_nor .dn
> > element.
> 
> Does it really?

Yes, it does, but I missed a bit from this patch, sorry.

> [...]
> 
> > ---
> > 
> >  drivers/mtd/devices/m25p80.c      | 1 +
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
> >  drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
> >  include/linux/mtd/spi-nor.h       | 3 +++
> >  4 files changed, 6 insertions(+)
> 
> ^^ I would expect to see spi-nor.c changes in the diffstat. Did you miss
> something?

Yes, sorry.

> [...]
> 
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index 1bf6f11..333999d 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -169,6 +169,7 @@ enum spi_nor_option_flags {
> > 
> >   * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
> >   * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR
> >   * @priv:		the private data
> > 
> > + * @dn:			[BOARD-SPECIFIC] device node describing this 
instance
> 
> I might like to see this up near the @dev entry, for organization
> purposes.

Right, will do in V2.
