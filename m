Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WafIO-0006JC-6m
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 05:55:36 +0000
Date: Thu, 17 Apr 2014 12:59:43 +0800
From: Huang Shijie <b32955@freescale.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20140417045942.GB29495@localhost>
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <20140416200849.GO3528@book.gsilab.sittig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140416200849.GO3528@book.gsilab.sittig.org>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 16, 2014 at 10:08:49PM +0200, Gerhard Sittig wrote:
> On Wed, 2014-04-16 at 16:18 +0800, Huang Shijie wrote:
> > 
> > The dummy cycles is actually 8 for SPI fast/dual/quad read.
> > 
> > This patch fixes the wrong dummy value for both the spi-nor.c and m25p80.c.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/devices/m25p80.c  |    3 +++
> >  drivers/mtd/spi-nor/spi-nor.c |    2 +-
> >  2 files changed, 4 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 1557d8f..112ca8b 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -131,6 +131,9 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
> >  	int dummy = nor->read_dummy;
> >  	int ret;
> >  
> > +	/* convert the dummy cycles to the number of byte */
> > +	dummy >>= 3;
> > +
> 
> "dummy /= 8" to match the comment / commit message, and for
> better mental association with a byte's width and the below
> return value?

I first version is "dummy /= 8". but i think the "dummy >>= 3" is more
faster.


> 
> is the number of bits guaranteed to always be a multiple of 8
> bits?  I guess it is for m25p80, but thought I'd ask (have seen
> "odd" numbers like 6 bits in quad spi implementations -- those
> are impossible to run with "traditional" SPI controllers)

that's why i add this patch.

In the DDR quad read, the dummy can be 3, 6 or 7 cycles.

Currently the m25p80 only support the 8 cycles dummy, and
since the m25p80 can not support the DDR QUAD READ (is this true?).

The code is ok.

Please see my other patch for the DDR QUAD read .

thanks
Huang Shijie
