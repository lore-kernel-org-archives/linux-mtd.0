Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXEuT-0005uR-9w
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:45:34 +0000
Date: Wed, 2 Sep 2015 22:45:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
Message-ID: <20150902224509.2c1033d5@bbrezillon>
In-Reply-To: <20150902203530.GT81844@google.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
 <1440409642-5495-3-git-send-email-boris.brezillon@free-electrons.com>
 <20150902203530.GT81844@google.com>
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

On Wed, 2 Sep 2015 13:35:30 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Mon, Aug 24, 2015 at 11:47:22AM +0200, Boris Brezillon wrote:
> > The default NAND read functions are relying on an underlying controller
> > to correct bitflips, but some of those controller cannot properly fix
> > bitflips in erased pages.
> > In case of ECC failures, check if the page of subpage is empty before
> > reporting an ECC failure.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> General note: this looks pretty good to me. Are there drivers which we
> should kill erased-page checks from now, given this patch? There are
> several of dubious value that we might drop without consequence. But
> with some, I'd wonder if we might cause a performance slowdown and/or
> high CPU utilization -- particularly those that look like they might
> signal ECC errors on all-0xff pages, even with no bitflips.
> 
> > ---
> >  drivers/mtd/nand/nand_base.c | 62 +++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 55 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 4d2ef65..e095d86 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -1400,6 +1400,19 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
> >  		stat = chip->ecc.correct(mtd, p,
> >  			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
> >  		if (stat < 0) {
> 
> I'm not sure if this is a fault of your patch or of the API design, but
> do we want to do erased-ECC checks on all failures, regardless of type?
> I would have expected maybe we could check only for -EBADMSG, but it
> appears that's not consistent. Apparently all correction failures are
> just "some negative value."
> 
> Anyway, if we had better consistency, I'd suggest:
> 
> 		if (stat == -EBADMSG) {

Yes, that would be preferable to avoid useless empty pattern check. 

> 
> But I suppose that 'stat < 0' is the best we can do for now.

I guess that's something we can easily check (I'll have a look).

> 
> > +			/* check for empty pages with bitflips */
> > +			int col = (int)(p - bufpoi);
> > +
> > +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, col, -1);
> 
> Are all drivers that use this function prepared to handle another RNDOUT
> properly? I know some drivers tend to make assumptions about things that
> nand_base is doing like this. I know that would be a dirty trick, but
> it's not impossible...
> 
> > +			chip->read_buf(mtd, p, chip->ecc.size);
> 
> Also, are you sure we need to re-read here? Technically, drivers are
> supposed to be leaving uncorrected data in their buffers if they can't
> correct it, no?

Normally they should leave the data untouched in this case, but I wasn't
sure all drivers were behaving like this, hence the conservative
approach.
Maybe that's something we can drop, which would also remove the extra
RNDOUT command.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
