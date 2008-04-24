Date: Thu, 24 Apr 2008 11:25:01 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: [RFC][patch] NAND partial page read functionality
In-Reply-To: <20080424074526.GA21709@cloud.net.au>
Message-ID: <Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
	<20080424074526.GA21709@cloud.net.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Oh I'm glad to hear that this patch is needful. In fact I did
not drop it. We did some more investigations about integration subpage
 read in background. We tried to remove some drawback caused by
invalidation of prestored page in do_read_ops function. (We have found
that on large read requests nand subpage read causes ~10% of read performance degradation. I
wanted to remove but changes made code ugly and saved only 5%)

Also we investigated possibility to make more universal solution which includes both sub-page 
read and partial page write. As it was discussed in December. In fact the partial page write did not
give any benefits at all as file system operates write_size. If we reduce writesize JFFS2 will write data by 
small chunks only and it will cause strong performance degradation. (it
brings more cons than pros until serious hacks in JFFS2 will be
implemented)

> On Thu, Apr 24, 2008 at 09:34:36AM +0300, Artem Bityutskiy wrote:
> > On Thu, 2007-12-13 at 18:15 +0000, Alexey Korolev wrote:
> > > Hi 
> > > 
> > > Here is a patch providing partial page read functionality for NAND
> > > devices. 
> > > 
> > > In many cases it gives performacne boost. I've added this feature
> > > enabling under chip->options flag. 
> > > Setting NAND_PART_READ option in board driver will enable this feature.
> > 
> > Hamish, this stuff should certainly help you. You could give it a try.
> > Unfortunately Alexey gave up almost straight away and did not try to
> > push his work harder.The arguments against the patch were weak, and
> > addressable. This work needs some more efforts and it may get merged.
> > Moreover, Alexey came with impressive numbers, and it is difficult to
> > argue against. Would you give it a try? If it gives performance benefits
> > for you, I think we could raise this again.
> > 
> > Look here for the full story: 
> > http://lists.infradead.org/pipermail/linux-mtd/2007-December/020105.html
> 
> I reviewed the discussion. 
> 
> Firstly it was suggested to talk about sub-page reads rather than
> partial reads. I don't think this is quite correct. Unlike writes, the
> chip does not care which part of the page you read - you can skip to any
> column address within the page. In nand_base it is in 256-byte
> increments because that is the software-ECC step size.
> 
Agree about it.
> The rest of the discussion was about improved use of sub-page writes.
> I'm sure that would be useful but it's not strictly relevant to the
> partial read patch.
> 
> Also Alexey said:
> > Setting NAND_PART_READ option in board driver will enable this
> > feature.
> 
> which is not true, as nand_base.c masks out chip-options (like this)
> inherited from the board driver. It must be set for the chip in
> nand_ids.c instead.
It works fine,  you need to setup this option after nand_scan. 
Using it in NAND_IDS is bad idea because some people may want disable it you can indirectly identify if chip
supports subpage read from NAND capabilities records.y 
> 
> Artem, were you able to try the patch on the OLPC with hardware ECC, as
> you hinted in the original discussion?
> 
> Also I reverted your recent patch to combine the EC + VID header reads
> in the UBI scan for this test. I think with partial reads it may make 
> things slower, because it will force 2K to be read (or 576 bytes if the 
> ALIGN() is removed, still more than 64 + 64). Because min_io_size = 2K
> is not really accurate I guess.

So if there is an interest in subpage read let resume the topic. In next couple days I
will send updated patch with subpage read functionality. 

Thanks,
Alexey
