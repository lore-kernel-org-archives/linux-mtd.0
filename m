Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clnMI-0000PG-5y
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 01:59:15 +0000
Received: by mail-lf0-x244.google.com with SMTP id r36so3588173lfi.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Mar 2017 17:58:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170308093135.2fa02e72@bbrezillon>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-5-git-send-email-peterpandong@micron.com>
 <20170308093135.2fa02e72@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 9 Mar 2017 09:58:51 +0800
Message-ID: <CAAyFORJUevwLgDq5K1QG42cidKV+2ZisH03WeGAJ0=_OJwCQOQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] nand: spi: Add BBT support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
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

Hi Boris,

On Wed, Mar 8, 2017 at 4:31 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 1 Mar 2017 16:52:08 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>>  /**
>> - * spinand_erase - [MTD Interface] erase block(s)
>> + * __spinand_erase - erase block(s)
>>   * @mtd: MTD device structure
>>   * @einfo: erase instruction
>> + * @allowbbt: allow to access bbt
>>   *
>>   * Erase one ore more blocks
>>   */
>> -static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
>> +static int __spinand_erase(struct mtd_info *mtd, struct erase_info *einfo,
>> +                     int allowbbt)
>
> Please no __ prefixes. Not sure you need the wrappers you define below
> BTW.

mtd->_erase needs a function to treat BBT block as bad block while
nand_ops->erase not. What's your suggestion if we don't use the wrappers?

>
>>  {
>>       struct spinand_device *chip = mtd_to_spinand(mtd);
>>       struct nand_device *nand = mtd_to_nand(mtd);
>> @@ -1152,7 +1185,7 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
>>
>>       while (len) {
>>               /* Check if we have a bad block, we do not erase bad blocks! */
>> -             if (spinand_block_bad(mtd, offs, 0)) {
>> +             if (spinand_block_checkbad(mtd, offs, 0, allowbbt)) {
>>                       pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
>>                       __func__, offs);
>>                       einfo->state = MTD_ERASE_FAILED;
>> @@ -1193,6 +1226,55 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
>>       /* Return more or less happy */
>>       return ret;
>>  }
>> +
>> +/**
>> + * spinand_erase - [MTD Interface] erase block(s)
>> + * @mtd: MTD device structure
>> + * @einfo: erase instruction
>> + *
>> + * Erase one ore more blocks
>> + */
>> +static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
>> +{
>> +     return __spinand_erase(mtd, einfo, 0);
>> +}
>> +
>> +
>> +static int spinand_erase_bbt(struct nand_device *nand, struct erase_info *einfo)
>> +{
>> +     return __spinand_erase(nand_to_mtd(nand), einfo, 1);
>> +}
>> +
>
> [...]
>
>
>> +static void spinand_fill_nandd(struct spinand_device *chip)
>> +{
>> +     struct nand_device *nand = &chip->base;
>> +
>> +     nand->ops = &spinand_ops;
>> +}
>
> This is not needed. I did that in the raw NAND framework to ease the
> transition to the generic NAND layer, but here, you're
> natively supporting it. Just assign nand->ops in spinand_scan_ident().

Noted/ Fix this in v3.

Thanks
Peter Pan
