Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al2vs-0007o4-F8
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 09:21:24 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	<1075099329.17157.97.camel@lapdancer.baythorne.internal>
	<m3bror89u9.fsf@maxwell.lnxi.com>
	<1075102799.17157.209.camel@lapdancer.baythorne.internal>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 26 Jan 2004 02:23:23 -0700
In-Reply-To: <1075102799.17157.209.camel@lapdancer.baythorne.internal>
Message-ID: <m3brorf4hg.fsf@maxwell.lnxi.com>
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

> On Mon, 2004-01-26 at 00:09 -0700, Eric W. Biederman wrote:
> > Has anyone gotten as far as a proof.  Or are there some informal
> > things that almost make up a proof, so I could get a feel?  Reserving
> > more than a single erase block is going to be hard to swallow for such
> > a small filesystem. 
> 
> You need to have enough space to let garbage collection make progress.
> Which means it has to be able to GC a whole erase block into space
> elsewhere, then erase it. That's basically one block you require.
> 
> Except you have to account for write errors or power cycles during a GC
> write, wasting some of your free space. You have to account for the
> possibility that what started off as a single 4KiB node in the original
> block now hits the end of the new erase block and is split between that
> and the start of another, so effectively it grew because it has an extra
> node header now. And of course when you do that you get worse
> compression ratios too, since 2KiB blocks compress less effectively than
> 4KiB blocks do.

Compression is an interesting question.  Do you encode the uncompressed
size of a block in bytes.  If so I don't think it would be too difficult
to get your uncompressed block size > page size.  With the page cache
there is real reason a block size <= page size.  You just need what
amounts to scatter/gather support.

My real question here is how difficult is it to disable compression?
Or can compression be deliberately disabled on a per file basis?

For the two primary files I am thinking of using neither one would
need compression.  A file of my BIOS settings is would be dense
and quite small (128 bytes on a big day).  A kernel is already
compressed and carries it's own decompresser, and whole file compression
is more effective than compressing small blocks.

> When you get down to the kind of sizes you're talking about, I suspect
> we need to be thinking in bytes rather than blocks -- because there
> isn't just one threshold; there's many, of which three are particularly
> relevant:

That makes sense.  This at least looks like a viable alternative for
the 1MB case.

[snip actual formulas]

> You want resv_blocks_write to be larger than resv_blocks_deletion, and I
> suspect you could get away with values of 2 and 1.5 respectively, if we
> were counting bytes rather than whole eraseblocks.

I have a truly perverse case I would like to ask your opinion about.
A filesystem composed of 2 8K erase blocks?  That is one of the
weird special cases that flash chips often support.  I could
only store my parameter file in there but it would be interesting.

I think if I counted bytes very carefully and never got above .5 of
a block full I suspect that it would work, and be useful.  I'd just
have to make certain the degenerate case matched the original jffs.

And a last question. jffs2 rounds all erase blocks up to a common size
doesn't it?

Eric
