Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgtvL-0000dB-Em
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 13:27:22 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id u85DQ5si026216
 for <linux-mtd@lists.infradead.org>; Mon, 5 Sep 2016 22:26:06 +0900
Received: by mail-yw0-f181.google.com with SMTP id s85so8757328ywg.3
 for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2016 06:26:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71387535-39e5-9cbc-71c4-d5142e409110@sigma-star.at>
References: <1473058466-10831-1-git-send-email-hs@denx.de>
 <71387535-39e5-9cbc-71c4-d5142e409110@sigma-star.at>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Sep 2016 22:26:04 +0900
Message-ID: <CAK7LNATR_sZf+3xj=zGPK4GwAikHkXsX_kVWrqAni5CQLW810A@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: compress lines for immediate return
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2016-09-05 22:18 GMT+09:00 David Oberhollenzer
<david.oberhollenzer@sigma-star.at>:
> On 09/05/2016 08:54 AM, Heiko Schocher wrote:
>> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
>> index 11a11b3..48d6851 100644
>> --- a/fs/ubifs/budget.c
>> +++ b/fs/ubifs/budget.c
>> @@ -77,7 +77,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
>>   */
>>  static int run_gc(struct ubifs_info *c)
>>  {
>> -     int err, lnum;
>> +     int lnum;
>>
>>       /* Make some free space by garbage-collecting dirty space */
>>       down_read(&c->commit_sem);
>> @@ -88,10 +88,7 @@ static int run_gc(struct ubifs_info *c)
>>
>>       /* GC freed one LEB, return it to lprops */
>>       dbg_budg("GC freed LEB %d", lnum);
>> -     err = ubifs_return_leb(c, lnum);
>> -     if (err)
>> -             return err;
>> -     return 0;
>> +     return = ubifs_return_leb(c, lnum);
>>  }
>>
>
> Apart from the other issues discussed below and in v1, I don't
> believe that this _ever_ compiled successfully.
>


Just in case:

It was not me who added '=' after 'return'.
(I usually run build-test before sending my patches.)





-- 
Best Regards
Masahiro Yamada
