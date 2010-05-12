Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC7q6-0001qe-VB
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 09:02:52 +0000
Date: Wed, 12 May 2010 11:02:40 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
Subject: Re: UBIL design doc
In-Reply-To: <AANLkTikbzOXYazQnxvgJNURHDD6pcc78YUt1hXU908pK@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.1005121014200.3401@localhost.localdomain>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<AANLkTikbzOXYazQnxvgJNURHDD6pcc78YUt1hXU908pK@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: rohitvdongre@gmail.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brijesh,

On Wed, 12 May 2010, Brijesh Singh wrote:
> On Wed, May 12, 2010 at 12:47 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > On Mon, 10 May 2010, Artem Bityutskiy wrote:
> >> 1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
> >> erease cycles? Won't the SB PEB wear out very quickly? Why you did not
> >> go for the chaining approach which I described in the old JFFS3 design
> >> doc?
> >>
> >> If we do not implement chaining, we should at least design it and make
> >> sure UBIL can be extended later so that SB chaining could be added.
> >
> > The super block needs to be scanned for from the beginning of flash
> > anyway due to bad blocks. Putting it into a fixed position (first good
> > erase block) is a very bad design decision vs. wear leveling.
> 
> This scan is minimal once the bad blocks are marked bad. Flash driver
> generally  returns error by reading oob area or in ram bbt table. In comparison,
> keeping super block in first few blocks may become question of availability or
> wear-leveling trade off. The scan time for super block itself will
> take lot of time.
> In fact, in that case we won't need the super block at all. Just scan
> to find first
> chained commit block. But this doesn't look like a very good idea.

Well, the super block is special. It links to the log block, so that
we can move the log block to any place in the flash. So it's going to
be a block which is not recycled too often depending on how the log
chain works.

I don't see why scanning for the super block will take so much
time. If we keep it inside of the first N blocks then it's a well
defined scan time limit. And you just need to read the first page to
find it.

> > The super block must be moveable like any other block, though we can
> > keep it as close to the start of flash as possible.
> 
> The idea is to get rid of scanning. A fixed place super block can
> locate movable headers.

Right, but there is a difference between scanning 8k blocks and
scanning a low number (16 or 32) blocks. That's in the single digit
milliseconds range. So forcing it to a fixed location is just an
overoptimization.

> > Also chaining has a tradeoff. The more chains you need to walk the
> > closer you get to the point where you are equally bad as a full scan.
> 
> As artem suggested, chaining should help in minimizing writes to
> anchor block at fixed
> location. At first instance it looked promising. But this design also
> has single point of failure.

Not if you make the super block movable. Then you can create the
replacement block before erasing the old super block. So in the worst
case you have two super blocks in that scan range and you need to
figure out which one is the valid one. No big deal.

> > I don't think it's a good idea to kill the EC/VID headers. It not only
> > violates the backwards compability it also fundamentally weakens UBIs
> > reliability for no good reason and I doubt that the performance win is
> > big enough to make it worth.
> >
> > The performance gain is at attach time by getting rid of the flash
> > scan, but not by getting rid of writing the EC/VID headers.
> 
> These flash headers have some more problems. Like, space wastage in MLC.
> Alignment problem for byte addressable memory. Backward compatibility
> is a good idea.
> But it is possible to implement these features and higher performance
> by getting rid of them.
> It seemed a fair trade off to me. But I am open for any better solution.

Well. You can get rid of them, but that needs to be optional. 

And if you remove them then your log needs to take care of the EC/VID
tracking.

That means you write at least ECC size long data to the log for every
single transaction. IOW, you move the space waste partially from the
data blocks to the loging blocks.

If you do not, you lose reliability completely, which is not an option
at all.

Further this will need a careful balance of how many log entries you
write before you need to create a compressed snapshot simply because
the number of entries is linearely increasing the attach time.

Thanks,

	tglx
