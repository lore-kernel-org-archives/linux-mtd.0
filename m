Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FloTy-0008Pk-L1
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:49:18 -0400
Date: Thu, 1 Jun 2006 16:49:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be satisfied by
	write buffer
Message-ID: <20060601144902.GC15216@wohnheim.fh-wedel.de>
References: <447E0FA4.7010201@realmsys.com>
	<20060601143249.GB15216@wohnheim.fh-wedel.de>
	<200606011539.35964.dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200606011539.35964.dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Kevin Vigor <kevin@realmsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 June 2006 15:39:34 +0100, David Woodhouse wrote:
> On Thursday 01 June 2006 15:32, Jörn Engel wrote:
> > Not sure whether this micro optimization is worth the code.  A real
> > solution would be to have a cache for the full device.  Possibly read
> > the device through pagecache somehow (writing obviously should be
> > write-through, not write-back).  That would have a significantly
> > higher hit rate than your patch.
> 
> We haven't written to the device yet, at this point -- this is just the case 
> where the data in question exist _only_ in the wbuf, but we're actually 
> reading from the flash first _anyway_, with the current code. 

Good point.  Ignore my objections then.

> I don't think that caching the compressed nodes from the flash is going to be 
> particularly useful -- we already have the page cache for _uncompressed_ 
> data. For other things we might want to cache, such as dirents and symlinks, 
> we'll do _much_ better to store that in memory for ourselves rather than just 
> caching whole pages of the backing store for such sparse content.

My observations have been a bit different.  I've had to deal with a
semi-broken simulator, where flash accesses were unbearably slow.
Booting took about an hour.  The simulator has been fixed since, but
the broken state made some details fairly visible. :)

One of the observations was that a lot of flash is being read multiple
times.  Reads on NAND happen in page granularity, so first we have to
read pretty much everything during scan, later again when accessing
the actual files.  There is some room for savings, as RAM is faster
than flash even in the real world.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
