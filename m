Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmM0C-0007OB-9k
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 12:17:25 +0000
Received: from [10.18.168.100] (unknown [185.23.60.4])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tlinder@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DE9F13F686
 for <linux-mtd@lists.infradead.org>; Thu,  6 Nov 2014 12:17:01 +0000 (UTC)
Message-ID: <545B66BA.4090904@codeaurora.org>
Date: Thu, 06 Nov 2014 14:16:58 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <545630E1.8020505@codeaurora.org>
 <1415261234.958.171.camel@sauron.fi.intel.com>
In-Reply-To: <1415261234.958.171.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/6/2014 10:07 AM, Artem Bityutskiy wrote:
> On Sun, 2014-11-02 at 15:25 +0200, Tanya Brokhman wrote:
>> On 10/31/2014 5:39 PM, Richard Weinberger wrote:
>>> Am 31.10.2014 um 16:34 schrieb Richard Weinberger:
>>>> Hi Tanya,
>>>>
>>>> Am 31.10.2014 um 14:12 schrieb Tanya Brokhman:
>>>>> Hi Richard
>>>>>
>>>>> On 10/29/2014 2:00 PM, Richard Weinberger wrote:
>>>>>> Tanya,
>>>>>>
>>>>>> Am 29.10.2014 um 12:03 schrieb Tanya Brokhman:
>>>>>>> I'll try to address all you comments in one place.
>>>>>>> You're right that the read counters don't have to be exact but they do have to reflect the real state.
>>>>>>
>>>>>> But it does not really matter if the counters are a way to high or too low?
>>>>>> It does also not matter if a re-read of adjacent PEBs is issued too often.
>>>>>> It won't hurt.
>>>>>>
>>>>>>> Regarding your idea of saving them to a file, or somehow with userspace involved; This is doable, but such solution will depend on user space implementation:
>>>>>>> - one need to update kernel with correct read counters (saved somewhere in userspace)
>>>>>>> - it is required on every boot.
>>>>>>> - saving the counters back to userspace should be periodically triggered as well.
>>>>>>> So the minimal workflow for each boot life cycle will be:
>>>>>>> - on boot: update kernel with correct values from userspace
>>>>>>
>>>>>> Correct.
>>>>>>
>>>>>>> - kernel updates the counters on each read operation
>>>>>>
>>>>>> Yeah, that's a plain simple in kernel counter..
>>>>>>
>>>>>>> - on powerdown: save the updated kernel counters back to userspace
>>>>>>
>>>>>> Correct. The counters can also be saved once a day by cron.
>>>>>> If one or two save operations are missed it won't hurt either.
>>>>>>
>>>>>>> The read-disturb handling is based on kernel updating and monitoring read counters. Taking this out of the kernel space will result in an incomplete and very fragile solution for
>>>>>>> the read-disturb problem since the dependency in userspace is just too big.
>>>>>>
>>>>>> Why?
>>>>>> We both agree on the fact that the counters don't have to be exact.
>>>>>> Maybe I'm wrong but to my understanding they are just a rough indicator that sometime later UBI has to check for bitrot/flips.
>>>>>
>>>>> The idea is to prevent data loss, to prevent errors while reading, because we might hit errors we can't fix. So although the read_disturb_threshold is a rough estimation based on
>>>>> statistics, we can't ignore it and need to stay close to the calculated statistics.
>>>>>
>>>>> Its really the same as wear-leveling. You have a limitation that each peb can be erased limited number of times. This erase-limit is also an estimation based on statistics
>>>>> collected by the card vendor. But you do want to know the exact number of erase counter to prevent erasing the block extensively.
>>>>
>>>> So you have to update the EC-Header every time we read a PEB...?
>>>>
>>>>>
>>>>>>
>>>>>>> Another issue to consider is that each SW upgrade will result in loosing the counters saved in userspace and reset all. Otherwise, system upgrade process will also have to be
>>>>>>> updated.
>>>>>>
>>>>>> Does it hurt if these counters are lost upon an upgrade?
>>>>>> Why do we need them for ever?
>>>>>> If they start after an upgrade from 0 again heavily read PEBs will quickly gain a high counter and will be checked.
>>>>>
>>>>> yes, we do need the ACCURATE counters and cant loose them. For example: we have a heavily read block. It was read from 100 times when the read-threshold is 101. Meaning, the 101
>>>>> read will most probably fail.
>>>>
>>>> You are trying me to tell that the NAND is that crappy that it will die after 100 reads? I really hope this was just a bad example.
>>>> You *will* loose counters unless you update the EC-Header upon every read, which is also not sane at all.
>>>>
>>>>> You do a SW upgrade, and set the read-counter for this block as 0 and don't scrubb it. Next time you try reading from it (since it's heavily read from block), you'll get errors. If
>>>>> you're lucky, ecc will fx them for you, but its not guarantied.
>>>>>
>>>>>>
>>>>>> And of course these counters can be preserved. One can also place them into a UBI static volume.
>>>>>> Or use a sane upgrade process...
>>>>>
>>>>> "Sane upgrade" means that in order to support read-disturb we twist the users hand into implementing not a trivial logic in userspace.
>>>>>
>>>>>>
>>>>>> As I wrote in my last mail we could also create a new internal UBI volume to store these counters.
>>>>>> Then you can have the logic in kernel but don't have to change the UBI on-disk layout.
>>>>>>
>>>>>>> The read counters are very much like the ec counters used for wear-leveling; One is updated on each erase, other on each read; One is used to handle issues caused by frequent
>>>>>>> writes (erase operations), the  other handle issues caused by frequent reads.
>>>>>>> So how are the two different? Why isn't wear-leveling (and erase counters) handled by userspace? My guess that the decision to encapsulate the wear-leveling into the kernel was due
>>>>>>> to the above mentioned reasons.
>>>>>>
>>>>>> The erase counters are crucial for UBI to operate. Even while booting up the kernel and mounting UBIFS the EC counters have to available
>>>>>> because UBI maybe needs to move LEBs around or has to find free PEBs which are not worn out. I UBI makes here a bad decision things will break.
>>>>>
>>>>> Same with read-counters and last_erase_timestamps. If ec counters are lost, we might get with bad blocks (since they are worn out) and have data loss.
>>>>> If we ignore read-disturb and don't' scrubb heavily read blocks we will have data loss as well.
>>>>> the only difference between the 2 scenarios is "how long before it happens". Read-disturb wasn't an issue since average lifespan of a nand device was ~5 years. Read-disturb occurs
>>>>> in a longer lifespan. that's why it's required now: a need for a "long life nand".
>>>>
>>>> Okay, read-disturb will only happen if you read blocks *very* often. Do you have numbers, datasheets, etc...?
>>>>
>>>> Let's recap.
>>>>
>>>> We need to address two issues:
>>>> a) If a PEB is ready very often we need to scrub it.
>>>> b) PEBs which are not read for a very long time need to be re-read/scrubbed to detect bit-rot
>>>>
>>>> Solving b) is easy, just re-read every PEB from time to time. No persistent data at all is needed.
>>>> To solve a) you suggest adding the read-counter to the UBI on-disk layout like the erase-counter values.
>>>> I don't think that this is a good solution.
>>>> We can perfectly fine save the read-counters from time to time and upon detach either to a file on UBIFS
>>>> or into a new internal value. As read-disturb will only happen after a long time and hence very high read-counters
>>>> it does not matter if we lose some values upon a powercut. i.e. Such that a counter is 50000 instead of 50500.
>>>> Btw: We also have to be very careful that reading data will not wear out the flash.
>>>>
>>>> So, we need a logic within UBI which counts every read access and persists this data in some way.
>>>> As suggested in an earlier mail this can also be done purely in userspace.
>>>> It can also be done within the UBI kernel module. I.e. by storing the counters into a internal volume.
>>>
>>> Another point:
>>> What if we scrub every PEB once a week?
>>> Why would that not work?
>>
>> It will work but it's an overkill because we don't want to scrub (and
>> erase) pebs that don't need this because this way we will ware out the
>> device in terms on wear-leveling.
>
> But the point is - how do you know if they need it or not? How do you
> prove that the thresholds are correct, and not too low? What makes you
> believe that it is the same for all eraseblocks?

the thresholds are configurable. The exact numbers are just estimation 
based on statistics i suppose. anyway, we got the values from the NAND 
manufacturer, as defined by the spec.
I guess its not the same for all blocks but close enough, so the defined 
threshold should be good enough for all blocks.

>
>  From what I read in technical papers some blocs are better and some are
> worse. There are different nano-defects in them. Some start misbehaving
> earlier than others, depending on the temperature.
>
> There is also the "radiation" effect. Say, you have 3 continuous PEBs A,
> B, C. And some PEB D which is far away from them. You never change A, C,
> and D, you only read them. And you change B many times. IIUC, the
> radiation effect is that A and C will accumulate bit-flips earlier than
> D, because D is being erased and re-programmed.

I think you got confused with the block-names (A B C D) because it 
doesn't make sense :) You said D never changes, just read from.

>
> Now the counters approach does not take this into account.

Yes, but for this we will scrub all PEBs from time to time

>
> On the contrary, reading data and scrubbing on the "need-to-do" basis
> takes into account whatever weird effect there is.
>
> Maintaining counters is hard job, and easy to take wrong.

Why? You increment on each READ, reset on each ERASE.
The only thing that is considered "hard" is how to handle power-cuts but 
for this we have a default value and we're working on some other ideas 
how to preserved them better.

  Besides, you
> lose them on power cuts, so they are not mathematically correct anyway.
> And there is guess-work anyway. And you do not take into account all the
> NAND effects.
>
> So why bothering with the complexity instead of just dealing with
> problems on the "by fact" basis: some weird NAND effect happened and we
> see bit-flips? Fine, we just scrub and "refresh" our data.

Because when you see bit-flips it may be too late and you might get too 
many errors then you're capable of fixing. What I'm trying to say - it 
may be too late and you may lose data here. "preferred to prevent rather 
than cure".

  We do not
> know that exactly was the effect, but we know how to detect it and how
> to deal with it.
>
> Isn't it simple and robust approach?
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
