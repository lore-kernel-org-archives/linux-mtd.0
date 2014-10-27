Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xifrw-0007lp-8o
 for linux-mtd@lists.infradead.org; Mon, 27 Oct 2014 08:41:40 +0000
Message-ID: <544E052B.1040505@codeaurora.org>
Date: Mon, 27 Oct 2014 10:41:15 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at>
In-Reply-To: <544D5BEC.50802@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/26/2014 10:39 PM, Richard Weinberger wrote:
> Am 26.10.2014 um 14:49 schrieb Tanya Brokhman:
>> One of the limitations of the NAND devices is the method used to read
>> NAND flash memory may cause bit-flips on the surrounding cells and result
>> in uncorrectable ECC errors. This is known as the read disturb or data
>> retention.
>>
>> Today’s Linux NAND drivers implementation doesn’t address the read disturb
>> and the data retention limitations of the NAND devices. To date these
>> issues could be overlooked since the possibility of their occurrence in
>> today’s NAND devices is very low.
>>
>> With the evolution of NAND devices and the requirement for a “long life”
>> NAND flash, read disturb and data retention can no longer be ignored
>> otherwise there will be data loss over time.
>>
>> The following patch set implements handling of Read-disturb and Data
>> retention by the UBI layer.
>
> So, your patch addresses the following issue:
> We need to re-read a PEB after a specific time (to detect bit rot) or after N reads (to detect read disturb issues).
> Is this correct?

Not exactly... We need to scrub a PEB that is being frequently read from 
in order to prevent bit-flip errors that might occur due to read-disturb

>
> Currently users of UBI do this by having cron jobs which read the complete UBI volume
> and then cause scrub work.
> The draw back of this is that only UBI payload will be read and not all data like EC and VID headers.
> I understand that you want to fix this issue.

Not sure I completely understand what this crons do but the last patch 
in the series does something similar.

>
> According to my opinion it is not a good idea to store read counters and timestamps into the UBI/Fastmap on-disk layout.
> Both the read counters and timestamps don't have to be exact values.

Why not? Storing last_erase_timestamp doesn't increase the memory 
consumption on NAND since I used reserved bytes in the ec_header. I 
agree that the RAM is increased but I couldn't find any other way to 
have these statistics saved.
read_counters can be saved ONLY as part of fastmap unfortunately because 
of the erase-before-write limitation.

>
> What about this idea?
> Add a userspace interface which allows UBI to expose read counters and last access timestamps.

Where will you save those?

> A userspace daemon (let's name it ubihealthd) then can decide whether it is time to trigger a re-read of a PEB.

Not a re-read - scrub. read-disturb is fixed by erasing the PEB.

> This daemon can also store and load the timestamp values and counters from and to UBI. If it misses these meta data some times due to a
> power cut it won't hurt.

Not sure i follow. How is this better then doing this from the kernel? 
you do have to store the timestamps and the read_counters somewhere and 
they are both updated in the ubi layer. I must be missing something 
here. Could you please elaborate on your idea?

> We could also add another internal UBI volume which can carry these data.

I'm afraid I have to disagree with this idea. First of all having a 
dedicated volume for this data is an overkill. Its not a sufficient 
amount of data to reserve a volume for. and what about the PEBs that 
belong to this volume? Taking this feature out of the UBI layer is just 
complicated, feels wrong from design perspective, and I don't see the 
benefit of it. Basically, its very similar to the wear-leveling but for 
"reads" instead of "writes".

>
> All in all, I like the idea but changing/extending the on-disk layout is overkill IMHO.

Why? Without addressing this issues we can't have devices with life span 
of more then ~5 years (and we need to). And this is very similar to 
wear-leveling and erase counters. So why is read-counters and 
erase_timestamp is an overkill?
I'm working on your idea of changing the fastmap layout to save all the 
read disturb data at the end of it and not integrated into fastmap 
existing data structures (as is done in this version of the code). But 
as I see it, fastmap has to be updates as well.

>
> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
