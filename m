From: dwmw2@infradead.org (David Woodhouse)
Date: 20 Feb 2003 13:34:50 +0000
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <200302192122.28841.tglx@linutronix.de>
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302192122.28841.tglx@linutronix.de>
Message-ID: <1045748089.2242.37.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-19 at 20:22, Thomas Gleixner wrote:
> What exactly did you do there ? I mean creating and/or modifying.
> The problem is the node is written with valid CRC, so it seems to be
> correct, but the node content is totally crap. Compressed data size = 
> 0x6b6b6b6b.

That's slab poisoning. Looking at the actual node, the 'offset',
'csize', 'dsize', 'usercompr' and 'flags' fields all seem to be filled
with 0x6B, but other fields are OK.

I suspect that we're allocating a jffs2_raw_inode structure, and we're
being given a slab address that someone else has already allocated and
freed. We're filling in some of the fields (offset, csize, etc), and
then said 'someone else' is freeing it _again_. At which point the slab
debugging code memsets it to all 0x6B. 

Then we fill in the rest of the fields, calculate the crcs and write it
to the flash, blissfully unaware that someone stomped on the offset,
csize, etc fields after we'd set them up.

What other drivers are present in your system? Can you reproduce this?
We can stick debugging checks in the write path to check for 0x6B in
bogus places, and try to debug further.

-- 
dwmw2
