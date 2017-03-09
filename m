Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clr9p-0002ZX-58
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 06:02:39 +0000
Date: Thu, 9 Mar 2017 07:02:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>, Arnaud Mouiche
 <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 2/6] nand: spi: add basic operations support
Message-ID: <20170309070213.3eaaa44e@bbrezillon>
In-Reply-To: <CAAyFOR+vSOSGH_XoZt5Tr5h1fetFUvkMFKGo-iG68obP9eNujg@mail.gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-3-git-send-email-peterpandong@micron.com>
 <20170307185740.327ed9d0@bbrezillon>
 <CAAyFOR+vSOSGH_XoZt5Tr5h1fetFUvkMFKGo-iG68obP9eNujg@mail.gmail.com>
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

On Thu, 9 Mar 2017 09:43:36 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> >> +
> >> +/**
> >> + * spinand_do_read_ops - read data from flash to buffer
> >> + * @mtd: MTD device structure
> >> + * @from: offset to read from
> >> + * @ops: oob ops structure
> >> + * Description:
> >> + *   Disable internal ECC before reading when MTD_OPS_RAW set.
> >> + */
> >> +static int spinand_do_read_ops(struct mtd_info *mtd, loff_t from,
> >> +                       struct mtd_oob_ops *ops)
> >> +{
> >> +     struct spinand_device *chip = mtd_to_spinand(mtd);
> >> +     struct nand_device *nand = mtd_to_nand(mtd);
> >> +     int ret;
> >> +     struct mtd_ecc_stats stats;
> >> +     unsigned int max_bitflips = 0;
> >> +     int oobreadlen = ops->ooblen;
> >> +     bool ecc_off = ops->mode == MTD_OPS_RAW;
> >> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
> >> +             mtd->oobavail : mtd->oobsize;
> >> +
> >> +     if (unlikely(from >= mtd->size)) {
> >> +             pr_err("%s: attempt to read beyond end of device\n",
> >> +                             __func__);
> >> +             return -EINVAL;
> >> +     }  
> >
> > Again, we can an helper to check the boundaries in the generic NAND
> > code.  
> 
> Let's keep the code the same and move to generic NAND code later.
> What do you think Boris?

For things we know will be needed and are simple enough to provide, I'd
recommend doing the modifications now. That's a bit different when it
comes to providing a generic ECC engine infrastructure or trying to
move part of the page read/write logic into the generic NAND layer,
because we don't know where we're going yet.

> 
> >  
> >> +     if (oobreadlen > 0) {
> >> +             if (unlikely(ops->ooboffs >= ooblen)) {
> >> +                     pr_err("%s: attempt to start read outside oob\n",
> >> +                                     __func__);
> >> +                     return -EINVAL;
> >> +             }
> >> +             if (unlikely(ops->ooboffs + oobreadlen >
> >> +             (nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, from))
> >> +             * ooblen)) {
> >> +                     pr_err("%s: attempt to read beyond end of device\n",
> >> +                                     __func__);
> >> +                     return -EINVAL;
> >> +             }
> >> +             ooblen -= ops->ooboffs;
> >> +             ops->oobretlen = 0;
> >> +     }
> >> +     stats = mtd->ecc_stats;
> >> +     if (ecc_off)
> >> +             spinand_disable_ecc(chip);
> >> +     ret = spinand_read_pages(mtd, from, ops, &max_bitflips);
> >> +     if (ecc_off)
> >> +             spinand_enable_ecc(chip);
> >> +     if (ret)
> >> +             return ret;
> >> +
> >> +     if (mtd->ecc_stats.failed - stats.failed)
> >> +             return -EBADMSG;
> >> +
> >> +     return max_bitflips;
> >> +}
> >> +  
> >
> > [...]
> >  
> >> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> >> index f3d0351..ee447c1 100644
> >> --- a/include/linux/mtd/spinand.h
> >> +++ b/include/linux/mtd/spinand.h
> >> @@ -135,6 +135,8 @@ struct spinand_manufacturer_ops {
> >>       bool(*detect)(struct spinand_device *chip);
> >>       int (*init)(struct spinand_device *chip);
> >>       void (*cleanup)(struct spinand_device *chip);
> >> +     void (*build_column_addr)(struct spinand_device *chip,
> >> +                               struct spinand_op *op, u32 page, u32 column);  
> >
> > Okay, I think Arnaud was right, maybe we should have vendor specific
> > ops for basic operations like ->prepare_read/write_op(), instead of
> > having these ->get_dummy() and ->build_column_addr() hooks.
> > Or maybe just a ->prepare_op() hook that can prepare things for any
> > basic operation (read, write, ...).  
> 
> I prefer ->prepare_read_op() and ->prepare_write_op. Fix this in v3

I'd like to have Arnaud's feedback on this. Can you wait a bit before
sending a new version?
