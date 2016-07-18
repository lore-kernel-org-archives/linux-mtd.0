Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPHAa-0002Pz-NH
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 22:37:49 +0000
Message-ID: <1468881442.25630.8.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Hector Palacios
 <hector.palacios@digi.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 richard@nod.at,  stable@vger.kernel.org, Brian Norris
 <computersforpeace@gmail.com>
Date: Mon, 18 Jul 2016 17:37:22 -0500
In-Reply-To: <20160718110432.003b52ea@bbrezillon>
References: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
 <20160718110432.003b52ea@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mtd: nand: fix bug writing 1 byte less than page size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-07-18 at 11:04 +0200, Boris Brezillon wrote:
> On Mon, 18 Jul 2016 10:39:18 +0200
> Hector Palacios <hector.palacios@digi.com> wrote:
> 
> > 
> > nand_do_write_ops() determines if it is writing a partial page with the
> > formula:
> > 	part_pagewr = (column || writelen < (mtd->writesize - 1))
> > 
> > When 'writelen' is exactly 1 byte less than the NAND page size the formula
> > equates to zero, so the code doesn't process it as a partial write,
> > although it should.
> > As a consequence the function remains in the while(1) loop with 'writelen'
> > becoming 0xffffffff and iterating endlessly.
> > 
> > The bug may not be easy to reproduce in Linux since user space tools
> > usually force the padding or round-up the write size to a page-size
> > multiple.
> > This was discovered in U-Boot where the issue can be reproduced by
> > writing any size that is 1 byte less than a page-size multiple.
> > For example, on a NAND with 2K page (0x800):
> > 	=> nand erase.part <partition>
> > 	=> nand write $loadaddr <partition> 7ff  
> > 
> > Signed-off-by: Hector Palacios <hector.palacios@digi.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, can you take this patch in your tree.
> 
> As usual, I'm unsure whether we should Cc stable or not, but we
> should at least add
> 
> Fixes: 66507c7bc8895 ("mtd: nand: Add support to use nand_base poi databuf
> as bounce buffer")

That commit just moved the bad test; it was introduced in 29072b96078ffde3
("[MTD] NAND: add subpage write support").

-Scott
