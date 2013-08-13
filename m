Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V92oF-0001tI-W4
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 00:50:05 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc17so7327678pbc.32
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 17:49:42 -0700 (PDT)
Date: Mon, 12 Aug 2013 17:49:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
Message-ID: <20130813004938.GD7267@brian-ubuntu>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 07:22:38AM +0000, Gupta, Pekon wrote:
> > The current code does not set the SLC/MLC information for onfi nand.
> > (This makes that the kernel treats all the onfi nand as SLC nand.)
> > 
> > This patch fills the chip->cellinfo when the onfi nand is a MLC(or TLC) nand
> > (p->bits_per_cell > 1).
> > 
> > The macro NAND_CI_CELLTYPE_SHIFT is added to avoid the hardcode.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/nand/nand_base.c |    3 +++
> >  include/linux/mtd/nand.h     |    1 +
> >  2 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index ff605c8..ee1aa52 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2988,6 +2988,9 @@ static int nand_flash_detect_onfi(struct mtd_info
> > *mtd, struct nand_chip *chip,
> >  	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
> >  	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
> > 
> > +	/* @bits_per_cell equals 1 means this is a SLC nand. */
> > +	chip->cellinfo = (p->bits_per_cell - 1) << NAND_CI_CELLTYPE_SHIFT;
> > +
> [Pekon]: For future scalability, good to update only MLC related bit-fields
> So ORing instead of assigning..
> chip->cellinfo |= (p->bits_per_cell - 1) << NAND_CI_CELLTYPE_SHIFT;

I was thinking of an alternate approach: since nand_chip.cellinfo is
only used for checking SLC vs. MLC (and it is admittedly bad at that,
currently), we should modify it so that is a reliable source of *only* 1
piece of information -- the number of bits per cell. Currently, it
contains unused (and potentially unmaintainable) information for some
chips about number of simultaneously-programmed pages, write caching,
internal chip numbering, etc.

So personally, I would rename cellinfo to bits_per_cell and make sure
it is set properly. That is, for the legacy chips, make sure we
initialize it 1 (SLC); for extended-ID chips, make sure the third ID
byte has the correct info (you can refer to [1]) and set it with
something like this:

  chip->bits_per_cell = id_data[2] & NAND_CI_CELLTYPE_MSK
  chip->bits_per_cell >>= NAND_CI_CELLTYPE_SHIFT;
  chip->bits_per_cell += 1;

for chips listed by full-ID, add an appropriate flag/field; and for ONFI
chips, just use p->bits_per_cell.

If you really need the other cellinfo fields in the future, we can add
more fields to nand_chip.

> 
> >  	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
> >  		*busw = NAND_BUSWIDTH_16;
> >  	else

Thanks,
Brian

[1] An incomplete NAND ID table:

  http://www.linux-mtd.infradead.org/nand-data/nanddata.html
