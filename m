Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPb85-000675-F5
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 19:56:34 +0000
Received: by mail-pf0-x22a.google.com with SMTP id x72so10410020pfd.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 12:56:12 -0700 (PDT)
Date: Tue, 19 Jul 2016 12:56:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <oss@buserror.net>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Hector Palacios <hector.palacios@digi.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 richard@nod.at, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fix bug writing 1 byte less than page size
Message-ID: <20160719195610.GL76613@google.com>
References: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
 <20160718110432.003b52ea@bbrezillon>
 <1468881442.25630.8.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1468881442.25630.8.camel@buserror.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 18, 2016 at 05:37:22PM -0500, Scott Wood wrote:
> On Mon, 2016-07-18 at 11:04 +0200, Boris Brezillon wrote:
> > On Mon, 18 Jul 2016 10:39:18 +0200
> > Hector Palacios <hector.palacios@digi.com> wrote:
> > 
> > > 
> > > nand_do_write_ops() determines if it is writing a partial page with the
> > > formula:
> > > 	part_pagewr = (column || writelen < (mtd->writesize - 1))
> > > 
> > > When 'writelen' is exactly 1 byte less than the NAND page size the formula
> > > equates to zero, so the code doesn't process it as a partial write,
> > > although it should.
> > > As a consequence the function remains in the while(1) loop with 'writelen'
> > > becoming 0xffffffff and iterating endlessly.
> > > 
> > > The bug may not be easy to reproduce in Linux since user space tools
> > > usually force the padding or round-up the write size to a page-size
> > > multiple.
> > > This was discovered in U-Boot where the issue can be reproduced by
> > > writing any size that is 1 byte less than a page-size multiple.
> > > For example, on a NAND with 2K page (0x800):
> > > 	=> nand erase.part <partition>
> > > 	=> nand write $loadaddr <partition> 7ff  
> > > 
> > > Signed-off-by: Hector Palacios <hector.palacios@digi.com>
> > Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > Brian, can you take this patch in your tree.
> > 
> > As usual, I'm unsure whether we should Cc stable or not, but we
> > should at least add
> > 
> > Fixes: 66507c7bc8895 ("mtd: nand: Add support to use nand_base poi databuf
> > as bounce buffer")
> 
> That commit just moved the bad test; it was introduced in 29072b96078ffde3
> ("[MTD] NAND: add subpage write support").

Indeed. I've update the Fixes tag and added an additional comment in the
commit message.

Thanks,
Brian
