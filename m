Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm7LS-0003A4-Bo
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 21:42:54 +0000
Received: by padcn9 with SMTP id cn9so1453415pad.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 14:42:33 -0700 (PDT)
Date: Tue, 13 Oct 2015 14:41:53 -0700
From: Aurelien Chanot <chanot.a@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for Micron n25q032a
Message-ID: <20151013214153.GA1079@achanot-lt>
References: <20151007191008.GA31411@achanot-lt>
 <20151013013828.GU107187@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151013013828.GU107187@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 12, 2015 at 06:38:28PM -0700, Brian Norris wrote:
> On Wed, Oct 07, 2015 at 12:10:08PM -0700, Aurelien Chanot wrote:
> > The N25Q032A is identical to the N25Q032 except it has a different
> > supply voltage range. Therefore, it has a new JEDEC ID.
> > 
> > Signed-off-by: Aurelien Chanot <chanot.a@gmail.com>
> 
> Applied to l2-mtd.git
> 
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index f59aedf..9122a2e 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -585,6 +585,7 @@ static const struct flash_info spi_nor_ids[] = {
> >  
> >  	/* Micron */
> >  	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
> > +	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
> 
> I know the original entry doesn't specify this, but does this flash
> support 4K sectors and dual read? We should add the flags.

Yes it does support 4k erase subsectors and, quad and dual fast read.

We can create a new patch to update the flags.

> 
> Brian
> 
> >  	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
> >  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
> >  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
> 
