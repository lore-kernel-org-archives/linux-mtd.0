Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGV4m-0005Yn-Bz
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 18:44:06 +0000
Received: by mail-pf0-x241.google.com with SMTP id w69so8220691pfk.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 11:43:43 -0700 (PDT)
Date: Thu, 1 Jun 2017 11:43:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 andrew@lunn.ch, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170601184340.GA102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170517172911.5f926712@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:
> Hi Chris,
> 
> On Wed, 17 May 2017 17:39:07 +1200
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > Setting the of_node for the mtd device allows the generic mtd code to
> > setup the partitions. Additionally we must specify a non-zero erasesize
> > for the partitions to be writeable.
> > 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >  drivers/mtd/devices/mchp23k256.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> > index 2542f5b8b63f..02c6b9dcbd3e 100644
> > --- a/drivers/mtd/devices/mchp23k256.c
> > +++ b/drivers/mtd/devices/mchp23k256.c
> > @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)
> >  
> >  	data = dev_get_platdata(&spi->dev);
> >  
> > +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
> >  	flash->mtd.dev.parent	= &spi->dev;
> >  	flash->mtd.type		= MTD_RAM;
> >  	flash->mtd.flags	= MTD_CAP_RAM;
> > @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)
> >  	flash->mtd._read	= mchp23k256_read;
> >  	flash->mtd._write	= mchp23k256_write;
> >  
> > +	flash->mtd.erasesize = PAGE_SIZE;
> > +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> > +		flash->mtd.erasesize >>= 1;
> > +
> 
> Can we fix allocate_partition() to properly handle the
> master->erasesize == 0 case instead of doing that?

Is everything actually ready for the eraseblock size to be 0? That would
seem surprising to many applications, I would think. Can you, for
instance, even use UBI on such a device?

BTW, I feel like this check is a little more natural to do with
'mtd->flags & MTD_NO_ERASE', rather than checking the (apparently
meaningless) erasesize.

(I realize there's a later version of these patches, but I figured I'd
put my comments where the suggestion was brought up.)

Brian
