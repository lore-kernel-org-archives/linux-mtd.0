Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bMV22-0006so-Pa
 for linux-mtd@lists.infradead.org; Mon, 11 Jul 2016 06:49:31 +0000
Date: Mon, 11 Jul 2016 08:49:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [V3, 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
Message-ID: <20160711084906.13cac84e@bbrezillon>
In-Reply-To: <20160711050452.GA12083@localhost>
References: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
 <1465507075-9447-2-git-send-email-kdasu.kdev@gmail.com>
 <20160711050452.GA12083@localhost>
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

On Sun, 10 Jul 2016 22:04:52 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
> 
> Looking through Boris's pull request, I noticed an issue:
> 
> On Thu, Jun 09, 2016 at 05:17:55PM -0400, Kamal Dasu wrote:
> > This change provides a fix for controller bug where nand
> > controller could have a possible sticky error after a PIO
> > followed by a DMA read. The fix retries a read if we see
> > a uncorr_ecc after read to detect such sticky errors.
> > The fix applies to only controller version 7.0 and 7.1.
> > 
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > ---
> > V3 changes 
> >  none
> > V2 Changes 
> >  Restrict controller bug workaround to version 7.0 and 7.1
> > ---
> >  drivers/mtd/nand/brcmnand/brcmnand.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 7ee9617..1156495 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -1602,9 +1602,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
> >  	struct brcmnand_controller *ctrl = host->ctrl;
> >  	u64 err_addr = 0;
> >  	int err;
> > +	static bool retry = true;  
> 
> Is this intentionally static? That means your retry will only be
> performed exactly once *ever*. Probably not what you expected?
> 
> Boris, if this is indeed unintended, would you rather fix this up in the
> original patch and send me a new pull request?

I'll fix the initial commit and send a new PR once Kamal has confirmed
this variable should not be static (which is also my opinion).

> Or have my apply the
> trivial fixup (i.e., s/static//) as a separate patch on top?

Thanks,

Boris
