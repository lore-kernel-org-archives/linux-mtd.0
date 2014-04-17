Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WamZr-0004gg-Ub
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 13:42:08 +0000
Received: by mail-pb0-f53.google.com with SMTP id rp16so388776pbb.40
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 06:41:43 -0700 (PDT)
Date: Thu, 17 Apr 2014 21:41:29 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20140417134127.GA3980@localhost.localdomain>
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <20140416200849.GO3528@book.gsilab.sittig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140416200849.GO3528@book.gsilab.sittig.org>
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
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


The disassemble code for "int dummy = 8; dummy /= 8;" is:
--------------------------------------------------
    83a6:	2308      	movs	r3, #8
    83a8:	607b      	str	r3, [r7, #4]
    83aa:	687b      	ldr	r3, [r7, #4]
    83ac:	1dda      	adds	r2, r3, #7
    83ae:	2b00      	cmp	r3, #0
    83b0:	bfb4      	ite	lt
    83b2:	4613      	movlt	r3, r2
    83b4:	461b      	movge	r3, r3
    83b6:	10db      	asrs	r3, r3, #3
    83b8:	607b      	str	r3, [r7, #4]
--------------------------------------------------

The disassemble code for "int dummy = 8; dummy >>= 3;" is:
--------------------------------------------------
    83a6:	2308      	movs	r3, #8
    83a8:	607b      	str	r3, [r7, #4]
    83aa:	687b      	ldr	r3, [r7, #4]
    83ac:	10db      	asrs	r3, r3, #3
    83ae:	607b      	str	r3, [r7, #4]
--------------------------------------------------

Obviously, the "dummy >>= 3" is faster then "dummy /= 8".

thanks
Huang Shijie
