Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akSFT-0001Hj-Ds
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 08:10:08 +0000
Received: by mail-lb0-x244.google.com with SMTP id oa3so8986855lbb.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 01:09:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160325093519.34c3f7fa@bbrezillon>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-3-git-send-email-peterpandong@micron.com>
 <20160325093519.34c3f7fa@bbrezillon>
Date: Mon, 28 Mar 2016 16:09:44 +0800
Message-ID: <CAAyFORK68Ur6ST_HbfCEXO5bM1x80szsCQeVDq_YbRNT8nuyvQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] mtd: nand_bbt: introduce BBT related data structure
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Firstly, thanks a lot for taking time to review my patches.

On Fri, Mar 25, 2016 at 4:35 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Peter,
>
> On Mon, 14 Mar 2016 02:47:55 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> From: Brian Norris <computersforpeace@gmail.com>
>>
>> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
>> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
>> onenand has own bbt(onenand_bbt.c).
>>
>> Separate struct nand_chip from BBT code can make current BBT shareable.
>> We create struct nand_bbt to take place of nand_chip in nand_bbt.c
>>
>> Below is mtd folder structure we want:
>>       drivers/mtd/nand/<all-nand-core-code>
>>       drivers/mtd/nand/raw/<raw-nand-controller-drivers>
>>       drivers/mtd/nand/spi/<spi-nand-code>
>>       drivers/mtd/nand/onenand/<onenand-code>
>>       drivers/mtd/nand/chips/<manufacturer-spcific-code>
>>
>> Of course, nand_bbt.c should be part of <all-nand-core-code>.
>>
>> We put every chip layout related information BBT needed into struct
>> nand_chip_layout_info.
>>       @numchips:      number of physical chips, required for NAND_BBT_PERCHIP
>>       @chipsize:      the size of one chip for multichip arrays
>>       @chip_shift:    number of address bits in one chip
>>       @bbt_erase_shift:       number of address bits in a bbt entry
>>       @page_shift:    number of address bits in a page
>>
>> We defined a struct nand_bbt_ops for BBT ops. Struct
>>       @is_bad_bbm:    check if a block is factory bad block
>>       @erase: erase block bypassing resvered checks
>>
>> Struct nand_bbt includes all BBT information:
>>       @mtd:   pointer to MTD device structure
>>       @bbt_options:   bad block specific options. All options used
>>                       here must come from nand_bbt.h.
>>       @bbt_ops:       struct nand_bbt_ops pointer.
>>       @info:          struct nand_chip_layout_info pointer.
>>       @bbt_td:        bad block table descriptor for flash lookup.
>>       @bbt_md:        bad block table mirror descriptor
>>       @bbt:           bad block table pointer
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> [Peter: 1. correct comment style
>>       2. introduce struct nand_bbt_ops and nand_chip_layout_info]
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/nand_bbt.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
>> index 5a65230..cfb22c8 100644
>> --- a/include/linux/mtd/nand_bbt.h
>> +++ b/include/linux/mtd/nand_bbt.h
>> @@ -18,6 +18,8 @@
>>  #ifndef __LINUX_MTD_NAND_BBT_H
>>  #define __LINUX_MTD_NAND_BBT_H
>>
>> +struct mtd_info;
>> +
>>  /* The maximum number of NAND chips in an array */
>>  #define NAND_MAX_CHIPS               8
>>
>> @@ -115,4 +117,69 @@ struct nand_bbt_descr {
>>  /* The maximum number of blocks to scan for a bbt */
>>  #define NAND_BBT_SCAN_MAXBLOCKS      4
>>
>> +struct nand_bbt;
>> +
>> +/**
>> + * struct nand_bbt_ops - bad block table operations
>> + * @is_bad_bbm:      check if a block is factory bad block
>> + * @erase:   erase block bypassing resvered checks
>> + */
>> +struct nand_bbt_ops {
>> +     /*
>> +      * This is important to abstract out of nand_bbt.c and provide
>> +      * separately in nand_base.c and spi-nand-base.c -- it's sort of
>> +      * duplicated in nand_block_bad() (nand_base) and
>> +      * scan_block_fast() (nand_bbt) right now
>> +      *
>> +      * Note that this also means nand_chip.badblock_pattern should
>> +      * be removed from nand_bbt.c
>> +      */
>> +     int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
>> +
>> +     /* Erase a block, bypassing reserved checks */
>> +     int (*erase)(struct mtd_info *mtd, loff_t ofs);
>> +};
>> +
>> +/**
>> + * struct nand_chip_layout_info - strucure contains all chip layout
>> + * information that BBT needed.
>> + * @numchips:        number of physical chips, required for NAND_BBT_PERCHIP
>> + * @chipsize:        the size of one chip for multichip arrays
>> + * @chip_shift:      number of address bits in one chip
>> + * @bbt_erase_shift: number of address bits in a bbt entry
>> + * @page_shift:      number of address bits in a page
>> + */
>> +struct nand_chip_layout_info {
>
> I know I'm the one who suggested this name, but NAND datasheet seems to
> call it "memory organization", so maybe we should rename this struct
> nand_memory_organization.

Fix this in v4
>
>> +     int numchips;
>
> I would rename it numdies, or ndies. numchips implies you're having
> several chips, which is not the case.

Fix this in v4
>
>> +     u64 chipsize;
>
> Ditto, s/chipsize/diesize/

Fix this in v4
>
>> +     int chip_shift;
>
> Ditto.

Fix this in v4
>
>> +     int bbt_erase_shift;
>
> Hm, this is not related to the memory organization. I'd prefer moving
> this one directly in

Yes, I also realize bbt_erase_shift is not proper. How about just rename it
to erase_block_shift or block_shift ?

>
>> +     int page_shift;
>> +};
>
> The structure should probably contain other info like (oob size, pages
> per block, blocks per die, ...)
> I know some of those information are redundant with mtd_info content,
> but it would be clearer to have everything in a common place.
>
> Also, I'd recommend using helpers to access memory organization info.
> For example nand_get_die_size(mtd), nand_get_page_size(mtd), ...
>
> On a more general note, as already said, I'd like to see more
> generalization across NAND based devices, no matter the interface
> they're using.
> Doing that implies forcing all NAND based devices to inherit from a
> common class. Something like
>
> struct nand_device {
>         struct mtd_info mtd;
>         struct nand_memory_organization memorg;
>         /* ... */
> };
>
> /* rawnand_device <-> nand_chip */
> struct rawnand_device {
>         struct nand_device base;
>         /* raw NAND specific fields */
> }
>
> struct spinand_device {
>         struct nand_device base;
>         /* SPI NAND specific fields */
> };
>
> struct onenand_device {
>         struct nand_device base;
>         /* OneNAND specific fields */
> };
>
> With this design, nand_bbt and nand_bbt_ops could use the generic
> nand_device instead of directly using the mtd instance.
>
> Anyway, that's just a long term goal, and I wanted to share my
> ideas. I guess your plan is to add support for SPI nand devices, so
> keep this in mind ;-).

Acctually your idea is quite good. Actually, struct nand_chip_layout_info
shouldn't be in nand_bbt.h. It should be in nand.h or nand_base.h and embedded
in struct nand_chip (or struct nand_deivce as your said).
The reason I did't do this is I feel it will be too involved. I need
to change almost
all files under mtd/nand/, which generates a larger patch set.
So I put struct nand_chip_layout_info here temporarily. Just as you
said, it's a long
term goal. Sorry for no comments to explain this in patches.

Thanks,
Peter Pan
