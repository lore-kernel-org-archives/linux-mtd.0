Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al0qM-0007Ag-Ei
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 07:07:34 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	<1075099329.17157.97.camel@lapdancer.baythorne.internal>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 26 Jan 2004 00:09:34 -0700
In-Reply-To: <1075099329.17157.97.camel@lapdancer.baythorne.internal>
Message-ID: <m3bror89u9.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Sun, 2004-01-25 at 14:53 -0700, Eric W. Biederman wrote:
> > The old papers on jffs2 would make it unacceptable as it reserves
> > 5 erase blocks. 
> 
> It's got slightly different heuristics now -- a proportion of total
> size, plus a proportion of total _blocks_. That was done primarily to
> deal with NAND flash, where we need _more_ blocks reserved, but it
> should also have helped with small NOR flashes. 
> 
> You blatantly don't _need_ to reserve five erase blocks to let you
> rewrite the contents of the remaining, erm, one erase block full of
> data. You can tune this; it's not a mount option but it's relatively
> simple to change in the code.

Has anyone gotten as far as a proof.  Or are there some informal
things that almost make up a proof, so I could get a feel?  Reserving
more than a single erase block is going to be hard to swallow for such
a small filesystem. 

> >  And I don't know if yaffs or yaffs2 is any better.
> 
> They're for NAND, not NOR flash.

I think I have heard about a port to NOR flash, but tuned
for NAND flash I would be really surprised if they were different.
 
> > In addition boot time is important so it would be ideal if I did not
> > to read every byte of the ROM chip to initialize the filesystem.
> 
> There have been efforts to improve JFFS2 performance in this respect. It
> still reads the _header_ from each node of the file system, but doesn't
> actually checksum every node any more.

That should help.  It bears trying to see how fast things are.

Eric
