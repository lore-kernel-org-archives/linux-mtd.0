Received: from web36706.mail.mud.yahoo.com ([209.191.85.40])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzTeW-0003o3-G0
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 09:33:32 +0000
Date: Fri, 23 May 2008 02:33:30 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080523055005.GA20264@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <806030.2681.qm@web36706.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jörn Engel <joern@logfs.org> wrote:

> On Thu, 22 May 2008 19:47:02 -0700, Alex Dubov wrote:
> > 
> > > 
> > > But nothing below the FTL should ever know about a logical block at all.
> > > Why pass it on?
> > 
> > Media class specific backend must know it, to populate media's oob
> structure.
> > TI's smartmedia adapter, for example, wants to know it itself (it has a
> > hardware register for it).
> 
> Interesting.  Do you have a spec for that?
> 
> I would have expected two kinds of controllers.  "Smart" ones that
> essentially export a block device interface and do all FTL work
> themselves and dumb ones that allow raw flash access and require and FTL
> in software.  Didn't know there were mixtures of the two.

I don't have a datasheet for the TI, but it appears that it calculates a parity
for the "block address" field in smartmedia oob itself, so it will overwrite
the submitted oob with the value of the appropriate register.

Memorystick cards don not expose the oob at all - logical address is set to oob
through a media side register.

> 
> > > We can replace the data pointer with a struct bio_vec.  In fact, I am
> > > wondering whether we could just use a struct bio instead of struct
> > > mtd_request.
> > > 
> > 
> > Passing the whole struct bio is an overshoot for what we want to support.
> It
> > has plenty of functionality that to my opinion would never be supported by
> dumb
> > flash controllers.
> 
> After having a closer look at it I tend to agree.  Nevertheless there
> are tons of similarities between block devices and mtd and I would like
> them to become as similar as reasonably possible.  So right now I'd
> create a struct fio (flash io) and copy any fields that make sense for
> both from struct bio. 

The question is: do you really think something like this is needed at all?
Block device layer uses all kinds of assumptions irrelevant to MTD:

1. Most backends are very (NCQ) intelligent and very fast.
2. Failure rates are diminishingly small and mostly handled in hardware.

On the MTD side:

1. Backends are dumb.
2. Protocols are even dumber.
3. Failures happen all the time.
4. Fully zero-copy approach is not possible (because of the occasional
read-merge-erase-write).

That's why MTD will hardly benefit from request queues or fancy IO management
schemes.

> 
> > I thought, something simple would be enough, as long as it can handle
> buffer
> > fragmentation and give the backend access to the actual struct page for
> mapping
> > operation. It doesn't matter if this is a scatterlist or bio_vec (they are
> > mostly the same). What's matter is an ability to obtain several chunks of
> the
> > buffer in some not too obtrusive way.
> > 
> > Host controller will get a buffer chunk, and set up a dma into it. When it
> > catches dma boundary event, it'll get another chunk, while still in the
> > interrupt handler (as much as needed). If controller happens to have a real
> sg
> > dma, it can call mtd_get_buf_sg several times in advance to populate the sg
> > table.
> > 
> > Controllers lacking dma capability can do exactly the same using
> mtd_get_buf.
> 
> Makes sense.  And one hopes that most controllers don't require busy
> waits and either send an interrupt or allow setting a timer as a poor
> man's interrupt.

There's nothing wrong with backend busy waiting to complete request. Maximum,
your audio will jump here and there. Just don't use that driver for mp3 player
project.

(That's why I put as a requirement that new requests must be advertised
asynchronously, by firing a tasklet in the backend, for example. I'm following
this approach in my xd_card driver).




      
