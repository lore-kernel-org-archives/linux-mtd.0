Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VN3Gn-0006Ld-TR
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2013 16:09:27 +0000
Received: by mail-vc0-f175.google.com with SMTP id ia10so438968vcb.20
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2013 09:09:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5226ED69.8080506@nod.at>
References: <1377511730-14834-1-git-send-email-richard@nod.at>
 <5226ED69.8080506@nod.at>
Date: Fri, 20 Sep 2013 18:09:02 +0200
Message-ID: <CAFLxGvwQ64QpC7GB5wG9S1RaQVfGuK5sn_JqABrdEmkqXY2KwA@mail.gmail.com>
Subject: Re: [PATCH] UBI: fix refill_wl_user_pool()
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Cc: richard.genoud@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 4, 2013 at 10:20 AM, Richard Weinberger <richard@nod.at> wrote:
> Am 26.08.2013 12:08, schrieb Richard Weinberger:
>> If no free PEBs are available refill_wl_user_pool() must not
>> return with -ENOSPC immediately.
>> It has to block till produce_free_peb() produced a free PEB.
>>
>> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/wl.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index c95bfb1..02317c1 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -599,10 +599,6 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
>>       return_unused_pool_pebs(ubi, pool);
>>
>>       for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
>> -             if (!ubi->free.rb_node ||
>> -                (ubi->free_count - ubi->beb_rsvd_pebs < 1))
>> -                     break;
>> -
>>               pool->pebs[pool->size] = __wl_get_peb(ubi);
>>               if (pool->pebs[pool->size] < 0)
>>                       break;
>>
>
> Artem, please don't forget do apply this patch.

*ping*

-- 
Thanks,
//richard
