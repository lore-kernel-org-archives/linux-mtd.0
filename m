Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b89pX-0002e0-U6
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 17:21:20 +0000
Date: Wed, 1 Jun 2016 19:20:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org, Brian
 Norris <computersforpeace@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
Message-ID: <20160601192057.50cc79d7@bbrezillon>
In-Reply-To: <CAKekbevuxMUsuKRuJE0cqNK_zAgG=64YOE6-OEYgY-neY7Ds1w@mail.gmail.com>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
 <20160530105005.62faa711@bbrezillon>
 <CAKekbevuxMUsuKRuJE0cqNK_zAgG=64YOE6-OEYgY-neY7Ds1w@mail.gmail.com>
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

On Wed, 1 Jun 2016 12:50:56 -0400
Kamal Dasu <kamal.dasu@broadcom.com> wrote:

> Boris,
> 
> On Mon, May 30, 2016 at 4:50 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Fri, 29 Apr 2016 16:21:25 -0400
> > Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >  
> >> This change provides a fix for controller bug where nand
> >> controller could have a possible sticky error after a PIO
> >> followed by a DMA read. The fix retries a read if we see
> >> a uncorr_ecc after read to detect such sticky errors.
> >>
> >> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> >> ---
> >>  drivers/mtd/nand/brcmnand/brcmnand.c | 15 ++++++++++++++-
> >>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> >> index 29a9abd..13c7784 100644
> >> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> >> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> >> @@ -1555,9 +1555,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
> >>       struct brcmnand_controller *ctrl = host->ctrl;
> >>       u64 err_addr = 0;
> >>       int err;
> >> +     bool retry = true;
> >>
> >>       dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
> >>
> >> +try_dmaread:
> >>       brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
> >>
> >>       if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> >> @@ -1579,7 +1581,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
> >>
> >>       if (mtd_is_eccerr(err)) {
> >>               int ret;
> >> -
> >> +             /*
> >> +              * On controller version >=7.0 if we are doing a DMA read
> >> +              * after a prior PIO read that reported uncorrectable error,
> >> +              * the DMA engine captures this error following DMA read
> >> +              * cleared only on subsequent DMA read, so just retry once
> >> +              * to clear a possible false error reported for current DMA
> >> +              * read
> >> +              */  
> >
> > Hm, shouldn't this BRCMNAND_UNCORR_COUNT bit be cleared just after
> > doing the PIO/DMA read instead of doing it before executing a new read?
> > This would solve your problem without the need for this extra retry, or
> > am I missing something?
> >  
> 
> Clearing the count registers or the intr registers does not clear the
> condition. Only a clean read (a page that does not have errors) clears
> the condition. So if this was a false error  ( page is really clean)
> and we read again, it will clear the condition.

This sounds like an expensive workaround, but you know the IP better
than I do, so I'll trust you ;).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
