Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctV4s-0005Ix-Ce
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:05:08 +0000
Received: by mail-lf0-x244.google.com with SMTP id n78so3830120lfi.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 01:04:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170329215749.1c35f780@bbrezillon>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-4-git-send-email-peterpandong@micron.com>
 <20170329215749.1c35f780@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 30 Mar 2017 16:04:44 +0800
Message-ID: <CAAyFORLydLDvTXTbHz8p4a7qA4rK+v5qS+gcwGc3frEjmO8Y7A@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] mtd: nand: add more helpers in nand.h
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
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

On Thu, Mar 30, 2017 at 3:57 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 23 Mar 2017 17:43:40 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit adds some helpers in nand.h
>>     nand_size()
>>     nand_check_address()
>>     nand_check_oob_ops()
>>     nand_oob_ops_across_page()
>>     nand_check_erase_ops()
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/nand.h | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 54ded4c..0c52401 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -434,6 +434,68 @@ static inline int nand_neraseblocks(struct nand_device *nand)
>>  }
>>
>>  /**
>> + * nand_size - Get NAND size
>> + * @nand: NAND device
>> + *
>> + * Returns the total size exposed by @nand.
>> + */
>> +static inline u64 nand_size(struct nand_device *nand)
>> +{
>> +     return nand->memorg.ndies * nand->memorg.diesize;
>> +}
>> +
>
> The nand_size() function should probably go in the commit introducing
> the interface-agnostic NAND layer (in my own series).
>
> Since you'll be the first one to use the generic NAND layer, I propose
> that you start maintaining my patch-set along with your SPI NAND
> patches.

You mean that I send your patch-set with SPI NAND patches? If so, you want
me to do this in v5 or when SPI NAND patches is ready to merge?

Thanks,
Peter Pan

>
>> +static inline int nand_check_address(struct nand_device *nand, loff_t addr)
>> +{
>> +     return addr < nand_size(nand) ? 0 : -EINVAL;
>> +}
>> +
>> +static inline int nand_check_oob_ops(struct nand_device *nand, loff_t start,
>> +                                  struct mtd_oob_ops *ops)
>> +{
>> +     struct mtd_info *mtd = nand_to_mtd(nand);
>> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> +             mtd->oobavail : mtd->oobsize;
>> +
>> +     if ((!!ops->datbuf != !!ops->len) ||
>> +         (!!ops->oobbuf != !!ops->ooblen))
>> +             return -EINVAL;
>> +     if (ops->ooboffs >= ooblen)
>> +             return -EINVAL;
>> +     if (ops->ooboffs + ops->ooblen >
>> +         (nand_len_to_pages(nand, nand_size(nand)) -
>> +                            nand_offs_to_page(nand, start)) * ooblen)
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>> +
>> +static inline bool nand_oob_ops_across_page(struct nand_device *nand,
>> +                                         struct mtd_oob_ops *ops)
>> +{
>> +     struct mtd_info *mtd = nand_to_mtd(nand);
>> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> +                  mtd->oobavail : mtd->oobsize;
>> +
>> +     return (ops->ooboffs + ops->ooblen) > ooblen;
>> +}
>> +
>> +static inline int nand_check_erase_ops(struct nand_device *nand,
>> +                                    struct erase_info *einfo)
>> +{
>> +     /* check address align on block boundary */
>> +     if (einfo->addr & (nand_eraseblock_size(nand) - 1))
>> +             return -EINVAL;
>> +     /* check lendth align on block boundary */
>> +     if (einfo->len & (nand_eraseblock_size(nand) - 1))
>> +             return -EINVAL;
>> +     /* Do not allow erase past end of device */
>> +     if ((einfo->addr + einfo->len) > nand_size(nand))
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>
> Hm, looking at these functions and the tests already done in mtdcore.c
> I'm not sure this is the best location.
> AFAICS, all these tests can be done (or are already done) at the MTD
> level, and that's where they are the most useful. The only exception I
> see where it could be useful is when the BBT code directly calls nand
> functions instead of mtd ones, but this should not happen that much.
>
>> +
>> +/**
>>   * nand_register - Register a NAND device
>>   * @nand: NAND device
>>   *
>
