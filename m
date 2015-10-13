Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm3wO-0004ZO-QV
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 18:04:49 +0000
Received: by pabrc13 with SMTP id rc13so28018120pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 11:04:28 -0700 (PDT)
Date: Tue, 13 Oct 2015 11:04:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: rnd4@dave-tech.it, linux-mtd@lists.infradead.org, peterpandong@micron.com
Subject: Re: [PATCH 0/2] Use badblockbits-like approach in nand_bbt.c
Message-ID: <20151013180425.GZ107187@google.com>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
 <20151013124620.79a8f055@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151013124620.79a8f055@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Peter Pan

On Tue, Oct 13, 2015 at 12:46:20PM +0200, Boris Brezillon wrote:
> On Fri,  6 Mar 2015 13:12:16 +0100
> rnd4@dave-tech.it wrote:
> 
> > 
> > Hi all,
> > 
> > I'm currenlty working with an MLC NAND (MT29F32G08CBACAWP) on a iMX6 based
> > platform (kernel 3.10.17).
> > The first problem I have is about badblock detection. I experienced a lot of bit
> > flips on badblock marker (some of them probalbly due misuse, e.g. powercut).
> > 
> > By looking into the MDT code, I've found that inside nand_base.c there's support
> > for badblockbits feature, which, for short, allow to tolerate 1 or more bitflip
> > when looking for BB.
> > 
> > In my experience usually the marker is 0x00 for bad blocks and 0xFF for good one
> > (at least this is true for my current component).
> > 
> > Unfortunately this approach is not used into BBT code (nand_bbt.c) and thus I have
> > a lot of false positive BB.
> > 
> > With the following patches I try to add badblockbits-like approach to nand_bbt.c
> > code.
> > 
> > The first patch is optional and configure badblockbits depending on SLC vs MLC NAND.
> > 
> > The second patch implements the badblockbits approach into BBT scan.
> > Please note that this is not usually enough, because many NAND controller override
> > nand_bbt_descr and thus requires changes also the the specific controller driver.
> > 
> > The patch has been made in collaboration with Boris Brezillon (thank you for you
> > suggestions Boris).
> > 
> > I tested it on a 3.10.17 kernel, but the second patch applies fine to
> > v3.10 stable and latest 4.0-rc1 (the first patch needs some changes to apply to this
> > one).
> > 
> > Feel free to comment it and tell me if something can be done in a better way
> 
> We recently discussed the option of retrieving BBM using raw access
> mode, which will likely require something similar to what this series is
> doing.
> I'm still not happy with the selection of ->badblockbits (4 for MLC
> NANDs and 8 otherwise), but maybe that's something we can adjust later.
> 
> What do you think?

This patch set is old and lost in my mailbox, so I'm not looking at the
details. There is also an effort to refactor nand_bbt by Peter [1]. These
should probably be coordinated in some way.

Years ago, I was looking at this problem and considering having nand_bbt
call into the nand_base implementation of checkbad(). Now, it seems like
we should probably keep nand_bbt independent. We could still use a
callback that nand_base can supply to nand_bbt, if desired, but then
that means SPI NAND will have to do the same, if it's going to need
this. I'd like not to have this reimplemented in multiple places, nor do
I want to be configuring badblockbits in too many different places.

Is there a good way to satisfy this? Peter, did you address any of this
sort of stuff in your series, or is there still a scattering of bad
block marker code in both nand_base and nand_bbt?

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-September/062084.html
