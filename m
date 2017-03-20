Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cppIp-0008FG-7X
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 04:52:21 +0000
Received: by mail-lf0-x241.google.com with SMTP id v2so9137902lfi.2
 for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2017 21:51:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317140750.463d1d32@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-2-git-send-email-peterpandong@micron.com>
 <20170317140750.463d1d32@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 20 Mar 2017 12:51:57 +0800
Message-ID: <CAAyFORLdB93oC9uhxWFkKYbbiMmYjMr1BqUqaXuqG7m-n8+V0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] mtd: nand: add more helpers in nand.h
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
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

On Fri, Mar 17, 2017 at 9:07 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 16 Mar 2017 14:47:30 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit adds some helpers in nand.h
>>     nand_size()
>>     valid_nand_address()
>>     valid_nand_oob_ops()
>>     nand_oob_ops_across_page()
>>     valid_nand_erase_ops()
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/nand.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index c2197b4..4a812e6 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -410,6 +410,65 @@ static inline int nand_neraseblocks(struct nand_device *nand)
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
>> +static inline bool valid_nand_address(struct nand_device *nand, loff_t addr)
>
> Please keep consistent prefixes. Maybe we should name it
> nand_check_address(), return -EINVAL if it's wrong and 0 otherwise:
>
> static inline int nand_check_address(struct nand_device *nand,
>                                      loff_t addr)
> {
>         return addr < nand_size(nand) ? 0 : -EINVAL;
> }

Fix this in v4

>
>> +{
>> +     return addr < nand_size(nand);
>> +}
>> +
>> +static inline bool valid_nand_oob_ops(struct nand_device *nand, loff_t start,
>> +                                   struct mtd_oob_ops *ops)
>> +{
>> +     struct mtd_info *mtd = nand_to_mtd(nand);
>> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> +             mtd->oobavail : mtd->oobsize;
>> +
>> +     if (ops->ooboffs >= ooblen)
>> +             return false;
>> +     if (ops->ooboffs + ops->ooblen >
>> +         (nand_len_to_pages(nand, nand_size(nand)) -
>> +                            nand_offs_to_page(nand, start)) * ooblen)
>> +             return false;
>> +
>> +     return true;
>> +}
>
> Ditto.

Fix this in v4.
BTW, I considered to put check the mtd ops consistency here. What do you think?

>
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
>> +static inline bool valid_nand_erase_ops(struct nand_device *nand,
>> +                                     struct erase_info *einfo)
>
> Ditto.

Fix this in v4.

Thanks
Peter Pan
