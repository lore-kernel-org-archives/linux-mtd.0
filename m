Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jow97-0001Ls-F7
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 07:45:33 +0000
Date: Thu, 24 Apr 2008 17:45:26 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
Message-ID: <20080424074526.GA21709@cloud.net.au>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1209018876.11721.100.camel@sauron>
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 24, 2008 at 09:34:36AM +0300, Artem Bityutskiy wrote:
> On Thu, 2007-12-13 at 18:15 +0000, Alexey Korolev wrote:
> > Hi 
> > 
> > Here is a patch providing partial page read functionality for NAND
> > devices. 
> > 
> > In many cases it gives performacne boost. I've added this feature
> > enabling under chip->options flag. 
> > Setting NAND_PART_READ option in board driver will enable this feature.
> 
> Hamish, this stuff should certainly help you. You could give it a try.
> Unfortunately Alexey gave up almost straight away and did not try to
> push his work harder.The arguments against the patch were weak, and
> addressable. This work needs some more efforts and it may get merged.
> Moreover, Alexey came with impressive numbers, and it is difficult to
> argue against. Would you give it a try? If it gives performance benefits
> for you, I think we could raise this again.
> 
> Look here for the full story: 
> http://lists.infradead.org/pipermail/linux-mtd/2007-December/020105.html

I reviewed the discussion. 

Firstly it was suggested to talk about sub-page reads rather than
partial reads. I don't think this is quite correct. Unlike writes, the
chip does not care which part of the page you read - you can skip to any
column address within the page. In nand_base it is in 256-byte
increments because that is the software-ECC step size.

The rest of the discussion was about improved use of sub-page writes.
I'm sure that would be useful but it's not strictly relevant to the
partial read patch.

Also Alexey said:
> Setting NAND_PART_READ option in board driver will enable this
> feature.

which is not true, as nand_base.c masks out chip-options (like this)
inherited from the board driver. It must be set for the chip in
nand_ids.c instead.

Artem, were you able to try the patch on the OLPC with hardware ECC, as
you hinted in the original discussion?

Also I reverted your recent patch to combine the EC + VID header reads
in the UBI scan for this test. I think with partial reads it may make 
things slower, because it will force 2K to be read (or 576 bytes if the 
ALIGN() is removed, still more than 64 + 64). Because min_io_size = 2K
is not really accurate I guess.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
