Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPCBc-00060s-20
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 17:18:32 +0000
Received: by mail-pf0-x244.google.com with SMTP id i6so11970184pfe.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 10:18:11 -0700 (PDT)
Date: Mon, 18 Jul 2016 10:18:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Hector Palacios <hector.palacios@digi.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 richard@nod.at, oss@buserror.net, stable@vger.kernel.org,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix bug writing 1 byte less than page size
Message-ID: <20160718171808.GJ76613@google.com>
References: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
 <20160718110432.003b52ea@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160718110432.003b52ea@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Kamal, FYI

On Mon, Jul 18, 2016 at 11:04:32AM +0200, Boris Brezillon wrote:
> On Mon, 18 Jul 2016 10:39:18 +0200
> Hector Palacios <hector.palacios@digi.com> wrote:
> 
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
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, can you take this patch in your tree.
> 
> As usual, I'm unsure whether we should Cc stable or not, but we
> should at least add
> 
> Fixes: 66507c7bc8895 ("mtd: nand: Add support to use nand_base poi databuf as bounce buffer")

Applied to l2-mtd.git with Fixes and stable tags. Thanks!

> > ---
> >  drivers/mtd/nand/nand_base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 0b0dc29d2af7..77533f7f2429 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2610,7 +2610,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
> >  		int cached = writelen > bytes && page != blockmask;
> >  		uint8_t *wbuf = buf;
> >  		int use_bufpoi;
> > -		int part_pagewr = (column || writelen < (mtd->writesize - 1));
> > +		int part_pagewr = (column || writelen < mtd->writesize);
> >  
> >  		if (part_pagewr)
> >  			use_bufpoi = 1;
> 
