Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tuUm-0001Uv-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 19:33:16 +0100
Date: Tue, 24 Sep 2002 11:33:14 -0700
From: Marc Singer <elf@buici.com>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
  yaffs@toby-churchill.org
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Message-ID: <20020924183314.GA3074@buici.com>
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz> <20020924044434.GA23917@buici.com> <1032854017.13283.3.camel@russ> <20020924165351.GA2533@buici.com> <1032886743.13283.6.camel@russ> <20020924171419.GA2733@buici.com> <1032888645.13282.11.camel@russ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1032888645.13282.11.camel@russ>
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

On Tue, Sep 24, 2002 at 10:30:45AM -0700, Russ Dill wrote:
> > > > A question, though.  I've been doing compression tests with cramfs.
> > > > I'm finding that gzip -9 of an ext2 filesystem produces smaller images
> > > > than mkcramfs.  Have you ever compared the two?
> > > 
> > > cramfs is meant to be lean, fast, and low on ram consumption, if you
> > > compress the whole thing at once, you have to load the whole thing into
> > > ram to read any of it, so cramfs compresses PAGE_CACHE (4096) sized
> > > pages at a time
> > 
> > That's what isn't clear.  I made two filesystems with the same
> > contents.  One cramfs and the other ext2.  The ext2 filesystem
> > compressed was smaller than the cramfs.  My understanding is that both
> > must be uncompressed into a ramfs to be used.  If this is correct,
> > then the only comparable consideration is the size of the compressed
> > data.
> 
> no, a cramfs does not need to be loaded into a ramfs, only the pages
> that are needed are loaded from the cramfs, and if memory is in a pinch,
> fs pages can be dropped. If you gzip a 4M file at once, vs gzip 4096
> byte pieces of it at a time, the former will end up smaller. (deflate
> uses repetition of information, and runs of things).
> 
> of course, it depends which you want, greatly optimized memory usage
> (cramfs), or a slightly smaller image.

Yes, that is the trade off.  I was unclear about how cramfs was
loaded.  It was my understanding that the cramfs was unpacked into a
ramfs so that the fs could be used R/W.

I'll evaluate it again when I have a chance.
