Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wakuh-00014D-Un
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 11:55:33 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Date: Thu, 17 Apr 2014 13:30:32 +0200
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <20140416200849.GO3528@book.gsilab.sittig.org>
 <20140417045942.GB29495@localhost>
In-Reply-To: <20140417045942.GB29495@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404171330.32822.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Gerhard Sittig <gsi@denx.de>,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 17, 2014 at 06:59:43 AM, Huang Shijie wrote:
> On Wed, Apr 16, 2014 at 10:08:49PM +0200, Gerhard Sittig wrote:
> > On Wed, 2014-04-16 at 16:18 +0800, Huang Shijie wrote:
> > > The dummy cycles is actually 8 for SPI fast/dual/quad read.
> > > 
> > > This patch fixes the wrong dummy value for both the spi-nor.c and
> > > m25p80.c.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > > 
> > >  drivers/mtd/devices/m25p80.c  |    3 +++
> > >  drivers/mtd/spi-nor/spi-nor.c |    2 +-
> > >  2 files changed, 4 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/devices/m25p80.c
> > > b/drivers/mtd/devices/m25p80.c index 1557d8f..112ca8b 100644
> > > --- a/drivers/mtd/devices/m25p80.c
> > > +++ b/drivers/mtd/devices/m25p80.c
> > > @@ -131,6 +131,9 @@ static int m25p80_read(struct spi_nor *nor, loff_t
> > > from, size_t len,
> > > 
> > >  	int dummy = nor->read_dummy;
> > >  	int ret;
> > > 
> > > +	/* convert the dummy cycles to the number of byte */
> > > +	dummy >>= 3;
> > > +
> > 
> > "dummy /= 8" to match the comment / commit message, and for
> > better mental association with a byte's width and the below
> > return value?
> 
> I first version is "dummy /= 8". but i think the "dummy >>= 3" is more
> faster.

You can prove that by running objdump on the object file and inspecting the 
generated code. My expectation would be that GCC would optimize this as needed.
[...]

Best regards,
Marek Vasut
