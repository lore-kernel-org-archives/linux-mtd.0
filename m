Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGYAf-0002kX-5d
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 22:02:22 +0000
Received: by mail-pf0-x241.google.com with SMTP id f27so9212707pfe.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 15:02:00 -0700 (PDT)
Date: Thu, 1 Jun 2017 15:01:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 andrew@lunn.ch, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170601220156.GD102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
 <20170601224712.6a81a458@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170601224712.6a81a458@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 01, 2017 at 10:47:12PM +0200, Boris Brezillon wrote:
> Le Thu, 1 Jun 2017 11:43:40 -0700,
> Brian Norris <computersforpeace@gmail.com> a écrit :
> > On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:
> > > On Wed, 17 May 2017 17:39:07 +1200
> > > Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> > > > @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)
> > > >  	flash->mtd._read	= mchp23k256_read;
> > > >  	flash->mtd._write	= mchp23k256_write;
> > > >  
> > > > +	flash->mtd.erasesize = PAGE_SIZE;
> > > > +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> > > > +		flash->mtd.erasesize >>= 1;
> > > > +  
> > > 
> > > Can we fix allocate_partition() to properly handle the
> > > master->erasesize == 0 case instead of doing that?  
> > 
> > Is everything actually ready for the eraseblock size to be 0? That would
> > seem surprising to many applications, I would think. Can you, for
> > instance, even use UBI on such a device?
> 
> Well, I think it's already broken. AFAICT this driver does not
> implement ->_erase(), and mtd_erase() does not check if MTD_NO_ERASE is
> set before calling mtd->_erase(), neither UBI does before calling
> mtd_erase().

Sure.

> Between a NULL pointer exception and a div-by-zero exception, I can't
> decide what is better :-).

Well, there are other potential problems than that. What if someone was
iterating over the device size, by increments of erasesize? Infinite
loop! Or what about anything that might have assumed
'writesize < erasesize'?

I'm mostly thinking out loud, because I'm not sure there's a really good
way to handle this, other than stop making those assumptions.

(A *possible* solution would be to have MTD enforce a fake erasesize for
NO_ERASE flash, instead of making drivers do it, like Chris was trying.
But I'm not sure that's a good one.)

> IMO, we'd better add a check in UBI to refuse to attach a device with
> MTD_NO_ERASE or mtd->erasesize == 0, and fix other places that don't
> check erasesize value instead of putting a fake erasesize and using a
> dummy ->_erase() implementation for those devices that simply can't be
> erased.

That's probably a good idea.

> We should also probably complain with -ENOTSUPP when someone calls
> mtd_erase() on a device with MTD_NO_ERASE and add more checks in the
> add_mtd_device() to detect drivers that don't have MTD_NO_ERASE set
> and do not implement ->_erase() or leave ->erasesize to 0. 

Yep.

> > BTW, I feel like this check is a little more natural to do with
> > 'mtd->flags & MTD_NO_ERASE', rather than checking the (apparently
> > meaningless) erasesize.
> 
> Fair enough.

OK, well I'll take another look at v4, but that might be my only
criticism then.

Overall though, a "NO_ERASE" MTD makes me wonder why it's an MTD in the
first place. I guess we're kinda the wild west of things that don't fit
into the block subsystem...

Brian
