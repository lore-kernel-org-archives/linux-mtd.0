Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awDuK-0003JM-Q5
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 19:16:57 +0000
Date: Fri, 29 Apr 2016 21:16:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kyle Roeschley <kyle.roeschley@ni.com>
Cc: <richard@nod.at>, <nathan.sullivan@ni.com>, <xander.huff@ni.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, <beanhuo@micron.com>,
 Peter Pan <peterpansjtu@gmail.com>
Subject: Re: [PATCH v3] mtd: nand_bbt: scan for next free bbt block if
 writing bbt fails
Message-ID: <20160429211631.35bf48d2@bbrezillon>
In-Reply-To: <20160429173417.GA18490@senary>
References: <1458945076-18305-1-git-send-email-kyle.roeschley@ni.com>
 <20160330151351.323a5333@bbrezillon>
 <20160330151623.7c1e4241@bbrezillon>
 <20160429173417.GA18490@senary>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Apr 2016 12:34:18 -0500
Kyle Roeschley <kyle.roeschley@ni.com> wrote:

> Hi Boris,
> 
> On Wed, Mar 30, 2016 at 03:16:23PM +0200, Boris Brezillon wrote:
> > +Peter, who's currently reworking the NAND BBT code.
> > 
> > On Wed, 30 Mar 2016 15:13:51 +0200
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >   
> > > Hi Kyle,
> > > 
> > > On Fri, 25 Mar 2016 17:31:16 -0500
> > > Kyle Roeschley <kyle.roeschley@ni.com> wrote:
> > >   
> > > > If erasing or writing the BBT fails, we should mark the current BBT
> > > > block as bad and use the BBT descriptor to scan for the next available
> > > > unused block in the BBT. We should only return a failure if there isn't
> > > > any space left.
> > > > 
> > > > Based on original code implemented by Jeff Westfahl
> > > > <jeff.westfahl@ni.com>.
> > > > 
> > > > Signed-off-by: Kyle Roeschley <kyle.roeschley@ni.com>
> > > > Suggested-by: Jeff Westfahl <jeff.westfahl@ni.com>
> > > > ---
> > > > This v3 is in response to comments from Brian Norris and Bean Ho on 8/26/15:
> > > > http://lists.infradead.org/pipermail/linux-mtd/2015-August/061411.html
> > > > 
> > > > v3: Don't overload mtd->priv
> > > >     Keep nand_erase_nand from erroring on protected BBT blocks
> > > > 
> > > > v2: Mark OOB area in each block as well as BBT
> > > >     Avoid marking read-only, bad address, or known bad blocks as bad
> > > > ---
> > > >  drivers/mtd/nand/nand_base.c |  4 ++--
> > > >  drivers/mtd/nand/nand_bbt.c  | 37 +++++++++++++++++++++++++++++++++++--
> > > >  2 files changed, 37 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > > index b6facac..9ad8a86 100644
> > > > --- a/drivers/mtd/nand/nand_base.c
> > > > +++ b/drivers/mtd/nand/nand_base.c
> > > > @@ -2916,8 +2916,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
> > > >  	/* Select the NAND device */
> > > >  	chip->select_chip(mtd, chipnr);
> > > >  
> > > > -	/* Check, if it is write protected */
> > > > -	if (nand_check_wp(mtd)) {
> > > > +	/* Check if it is write protected, unless we're erasing BBT */
> > > > +	if (nand_check_wp(mtd) && !allowbbt) {  
> > > 
> > > Hm, will this really work. Can a write-protected device accept erase
> > > commands?
> > >   
> 
> Having looked into this more, no. Since v2, we called block_markbad in
> write_bbt incorrectly and caused the chip to report that it was write
> protected. Fixing that makes this unnecessary.
> 
> > > >  		pr_debug("%s: device is write protected!\n",
> > > >  				__func__);
> > > >  		instr->state = MTD_ERASE_FAILED;
> > > > diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> > > > index 2fbb523..01526e5 100644
> > > > --- a/drivers/mtd/nand/nand_bbt.c
> > > > +++ b/drivers/mtd/nand/nand_bbt.c
> > > > @@ -662,6 +662,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
> > > >  			page = td->pages[chip];
> > > >  			goto write;
> > > >  		}
> > > > +	next:  
> > > 
> > > Please put this label at the beginning of the line and fix all the other
> > > issues reported by checkpatch (I know we already have a 'write' label
> > > which does not follow this rule, but let's try to avoid adding new
> > > ones).
> > >   
> 
> Will do.
> 
> > > >  
> > > >  		/*
> > > >  		 * Automatic placement of the bad block table. Search direction
> > > > @@ -787,14 +788,46 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
> > > >  		einfo.addr = to;
> > > >  		einfo.len = 1 << this->bbt_erase_shift;
> > > >  		res = nand_erase_nand(mtd, &einfo, 1);
> > > > -		if (res < 0)
> > > > +		if (res == -EIO) {
> > > > +			/* This block is bad. Mark it as such and see if
> > > > +			 * there's another block available in the BBT area. */
> > > > +			int block = page >>
> > > > +				(this->bbt_erase_shift - this->page_shift);
> > > > +			pr_info("nand_bbt: failed to erase block %d when writing BBT\n",
> > > > +				block);
> > > > +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> > > > +
> > > > +			res = this->block_markbad(mtd, block);  
> > > 
> > > Not sure we should mark the block bad until we managed to write a new
> > > BBT. ITOH, if we do so and the new BBT write is interrupted, it
> > > will trigger a full BBM scan, which should be harmless on most
> > > platforms (except those overwriting BBM with real data :-/)
> > >   
> 
> So is your suggestion here just to swap the order of block_markbad and
> bbt_mark_entry?

No, my suggestion was to move this->block_markbad() call after
scan_write_bbt(), but this leads to another problem: if the BBT content
is still valid after the erasure and you move this->block_markbad(),
you might have a power-cut in the middle and the BBT detection code
will pick the first valid one BBT (i.e. the one you were about to mark
as bad).
Again, this is all hypothetical, and anyway, the current BBT
implementation is not so robust, so maybe we shouldn't care and rely on
full bad block scan in this case (too bad for controllers that did not
take care of keeping valid bad block markers :-/).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
