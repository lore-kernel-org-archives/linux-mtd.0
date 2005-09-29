Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EL7fB-0008KQ-No
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 19:18:20 -0400
Date: Fri, 30 Sep 2005 01:18:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20050929231814.GB30887@wohnheim.fh-wedel.de>
References: <20050929195205.GA30002@plexity.net>
	<20050929205252.GG7684@flint.arm.linux.org.uk>
	<20050929212055.GA311@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050929212055.GA311@plexity.net>
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix IXP4xx MTD driver no cast warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 14:20:55 -0700, Deepak Saxena wrote:
> On Sep 29 2005, at 21:52, Russell King was caught saying:
> > On Thu, Sep 29, 2005 at 12:52:05PM -0700, Deepak Saxena wrote:
> > > Fix following warning:
> > > 
> > > drivers/mtd/maps/ixp4xx.c: In function 'ixp4xx_flash_probe':
> > > drivers/mtd/maps/ixp4xx.c:199: warning: assignment makes integer from
> > > pointer without a cast
> > > 
> > > Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> > > 
> > > diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> > > --- a/drivers/mtd/maps/ixp4xx.c
> > > +++ b/drivers/mtd/maps/ixp4xx.c
> > > @@ -196,7 +196,7 @@ static int ixp4xx_flash_probe(struct dev
> > >  		goto Error;
> > >  	}
> > >  
> > > -	info->map.map_priv_1 = ioremap(dev->resource->start,
> > > +	info->map.map_priv_1 = (unsigned long)ioremap(dev->resource->start,
> > 
> > Shouldn't this be using info->map.virt instead of the old map.map_priv_1 ?
> 
> I think when I wrote this, having a !0 value in map->virt would cause the mtd
> core to assume that the map driver supported point()ing and direct copy
> of data.  Looking at the mtd code it looks like this assumption might
> have gone away...will change code.

A check on this field is still used in cfi_intelext_point(), but you
can disable the point stuff by setting map->phys to NO_XIP - as you
already do.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
