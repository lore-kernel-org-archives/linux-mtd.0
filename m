Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elAVI-0001TR-5m
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 09:34:29 +0000
Date: Mon, 12 Feb 2018 10:34:06 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: warn if hamming layout is used with too
 large ECC
Message-ID: <20180212103406.34f0dae4@bbrezillon>
In-Reply-To: <475d5f62d1cc95e38da0c7dc2e37a511@agner.ch>
References: <20180208233305.20583-1-stefan@agner.ch>
 <20180209095027.63da257d@bbrezillon>
 <7ec8aa6337c59550f335957a34658a65@agner.ch>
 <20180209105852.21c5a400@bbrezillon>
 <475d5f62d1cc95e38da0c7dc2e37a511@agner.ch>
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

On Fri, 09 Feb 2018 12:55:49 +0100
Stefan Agner <stefan@agner.ch> wrote:

> On 09.02.2018 10:58, Boris Brezillon wrote:
> > On Fri, 09 Feb 2018 10:20:37 +0100
> > Stefan Agner <stefan@agner.ch> wrote:
> >   
> >>
> >> But some kind of sanity check somewhere might be worthwhile, I was a bit
> >> surprised that this overflowing happens on a driver in operational use
> >> and goes unnoticed. I realize that this patch is not ideal. Maybe making
> >> length signed, then we could sanity check in
> >> mtd_ooblayout_count_bytes...  
> > 
> > Something like that should help us detect this unexpected case:
> >   
> 
> It is less generic than making length signed and checking for positive
> length, but fine for me.

It's just easier for callers if they only have to check the return
code instead of having to check both the return code and the oobregion
fields.

Would you mind modifying your patch accordingly and sending a v2?

Thanks,

Boris

> 
> --
> Stefan
> 
> > --->8---  
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 66b67014508f..ada2e709743f 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -201,6 +201,9 @@ static int nand_ooblayout_free_lp_hamming(struct
> > mtd_info *mtd, int section, oobregion->offset = 2;
> >                 oobregion->length = ecc_offset - 2;
> >         } else {
> > +               if (ecc_offset + ecc->total > mtd->oobsize)
> > +                       return -EINVAL;
> > +
> >                 oobregion->offset = ecc_offset + ecc->total;
> >                 oobregion->length = mtd->oobsize - oobregion->offset;
> >         }  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
