Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xkv8V-0005kH-U3
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 13:24:04 +0000
Message-ID: <54563059.1080405@codeaurora.org>
Date: Sun, 02 Nov 2014 15:23:37 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at>
In-Reply-To: <5453ABF9.4070208@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/31/2014 5:34 PM, Richard Weinberger wrote:
> Hi Tanya,
>
> Am 31.10.2014 um 14:12 schrieb Tanya Brokhman:
>> Hi Richard
>>
>> On 10/29/2014 2:00 PM, Richard Weinberger wrote:
>>> Tanya,
>>>
>>> Am 29.10.2014 um 12:03 schrieb Tanya Brokhman:
>>>> I'll try to address all you comments in one place.
>>>> You're right that the read counters don't have to be exact but they do have to reflect the real state.
>>>
>>> But it does not really matter if the counters are a way to high or too low?
>>> It does also not matter if a re-read of adjacent PEBs is issued too often.
>>> It won't hurt.
>>>
>>>> Regarding your idea of saving them to a file, or somehow with userspace involved; This is doable, but such solution will depend on user space implementation:
>>>> - one need to update kernel with correct read counters (saved somewhere in userspace)
>>>> - it is required on every boot.
>>>> - saving the counters back to userspace should be periodically triggered as well.
>>>> So the minimal workflow for each boot life cycle will be:
>>>> - on boot: update kernel with correct values from userspace
>>>
>>> Correct.
>>>
>>>> - kernel updates the counters on each read operation
>>>
>>> Yeah, that's a plain simple in kernel counter..
>>>
>>>> - on powerdown: save the updated kernel counters back to userspace
>>>
>>> Correct. The counters can also be saved once a day by cron.
>>> If one or two save operations are missed it won't hurt either.
>>>
>>>> The read-disturb handling is based on kernel updating and monitoring read counters. Taking this out of the kernel space will result in an incomplete and very fragile solution for
>>>> the read-disturb problem since the dependency in userspace is just too big.
>>>
>>> Why?
>>> We both agree on the fact that the counters don't have to be exact.
>>> Maybe I'm wrong but to my understanding they are just a rough indicator that sometime later UBI has to check for bitrot/flips.
>>
>> The idea is to prevent data loss, to prevent errors while reading, because we might hit errors we can't fix. So although the read_disturb_threshold is a rough estimation based on
>> statistics, we can't ignore it and need to stay close to the calculated statistics.
>>
>> Its really the same as wear-leveling. You have a limitation that each peb can be erased limited number of times. This erase-limit is also an estimation based on statistics
>> collected by the card vendor. But you do want to know the exact number of erase counter to prevent erasing the block extensively.
>
> So you have to update the EC-Header every time we read a PEB...?

No, I can't save the read-counter as part of the ec_header because of 
the erase-before-write limitation. Thats why the read-counters are saved 
only as part of the fastmap data.
last_erase_timestamp is saved as part of the ec_header and it's updated 
each erase operation together with the erase counter. For 
last_erase_timestamp I used the reserved bytes of the ec_header so not 
much impact here.

>
>>
>>>
>>>> Another issue to consider is that each SW upgrade will result in loosing the counters saved in userspace and reset all. Otherwise, system upgrade process will also have to be
>>>> updated.
>>>
>>> Does it hurt if these counters are lost upon an upgrade?
>>> Why do we need them for ever?
>>> If they start after an upgrade from 0 again heavily read PEBs will quickly gain a high counter and will be checked.
>>
>> yes, we do need the ACCURATE counters and cant loose them. For example: we have a heavily read block. It was read from 100 times when the read-threshold is 101. Meaning, the 101
>> read will most probably fail.
>
> You are trying me to tell that the NAND is that crappy that it will die after 100 reads? I really hope this was just a bad example.

Of course not :) it was just an example. The actual value for 
read-disturb is huge and is defined by the NAND manufacturer.

> You *will* loose counters unless you update the EC-Header upon every read, which is also not sane at all.
>
>> You do a SW upgrade, and set the read-counter for this block as 0 and don't scrubb it. Next time you try reading from it (since it's heavily read from block), you'll get errors. If
>> you're lucky, ecc will fx them for you, but its not guarantied.
>>
>>>
>>> And of course these counters can be preserved. One can also place them into a UBI static volume.
>>> Or use a sane upgrade process...
>>
>> "Sane upgrade" means that in order to support read-disturb we twist the users hand into implementing not a trivial logic in userspace.
>>
>>>
>>> As I wrote in my last mail we could also create a new internal UBI volume to store these counters.
>>> Then you can have the logic in kernel but don't have to change the UBI on-disk layout.
>>>
>>>> The read counters are very much like the ec counters used for wear-leveling; One is updated on each erase, other on each read; One is used to handle issues caused by frequent
>>>> writes (erase operations), the  other handle issues caused by frequent reads.
>>>> So how are the two different? Why isn't wear-leveling (and erase counters) handled by userspace? My guess that the decision to encapsulate the wear-leveling into the kernel was due
>>>> to the above mentioned reasons.
>>>
>>> The erase counters are crucial for UBI to operate. Even while booting up the kernel and mounting UBIFS the EC counters have to available
>>> because UBI maybe needs to move LEBs around or has to find free PEBs which are not worn out. I UBI makes here a bad decision things will break.
>>
>> Same with read-counters and last_erase_timestamps. If ec counters are lost, we might get with bad blocks (since they are worn out) and have data loss.
>> If we ignore read-disturb and don't' scrubb heavily read blocks we will have data loss as well.
>> the only difference between the 2 scenarios is "how long before it happens". Read-disturb wasn't an issue since average lifespan of a nand device was ~5 years. Read-disturb occurs
>> in a longer lifespan. that's why it's required now: a need for a "long life nand".
>
> Okay, read-disturb will only happen if you read blocks *very* often. Do you have numbers, datasheets, etc...?

Yes. In 0001-mtd-ubi-Read-disturb-infrastructure.patch you'll find:
#define UBI_RD_THRESHOLD 100000
Can't share more than that. This value is defined by card manufacturer 
and configurable by this define.

>
> Let's recap.
>
> We need to address two issues:
> a) If a PEB is ready very often we need to scrub it.

right. this is what the read-counter is for.

> b) PEBs which are not read for a very long time need to be re-read/scrubbed to detect bit-rot

it need to be scrubbed. this is for data retention and these pebs are 
found by last_erase_timestamp. I referred to them as "pebs that are 
rarely accessed. "

>
> Solving b) is easy, just re-read every PEB from time to time. No persistent data at all is needed.

That isn't good enough. Because if we just re-read the peb we will find 
the "problematic" once only when the read produces ecc errors. But if we 
relay on that we may be too late because we might hit ecc errors that we 
just wont be able to fix and data will be lost. So the goal is *to 
prevent* ecc errors on read. That's why we need both the read-counter 
(for heavily read pebs) and the last_erase_timestamp (for once that are 
rarely accessed).

> To solve a) you suggest adding the read-counter to the UBI on-disk layout like the erase-counter values.

No, not on disk layout. You're mixing the read-counter with the 
last_erase_timestamp.
read-counter: maintained only at RAM, saved *only* as part of fastmap 
data. If fastmap data is lost: read counters are lost too
last-erase-timestamp: part of ec_header, maintained on disk

> I don't think that this is a good solution.
> We can perfectly fine save the read-counters from time to time and upon detach either to a file on UBIFS
> or into a new internal value. As read-disturb will only happen after a long time and hence very high read-counters
> it does not matter if we lose some values upon a powercut. i.e. Such that a counter is 50000 instead of 50500.
> Btw: We also have to be very careful that reading data will not wear out the flash.
>
> So, we need a logic within UBI which counts every read access and persists this data in some way.
> As suggested in an earlier mail this can also be done purely in userspace.
> It can also be done within the UBI kernel module. I.e. by storing the counters into a internal volume.
>
> My point is that no on-disk layout change at all is needed.

I hope my previous answer addressed the above as well, since you 
misunderstood where the read-counters will be saved.

BTW, I described it all in the documentation file I added in patch #1 :)

>
> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
