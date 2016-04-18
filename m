Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as3rn-0004vq-Au
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 07:45:08 +0000
Date: Mon, 18 Apr 2016 09:44:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, karlzhang@micron.com, beanhuo@micron.com,
 Jiancheng Xue <xuejiancheng@huawei.com>, Peter Pan
 <peterpandong@micron.com>
Subject: Re: [PATCH 02/11] mtd: nand_bbt: introduce BBT related data structure
Message-ID: <20160418094444.152042ee@bbrezillon>
In-Reply-To: <CAAyFORKJzXTSgXvHgNe=AtExs8_9sVNEYMRefYLXDqG7-u-yRg@mail.gmail.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-3-git-send-email-peterpandong@micron.com>
 <20160325093519.34c3f7fa@bbrezillon>
 <CAAyFORKJzXTSgXvHgNe=AtExs8_9sVNEYMRefYLXDqG7-u-yRg@mail.gmail.com>
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

Hi Peter,

On Mon, 18 Apr 2016 14:22:09 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Hi  Boris,
> 
> On Fri, Mar 25, 2016 at 4:35 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Peter,
> >
> > On Mon, 14 Mar 2016 02:47:55 +0000
> > Peter Pan <peterpansjtu@gmail.com> wrote:
> >
> >> From: Brian Norris <computersforpeace@gmail.com>
> >>
> >> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> >> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> >> onenand has own bbt(onenand_bbt.c).
> >>
> >> Separate struct nand_chip from BBT code can make current BBT shareable.
> >> We create struct nand_bbt to take place of nand_chip in nand_bbt.c
> >>
> >> Below is mtd folder structure we want:
> >>       drivers/mtd/nand/<all-nand-core-code>
> >>       drivers/mtd/nand/raw/<raw-nand-controller-drivers>
> >>       drivers/mtd/nand/spi/<spi-nand-code>
> >>       drivers/mtd/nand/onenand/<onenand-code>
> >>       drivers/mtd/nand/chips/<manufacturer-spcific-code>
> >>
> >> Of course, nand_bbt.c should be part of <all-nand-core-code>.
> >>
> >> We put every chip layout related information BBT needed into struct
> >> nand_chip_layout_info.
> >>       @numchips:      number of physical chips, required for NAND_BBT_PERCHIP
> >>       @chipsize:      the size of one chip for multichip arrays
> >>       @chip_shift:    number of address bits in one chip
> >>       @bbt_erase_shift:       number of address bits in a bbt entry
> >>       @page_shift:    number of address bits in a page
> >>
> >> We defined a struct nand_bbt_ops for BBT ops. Struct
> >>       @is_bad_bbm:    check if a block is factory bad block
> >>       @erase: erase block bypassing resvered checks
> >>
> >> Struct nand_bbt includes all BBT information:
> >>       @mtd:   pointer to MTD device structure
> >>       @bbt_options:   bad block specific options. All options used
> >>                       here must come from nand_bbt.h.
> >>       @bbt_ops:       struct nand_bbt_ops pointer.
> >>       @info:          struct nand_chip_layout_info pointer.
> >>       @bbt_td:        bad block table descriptor for flash lookup.
> >>       @bbt_md:        bad block table mirror descriptor
> >>       @bbt:           bad block table pointer
> >>
> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >> [Peter: 1. correct comment style
> >>       2. introduce struct nand_bbt_ops and nand_chip_layout_info]
> >> Signed-off-by: Peter Pan <peterpandong@micron.com>
> >> ---
> >>  include/linux/mtd/nand_bbt.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 67 insertions(+)
> >>
> >> diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
> >> index 5a65230..cfb22c8 100644
> >> --- a/include/linux/mtd/nand_bbt.h
> >> +++ b/include/linux/mtd/nand_bbt.h
> >> @@ -18,6 +18,8 @@
> >>  #ifndef __LINUX_MTD_NAND_BBT_H
> >>  #define __LINUX_MTD_NAND_BBT_H
> >>
> >> +struct mtd_info;
> >> +
> >>  /* The maximum number of NAND chips in an array */
> >>  #define NAND_MAX_CHIPS               8
> >>
> >> @@ -115,4 +117,69 @@ struct nand_bbt_descr {
> >>  /* The maximum number of blocks to scan for a bbt */
> >>  #define NAND_BBT_SCAN_MAXBLOCKS      4
> >>
> >> +struct nand_bbt;
> >> +
> >> +/**
> >> + * struct nand_bbt_ops - bad block table operations
> >> + * @is_bad_bbm:      check if a block is factory bad block
> >> + * @erase:   erase block bypassing resvered checks
> >> + */
> >> +struct nand_bbt_ops {
> >> +     /*
> >> +      * This is important to abstract out of nand_bbt.c and provide
> >> +      * separately in nand_base.c and spi-nand-base.c -- it's sort of
> >> +      * duplicated in nand_block_bad() (nand_base) and
> >> +      * scan_block_fast() (nand_bbt) right now
> >> +      *
> >> +      * Note that this also means nand_chip.badblock_pattern should
> >> +      * be removed from nand_bbt.c
> >> +      */
> >> +     int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
> >> +
> >> +     /* Erase a block, bypassing reserved checks */
> >> +     int (*erase)(struct mtd_info *mtd, loff_t ofs);
> >> +};
> >> +
> >> +/**
> >> + * struct nand_chip_layout_info - strucure contains all chip layout
> >> + * information that BBT needed.
> >> + * @numchips:        number of physical chips, required for NAND_BBT_PERCHIP
> >> + * @chipsize:        the size of one chip for multichip arrays
> >> + * @chip_shift:      number of address bits in one chip
> >> + * @bbt_erase_shift: number of address bits in a bbt entry
> >> + * @page_shift:      number of address bits in a page
> >> + */
> >> +struct nand_chip_layout_info {
> >
> > I know I'm the one who suggested this name, but NAND datasheet seems to
> > call it "memory organization", so maybe we should rename this struct
> > nand_memory_organization.
> >
> >> +     int numchips;
> >
> > I would rename it numdies, or ndies. numchips implies you're having
> > several chips, which is not the case.
> 
> In struct nand_chip and nand_base.c, numchips stands for the number of
> physical nand chips not number of dies(LUNs), am I right?

I don't know what was the initial meaning for ->numchips, but last time
we discussed that with Brian, he seemed to agree that this should now
encode the number of dies in a physical chip, and each physical chip
should have its own nand_chip instance. That's why I suggested to
rename this field nand_chip_layout_info. 

> So it's true, it
> should still be numchips in nand_bbt.c?  I just came out this question when
> making v4. :)

BTW, I have something for you [1]. I started to move things around to
allow spinand and onenand layers to lie under drivers/mtd/nand/, and I
wonder if we shouldn't do this move before reworking the nand_bbt code
to make it generic.
Note that this rework is not finished yet, but it gives a rough idea of
what I'd like to see.

Best Regards,

Boris

[1]https://github.com/bbrezillon/linux-sunxi/commits/nand/generic

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
