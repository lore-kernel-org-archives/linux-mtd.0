Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tt14-0001ID-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 17:58:30 +0100
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
From: Russ Dill <Russ.Dill@asu.edu>
To: Marc Singer <elf@buici.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
	yaffs@toby-churchill.org
In-Reply-To: <20020924165351.GA2533@buici.com>
References: <200209231220.12682.ayalon@tadlys.com>
	<20020924014556.6EC8B43F2@tiger.actrix.co.nz>
	<20020924034410.GA18915@buici.com>
	<20020924040150.A1499145FF@dragon.actrix.co.nz>
	<20020924044434.GA23917@buici.com> <1032854017.13283.3.camel@russ>
	<20020924165351.GA2533@buici.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Sep 2002 09:59:03 -0700
Message-Id: <1032886743.13283.6.camel@russ>
Mime-Version: 1.0
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

On Tue, 2002-09-24 at 09:53, Marc Singer wrote:
> On Tue, Sep 24, 2002 at 12:53:36AM -0700, Russ Dill wrote:
> > 
> > > Some people think that writing a new kernel would be easy.  %^)
> > > 
> > > The trouble is coming up with a convenient method.  LILO stores a list
> > > of blocks.  GRUB reads filesystems.  GRUB is better in the long run,
> > > but harder to implement.
> > 
> > I've written a cramfs reader for grub, to use on the DOC, and grub works
> > great on a DOC. Although the grub code is a bit ugly, and there are a
> > few gotchas, writing a module is pretty straight forward. That being
> > said, writing a module to load files of a journaled fs (jffs2), is a bit
> > more time consuming, but as I understand yaffs is greatly optimized
> > towards NAND (as apposed to NOR) flash layout and lends itself to easy
> > reading (same sized blocks, no compression iirc).
> > 
> > If I were you, I'd use grub.
> 
> That's what I'd expect.
> 
> A question, though.  I've been doing compression tests with cramfs.
> I'm finding that gzip -9 of an ext2 filesystem produces smaller images
> than mkcramfs.  Have you ever compared the two?

cramfs is meant to be lean, fast, and low on ram consumption, if you
compress the whole thing at once, you have to load the whole thing into
ram to read any of it, so cramfs compresses PAGE_CACHE (4096) sized
pages at a time
