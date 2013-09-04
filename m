Received: from mail-qe0-x236.google.com ([2607:f8b0:400d:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHFML-0000hy-0n
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 15:51:09 +0000
Received: by mail-qe0-f54.google.com with SMTP id cy11so266364qeb.41
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 08:50:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5226ED69.8080506@nod.at>
References: <1377511730-14834-1-git-send-email-richard@nod.at>
 <5226ED69.8080506@nod.at>
Date: Wed, 4 Sep 2013 09:50:46 -0600
Message-ID: <CACwUX0PZ4RY6JDvOo7KS_rAFtUrUjPYmm2PG-PENMSkXq3CiSQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: fix refill_wl_user_pool()
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

Is there more background on the bug this patch fixes?
We are working on root-causing an issue where a UBIFS write fails with
ENOSPC, even though there is no plausible reason that the filesystem
should be out of space.  The ENOSPC errors persist across multiple
reboots, only to disappear magically later on.  We haven't found a
reliable way to reproduce this so far, so we're still tapping a bit in
the dark.

  --david

On Wed, Sep 4, 2013 at 2:20 AM, Richard Weinberger <richard@nod.at> wrote:
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
>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
