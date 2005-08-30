Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EA3jn-00065g-2m
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 06:53:15 -0400
Date: Tue, 30 Aug 2005 12:27:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jared Hulbert <jaredeh@gmail.com>
Message-ID: <20050830102739.GC9504@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
	<6934efce0508291621656374d2@mail.gmail.com>
	<20050830095610.GA9504@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050830095610.GA9504@wohnheim.fh-wedel.de>
Cc: Zhao Fusheng <zhao_fusheng@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 August 2005 11:56:10 +0200, Jörn Engel wrote:
> 
> You cannot kmalloc() more than 128k in a chunk.  Depending on your
> system, you could vmalloc() more.
> 
> It's not the eraseblock size that matters, it's the number of erase
> blocks.  One struct jffs2_eraseblock is needed for each and right now,
> they are put into a large array, allocated by kmalloc().  This array
> hits the ceiling at 128k.
> 
> What we have to do is allocate the memory in smaller chunks and put
> some effort into organizing it.  A slab cache would be the best idea.

Zhao asked me to write some documentation on the 1:1 problem and
possible solutions to it.  He's right, I should have done that long
ago.


	The problem

As explained above, there is a size limit to kmalloc().  Therefore,
JFFS2 in its original design cannot support flashes with more than
131072 / sizeof(struct jffs2_eraseblock) blocks.

In the current implementation, JFFS2 attempts to "solve" this problem
by creating virtual erase blocks.  If one struct takes 68 bytes, JFFS2
could support a maximum of 1927 blocks.  For a 2048 block device, it
will simply combine two physical blocks into one virtual, giving a
total of 1024 virtual blocks.  This is below the limit and everything
appeared to be well.

But it isn't.  The problem is that sizeof(struct jffs2_eraseblock) is
not a god-given constant but changes depending on your architecture
(bigger for 64bit machines, smaller for 32bit), patches you may have
applied (erase count and summary both add fields to the struct) and
possibly other things as well.  Thus, the number of blocks that JFFS2
can support it not fixed.

Since the maximum number of blocks is not fixed, it depends on your
architecture, kernel, etc. whether you have virtual blocks on your
system or you don't.  A kernel update could turn virtual mapping on or
off for your system.

One example of how this hurts you is this:

+----------------+----------------+
|node node node node node node ...|
+----------------+----------------+

You have two physical blocks combined into a virtual one.  Notice how
the fourth node is partially in one physical block and partially in
the other.  Now imagine your last kernel update shrunk struct
jffs2_eraseblock, so that you don't need virtual blocks anymore:

+----------------+----------------+
|node node node n|ode node node...|
+----------------+----------------+

The fourth node is divided into two parts.  Either one of them will
have CRC errors, thus it will be treated as garbage and removed.  Wave
your data a last goodbye, it will be gone once GC handles either of
those blocks.


	The solution

Quite a few things are possible now.  But any real fix for this design
problem will require a fixed amount of physical blocks to be part of a
virtual block.  No matter what else changes, the number of physical
blocks per virtual one *must not*.

Imo, the best number of physical blocks per virtual one to pick is one
(1).  Any higher number will limit scalability towards small flashes.
JFFS2 requires 5 erase blocks in _addition_ to whatever is occupied by
data.  With a 2:1 mapping, devices smaller than 12 physical blocks
wouldn't work with JFFS2 at all.

The rest is code and implementation details.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
