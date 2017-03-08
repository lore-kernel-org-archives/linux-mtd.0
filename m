Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clWVk-0003SI-Df
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 07:59:54 +0000
Received: by mail-lf0-x244.google.com with SMTP id r36so1797045lfi.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2017 23:59:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170308082324.256d4bce@bbrezillon>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-4-git-send-email-peterpandong@micron.com>
 <20170308082324.256d4bce@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Wed, 8 Mar 2017 15:59:27 +0800
Message-ID: <CAAyFORJwb=AZCPZNy-8v9t57Nz9_FjZWQmz2pDDWMn5YTp1YJQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] nand: spi: Add bad block support
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

On Wed, Mar 8, 2017 at 3:23 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 1 Mar 2017 16:52:07 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> Add isbad and markbad support for SPI NAND. And do not
>> erase bad blocks in spi_nand_erase.
>
> Hm, can you put patch 4 before patch 3 (or maybe merge the 2 patches?).

Let's merge these two patches.

>
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/spi/spinand_base.c | 116 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 116 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
>> index 1bc57e9..442997d 100644
>> --- a/drivers/mtd/nand/spi/spinand_base.c
>> +++ b/drivers/mtd/nand/spi/spinand_base.c
>> @@ -1003,6 +1003,113 @@ static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
>>       return ret;
>>  }
>>
>> +/**
>> + * spinand_block_bad - Check if block at offset is bad
>> + * @mtd: MTD device structure
>> + * @offs: offset relative to mtd start
>> + * @getchip: 0, if the chip is already selected
>> + */
>> +static int spinand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
>
> Please don't drop the getchip parameter and let the caller take the
> spi NAND lock. If you want to make it clear that the function should be
> called with the lock held, you can rename it spinand_block_bad_locked()
> and/or document this expectation in the function doc header.

Noted. Fix it in v3

>
>> +{
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     struct mtd_oob_ops ops = {0};
>> +     u32 block_addr;
>> +     u8 bad[2] = {0, 0};
>> +     u8 ret = 0;
>> +
>> +     block_addr = nand_offs_to_eraseblock(nand, ofs);
>> +     ops.mode = MTD_OPS_PLACE_OOB;
>> +     ops.ooblen = 2;
>> +     ops.oobbuf = bad;
>> +
>> +     if (getchip)
>> +             spinand_get_device(mtd_to_spinand(mtd));
>> +     spinand_do_read_ops(mtd, nand_eraseblock_to_offs(nand, block_addr), &ops);
>> +     if (getchip)
>> +             spinand_release_device(mtd_to_spinand(mtd));
>> +     if (bad[0] != 0xFF || bad[1] != 0xFF)
>> +             ret =  1;
>> +
>> +     return ret;
>> +}
