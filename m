Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clrJT-0006M7-0E
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 06:12:37 +0000
Date: Thu, 9 Mar 2017 07:12:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 4/6] nand: spi: Add BBT support
Message-ID: <20170309071212.00ea1687@bbrezillon>
In-Reply-To: <CAAyFORJUevwLgDq5K1QG42cidKV+2ZisH03WeGAJ0=_OJwCQOQ@mail.gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-5-git-send-email-peterpandong@micron.com>
 <20170308093135.2fa02e72@bbrezillon>
 <CAAyFORJUevwLgDq5K1QG42cidKV+2ZisH03WeGAJ0=_OJwCQOQ@mail.gmail.com>
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

On Thu, 9 Mar 2017 09:58:51 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Hi Boris,
> 
> On Wed, Mar 8, 2017 at 4:31 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Wed, 1 Mar 2017 16:52:08 +0800
> > Peter Pan <peterpandong@micron.com> wrote:
> >  
> >>  /**
> >> - * spinand_erase - [MTD Interface] erase block(s)
> >> + * __spinand_erase - erase block(s)
> >>   * @mtd: MTD device structure
> >>   * @einfo: erase instruction
> >> + * @allowbbt: allow to access bbt
> >>   *
> >>   * Erase one ore more blocks
> >>   */
> >> -static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
> >> +static int __spinand_erase(struct mtd_info *mtd, struct erase_info *einfo,
> >> +                     int allowbbt)  
> >
> > Please no __ prefixes. Not sure you need the wrappers you define below
> > BTW.  
> 
> mtd->_erase needs a function to treat BBT block as bad block while
> nand_ops->erase not. What's your suggestion if we don't use the wrappers?

Oh, I forgot about that. Then keep the wrapper, but find a better name
for this function.

> 
> >  
> >>  {
> >>       struct spinand_device *chip = mtd_to_spinand(mtd);
> >>       struct nand_device *nand = mtd_to_nand(mtd);
> >> @@ -1152,7 +1185,7 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
> >>
> >>       while (len) {
> >>               /* Check if we have a bad block, we do not erase bad blocks! */
> >> -             if (spinand_block_bad(mtd, offs, 0)) {
> >> +             if (spinand_block_checkbad(mtd, offs, 0, allowbbt)) {
> >>                       pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
> >>                       __func__, offs);
> >>                       einfo->state = MTD_ERASE_FAILED;
> >> @@ -1193,6 +1226,55 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
> >>       /* Return more or less happy */
> >>       return ret;
> >>  }
> >> +
> >> +/**
> >> + * spinand_erase - [MTD Interface] erase block(s)
> >> + * @mtd: MTD device structure
> >> + * @einfo: erase instruction
> >> + *
> >> + * Erase one ore more blocks
> >> + */
> >> +static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)

Or maybe you can rename this function spinand_erase_skip_bbt(), and
keep spinand_erase() for the generic one.

> >> +{
> >> +     return __spinand_erase(mtd, einfo, 0);
> >> +}
> >> +
> >> +

Remove this extra empty line.

> >> +static int spinand_erase_bbt(struct nand_device *nand, struct erase_info *einfo)
> >> +{
> >> +     return __spinand_erase(nand_to_mtd(nand), einfo, 1);
> >> +}
> >> +  
> >
