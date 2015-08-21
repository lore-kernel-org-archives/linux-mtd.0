Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSr9l-00085m-Ua
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 18:35:15 +0000
From: Marek Vasut <marex@denx.de>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Date: Fri, 21 Aug 2015 20:34:50 +0200
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <CAOiHx==Vuc8CCF0rTr5E8A0n31oeAR=UA3PgGhKTwEzi5PH0Jw@mail.gmail.com>
In-Reply-To: <CAOiHx==Vuc8CCF0rTr5E8A0n31oeAR=UA3PgGhKTwEzi5PH0Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508212034.50804.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, August 21, 2015 at 04:15:11 PM, Jonas Gorski wrote:
> Hi,

Hi,

> On Fri, Aug 21, 2015 at 11:09 AM, Marek Vasut <marex@denx.de> wrote:
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
> 
> dev->of_node

Guh, right, thanks :)

> > The problem is, that for SPI NOR controllers, the struct spi_nor .dev
> > element points to the struct device of the SPI NOR controller, not the
> > SPI NOR flash. Therefore, the associated dev->device_node also is the
> 
> dev->of_node

Yep, thanks :)

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
> > element. This let's the SPI NOR controller drivers set up a different
> > spi_nor .dn element for each SPI NOR flash.
> > 
> > This patch also fixes the controller drivers to be compatible with
> > this modification and correctly set the spi_nor .dn element.
> > 
> > This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> > mtd: nand: add common DT init code
> 
> I know that this commit named it dn for nand, but IMHO "dn" isn't a
> very readable member name, so I would suggest using something with
> "node" in it (just using of_node as well seems to be common). I see no
> place where the name length might become an issue.

I thought .dn was supposed to be abbrev for device_node ;-)

> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > ---
> > 
> >  drivers/mtd/devices/m25p80.c      | 1 +
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
> >  drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
> >  include/linux/mtd/spi-nor.h       | 3 +++
> >  4 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 9cd3631..725320f 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -202,6 +202,7 @@ static int m25p_probe(struct spi_device *spi)
> > 
> >         nor->dev = &spi->dev;
> >         nor->mtd = &flash->mtd;
> > 
> > +       nor->dn = &spi->dev.of_node;
> 
> drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
> drivers/mtd/devices/m25p80.c:221:5: warning: assignment from
> incompatible pointer type [enabled by default]
> 
> this needs to be ... = spi->dev.of_node;

Right, thanks!

I'll wait for a bit to figure out if this approach is sensible and then
repost with the fixes.
