Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ttVk-0001Mr-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 18:30:12 +0100
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
From: Russ Dill <Russ.Dill@asu.edu>
To: Marc Singer <elf@buici.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
	yaffs@toby-churchill.org
In-Reply-To: <20020924171419.GA2733@buici.com>
References: <200209231220.12682.ayalon@tadlys.com>
	<20020924014556.6EC8B43F2@tiger.actrix.co.nz>
	<20020924034410.GA18915@buici.com>
	<20020924040150.A1499145FF@dragon.actrix.co.nz>
	<20020924044434.GA23917@buici.com> <1032854017.13283.3.camel@russ>
	<20020924165351.GA2533@buici.com> <1032886743.13283.6.camel@russ>
	<20020924171419.GA2733@buici.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Sep 2002 10:30:45 -0700
Message-Id: <1032888645.13282.11.camel@russ>
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

> > > A question, though.  I've been doing compression tests with cramfs.
> > > I'm finding that gzip -9 of an ext2 filesystem produces smaller images
> > > than mkcramfs.  Have you ever compared the two?
> > 
> > cramfs is meant to be lean, fast, and low on ram consumption, if you
> > compress the whole thing at once, you have to load the whole thing into
> > ram to read any of it, so cramfs compresses PAGE_CACHE (4096) sized
> > pages at a time
> 
> That's what isn't clear.  I made two filesystems with the same
> contents.  One cramfs and the other ext2.  The ext2 filesystem
> compressed was smaller than the cramfs.  My understanding is that both
> must be uncompressed into a ramfs to be used.  If this is correct,
> then the only comparable consideration is the size of the compressed
> data.

no, a cramfs does not need to be loaded into a ramfs, only the pages
that are needed are loaded from the cramfs, and if memory is in a pinch,
fs pages can be dropped. If you gzip a 4M file at once, vs gzip 4096
byte pieces of it at a time, the former will end up smaller. (deflate
uses repetition of information, and runs of things).

of course, it depends which you want, greatly optimized memory usage
(cramfs), or a slightly smaller image.
