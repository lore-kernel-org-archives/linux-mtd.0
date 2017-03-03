Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjilF-0003UC-T2
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 08:40:27 +0000
Received: by mail-lf0-x231.google.com with SMTP id k202so44312429lfe.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Mar 2017 00:40:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170301142135.0f0bbe65@free-electrons.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-2-git-send-email-peterpandong@micron.com>
 <20170301142135.0f0bbe65@free-electrons.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 3 Mar 2017 16:40:03 +0800
Message-ID: <CAAyFORLbs2c2f2yCjkZa9S4=LMcwuOLDB147UnoD4swpgSKtVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] nand: spi: Add init/release function
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

On Wed, Mar 1, 2017 at 9:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 1 Mar 2017 16:52:05 +0800, Peter Pan wrote:
>
>> +static bool spinand_scan_id_table(struct spinand_device *chip, u8 *id)
>> +{
>> +     struct nand_device *nand = &chip->base;
>> +     struct spinand_flash *type = spinand_table;
>> +     struct nand_memory_organization *memorg = &nand->memorg;
>> +     struct spinand_ecc_engine *ecc_engine = &chip->ecc_engine;
>> +
>> +     for (; type->name; type++) {
>> +             if (id[0] == type->mfr_id && id[1] == type->dev_id) {
>> +                     chip->name = type->name;
>> +                     memorg->eraseblocksize = type->page_size
>> +                                     * type->pages_per_blk;
>> +                     memorg->pagesize = type->page_size;
>> +                     memorg->oobsize = type->oob_size;
>> +                     memorg->diesize =
>> +                             memorg->eraseblocksize * type->blks_per_lun;
>> +                     memorg->ndies = type->luns_per_chip;
>> +                     ecc_engine->strength = type->ecc_strength;
>> +                     chip->rw_mode = type->rw_mode;
>> +
>> +                     return true;
>> +             }
>> +     }
>
> One minor nit, based on a very quick look. What about instead:
>
>         for (type = spinand_table; type->name; type++) {
>                 if (id[0] != type->mfr_id)
>                         continue;
>                 if (id[1] != type->dev_id)
>                         continue;
>                 chip->name = type->name;
>                 ...
>                 return true;
>         }
>
> I.e, use the initialization part of the for() loop, and inside the
> for() loop, avoid one indentation level by handling the non-interesting
> case first, and skipping to the next table entry if needed.

Thanks for your comment. I will fix this in v3

Thanks,
Peter Pan
