From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3bror89u9.fsf@maxwell.lnxi.com>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	 <1075099329.17157.97.camel@lapdancer.baythorne.internal>
	 <m3bror89u9.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1075102799.17157.209.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 07:40:00 +0000
Content-Transfer-Encoding: 7bit
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

On Mon, 2004-01-26 at 00:09 -0700, Eric W. Biederman wrote:
> Has anyone gotten as far as a proof.  Or are there some informal
> things that almost make up a proof, so I could get a feel?  Reserving
> more than a single erase block is going to be hard to swallow for such
> a small filesystem. 

You need to have enough space to let garbage collection make progress.
Which means it has to be able to GC a whole erase block into space
elsewhere, then erase it. That's basically one block you require.

Except you have to account for write errors or power cycles during a GC
write, wasting some of your free space. You have to account for the
possibility that what started off as a single 4KiB node in the original
block now hits the end of the new erase block and is split between that
and the start of another, so effectively it grew because it has an extra
node header now. And of course when you do that you get worse
compression ratios too, since 2KiB blocks compress less effectively than
4KiB blocks do.

When you get down to the kind of sizes you're talking about, I suspect
we need to be thinking in bytes rather than blocks -- because there
isn't just one threshold; there's many, of which three are particularly
relevant:

        /* Deletion should almost _always_ be allowed. We're fairly
           buggered once we stop allowing people to delete stuff
           because there's not enough free space... */
        c->resv_blocks_deletion = 2;
                                                                                
        /* Be conservative about how much space we need before we allow writes.
           On top of that which is required for deletia, require an extra 2%
           of the medium to be available, for overhead caused by nodes being
           split across blocks, etc. */
                                                                                
        size = c->flash_size / 50; /* 2% of flash size */
        size += c->nr_blocks * 100; /* And 100 bytes per eraseblock */
        size += c->sector_size - 1; /* ... and round up */
                                                                                
        c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);

        /* When do we allow garbage collection to merge nodes to make
           long-term progress at the expense of short-term space exhaustion? */
        c->resv_blocks_gcmerge = c->resv_blocks_deletion + 1;
                                                                                
You want resv_blocks_write to be larger than resv_blocks_deletion, and I
suspect you could get away with values of 2 and 1.5 respectively, if we
were counting bytes rather than whole eraseblocks.

Then resv_blocks_gcmerge wants to be probably about the same as
resv_blocks_deletion, to make sure we get as much benefit from GC as
possible.





> > >  And I don't know if yaffs or yaffs2 is any better.
> > 
> > They're for NAND, not NOR flash.
> 
> I think I have heard about a port to NOR flash, but tuned
> for NAND flash I would be really surprised if they were different.
>  
> > > In addition boot time is important so it would be ideal if I did not
> > > to read every byte of the ROM chip to initialize the filesystem.
> > 
> > There have been efforts to improve JFFS2 performance in this respect. It
> > still reads the _header_ from each node of the file system, but doesn't
> > actually checksum every node any more.
> 
> That should help.  It bears trying to see how fast things are.
> 
> Eric
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
dwmw2
