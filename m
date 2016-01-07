Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH3fm-0001Rv-3S
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 06:03:47 +0000
Received: by mail-lf0-x22e.google.com with SMTP id m198so2224194lfm.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 22:03:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160106162216.617f0811@bbrezillon>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-6-git-send-email-peterpandong@micron.com>
 <20160106162216.617f0811@bbrezillon>
Date: Thu, 7 Jan 2016 14:03:23 +0800
Message-ID: <CAAyFORKX7-jjjZsrZE7jk1soK=TsbThW_QJMk0uYqLkmTC0LYw@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] mtd: nand: use new BBT API instead of old ones
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>, Peter Pan <peterpandong@micron.com>,
 beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 6, 2016 at 11:22 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 15 Dec 2015 05:59:31 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> From: Brian Norris <computersforpeace@gmail.com>
>>
>> Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
>> exist temporarily.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> [Peter: 1. use nand_bbt_markbad_factory() in docg4.c and implement
>>         2. nand_create_factory_badblock_pattern(), nand_is_bad_bbm() and
>>         nand_default_bbt() in nand_base.c
>>         3. add NAND_BADBLOCK_PATTERN_ALLOC macro]
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/docg4.c     |   6 +-
>>  drivers/mtd/nand/nand_base.c | 140 ++++++++++++++++++++++++++++++++++++++++---
>>  include/linux/mtd/nand.h     |   9 ++-
>>  3 files changed, 143 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
>> index da93d7f..1be7fa2 100644
>> --- a/drivers/mtd/nand/docg4.c
>> +++ b/drivers/mtd/nand/docg4.c
>> @@ -1037,7 +1037,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
>>        * operation after device power-up.  The above read ensures it never is.
>>        * Ugly, I know.
>>        */
>> -     if (nand->bbt == NULL)  /* no memory-based bbt */
>> +     if (nand->nand_bbt == NULL)  /* no memory-based bbt */
>>               goto exit;
>>
>>       if (mtd->ecc_stats.failed > eccfailed_stats) {
>> @@ -1064,8 +1064,8 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
>>               unsigned long bits = ~buf[i];
>>               for_each_set_bit(bitnum, &bits, 8) {
>>                       int badblock = block + 7 - bitnum;
>> -                     nand->bbt[badblock / 4] |=
>> -                             0x03 << ((badblock % 4) * 2);
>> +                     nand_bbt_markbad_factory(nand->nand_bbt,
>> +                                     badblock << nand->bbt_erase_shift);
>>                       mtd->ecc_stats.badblocks++;
>>                       dev_notice(doc->dev, "factory-marked bad block: %d\n",
>>                                  badblock);
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 5aec154..28d7a58 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>
> [...]
>
>>
>> +/* NAND BBT helper - erase a block, including reserved blocks */
>> +static int nand_bbt_erase_block(struct mtd_info *mtd, loff_t addr)
>> +{
>> +     struct erase_info einfo;
>> +     struct nand_chip *chip = mtd->priv;
>
> nand_chip backpointer is no longer stored in mtd->priv (nand_chip now
> embeds its own mtd_info field and we use the container_of trick to
> retrieve the nand_chip pointer from the mtd_info pointer).
>
>         struct nand_chip *chip = mtd_to_nand(mtd);
>

Fix this in v3.

>> +
>> +     memset(&einfo, 0, sizeof(einfo));
>> +     einfo.mtd = mtd;
>> +     einfo.addr = addr;
>> +     einfo.len = 1ULL << chip->phys_erase_shift;
>> +
>> +     return nand_erase_nand(mtd, &einfo, 1);
>> +}
>> +
>
> [...]
>
>> +static int nand_is_bad_bbm(struct mtd_info *mtd, loff_t addr)
>> +{
>> +     struct nand_chip *chip = mtd->priv;
>
>         struct nand_chip *chip = mtd_to_nand(mtd);

Fix this in v3.

>
>> +     struct mtd_oob_ops ops;
>> +     struct nand_bbt_descr *bd = chip->badblock_pattern;
>> +     int j, ret;
>> +     int numpages;
>> +
>> +     if (bd->options & NAND_BBT_SCAN2NDPAGE)
>> +             numpages = 2;
>> +     else
>> +             numpages = 1;
>> +
>> +     if (bd->options & NAND_BBT_SCANLASTPAGE)
>> +             addr += mtd->erasesize - (mtd->writesize * numpages);
>> +
>> +     ops.ooblen = mtd->oobsize;
>> +     ops.oobbuf = chip->buffers->databuf;
>> +     ops.ooboffs = 0;
>> +     ops.datbuf = NULL;
>> +     ops.mode = MTD_OPS_PLACE_OOB;
>> +
>> +     for (j = 0; j < numpages; j++) {
>> +             /*
>> +              * Read the full oob until read_oob is fixed to handle single
>> +              * byte reads for 16 bit buswidth.
>> +              */
>> +             ret = nand_do_read_oob(mtd, addr, &ops);
>> +             /* Ignore ECC errors when checking for BBM */
>> +             if (ret && !mtd_is_bitflip_or_eccerr(ret))
>> +                     return ret;
>> +
>> +             if (memcmp(chip->buffers->databuf + bd->offs,
>> +                             bd->pattern, bd->len))
>> +                     return 1;
>> +
>> +             addr += mtd->writesize;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int nand_default_bbt(struct mtd_info *mtd)
>> +{
>> +     struct nand_chip *chip = mtd->priv;
>
>         struct nand_chip *chip = mtd_to_nand(mtd);

Fix this in v3.

>
>> +     struct nand_bbt *bbt = kzalloc(sizeof(struct nand_bbt), GFP_KERNEL);
>> +
>> +     if (!bbt)
>> +             return -ENOMEM;
>> +
>> +     bbt->bbt_options = chip->bbt_options;
>> +     bbt->mtd = mtd;
>> +     bbt->numchips = chip->numchips;
>> +     bbt->chipsize = chip->chipsize;
>> +     bbt->chip_shift = chip->chip_shift;
>> +     bbt->bbt_erase_shift = chip->phys_erase_shift;
>> +     bbt->page_shift = chip->page_shift;
>> +     bbt->bbt_td = chip->bbt_td;
>> +     bbt->bbt_md = chip->bbt_md;
>> +     bbt->is_bad_bbm = nand_is_bad_bbm;
>> +     bbt->erase = nand_bbt_erase_block;
>> +     chip->nand_bbt = bbt;
>> +
>> +     if (!chip->badblock_pattern &&
>> +             nand_create_factory_badblock_pattern(chip))
>> +             return -ENOMEM;
>> +
>> +     return nand_bbt_init(chip->nand_bbt);
>> +}
>
>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Thanks
Peter Pan
