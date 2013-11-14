Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vh28D-0001Gc-HQ
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 18:59:11 +0000
Date: Thu, 14 Nov 2013 15:58:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/1] Bad block markers here, there and everywhere
Message-ID: <20131114185845.GB9912@localhost>
References: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131105180743.GM20061@ld-irv-0074.broadcom.com>
 <20131105230126.GB11759@localhost>
 <20131105231522.GC11759@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131105231522.GC11759@localhost>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 08:15:22PM -0300, Ezequiel Garcia wrote:
> On Tue, Nov 05, 2013 at 08:01:26PM -0300, Ezequiel Garcia wrote:
> > On Tue, Nov 05, 2013 at 10:07:43AM -0800, Brian Norris wrote:
> > > On Tue, Nov 05, 2013 at 09:00:20AM -0300, Ezequiel Garcia wrote:
> > > > This commit adds a new option called NAND_BBT_DATA_BBM. The change itself
> > > > is pretty small and simple to understand: when the badblock_pattern sets the
> > > > NAND_BBT_DATA_BBM option, scan_block_fast() reads the data region instead
> > > > of the OOB region.
> > > 
> > > I think this type of scanning method is better suited to a different
> > > type of solution: implement a custom nand_chip.bad_block() call-back.
> > 
> > Fully agreed (I guess you mean block_bad() right?)
> > 
> > > Unfortunately, nand_base/nand_bbt are kind of inconsistent, so that some
> > > code paths use nand_chip.bad_block() and some use nand_bbt.c's scanning
> > > code to check for bad block markers, so this is not currently a good
> > > solution.
> > > 
> > 
> > Which is why I couldn't implement a custom block_bad(). My particular
> > use case (which could match others) needs this customization in the
> > first scan. After that, once the bad block table is built, the in-flash
> > bad block markers are never touched.
> > 
> > > I've been meaning to follow through with an improved version of this
> > > patch for a while:
> > > 
> > >   http://lists.infradead.org/pipermail/linux-mtd/2012-June/042571.html
> > > 
> > > Such a patch provides several benefits, one of them being that drivers
> > > like yours can easily provide a custom BBM location. What do you think?
> > > 
> > 
> > Of course, that sounds much more flexible. Let me pick it where Matthieu left,
> > I'll read the patch and prepare something to discuss.
> > 
> > On the other side, I'm seeing the above patch was a bit argued :/ I'm
> > not sure why it got never merged, maybe you can give me some heads up
> > about potential drawbacks?
> 
> After reading the patch and reading the code, now I'm even more confused :)
> 
> The first thing that seems odd is the fact that the scan_block_fast()
> path matches a pattern (which can be several bytes long), whereas the
> default nand_block_bad() seem to check for just one byte.
> 
> This may or may not be an issue, after some thought, but it's not
> a trivial change, IMHO.
> 
> The second thing, which was already discussed back in June-2012 is the
> fact that scan_block_fast() uses mtd_read_oob() to read, but
> nand_block_bad() just issues a READOOB command.
> 
> So, what do you propose? If you can give me some guidelines I've no problem
> in preparing a (first/draft) patch to trigger the discussion.

Ping?

This is an important issue for the pxa3xx driver and I'd like to move
forward with it.

However, as I previously said I'd like to discuss some more about your
proposal: currently scan_block_fast() uses mtd_read_oob() to read, and
nand_block_bad() issues a READOOB command, so it's not trivial to
replace the former with the latter.

Ideas?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
