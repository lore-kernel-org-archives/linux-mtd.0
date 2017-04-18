Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0O0w-0002Ct-92
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 07:57:39 +0000
Received: by mail-wm0-x242.google.com with SMTP id z129so10422197wmb.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 00:57:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
 <1492287078-22369-2-git-send-email-andrea.adami@gmail.com>
 <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 18 Apr 2017 09:57:06 +0200
Message-ID: <CAAQYJAvpNxDA1afo60+Ey=3cU_A0GuXh9AvWoiH8fX2d9q_6hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: sharpsl: add sharpslpart MTD partition parser
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 16, 2017 at 6:07 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 04/15/2017 10:11 PM, Andrea Adami wrote:
>> The Sharp SL Series (Zaurus) PXA handhelds have 16/64/128M of NAND flash
>> and share the same layout of the first 7M partition, managed by Sharp FTL.
>>
>> The purpose of this self-contained patch is to add a common parser and
>> remove the hardcoded sizes in the board files (these devices are not yet
>> converted to devicetree).
>> Users will have benefits because the mtdparts= tag will not be necessary
>> anymore and they will be free to repartition the little sized flash.
>>
>> The obsolete bootloader can not pass the partitioning info to modern
>> kernels anymore so it has to be read from flash at known logical addresses.
>> (see http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm )
>>
>> In kernel, under arch/arm/mach-pxa we have already 8 machines:
>> MACH_POODLE, MACH_CORGI, MACH_SHEPERD, MACH_HUSKY, MACH_AKITA, MACH_SPITZ,
>> MACH_BORZOI, MACH_TOSA.
>> Lost after the 2.4 vendor kernel are MACH_BOXER and MACH_TERRIER.
>>
>> Almost every model has different factory partitioning: add to this the
>> units can be repartitioned by users with userspace tools (nandlogical)
>> and installers for popular (back then) linux distributions.
>>
>> The Parameter Area in the first (boot) partition extends from 0x00040000 to
>> 0x0007bfff (176k) and contains two copies of the partition table:
>> ...
>> 0x00060000: Partition Info1   16k
>> 0x00064000: Partition Info2   16k
>> 0x00668000: Model             16k
>> ...
>>
>> The first 7M partition is managed by the Sharp FTL reserving 5% + 1 blocks
>> for wear-leveling: some blocks are remapped and one layer of translation
>> (logical to physical) is necessary.
>>
>> There isn't much documentation about this FTL in the 2.4 sources, just the
>> MTD methods for reading and writing using logical addresses and the block
>> management (wear-leveling, use counter).
>> For the purpose of the MTD parser only the read part of the code was taken.
>>
>> The NAND drivers that can use this parser are sharpsl.c and tmio_nand.c.
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  drivers/mtd/Kconfig       |   8 ++
>>  drivers/mtd/Makefile      |   2 +
>>  drivers/mtd/sharpsl_ftl.c | 309 ++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/mtd/sharpsl_ftl.h |  34 +++++
>>  drivers/mtd/sharpslpart.c | 142 +++++++++++++++++++++
>>  5 files changed, 495 insertions(+)
>>  create mode 100644 drivers/mtd/sharpsl_ftl.c
>>  create mode 100644 drivers/mtd/sharpsl_ftl.h
>>  create mode 100644 drivers/mtd/sharpslpart.c
>>
>> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
>> index e83a279..5c96127 100644
>> --- a/drivers/mtd/Kconfig
>> +++ b/drivers/mtd/Kconfig
>> @@ -155,6 +155,14 @@ config MTD_BCM47XX_PARTS
>>         This provides partitions parser for devices based on BCM47xx
>>         boards.
>>
>> +config MTD_SHARPSL_PARTS
>> +     tristate "Sharp SL Series NAND flash partition parser"
>> +     depends on MTD_NAND_SHARPSL || MTD_NAND_TMIO
>> +     help
>> +       This provides the read-only FTL logic necessary to read the partition
>> +       table from the NAND flash of Sharp SL Series (Zaurus) and the MTD
>> +       partition parser using this code.
>> +
>>  comment "User Modules And Translation Layers"
>>
>>  #
>> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
>> index 99bb9a1..89f707b 100644
>> --- a/drivers/mtd/Makefile
>> +++ b/drivers/mtd/Makefile
>> @@ -13,6 +13,8 @@ obj-$(CONFIG_MTD_AFS_PARTS) += afs.o
>>  obj-$(CONFIG_MTD_AR7_PARTS)  += ar7part.o
>>  obj-$(CONFIG_MTD_BCM63XX_PARTS)      += bcm63xxpart.o
>>  obj-$(CONFIG_MTD_BCM47XX_PARTS)      += bcm47xxpart.o
>> +obj-$(CONFIG_MTD_SHARPSL_PARTS)      += sharpsl-part.o
>> +sharpsl-part-objs := sharpsl_ftl.o sharpslpart.o
>
Hello,
thanks for the review.

I have taken in account your observations and I am applying the
suggested fixes (see comments).

> Can the FTL and partition parser be used separately ?

The parser needs the FTL to read.
The FTL could be used elsewhere but I only know about Sharp Zaurus using it.

I put the original 2.4 files here:
https://github.com/LinuxPDA/Sharp_FTL_2.4.20

>
>>  # 'Users' - code which presents functionality to userspace.
>>  obj-$(CONFIG_MTD_BLKDEVS)    += mtd_blkdevs.o
>> diff --git a/drivers/mtd/sharpsl_ftl.c b/drivers/mtd/sharpsl_ftl.c
>> new file mode 100644
>> index 0000000..d8ebefe
>> --- /dev/null
>> +++ b/drivers/mtd/sharpsl_ftl.c
>> @@ -0,0 +1,309 @@
>> +/*
>> + * MTD method for NAND accessing via logical address (SHARP FTL)
>> + *
>> + * Copyright (C) 2017 Andrea Adami <andrea.adami@gmail.com>
>> + *
>> + * Based on 2.4 sources: drivers/mtd/nand/sharp_sl_logical.c
>> + * Copyright (C) 2002  SHARP
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/partitions.h>
>> +#include "sharpsl_ftl.h"
>> +
>> +/* oob structure */
>> +#define NAND_NOOB_LOGADDR_00         8
>> +#define NAND_NOOB_LOGADDR_01         9
>> +#define NAND_NOOB_LOGADDR_10         10
>> +#define NAND_NOOB_LOGADDR_11         11
>> +#define NAND_NOOB_LOGADDR_20         12
>> +#define NAND_NOOB_LOGADDR_21         13
>> +
>> +/* Logical Table */
>> +struct mtd_logical {
>> +     u32 size;               /* size of the handled partition */
>> +     int index;              /* mtd->index */
>> +     u_int phymax;           /* physical blocks */
>> +     u_int logmax;           /* logical blocks */
>> +     u_int *log2phy;         /* the logical-to-physical table */
>> +};
>> +
>> +static struct mtd_logical *sharpsl_mtd_logical;
>> +
>> +/* wrapper */
>> +static int sharpsl_nand_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
>> +                              size_t *retlen, uint8_t *buf)
>> +{
>> +     loff_t mask = mtd->writesize - 1;
>> +     struct mtd_oob_ops ops;
>> +     int res;
>> +
>> +     ops.mode = MTD_OPS_PLACE_OOB;
>> +     ops.ooboffs = offs & mask;
>> +     ops.ooblen = len;
>> +     ops.oobbuf = buf;
>> +     ops.datbuf = NULL;
>> +
>> +     res = mtd_read_oob(mtd, offs & ~mask, &ops);
>> +     *retlen = ops.oobretlen;
>
> You sure you want to do this assignment in all cases (also in fail case) ?
Well, I needed a wrapper for the old mtd->read_oob() ...
this example comes straight from other sources (ntflcore.c, inftlcore.c,).
I do a check afterwards: if ((ret != 0) || (mtd->oobsize != retlen))..

>
>> +     return res;
>> +}
>> +
>> +/* utility */
>> +static u_int sharpsl_nand_get_logical_no(unsigned char *oob)
>> +{
>> +     unsigned short us, bit;
>> +     int par;
>> +     int good0, good1;
>> +
>> +     if (oob[NAND_NOOB_LOGADDR_00] == oob[NAND_NOOB_LOGADDR_10] &&
>> +         oob[NAND_NOOB_LOGADDR_01] == oob[NAND_NOOB_LOGADDR_11]) {
>> +             good0 = NAND_NOOB_LOGADDR_00;
>> +             good1 = NAND_NOOB_LOGADDR_01;
>> +     } else if (oob[NAND_NOOB_LOGADDR_10] == oob[NAND_NOOB_LOGADDR_20] &&
>> +                oob[NAND_NOOB_LOGADDR_11] == oob[NAND_NOOB_LOGADDR_21]) {
>> +             good0 = NAND_NOOB_LOGADDR_10;
>> +             good1 = NAND_NOOB_LOGADDR_11;
>> +     } else if (oob[NAND_NOOB_LOGADDR_20] == oob[NAND_NOOB_LOGADDR_00] &&
>> +         oob[NAND_NOOB_LOGADDR_21] == oob[NAND_NOOB_LOGADDR_01]) {
>
> Consistent indent would be nice.
About this, I am doing a personal battle with checkpatch.pl --strict.
I'll fix all the indentings, sorry for the eyesore.

>
>> +             good0 = NAND_NOOB_LOGADDR_20;
>> +             good1 = NAND_NOOB_LOGADDR_21;
>> +     } else {
>> +             return (u_int)-1;
>
> What is this ?
They used this casting of negative integer to signale abnormal exit.

>
>> +     }
>> +
>> +     us = (((unsigned short)(oob[good0]) & 0x00ff) << 0) |
>> +             (((unsigned short)(oob[good1]) & 0x00ff) << 8);
>
> oob is unsigned char array, the cast and masking should not be needed.
> btw make us into u16 type.
ok, I'll try

>
>> +     par = 0;
>> +     for (bit = 0x0001; bit != 0; bit <<= 1) {
>
> You can use the BIT() macro here.
Ok, I'l have to learn it

>
>> +             if (us & bit)
>> +                     par++;
>> +     }
>> +     if (par & 1)
>> +             return (u_int)-2;
>
> Again, what's this return (u_int) stuff ?
As before, replaced with UINT_MAX

>
>> +
>> +     if (us == 0xffff)
>> +             return 0xffff;
>> +     else
>> +             return ((us & 0x07fe) >> 1);
>
> One parenthesis set too many here.
Apparently not. This is necessary or you get wrong result.

>
>> +}
>> +
>> +int sharpsl_nand_init_logical(struct mtd_info *mtd, u_int32_t partition_size)
>> +{
>> +     struct mtd_logical *logical = NULL;
>> +     u_int block_no;
>> +     loff_t block_adr;
>> +     u_int log_no;
>> +     unsigned char *oob = NULL;
>> +     int readretry;
>> +     int ret;
>> +     int i;
>> +     size_t retlen;
>> +
>> +     /* check argument */
>> +     if ((partition_size % mtd->erasesize) != 0) {
>
> Can this even happen ?
Not really. Removed.

>
>> +             pr_err("Illegal partition size. (0x%x)\n", partition_size);
>> +             return -EINVAL;
>> +     }
>> +
>> +     /* Allocate memory for Logical Address Management */
>> +     logical = kzalloc(sizeof(*logical), GFP_KERNEL);
>> +     if (!logical)
>> +             return -ENOMEM;
>> +
>> +     /* Allocate a few more bytes of memory for oob */
>> +     oob = kzalloc(mtd->oobsize, GFP_KERNEL);
>
> Can we use devm_ functions all over the place ?
Probably yes but I'll need help with the new implementation.

>
> Can we avoid the double-allocation, ie. by embedding the maximum oob
> sized buffer into struct mtd_logical (which might need renaming btw)
> or allocating it on stack (it's likely a few bytes)?

I'm open to suggestions: I started taking the old code.
Here the sources had a nice #if defined() and the oob was [16] or [64].
The right size is the oobsize.

>
>> +     if (!oob) {
>> +             kfree(logical);
>> +             return -ENOMEM;
>> +     }
>> +
>> +     /* initialize management structure */
>> +     logical->size = partition_size;
>> +     logical->index = mtd->index;
>> +     logical->phymax = (partition_size / mtd->erasesize);
>> +
>> +     /* FTL reserves 5% of the blocks + 1 spare  */
>> +     logical->logmax = (((logical->phymax * 95) / 100) - 1);
>> +
>> +     pr_debug("FTL blocks: %d physical (%d logical + %d reserved)\n",
>> +              logical->phymax, logical->logmax,
>> +              logical->phymax - logical->logmax);
>> +
>> +     logical->log2phy = NULL;
>> +
>> +     /* Allocate memory for logical->log2phy */
>> +     logical->log2phy = kcalloc(logical->logmax, sizeof(u_int), GFP_KERNEL);
>
> Another allocation which could be avoided IMO
Like before, this will need a redesign.

>
>> +     if (!logical->log2phy) {
>> +             kfree(logical);
>> +             kfree(oob);
>> +             return -ENOMEM;
>> +     }
>> +
>> +     /* initialize logical->log2phy */
>> +     for (i = 0; i < logical->logmax; i++)
>> +             logical->log2phy[i] = (u_int)-1;
>
> You should stop using this (u_int) stuff unless there's a real good
> reason for that (which I doubt).
I have just replaced that with UINT_MAX so one can imagine at least
the bit mask.
They mark the [i] with an out-of-range value, which will be always
bigger than the number of blocks.
>
>> +     /* create physical-logical table */
>> +     for (block_no = 0; block_no < logical->phymax; block_no++) {
>> +             block_adr = block_no * mtd->erasesize;
>> +
>> +             readretry = 3;
>> +read_retry:
>> +             /* avoid bad blocks */
>> +             if (mtd_block_isbad(mtd, block_adr)) {
>> +                     pr_debug("block_no=%d is marked as bad, skipping\n",
>> +                              block_no);
>
> Can we use dev_dbg() and co. all over the place ?
This is another big change, I see the other parsers do use pr_err et
co,. so I just did that.

>
>> +                     continue;
>> +             }
>> +
>> +             /* wrapper for mtd_read_oob() */
>> +             ret = sharpsl_nand_read_oob(mtd, block_adr, mtd->oobsize,
>> +                                         &retlen, oob);
>> +
>> +             if (ret != 0) {
>> +                     pr_warn("Failed in read_oob, skip this block.\n");
>> +                     continue;
>> +             }
>> +
>> +             if (mtd->oobsize != retlen) {
>> +                     pr_warn("read_oob cannot read full-size.\n");
>> +                     continue;
>> +             }
>> +
>> +             /* logical address */
>> +             log_no = sharpsl_nand_get_logical_no(oob);
>> +
>> +             if ((int)log_no < 0) {
>
> Is the typecast needed ? Probably not ...

Well, yes, because it is an unsigned int, set to UINT_MAX.
If you cast it to int it becomes negative again afais.

>
>> +                     pr_warn("Bad logical no found.\n");
>
> Bad English is found though :-) Please fix the comment.

I have removed many comments. This is not userspace and debug should
not be needed.

>
>> +                     readretry--;
>> +                     if (readretry > 0)
>> +                             goto read_retry;
>> +                     continue;
>> +             }
>> +
>> +             /* reserved (FTL) */
>> +             if (log_no == 0xffff) {
>> +                     pr_debug("block_no=%d is reserved, skipping\n",
>> +                              block_no);
>> +                     continue;
>> +             }
>> +
>> +             /* logical address available ? */
>> +             if (log_no >= logical->logmax) {
>> +                     pr_warn("The logical no is too big. (%d)\n", log_no);
>> +                     pr_warn("***partition(%d) erasesize(%d) logmax(%d)\n",
>> +                             partition_size, mtd->erasesize,
>> +                             logical->logmax);
>> +             continue;
>
> Indent.
Sorry again...
>
>> +             }
>> +
>> +             /* duplicated or not ? */
>> +             if (logical->log2phy[log_no] == (u_int)(-1)) {
>> +                     logical->log2phy[log_no] = block_no;
>> +             } else {
>> +                     pr_warn("The logical no is duplicated. (%d)\n", log_no);
>> +                     continue;
>
> Continue not needed.
Removed
>
>> +             }
>> +
>> +             /* pr_debug("FTL map: block_no=%d block_adr=0x%x log_no=%d\n",
>> +              *              block_no, (u_int32_t)block_adr, log_no);
>> +              */
>
> Please make up your mind with this comment.
Removed, debug not necessary anymore

>
>> +     }
>> +     kfree(oob);
>> +     sharpsl_mtd_logical = logical;
>> +
>> +     return 0;
>> +}
>> +
>> +void sharpsl_nand_cleanup_logical(void)
>> +{
>> +     struct mtd_logical *logical = sharpsl_mtd_logical;
>> +
>> +     sharpsl_mtd_logical = NULL;
>> +
>> +     kfree(logical->log2phy);
>> +     logical->log2phy = NULL;
>> +     kfree(logical);
>> +     logical = NULL;
>> +}
>> +
>> +/* MTD METHOD */
>> +int sharpsl_nand_read_laddr(struct mtd_info *mtd,
>> +                         loff_t from,
>> +                         size_t len,
>> +                         u_char *buf)
>> +{
>> +     struct mtd_logical *logical;
>> +     u_int log_no;
>> +     u_int block_no;
>> +     loff_t block_adr;
>> +     loff_t block_ofs;
>> +     size_t retlen;
>> +     int ret;
>> +
>> +     /* support only for one block */
>> +     if (len <= 0) {
>> +             pr_err("Illegal argumnent. len=0x%x\n",
>> +                    len);
>
> Indent :)
Sorry...
>
>> +             return -EINVAL;
>> +     }
>> +
>> +     if ((((u_int32_t)from) / mtd->erasesize) != ((((u_int32_t)from) +
>> +             len - 1) / mtd->erasesize)) {
>> +             pr_err("Illegal argument. from=0x%x len=0x%x\n",
>> +                    (u_int32_t)from, len);
>
> Typecast , indent (fix globally), the condition looks like crap ...
>
> Use u8/u16/u32 types btw

I'll try to rewrite it so to check block boundaries.

>
>> +             return -EINVAL;
>> +     }
>> +
>> +     logical = sharpsl_mtd_logical;
>> +     log_no = (((u_int32_t)from) / mtd->erasesize);
>> +
>> +     if (log_no >= logical->logmax) {
>> +             pr_err("Illegal argument. from=0x%x\n",
>> +                    (u_int32_t)from);
>> +             return -EINVAL;
>> +     }
>> +
>> +     /* is log_no used ? */
>> +     if (logical->log2phy[log_no] == (u_int)-1) {
>> +             pr_err("There is not the LOGICAL block. from=0x%x\n",
>> +                    (u_int32_t)from);
>> +             return -EINVAL;
>> +     }
>> +
>> +     /* physical address */
>> +     block_no = logical->log2phy[log_no];
>> +     block_adr = block_no * mtd->erasesize;
>> +     block_ofs = (((u_int32_t)from) % mtd->erasesize);
>> +
>> +     /* read */
>> +     ret = mtd_read(mtd, block_adr + block_ofs, len, &retlen, buf);
>> +     if (ret != 0) {
>> +             pr_err("mtd_read failed in sharpsl_nand_read_laddr()\n");
>> +             return ret;
>> +     }
>> +
>> +     if (len != retlen) {
>> +             pr_err("mtd_read cannot read full-size.\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     return 0;
>> +}
>> diff --git a/drivers/mtd/sharpsl_ftl.h b/drivers/mtd/sharpsl_ftl.h
>> new file mode 100644
>> index 0000000..f639646
>> --- /dev/null
>> +++ b/drivers/mtd/sharpsl_ftl.h
>> @@ -0,0 +1,34 @@
>> +/*
>> + * Header file for NAND accessing via logical address (SHARP FTL)
>> + *
>> + * Copyright (C) 2017 Andrea Adami <andrea.adami@gmail.com>
>> + *
>> + * Based on 2.4 sources: linux/include/asm-arm/sharp_nand_logical.h
>> + * Copyright (C) 2002  SHARP
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef __SHARPSL_NAND_LOGICAL_H__
>> +#define __SHARPSL_NAND_LOGICAL_H__
>> +
>> +#include <linux/types.h>
>> +#include <linux/mtd/mtd.h>
>> +
>> +int sharpsl_nand_init_logical(struct mtd_info *mtd, u_int32_t partition_size);
>> +
>> +void sharpsl_nand_cleanup_logical(void);
>> +
>> +int sharpsl_nand_read_laddr(struct mtd_info *mtd, loff_t from, size_t len,
>> +                         u_char *buf);
>> +
>> +#endif
>> diff --git a/drivers/mtd/sharpslpart.c b/drivers/mtd/sharpslpart.c
>> new file mode 100644
>> index 0000000..dcd3cbe
>> --- /dev/null
>> +++ b/drivers/mtd/sharpslpart.c
>> @@ -0,0 +1,142 @@
>> +/*
>> + * MTD partition parser for NAND flash on Sharp SL Series
>> + *
>> + * Copyright (C) 2017 Andrea Adami <andrea.adami@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/partitions.h>
>> +#include "sharpsl_ftl.h"
>> +
>> +/* factory defaults */
>> +#define SHARPSL_NAND_PARTS           3
>> +#define SHARPSL_FTL_PARTITION_SIZE   (7 * 1024 * 1024)
>> +#define PARAM_BLOCK_PARTITIONINFO1   0x00060000
>> +#define PARAM_BLOCK_PARTITIONINFO2   0x00064000
>> +
>> +#define BOOT_MAGIC                   be32_to_cpu(0x424f4f54)   /* BOOT */
>> +#define FSRO_MAGIC                   be32_to_cpu(0x4653524f)   /* FSRO */
>> +#define FSRW_MAGIC                   be32_to_cpu(0x46535257)   /* FSRW */
>> +
>> +/*
>> + * Sample values read from SL-C860
>> + *
>> + * # cat /proc/mtd
>> + * dev:    size   erasesize  name
>> + * mtd0: 006d0000 00020000 "Filesystem"
>> + * mtd1: 00700000 00004000 "smf"
>> + * mtd2: 03500000 00004000 "root"
>> + * mtd3: 04400000 00004000 "home"
>> + *
>> + * PARTITIONINFO1
>> + * 0x00060000: 00 00 00 00 00 00 70 00 42 4f 4f 54 00 00 00 00  ......p.BOOT....
>> + * 0x00060010: 00 00 70 00 00 00 c0 03 46 53 52 4f 00 00 00 00  ..p.....FSRO....
>> + * 0x00060020: 00 00 c0 03 00 00 00 04 46 53 52 57 00 00 00 00  ........FSRW....
>> + * 0x00060030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
>> + */
>> +
>> +struct sharpsl_nand_partitioninfo {
>> +     u32 boot_start;
>> +     u32 boot_end;
>> +     u32 boot_magic;
>> +     u32 boot_reserved;
>
> Could be reduced to
>
> struct sharpsl_nand_partition_info {
>         u32 start;
>         u32 end;
>         u32 magic;
>         u32 reserved;
> };
>
> And then have struct sharpsl_nand_partition_info *foo; and index it with
> { 0, 1, 2 } .
>

Yes, ofc, but I thought it is better to let it simple.
The extra loop and code needed will not give much shorter file.

>> +     u32 fsro_start;
>> +     u32 fsro_end;
>> +     u32 fsro_magic;
>> +     u32 fsro_reserved;
>> +     u32 fsrw_start;
>> +     u32 fsrw_end; /* ignore, was for the older models with 64M flash */
This exception would need i.e. an if ()

>> +     u32 fsrw_magic;
>> +     u32 fsrw_reserved;
>> +};
>> +
>> +static int sharpsl_parse_mtd_partitions(struct mtd_info *master,
>> +                                     const struct mtd_partition **pparts,
>> +                                     struct mtd_part_parser_data *data)
>> +{
>> +     struct sharpsl_nand_partitioninfo buf1;
>> +     struct sharpsl_nand_partitioninfo buf2;
>> +     struct mtd_partition *sharpsl_nand_parts;
>> +
>> +     /* init logical mgmt (FTL) */
>> +     if (sharpsl_nand_init_logical(master, SHARPSL_FTL_PARTITION_SIZE))
>> +             return -EINVAL;
>> +
>> +     /* read the two partition tables */
>> +     if (sharpsl_nand_read_laddr(master,
>> +                                 PARAM_BLOCK_PARTITIONINFO1, 48,
>> +                                 (u_char *)&buf1) ||
>> +         sharpsl_nand_read_laddr(master,
>> +                                 PARAM_BLOCK_PARTITIONINFO2, 48,
>> +                                 (u_char *)&buf2))
>> +             return -EINVAL;
>> +
>> +     /* cleanup logical mgmt (FTL) */
>> +     sharpsl_nand_cleanup_logical();
>> +
>> +     /* compare the two buffers */
>> +     if (!memcmp(&buf1, &buf2, 48)) {
>> +             pr_debug("sharpslpart: PARTITIONINFO 1/2 are in sync.\n");
>> +     } else {
>> +             pr_err("sharpslpart: PARTITIONINFO 1/2 differ. Quit parser.\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     /* check for magics (just in the first) */
>> +     if (buf1.boot_magic == BOOT_MAGIC &&
>> +         buf1.fsro_magic == FSRO_MAGIC &&
>> +         buf1.fsrw_magic == FSRW_MAGIC) {
>> +             pr_debug("sharpslpart: magic values found.\n");
>
> Can we use dev_dbg() ?
As said above, most parsers do use pr_err/pr_warn.
I am tempted to remove these messages as well: the parser should not need debug.

>
>> +     } else {
>> +             pr_err("sharpslpart: magic values mismatch. Quit parser.\n");
>> +             return -EINVAL;
>> +     }
>
> Can we use devm_kzalloc() ?

As above, taken straight from the other parsers.

>
>> +     sharpsl_nand_parts = kzalloc(sizeof(*sharpsl_nand_parts) *
>> +                                  SHARPSL_NAND_PARTS, GFP_KERNEL);
>> +     if (!sharpsl_nand_parts)
>> +             return -ENOMEM;
>> +
>> +     /* original names */
>> +     sharpsl_nand_parts[0].name = "smf";
>> +     sharpsl_nand_parts[0].offset = buf1.boot_start;
>> +     sharpsl_nand_parts[0].size = buf1.boot_end - buf1.boot_start;
>> +     sharpsl_nand_parts[0].mask_flags = 0;
>> +
>> +     sharpsl_nand_parts[1].name = "root";
>> +     sharpsl_nand_parts[1].offset = buf1.fsro_start;
>> +     sharpsl_nand_parts[1].size = buf1.fsro_end - buf1.fsro_start;
>> +     sharpsl_nand_parts[1].mask_flags = 0;
>> +
>> +     sharpsl_nand_parts[2].name = "home";
>> +     sharpsl_nand_parts[2].offset = buf1.fsrw_start;
>> +     sharpsl_nand_parts[2].size = master->size - buf1.fsrw_start;
>> +     sharpsl_nand_parts[2].mask_flags = 0;
>> +
>> +     *pparts = sharpsl_nand_parts;
>> +     return SHARPSL_NAND_PARTS;
>> +}
>> +
>> +static struct mtd_part_parser sharpsl_mtd_parser = {
>> +     .parse_fn = sharpsl_parse_mtd_partitions,
>> +     .name = "sharpslpart",
>> +};
>> +module_mtd_part_parser(sharpsl_mtd_parser);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Andrea Adami <andrea.adami@gmail.com>");
>> +MODULE_DESCRIPTION("MTD partitioning for NAND flash on Sharp SL Series");
>>
>
>
> --
> Best regards,
> Marek Vasut


I know there is still much work to do: I am working at a v2 of the
patch, much shorter.
https://github.com/LinuxPDA/linux/tree/sharpslpart_v2

I'll try to improve it more. Let's wait some more reviews.

Regards
Andrea.
