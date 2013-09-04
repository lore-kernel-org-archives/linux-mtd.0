Received: from mail-qe0-x231.google.com ([2607:f8b0:400d:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHFYp-00011u-KN
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 16:04:04 +0000
Received: by mail-qe0-f49.google.com with SMTP id da11so241482qeb.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 09:03:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52275960.20309@nod.at>
References: <1377511730-14834-1-git-send-email-richard@nod.at>
 <5226ED69.8080506@nod.at>
 <CACwUX0PZ4RY6JDvOo7KS_rAFtUrUjPYmm2PG-PENMSkXq3CiSQ@mail.gmail.com>
 <52275960.20309@nod.at>
Date: Wed, 4 Sep 2013 10:03:42 -0600
Message-ID: <CACwUX0P5+bCbQMg=pYV8jQ7KGUEGSkdTyyHRhUDGxi5j0YbQTw@mail.gmail.com>
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

Thanks for the info.  We are not using FASTMAP, so it doesn't explain
what we're seeing.

Best regards,

  --david

On Wed, Sep 4, 2013 at 10:01 AM, Richard Weinberger <richard@nod.at> wrote:
> David,
>
> Am 04.09.2013 17:50, schrieb David Mosberger-Tang:
>> Richard,
>>
>> Is there more background on the bug this patch fixes?
>> We are working on root-causing an issue where a UBIFS write fails with
>> ENOSPC, even though there is no plausible reason that the filesystem
>> should be out of space.  The ENOSPC errors persist across multiple
>> reboots, only to disappear magically later on.  We haven't found a
>> reliable way to reproduce this so far, so we're still tapping a bit in
>> the dark.
>
> The said patch fixes an issue if your Kernel was build with experimental Fastmap support.
> If you have CONFIG_MTD_UBI_FASTMAP=n you are not affected.
>
> Fastmap uses two pools of available PEBs. Every time a pool is filled with used PEBs
> it writes out a new fastmap to the flash.
> The bug in refill_wl_user_pool() was that the function did not try hard enough to get a free PEB
> and failed too early with -ENOSPC.
>
> Thanks,
> //richard
>
>>   --david
>>
>> On Wed, Sep 4, 2013 at 2:20 AM, Richard Weinberger <richard@nod.at> wrote:
>>> Am 26.08.2013 12:08, schrieb Richard Weinberger:
>>>> If no free PEBs are available refill_wl_user_pool() must not
>>>> return with -ENOSPC immediately.
>>>> It has to block till produce_free_peb() produced a free PEB.
>>>>
>>>> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>> ---
>>>>  drivers/mtd/ubi/wl.c | 4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>>>> index c95bfb1..02317c1 100644
>>>> --- a/drivers/mtd/ubi/wl.c
>>>> +++ b/drivers/mtd/ubi/wl.c
>>>> @@ -599,10 +599,6 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
>>>>       return_unused_pool_pebs(ubi, pool);
>>>>
>>>>       for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
>>>> -             if (!ubi->free.rb_node ||
>>>> -                (ubi->free_count - ubi->beb_rsvd_pebs < 1))
>>>> -                     break;
>>>> -
>>>>               pool->pebs[pool->size] = __wl_get_peb(ubi);
>>>>               if (pool->pebs[pool->size] < 0)
>>>>                       break;
>>>>
>>>
>>> Artem, please don't forget do apply this patch.
>>>
>>> Thanks,
>>> //richard
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
