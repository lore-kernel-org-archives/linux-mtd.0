Date: Wed, 12 Jan 2005 17:28:07 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050112092246ae9277@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0501121724520.10617@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
	<6934efce050112092246ae9277@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005, Jared Hulbert wrote:

> > Correct.  That requirement comes mostly from having to program the
> > memory controller before being able to use DRAM.  After the early
> > boot, it's just nice to have.
> 
> Requirement in the marketplace I mean.  Most NOR chips are expected to
> have 0 errors by those who buy them.
> 
> > Would this actually be an advantage?  Last time I looked, it was
> > cheaper to use more DRAM.  Most DSL routers I see advertised have a
> > 1:4 or 1:8 ratio of NOR:DRAM, so it looks as if the prices haven't
> > changed much.
> 
> So you save more RAM that you use up flash when doing XIP.  We've seen
> 1.5MiB of RAM saved at a cost of 1MiB of NOR.  This reduces the total
> memory footprint of the system.  It can also make the difference
> between 16MiB and a 32MiB DRAM.  The end result is that the XIP can
> lower the BOM cost for a device.  It also can reduce the power
> consumption such that your phone or PDA has a much longer standby
> time.  The performance advantage of XIP to boot up and application
> launch can be quite noticable.  Think of the flow of data to start
> executing an application from JFFS2.  We copy the data 3 times in RAM?
Teoretically in case of NOR only once in the best case when node is 
pristine. We just uncompress it directly from NOR flash to RAM page.
In worst case twice. We uncompress non-pristine data to temporary buffer, 
copy the valid data to the page. And so forth for all nodes containing 
data related to the requested range.

> decompress it, CRC it.  Compare that to mmap() in XIP cramfs.  It just
> points to the flash address.
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
