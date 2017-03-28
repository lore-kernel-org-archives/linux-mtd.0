Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csg3W-0007Ry-Ir
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 01:36:20 +0000
Received: by mail-lf0-x241.google.com with SMTP id n78so9025509lfi.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2017 18:35:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <37c3dc9e-55a1-2a91-075d-587d3ffb9b0b@denx.de>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-2-git-send-email-peterpandong@micron.com>
 <37c3dc9e-55a1-2a91-075d-587d3ffb9b0b@denx.de>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 28 Mar 2017 09:35:55 +0800
Message-ID: <CAAyFOR+ZVHRatBL+6uAjJLjvqMR47eJBeP7+_7xdfCvTir1vmA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] mtd: nand: add oob iterator in nand_for_each_page
To: Marek Vasut <marex@denx.de>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
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

Hi Marek,


On Thu, Mar 23, 2017 at 7:13 PM, Marek Vasut <marex@denx.de> wrote:
> On 03/23/2017 10:43 AM, Peter Pan wrote:
>> Iterate nand pages by both page and oob operation.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/nand.h | 38 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index c2197b4..54ded4c 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -84,9 +84,12 @@ struct nand_device {
>>   * @pageoffset: the offset within a page
>>   */
>>  struct nand_page_iter {
>> -     loff_t offs;
>>       int page;
>>       int pageoffs;
>> +     size_t dataleft;
>> +     int ooboffs;
>> +     int oobsize;
>> +     size_t oobleft;
>>  };
>>
>>  /**
>> @@ -193,14 +196,19 @@ static inline int nand_per_page_oobsize(struct nand_device *nand)
>>   * @offs: absolute offset
>>   * @iter: page iterator
>>   */
>> -static inline void nand_page_iter_init(struct nand_device *nand, loff_t offs,
>> +static inline void nand_page_iter_init(struct nand_device *nand,
>> +                                    loff_t offs, size_t len, u32 ooboffs,
>> +                                    size_t ooblen, u32 oobsize,
>>                                      struct nand_page_iter *iter)
>>  {
>>       u64 page = offs;
>>
>>       iter->pageoffs = do_div(page, nand->memorg.pagesize);
>>       iter->page = page;
>> -     iter->offs = offs;
>> +     iter->dataleft = len;
>> +     iter->ooboffs = ooboffs;
>> +     iter->oobsize = oobsize;
>> +     iter->oobleft = ooblen;
>>  }
>>
>>  /**
>> @@ -212,13 +220,29 @@ static inline void nand_page_iter_next(struct nand_device *nand,
>>                                      struct nand_page_iter *iter)
>>  {
>>       iter->page++;
>> -     iter->offs += nand_page_size(nand) - iter->pageoffs;
>>       iter->pageoffs = 0;
>> +     if (iter->dataleft)
>> +             iter->dataleft -= min_t (int,
>                                          ^^^
>                                          shouldn't this be size_t ?

Yes, you are right, Fix this in v5

>
>> +                                      nand_page_size(nand) - iter->pageoffs,
>> +                                      iter->dataleft);
>> +     if (iter->oobleft)
>> +             iter->oobleft -= min_t(int, iter->oobsize - iter->ooboffs,
>
> DTTO here ?

Fix this in v5

>
>> +                                    iter->oobleft);
>> +}
>> +
>> +static inline bool nand_page_iter_end(struct nand_device *nand,
>> +                                   struct nand_page_iter *iter)
>> +{
>> +     if (iter->dataleft || iter->oobleft)
>> +             return false;
>> +     return true;
>>  }
>>
>> -#define nand_for_each_page(nand, start, len, iter)           \
>> -     for (nand_page_iter_init(nand, start, iter);            \
>> -          (iter)->offs < (start) + (len);                    \
>> +#define nand_for_each_page(nand, start, len, ooboffs, ooblen,        \
>> +                        oobsize, iter)       \
>
> What's the difference between ooblen and oobsize ? That is totally
> confusing , so add a comment explaining that ...

Yes, A comment is needed. Fix this in v5

Thanks
Peter Pan

>
>> +     for (nand_page_iter_init(nand, start, len, ooboffs,     \
>> +                              ooblen, oobsize, iter);        \
>> +          !nand_page_iter_end(nand, iter);           \
>>            nand_page_iter_next(nand, iter))
>>
>>  /**
>>
>
>
> --
> Best regards,
> Marek Vasut
