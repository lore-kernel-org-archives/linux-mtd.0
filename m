Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHSmO-0000Ej-RD
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2013 06:10:58 +0000
Message-ID: <52282019.6020700@nod.at>
Date: Thu, 05 Sep 2013 08:09:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [PATCH] UBI: fix refill_wl_user_pool()
References: <1377511730-14834-1-git-send-email-richard@nod.at>
 <5226ED69.8080506@nod.at>
 <CACwUX0PZ4RY6JDvOo7KS_rAFtUrUjPYmm2PG-PENMSkXq3CiSQ@mail.gmail.com>
 <52275960.20309@nod.at>
 <CACwUX0P5+bCbQMg=pYV8jQ7KGUEGSkdTyyHRhUDGxi5j0YbQTw@mail.gmail.com>
In-Reply-To: <CACwUX0P5+bCbQMg=pYV8jQ7KGUEGSkdTyyHRhUDGxi5j0YbQTw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Am 04.09.2013 18:03, schrieb David Mosberger-Tang:
> Thanks for the info.  We are not using FASTMAP, so it doesn't explain
> what we're seeing.

Maybe you are suffering from the issue fixed by:
http://git.infradead.org/linux-ubi.git/commit/5ef4414f4bc26a19cfd5cd11aee9697a863e4d51

This patch will hopefully make it into 3.12-rc1 and then back into -stable as soon as possible.

Thanks,
//richard

> Best regards,
> 
>   --david
> 
> On Wed, Sep 4, 2013 at 10:01 AM, Richard Weinberger <richard@nod.at> wrote:
>> David,
>>
>> Am 04.09.2013 17:50, schrieb David Mosberger-Tang:
>>> Richard,
>>>
>>> Is there more background on the bug this patch fixes?
>>> We are working on root-causing an issue where a UBIFS write fails with
>>> ENOSPC, even though there is no plausible reason that the filesystem
>>> should be out of space.  The ENOSPC errors persist across multiple
>>> reboots, only to disappear magically later on.  We haven't found a
>>> reliable way to reproduce this so far, so we're still tapping a bit in
>>> the dark.
>>
>> The said patch fixes an issue if your Kernel was build with experimental Fastmap support.
>> If you have CONFIG_MTD_UBI_FASTMAP=n you are not affected.
>>
>> Fastmap uses two pools of available PEBs. Every time a pool is filled with used PEBs
>> it writes out a new fastmap to the flash.
>> The bug in refill_wl_user_pool() was that the function did not try hard enough to get a free PEB
>> and failed too early with -ENOSPC.
>>
>> Thanks,
>> //richard
>>
>>>   --david
>>>
>>> On Wed, Sep 4, 2013 at 2:20 AM, Richard Weinberger <richard@nod.at> wrote:
>>>> Am 26.08.2013 12:08, schrieb Richard Weinberger:
>>>>> If no free PEBs are available refill_wl_user_pool() must not
>>>>> return with -ENOSPC immediately.
>>>>> It has to block till produce_free_peb() produced a free PEB.
>>>>>
>>>>> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
>>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>>> ---
>>>>>  drivers/mtd/ubi/wl.c | 4 ----
>>>>>  1 file changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>>>>> index c95bfb1..02317c1 100644
>>>>> --- a/drivers/mtd/ubi/wl.c
>>>>> +++ b/drivers/mtd/ubi/wl.c
>>>>> @@ -599,10 +599,6 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
>>>>>       return_unused_pool_pebs(ubi, pool);
>>>>>
>>>>>       for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
>>>>> -             if (!ubi->free.rb_node ||
>>>>> -                (ubi->free_count - ubi->beb_rsvd_pebs < 1))
>>>>> -                     break;
>>>>> -
>>>>>               pool->pebs[pool->size] = __wl_get_peb(ubi);
>>>>>               if (pool->pebs[pool->size] < 0)
>>>>>                       break;
>>>>>
>>>>
>>>> Artem, please don't forget do apply this patch.
>>>>
>>>> Thanks,
>>>> //richard
>>>>
>>>> ______________________________________________________
>>>> Linux MTD discussion mailing list
>>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
