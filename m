Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkC0c-0005jf-1D
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 13:12:54 +0000
Message-ID: <54538ABC.1040605@codeaurora.org>
Date: Fri, 31 Oct 2014 15:12:28 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at>
In-Reply-To: <5450D6C4.4040400@nod.at>
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

Hi Richard

On 10/29/2014 2:00 PM, Richard Weinberger wrote:
> Tanya,
>
> Am 29.10.2014 um 12:03 schrieb Tanya Brokhman:
>> I'll try to address all you comments in one place.
>> You're right that the read counters don't have to be exact but they do have to reflect the real state.
>
> But it does not really matter if the counters are a way to high or too low?
> It does also not matter if a re-read of adjacent PEBs is issued too often.
> It won't hurt.
>
>> Regarding your idea of saving them to a file, or somehow with userspace involved; This is doable, but such solution will depend on user space implementation:
>> - one need to update kernel with correct read counters (saved somewhere in userspace)
>> - it is required on every boot.
>> - saving the counters back to userspace should be periodically triggered as well.
>> So the minimal workflow for each boot life cycle will be:
>> - on boot: update kernel with correct values from userspace
>
> Correct.
>
>> - kernel updates the counters on each read operation
>
> Yeah, that's a plain simple in kernel counter..
>
>> - on powerdown: save the updated kernel counters back to userspace
>
> Correct. The counters can also be saved once a day by cron.
> If one or two save operations are missed it won't hurt either.
>
>> The read-disturb handling is based on kernel updating and monitoring read counters. Taking this out of the kernel space will result in an incomplete and very fragile solution for
>> the read-disturb problem since the dependency in userspace is just too big.
>
> Why?
> We both agree on the fact that the counters don't have to be exact.
> Maybe I'm wrong but to my understanding they are just a rough indicator that sometime later UBI has to check for bitrot/flips.

The idea is to prevent data loss, to prevent errors while reading, 
because we might hit errors we can't fix. So although the 
read_disturb_threshold is a rough estimation based on statistics, we 
can't ignore it and need to stay close to the calculated statistics.

Its really the same as wear-leveling. You have a limitation that each 
peb can be erased limited number of times. This erase-limit is also an 
estimation based on statistics collected by the card vendor. But you do 
want to know the exact number of erase counter to prevent erasing the 
block extensively.

>
>> Another issue to consider is that each SW upgrade will result in loosing the counters saved in userspace and reset all. Otherwise, system upgrade process will also have to be updated.
>
> Does it hurt if these counters are lost upon an upgrade?
> Why do we need them for ever?
> If they start after an upgrade from 0 again heavily read PEBs will quickly gain a high counter and will be checked.

yes, we do need the ACCURATE counters and cant loose them. For example: 
we have a heavily read block. It was read from 100 times when the 
read-threshold is 101. Meaning, the 101 read will most probably fail.
You do a SW upgrade, and set the read-counter for this block as 0 and 
don't scrubb it. Next time you try reading from it (since it's heavily 
read from block), you'll get errors. If you're lucky, ecc will fx them 
for you, but its not guarantied.

>
> And of course these counters can be preserved. One can also place them into a UBI static volume.
> Or use a sane upgrade process...

"Sane upgrade" means that in order to support read-disturb we twist the 
users hand into implementing not a trivial logic in userspace.

>
> As I wrote in my last mail we could also create a new internal UBI volume to store these counters.
> Then you can have the logic in kernel but don't have to change the UBI on-disk layout.
>
>> The read counters are very much like the ec counters used for wear-leveling; One is updated on each erase, other on each read; One is used to handle issues caused by frequent
>> writes (erase operations), the  other handle issues caused by frequent reads.
>> So how are the two different? Why isn't wear-leveling (and erase counters) handled by userspace? My guess that the decision to encapsulate the wear-leveling into the kernel was due
>> to the above mentioned reasons.
>
> The erase counters are crucial for UBI to operate. Even while booting up the kernel and mounting UBIFS the EC counters have to available
> because UBI maybe needs to move LEBs around or has to find free PEBs which are not worn out. I UBI makes here a bad decision things will break.

Same with read-counters and last_erase_timestamps. If ec counters are 
lost, we might get with bad blocks (since they are worn out) and have 
data loss.
If we ignore read-disturb and don't' scrubb heavily read blocks we will 
have data loss as well.
the only difference between the 2 scenarios is "how long before it 
happens". Read-disturb wasn't an issue since average lifespan of a nand 
device was ~5 years. Read-disturb occurs in a longer lifespan. that's 
why it's required now: a need for a "long life nand".

>
> Again, to my understanding read counters are just a rough indicator when to have a check.
> If we don't do this check immediately, nothing will go bad. As I understand the feature it is something like "Oh, the following PEBs got read a lot in the last few hours, let's
> trigger a check later." Same applies for the timestamps.

I'm afraid your understanding is inaccurate :) Hope I explained in the 
prev paragraph why.

>
> Thanks,
> //richard
>
> P.s: Is my assumption correct that read counters are needed because newer MLC-NANDs are so crappy? ;-)
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
