Received: from 0122700014.0.fullrate.dk ([95.166.99.235] helo=kernel.dk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O3o67-0005i5-Lb
	for linux-mtd@lists.infradead.org; Mon, 19 Apr 2010 10:21:00 +0000
Date: Mon, 19 Apr 2010 12:20:56 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100419102056.GS27497@kernel.dk>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100419101559.GA4145@logfs.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 19 2010, Jörn Engel wrote:
> On Mon, 19 April 2010 09:38:44 +0200, Jens Axboe wrote:
> > On Sat, Apr 17 2010, Jörn Engel wrote:
> > > Moin David,
> > > 
> > > if I read the code correctly, JFFS2 will happily perform a NOP on
> > > sys_sync() again.  And this time it appears to be Jens' fault.
> > > 
> > > JFFS2 does not appear to set s_bdi anywhere.  And as of 32a88aa1,
> > > __sync_filesystem() will return 0 if s_bdi is not set.  As a result,
> > > sync_fs() is never called for jffs2 and whatever remains in the wbuf
> > > will not make it to the device.
> > > 
> > > The patch also adds a BUG_ON to catch this problem in any remaining or
> > > future offenders.  I am not sure about network filesystems, but at
> > > least bdev- and mtd-based ones should be caught.
> > > 
> > > Opinions?
> > 
> > I think that BUG_ON() would be a lot better as a printk() and fail mount
> > instead. There's really little point in killing the kernel for something
> > you could easily warn about and recover nicely.
> 
> *shrug*
> The BUG_ON directly above is not qualitatively different.  In both cases
> the only solution is to find and fix the bug in some other file,
> recompile and try again.  But ultimately I don't care, as long as we
> catch the bug before people lose their data.
> 
> Feel free to respin this patch.  You caused the problem in the first
> place. ;)
> 
> For the record, while I consider the two-liner that causes this mess a
> real turd, the rest of your patch was brilliant.  A shame I didn't catch
> this earlier.

Thanks, we definitely should have put a debug statement to catch this in
from day 1, good debugging should be an important part of any new
infrastructure.

Care to send your jffs2 patch separately to David? Then I'll commit a
modified variant for complaining about missing ->s_bdi on mount.

-- 
Jens Axboe
