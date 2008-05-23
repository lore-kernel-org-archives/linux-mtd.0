Received: from web36707.mail.mud.yahoo.com ([209.191.85.41])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzNJ9-0005lY-Vs
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 02:47:04 +0000
Date: Thu, 22 May 2008 19:47:02 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080522151051.GA15015@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <323976.43299.qm@web36707.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > # You have to retain logical block address when using FTLs. This also makes
> > "struct mtd_address" confusing - the offset applies the same both to
> physical
> > and logical block. User level driver may want to fill in only logical block
> > address + offset, FTL will put in the actual physical block.
> 
> But nothing below the FTL should ever know about a logical block at all.
> Why pass it on?

Media class specific backend must know it, to populate media's oob structure.
TI's smartmedia adapter, for example, wants to know it itself (it has a
hardware register for it).

> 
> > # And it's not clear to me why would you need pointer to data in the
> request
> > struct. Data is delivered through the additional (quite often more than
> one)
> > call to mtd_get_buf. I think, it's imperative to support fragmented buffers
> -
> > block device often submits requests that are larger than eraseblock (can be
> > read/written in one go) but fragmented across several memory buffers.
> 
> We can replace the data pointer with a struct bio_vec.  In fact, I am
> wondering whether we could just use a struct bio instead of struct
> mtd_request.
> 

Passing the whole struct bio is an overshoot for what we want to support. It
has plenty of functionality that to my opinion would never be supported by dumb
flash controllers.

I thought, something simple would be enough, as long as it can handle buffer
fragmentation and give the backend access to the actual struct page for mapping
operation. It doesn't matter if this is a scatterlist or bio_vec (they are
mostly the same). What's matter is an ability to obtain several chunks of the
buffer in some not too obtrusive way.

Host controller will get a buffer chunk, and set up a dma into it. When it
catches dma boundary event, it'll get another chunk, while still in the
interrupt handler (as much as needed). If controller happens to have a real sg
dma, it can call mtd_get_buf_sg several times in advance to populate the sg
table.

Controllers lacking dma capability can do exactly the same using mtd_get_buf.



      
