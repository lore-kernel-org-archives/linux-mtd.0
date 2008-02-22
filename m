Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JSTXG-000186-5h
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2008 08:45:38 +0000
Date: Fri, 22 Feb 2008 09:45:33 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Bryan Wu <cooloney@kernel.org>
Subject: Re: [MTD/NAND] Blackfin NFC driver DMA bug ?
Message-ID: <20080222084533.GA2543@parrot.com>
References: <loom.20080221T171743-57@post.gmane.org>
	<386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
Sender: Ivan Djelic <ivan.djelic@parrot.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 22, 2008 at 10:52:49AM +0800, Bryan Wu wrote:
> >         /*
> >          * Before starting a dma transfer, be sure to invalidate/flush
> >          * the cache over the address range of your DMA buffer to
> >          * prevent cache coherency problems. Otherwise very subtle bugs
> >          * can be introduced to your driver.
> >          */
> >         if (is_read)
> >                 invalidate_dcache_range((unsigned int)buf,
> >                                 (unsigned int)(buf + page_size));
> >         else
> >                 flush_dcache_range((unsigned int)buf,
> >                                 (unsigned int)(buf + page_size));
> >
> >  Since 'buf' is allocated outside MTD, are we allowed to assume it is
> >  cache-aligned ? Because if it's not, invalidating dcache on read is not enough
> >  to prevent cache coherency problems. For instance, a cache line partially
> >  spanning across the buffer address range could be flushed just after DMA has
> >  completed, corrupting DMA data in the process...
> 
> Oh, I am not fully understand your concern.  The code is invalidating
> or flushing buf before DMA operation.
> And invalidate and flush operation is OK for buf which is not
> cache-aligned on Blackfin arch. it also should be
> OK for other arch.

Well, consider the following scenario, in which 'buf' is not cache-aligned:

1) function bf5xx_nand_dma_rw() is called for reading data.

2) dcache is partially invalidated on a range containing 'buf': this range is
cache-aligned, of course.

3) at this point, imagine some variable residing nearby 'buf' (in the same
cache line interval) is read and modified, resulting in a cache line being
fetched and modified (hence becoming dirty).

4) DMA transfer happens, modifying data in memory.

5) now, the dirty cache line from 3) can be flushed to memory anytime...
corrupting DMA data, because its contents were read *before* the DMA transfer !

Or consider this other scenario:

1) and 2) same as above.

3) some variable residing nearby 'buf' (in the same cache line interval) is
read (not modified), resulting in a cache line being fetched. Cache line is not
dirty.

4) DMA transfer happens.

5) now, if you read data from 'buf', you will get wrong (stale) data because the
cache line contents were read *before* the DMA transfer.


To avoid those kind of problems you would need a reliable way to prevent the
cache from messing with your buffer during the whole DMA transfer.

Ivan
