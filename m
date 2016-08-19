Received: from mr213138.mail.yeah.net ([223.252.213.138])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bagws-0005V3-2F
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 10:22:55 +0000
Subject: Re: MTD RAID
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dongsheng Yang <dongsheng081251@gmail.com>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon> <57B6B073.9060404@easystack.cn>
 <20160819102016.0640b6d5@bbrezillon>
 <CA+qeAOrSAi9uTHGCi-5cAJpM_O45oJUihNP-rHHa1FWL7_ZKHQ@mail.gmail.com>
 <20160819113725.14cb83c8@bbrezillon>
Cc: starvik@axis.com, jesper.nilsson@axis.com,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 richard <richard@nod.at>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, fabf@skynet.be,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org,
 Colin King <colin.king@canonical.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <57B6DDE1.3070500@easystack.cn>
Date: Fri, 19 Aug 2016 18:22:25 +0800
MIME-Version: 1.0
In-Reply-To: <20160819113725.14cb83c8@bbrezillon>
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



On 08/19/2016 05:37 PM, Boris Brezillon wrote:
> On Fri, 19 Aug 2016 17:15:56 +0800
> Dongsheng Yang <dongsheng081251@gmail.com> wrote:
>
>> Hi Boris,
>>
>> On Fri, Aug 19, 2016 at 4:20 PM, Boris Brezillon <
>> boris.brezillon@free-electrons.com> wrote:
>>
>>> On Fri, 19 Aug 2016 15:08:35 +0800
>>> Dongsheng Yang <dongsheng.yang@easystack.cn> wrote:
>>>   
>>>> On 08/19/2016 02:49 PM, Boris Brezillon wrote:
>>>>> Hi Dongsheng,
>>>>>
>>>>> On Fri, 19 Aug 2016 14:34:54 +0800
>>>>> Dongsheng Yang <dongsheng081251@gmail.com> wrote:
>>>>>   
>>>>>> Hi guys,
>>>>>>       This is a email about MTD RAID.
>>>>>>
>>>>>> *Code:*
>>>>>>       kernel:
>>>>>> https://github.com/yangdongsheng/linux/tree/mtd_raid_v2-for-4.7
>>>>> Just had a quick look at the code, and I see at least one major problem
>>>>> in your RAID-1 implementation: you're ignoring the fact that NAND
>>> blocks
>>>>> can be or become bad. What's the plan for that?
>>>> Hi Boris,
>>>>       Thanx for your quick reply.
>>>>
>>>>       When you are using RAID-1, it would erase the all mirrored blockes
>>>> when you are erasing.
>>>> if there is a bad block in them, mtd_raid_erase will return an error and
>>>> the userspace tool
>>>> or ubi will mark this block as bad, that means, the
>>>> mtd_raid_block_markbad() will mark the all
>>>>    mirrored blocks as bad, although some of it are good.
>>>>
>>>> In addition, when you have data in flash with RAID-1, if one block
>>>> become bad. For example,
>>>> when the mtd0 and mtd1 are used to build a RAID-1 device mtd2. When you
>>>> are using mtd2
>>>> and you found there is a block become bad. Don't worry about data
>>>> losing, the data is still
>>>> saved in the good one mirror. you can replace the bad one device with
>>>> another new mtd device.
>>> Okay, good to see you were aware of this problem.
>>>   
>>>> My plan about this feature is all on the userspace tool.
>>>> (1). mtd_raid scan mtd2 <---- this will show the status of RAID device
>>>> and each member of it.
>>>> (2). mtd_raid replace mtd2 --old mtd1 --new mtd3.   <---- this will
>>>> replace the bad one mtd1 with mtd3.
>>>>
>>>> What about this idea?
>>> Not sure I follow you on #2. And, IMO, you should not depend on a
>>> userspace tool to detect address this kind of problems.
>>>
>>> Okay, a few more questions.
>>>
>>> 1/ What about data retention issues? Say you read from the main MTD, and
>>> it does not show uncorrectable errors, so you keep reading on it, but,
>>> since you're never reading from the mirror, you can't detect if there
>>> are some uncorrectable errors or if the number of bitflips exceed the
>>> threshold used to trigger a data move. If suddenly a page in your main
>>> MTD becomes unreadable, you're not guaranteed that the mirror page will
>>> be valid :-/.
>>>   
>> Yes, that could happen. But that's a case where main MTD and mirror bacome
>> bad at the same time. Yes, that's possible, but that's much rare than
>> pure one MTD going to bad, right?
> Absolutely not, that's actually more likely than getting bad blocks. If
> you're not regularly reading your data they can become bad with no way
> to recover from it.
>
>> That's what RAID-1 want. If you want
>> to solve this problem, just increase the number of mirror. Then you can make
>> your data safer and safer.
> Except the number of bitflips is likely to increase over time, so if
> you never read your mirror blocks because the main MTD is working fine,
> you may not be able to read data back when you really need it.

Sorry, I am afraid I did not get your point. But in general, it's safer to
have two copies of data than just one copy of it I believe. Could you 
explain
more , thanx. :)
>
>>> 2/ How do you handle write atomicity in RAID1? I don't know exactly
>>> how RAID1 works, but I guess there's a mechanism (a journal?) to detect
>>> that data has been written on the main MTD but not on the mirror, so
>>> that you can replay the operation after a power-cut. Do handle this
>>> case correctly?
>>>   
>> No, but the redundancy of RAID levels is designed to protect against a
>> *disk* failure,
>> not against a *power* failure, that's a responsibility of ubifs. when the
>> ubifs replay,
>> the not completed writing will be abandoned.
> And again, you're missing one important point. UBI and UBIFS are
> sitting on your RAID layer. If the mirror MTD is corrupted because of
> a power-cut, but the main one is working fine, UBI and UBIFS won't
> notice, until you really need to use the mirror, and it's already too
> late.
Actually there is already an answer about this question in RAID-1:

https://linas.org/linux/Software-RAID/Software-RAID-4.html


But, I am glad to figure out what we can do in this case.
At this moment, I think do a raid check for the all copies of data
when ubifs is recoverying sounds possible.

>
>>> On a general note, I don't think it's wise to place the RAID layer at
>>> the MTD level. How about placing it at the UBI level (pick 2 ubi
>>> volumes to create one UBI-RAID element)? This way you don't have to
>>> bother about bad block handling (you're manipulating logical blocks
>>> which can be anywhere on the NAND).
>>>   
>>
>> But how can we handle the multiple chips problem? Some drivers
>> are combining multiple chips to one single mtd device, what the
>> mtd_concat is doing.
> You can either pick 2 UBI volumes from 2 UBI devices (each one attached
> to a different MTD device).

Yes, but, I am afraid we don't want to expose all our chips.

Please consider this scenario, One pcie card attached chips, we only 
want user
to see just one mtd device /dev/mtd0, rather than 40+ mtd devices. So we 
need to call
mtd_raid_create() in the driver for this card.
>
>>> One last question? What's the real goal of this MTD-RAID layer? If
>>> that's about addressing the MLC/TLC NAND reliability problems, I don't
>>> think it's such a good idea.
>>>   
>> Oh, that's not the main problem I want to solve. RAID-1 is just a possible
>>   extension base on my RAID framework.
>>
>> This work is started for only RAID0, which is used to take the use of lots
>> of flash to improve performance. Then I refactored it to a MTD RAID
>> framework. Then we can implement other raid level for mtd.
>>
>> Example:
>>      In our production, there are 40+ chips attached on one pcie card.
>> Then we need to simulate all of them into one mtd device. At the same
>> time, we need to consider how to manage these chips. Finally we chose
>> a RAID0 mode for them. And got a great performance result.
>>
>> So, the multiple chips scenario is the original problem I want to solve. And
>> then I found I can refactor it for other RAID-levels.
> So all you need a way to concatenate MTD devices (are we talking
> about NAND devices?)? That shouldn't be to hard to define something
> like an MTD-cluster aggregating several similar MTD devices to provide
> a single MTD. But I'd really advise you to drop the MTD-RAID idea and
> focus on your real/simple need: aggregating MTD devices.

Yes, the original problem is to concatenate the NAND devices. And we
have to use RAID-0 to improve our performance.

Later on, I found the MTD raid is a not bad idea to solve other problems,
So I tried to do a refactor for MTD-RAID.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
