Received: from d-106.linux2002.uq.net.au ([203.15.37.106] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YJwI-0008GH-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 04:44:11 +0000
Date: Wed, 6 Feb 2002 14:54:38 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <gleixner@autronix.de>
cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
     <linux-mtd@lists.infradead.org>,  <jffs-dev@axis.com>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <02020523405103.11497@thomas>
Message-ID: <Pine.LNX.4.44.0202061444340.2447-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 Feb 2002, Thomas Gleixner wrote:

> There are different types of adaptors available:
> - Very smart with controller (Useless they force this DOS/FAT style fs)
> - Less smart with ECC hardware (OK, but we should have a close look on it, 
> regarding ECC stuff, especially write to the ecc area and consecutive writes 
> to a page). I have schematics and CPLD code. I try to figure it out.

We should be able to use their ECC hardware. As with the DiskOnChip, this
effectively limits us to one write per page, even if the NAND chip can do
more than that.

> - simple without anything, like on the Cirrus evaluation boards is exactly 
> the same as a soldered NAND chip. (No restrictions)

We already have software ECC code which we can use on these.

> Maybe we can use the SmartMedia scheme for ECC placement in general for all 
> NAND chips.

Except DiskOnChip, which has its own layout.

> > This would be feasible. I thought I'd heard of NAND flash devices
> > which only allowed one write per page though - and I've already
> > written the code to move the cleanmarker.

> I have a look on the data sheets again. I know only about 2 writes/page limit.
> But maybe we need this, when we have a less smart adaptor with ECC hardware.

Yes, the ECC makes supporting multiple writes quite hard. We could invent 
new node types and do ECC per-node, but I think it would be better to do 
block-based ECC and use the hardware capabilities, as we have to do write 
batching into blocks anyway.

> I had already a look on your changes. 
> Is there a possibility to get a mail, when CVS updates are done ?

http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs

> 
> > > > I've done some of the write batching too - we have code to set up a
> > Cool.
> tricky hack, but now oops is gone.

OK. Could you show me the changes you had to make?

> > > That's a bit of headache i don't know exactly how to handle. The only
> > > tricky thing is a write error when we flush the buffer and have data of
> > > the previous write in the buffer.
> >
> > The comments say what you need to do in that case - still a PITA to
> > actually write though.

> I know, but I'm not deep enough inside the jffs2 stuff to do this. If you 
> provide a basic implementation, i could do the same as to the wbuf stuff.

OK, I'll have a go at it. I was leaving it till last, because it's not 
particularly likely to happen in real life. Once the rest works, I'll be 
all happy and motivated to do the evil bits of the error handling :)

> > > > and I haven't implemented fsync().
> > > I implemented it basicly and it works.
> > How did you implement this?
> I look, if the inode of the file, which has to be synced, is partially or 
> full in the writebuffer. Then i pad and flush the buffer and adjust the 
> c->nextsize->free_size and dirty_size. Is simple but works.

OK. It would be nice if we could trigger GC to fill the wbuf, rather than 
padding - and only pad it if we really can't use up the space with GC 
writes.

-- 
dwmw2
