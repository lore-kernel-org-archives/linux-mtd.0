Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMFxx-0007fn-IE
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 13:39:48 +0000
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it> <20150731123221.34cf601e@bbrezillon>
 <55BB7ABD.7040008@dave-tech.it> <20150731161032.2b155ccb@bbrezillon>
 <55BBA012.4080600@dave-tech.it> <20150731182709.14c345df@bbrezillon>
 <55BF4D72.8090000@dave-tech.it> <20150803144253.66fc6941@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Han Xu <b45815@freescale.com>, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55BF6F09.9000001@dave-tech.it>
Date: Mon, 3 Aug 2015 15:39:21 +0200
MIME-Version: 1.0
In-Reply-To: <20150803144253.66fc6941@bbrezillon>
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

Il 03/08/2015 14:42, Boris Brezillon ha scritto:
> Adding Artem and Richard in the loop.

thanks ;-)

>
> On Mon, 3 Aug 2015 13:16:02 +0200
> Andrea Scian <rnd4@dave-tech.it> wrote:
>
>>
>> Dear Boris,
>>
>> Il 31/07/2015 18:27, Boris Brezillon ha scritto:
>>> On Fri, 31 Jul 2015 18:19:30 +0200
>>> Andrea Scian <rnd4@dave-tech.it> wrote:
>>>
>>>> Il 31/07/2015 16:10, Boris Brezillon ha scritto:
>>>>> On Fri, 31 Jul 2015 15:40:13 +0200
>>>>> Andrea Scian <rnd4@dave-tech.it> wrote:
>>>>>
>>>>>> Boris,
>>>>>>
>>>>>> Il 31/07/2015 12:32, Boris Brezillon ha scritto:
>>>>>>> Hi Andrea,
>>>>>>>
>>>>>>> Adding Han in Cc.
>>>>>>>
>>>>>>> On Fri, 31 Jul 2015 12:07:21 +0200
>>>>>>> Andrea Scian <rnd4@dave-tech.it> wrote:
>>>>>>>
>>>>>>>> Dear Boris,
>>>>>>>>
>>>>>>>>
>>>>>>>> Il 30/07/2015 19:34, Boris Brezillon ha scritto:
>>>>>>>>> The default NAND read functions are relying on an underlying controller
>>>>>>>>> to correct bitflips, but some of those controller cannot properly fix
>>>>>>>>> bitflips in erased pages.
>>>>>>>>> In case of ECC failures, check if the page of subpage is empty before
>>>>>>>>> reporting an ECC failure.
>>>>>>>> I'm still wondering if chip->ecc.strength is the right threshold.
>>>>>>>>
>>>>>>>> Did you see my comments here [1]? WDYT?
>>>>>>> Yes I've read it, and decided to go for ecc->strength as a first
>>>>>>> step (I'm more interested in discussing the approach than the threshold
>>>>>>> value right now ;-)).
>>>>>> I perfectly understand, that's the reason why I ask if you want to move
>>>>>> to another thread ;-)
>>>>>>
>>>>>>> Anyway, as you pointed out in the thread, writing data on an erased
>>>>>>> page already containing some bitflips might generate even more
>>>>>>> bitflips, so using a different threshold for the erased page check
>>>>>>> makes sense. This threshold should definitely be correlated to the ECC
>>>>>>> strength, but how, that's the question.
>>>>>>>
>>>>>>> How about taking a rather conservative value like 10% of the specified
>>>>>>> ECC strength, and see how it goes.
>>>>>> Yes, I think that there's no real way to get the right value, other than
>>>>>> feedbacks from on-field testing with various devices.
>>>>>>
>>>>>> I'm also thinking about changing how a NAND page is written on the
>>>>>> device, now that we know that even erased page may have (too many!)
>>>>>> bitflips if they has not been so-freshly erased.
>>>>>>
>>>>>> Read on NAND device is lot's faster that write, so maybe we can:
>>>>>>
>>>>>> a) read the page before write it, check for bitflips on erased area and
>>>>>> write it only if it fit our threshold
>>>>>>
>>>>>> b) read the page after write it and check if the bitflips are lower that
>>>>>> a give value
>>>>>>
>>>>>> In this way:
>>>>>> - we can use ecc_strength as read threshold, because it fits all the
>>>>>> other NAND read
>>>>>>
>>>>>> - we can use "something a bit lower than" mtd->bitflip_threshold on
>>>>>> read-before-write or read-after-write. If we don't do so the block will
>>>>>> be scrubbed next time we read it again (if we are lucky.. if we are
>>>>>> unlucky the block will have bitflip > ecc_strength!): IOW we did a write
>>>>>> that will trigger another erase/write cycle.
>>>>>>
>>>>>> Am I misunderstanding something?
>>>>> Nope, but this implies doing an extra read after each write :-/
>>>>>
>>>> Let's wait what the others says about this, but I would like to put some
>>>> numbers in it.
>>> Sure.
>>>
>>>> My micron MLC device says
>>>> - read page max 75 uS
>>>> - write page typ 1300uS, max 2600uS
>>>>
>>>> If we implement read-before-write (which is, IMO, the best approach), in
>>>> the worst overhead we have is 1375uS vs 1300uS, which is ~6%.
>>>> Please note that, if you read a page that "is not suitable" for write,
>>>> you avoid the write time, schedule it for scrubbing, and use another
>>>> free page.
>>> Indeed, that's not such a big overhead.
>>>
>>>> Probably I'm a bit optimistic because we also need to take in account
>>>> other latencies (DMA setup, ECC engine, buffer copies and so on) but
>>>> it's a starting point ;-)
>>> Yep, if you test it, could you provide some speed test results (with
>>> and without this solution).
>>
>> I think I can find some time to do some performance tests on real hardware.
>> Can you please help me in finding:
>> - which benchmark to use (currently I'm using bonnie++ on UBIFS, maybe I
>> can you just mtd_speedtest)
>> - where to implement those read
>
> I think the test should be done at the UBI layer if we want to check
> the real impact of the additional read sequence, but given the answer I
> gave to your other question I'm not sure this is relevant anymore ;-).
>
>>
>> For the second point I think we can implement it a UBI or MTD level.
>> I think the former will allow us to easily schedule scrubbing and choose
>> another block to issue the write to. However I don't really know how to
>> implement it (I don't really know so much about the UBI code).
>>
>> The latter, at least for me, is easier to implement: I think I can find
>> the place to add the page read on my own, anyway any clue is welcome ;-)
>> But I think it will be harder (or impossible) to choose where to issue
>> the write, unless UBI already do so when it saw an MTD write failure.
>>
>>> And I wonder if we shouldn't do it the other way around, write then
>>> read-back and check the content.
>>> Of course this implies doing the extra write even when the erased page
>>> contains too many bitflips, but at least your sure that the data you
>>> put in the page were correct at that time.
>>>
>>
>> You're right, I think this is something that once we can find inside the
>> MTD code (something like "check NAND written page" kconfig option) but I
>> cannot find this option anymore on latest kernel.
>>
>> You're approach will also have another advantage, currently nearly all
>> platform will use software implementation for ECC check on erased
>> blocks, while nearly all of them has hardware ECC once programmed. Using
>> hardware ECC will remove CPU load and, maybe, be faster than call
>> nand_check_erased_ecc_chunk()
>> I also think that the situation of having failure on write is very
>> unlikely, unless you have a very "used" NAND device or you're not using
>> Richard's bitrot check. So we'll have a performance impact (issuing
>> another write) only when it's really needed.
>
> I didn't check before suggesting that, but it seems that the UBI layer
> is already doing this check for you [1], so if you're using UBI/UBIFS
> you shouldn't worry about bitflips in erased pages: if there is any,
> and their presence impact the write result, they should be detected.
> AFAICT, the only thing that is not checked is whether the number of
> bitflips after a write exceed the bitflips threshold or not, and I
> guess this can be added.

IIUC this is a runtime debug check

if (!ubi_dbg_chk_io(ubi))
	....

And thus is disabled by default.
Anyway, this answer my missing "check NAND written page" question above ;-)

IIUC (again) /sys/kernel/debug/ubi/ubi0/chk_io enable this and many 
other runtime check, so it's only partially useful to have a first raw 
approach to performance impact.

And, yes, those functions only check for valid data, not about bitflip 
counts.

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
