Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xig6V-0005cz-OQ
 for linux-mtd@lists.infradead.org; Mon, 27 Oct 2014 08:56:45 +0000
Message-ID: <544E08AE.7080506@nod.at>
Date: Mon, 27 Oct 2014 09:56:14 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
In-Reply-To: <544E052B.1040505@codeaurora.org>
Content-Type: text/plain; charset=utf-8
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

Tanya,

Am 27.10.2014 um 09:41 schrieb Tanya Brokhman:
>> So, your patch addresses the following issue:
>> We need to re-read a PEB after a specific time (to detect bit rot) or after N reads (to detect read disturb issues).
>> Is this correct?
> 
> Not exactly... We need to scrub a PEB that is being frequently read from in order to prevent bit-flip errors that might occur due to read-disturb

This is what I meant with "after N reads". :)

>>
>> Currently users of UBI do this by having cron jobs which read the complete UBI volume
>> and then cause scrub work.
>> The draw back of this is that only UBI payload will be read and not all data like EC and VID headers.
>> I understand that you want to fix this issue.
> 
> Not sure I completely understand what this crons do but the last patch in the series does something similar.

The cron job reads the complete UBI volume. i.e. dd=/dev/ubi0_X of=/dev/null. It will trigger scrub work
for bit-flipping PEBs. Is the poor men variant of your feature.

>>
>> According to my opinion it is not a good idea to store read counters and timestamps into the UBI/Fastmap on-disk layout.
>> Both the read counters and timestamps don't have to be exact values.
> 
> Why not? Storing last_erase_timestamp doesn't increase the memory consumption on NAND since I used reserved bytes in the ec_header. I agree that the RAM is increased but I couldn't
> find any other way to have these statistics saved.
> read_counters can be saved ONLY as part of fastmap unfortunately because of the erase-before-write limitation.

Please explain in detail why those counters have to be exact.
I was not complaining about RAM consumption. But I think we should change the on-disk layout only for very
serious reasons.

>>
>> What about this idea?
>> Add a userspace interface which allows UBI to expose read counters and last access timestamps.
> 
> Where will you save those?

In a plain file? As I said, the counters don't have to be exact. If you lose one cycle, who cares....
The counters and timestamps are only a rough estimate.
i.e. the userspace daemon dumps all this informations from UBI and stores them to a file (or a static UBI volume).
Upon system boot it restores them.

>> A userspace daemon (let's name it ubihealthd) then can decide whether it is time to trigger a re-read of a PEB.
> 
> Not a re-read - scrub. read-disturb is fixed by erasing the PEB.

It will trigger a scrub work if bit-flipps happen. But what I was trying to say, this all can be done perfectly fine
in userspace.

>> This daemon can also store and load the timestamp values and counters from and to UBI. If it misses these meta data some times due to a
>> power cut it won't hurt.
> 
> Not sure i follow. How is this better then doing this from the kernel? you do have to store the timestamps and the read_counters somewhere and they are both updated in the ubi
> layer. I must be missing something here. Could you please elaborate on your idea?

If it can be done in userspace, do it in userspace. We have to make sure that the kernel stays maintainable.
We really don't want to add new complexity which is not really needed.

>> We could also add another internal UBI volume which can carry these data.
> 
> I'm afraid I have to disagree with this idea. First of all having a dedicated volume for this data is an overkill. Its not a sufficient amount of data to reserve a volume for. and
> what about the PEBs that belong to this volume? Taking this feature out of the UBI layer is just complicated, feels wrong from design perspective, and I don't see the benefit of
> it. Basically, its very similar to the wear-leveling but for "reads" instead of "writes".

But adding this data to fastmap is a better idea? fastmap is also just another internal volume.

>>
>> All in all, I like the idea but changing/extending the on-disk layout is overkill IMHO.
> 
> Why? Without addressing this issues we can't have devices with life span of more then ~5 years (and we need to). And this is very similar to wear-leveling and erase counters. So
> why is read-counters and erase_timestamp is an overkill?
> I'm working on your idea of changing the fastmap layout to save all the read disturb data at the end of it and not integrated into fastmap existing data structures (as is done in
> this version of the code). But as I see it, fastmap has to be updates as well.

I meant that adding these data to the on-disk layout is overkill. I like your feature but not the part
where you extend the on-disk layout. In my opinion most of it can be done without storing this data into fastmap
or other UBI internal on-disk data structures.
As I said, the counters don't have to be exact. Let a daemon handle and persist them.

Thanks,
//richard
