Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNJVu-0005xE-Nn
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 12:43:43 +0000
Date: Wed, 13 Jul 2016 14:43:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: Cached NAND reads and UBIFS
Message-ID: <20160713144318.38f809f7@bbrezillon>
In-Reply-To: <57863449.4070108@nod.at>
References: <57863449.4070108@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Jul 2016 14:30:01 +0200
Richard Weinberger <richard@nod.at> wrote:

> Hi!
> 
> As discussed on IRC, Boris and I figured that on our target UBIFS is sometimes
> very slow.
> i.e. deleting a 1GiB file right after a reboot takes more than 30 seconds.
> 
> When deleting a file with a cold TNC UBIFS has to lookup a lot of znodes
> on the flash.
> For every single znode lookup UBIFS requests a few bytes from the flash.
> This is slow.
> 
> After some investigation we found out that the NAND read cache is disabled
> when the NAND driver supports reading subpages.
> So we removed the NAND_SUBPAGE_READ flag from the driver and suddenly
> lookups were fast. Really fast. Deleting a 1GiB took less than 5 seconds.
> Since on our MLC NAND a page is 16KiB many znodes can be read very fast
> directly out of the NAND read cache.
> The read cache helps here a lot because in the regular case UBIFS' index
> nodes are linearly stored in a LEB.
> 
> The TNC seems to assume that it can do a lot of short reads since the NAND
> read cache will help.
> But as soon subpage reads are possible this assumption is no longer true.
> 
> Now we're not sure what do do, should we implement bulk reading in the TNC
> code or improve NAND read caching?

Hm, NAND page caching is something I'd like to get rid of at some
point, and this for several reasons:

1/ it brings some confusion in NAND controller drivers, where those
don't know when they are allowed to use chip->buffer, and what to do
with ->pagebuf in this case

2/ caching is already implemented at the FS level, so I'm not sure we
really need another level of caching at the MTD/NAND level (except for
those specific use cases where the MTD user relies on this caching to
improve accesses to small contiguous chunks)

3/ it hides the real number of bitflips in a given page: say someone is
reading over and over the same page, the MTD user will never be able to
detect when the number of bitflips exceed the threshold. This should
not be a problem in real world, because MTD users are unlikely to always
read the same page without reading other pages in the meantime, but
still, I think it adds some confusion, especially if one wants to write
a test that reads over and over the same page to see the impact of
read-disturb.

Regards,

Boris
