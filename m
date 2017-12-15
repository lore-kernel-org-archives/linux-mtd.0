Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePehF-0000hd-Gq
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 01:21:56 +0000
Received: by mail-lf0-x233.google.com with SMTP id r143so8719646lfe.13
 for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2017 17:21:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAyFORKeFq+=tF9AK+8hp6GYYiyp3DKcw8+LWrC3RWS2zLNU_w@mail.gmail.com>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon> <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
 <20171213222710.32d12514@bbrezillon>
 <CAAyFORJcT1abbo21iA4cetLKmF0zE4akFGFryxPpwPO+730LDQ@mail.gmail.com>
 <20171214085036.436b4fcf@bbrezillon>
 <CAAyFOR+=JwTRTm2MXVdMy7KRPsnV8LV4t71kHUh_s=+QOsVurA@mail.gmail.com>
 <23d17416-e555-4b92-cc47-f644fbe676c6@exceet.de>
 <20171214163848.41f6d277@bbrezillon>
 <CAAyFORKeFq+=tF9AK+8hp6GYYiyp3DKcw8+LWrC3RWS2zLNU_w@mail.gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 15 Dec 2017 09:21:29 +0800
Message-ID: <CAAyFORJEuEaHDXgk+m0ax5RoZ-3cRJs6uFXw7syR4vHE1veEwQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Dec 15, 2017 at 9:08 AM, Peter Pan <peterpansjtu@gmail.com> wrote:
> Hi Boris and Frieder
>
> On Thu, Dec 14, 2017 at 11:38 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> On Thu, 14 Dec 2017 15:39:13 +0100
>> Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
>>
>>> Hello Peter, hello Boris
>>>
>>> >>>>> What I did so far:
>>> >>>>>
>>> >>>>> * Rebase your patches on latest Linux 4.14.5
>>> >>>>
>>> >>>> Cool, rebasing on 4.15-rc1 would be even better, but I can do that if
>>> >>>> you don't have the time.
>>>
>>> I will try to rebase on 4.15-rc1. Can you give me a quick explanation on
>>> which patches are needed for SPI NAND + preparation, if I only want to
>>> add the generic NAND and the SPI NAND layer?
>>> Previously I just rebased the whole branch, but I think you have some
>>> other pending patches in there?
>>> Would this be the correct changeset: [1]
>>> Or are there other preparation patches needed?
>>
>> Looks good. By preparation patches I meant
>>
>> from:
>> "mtd: Do not allow MTD devices with inconsistent erase properties"
>> to
>> "mtd: nand: move raw NAND related code to the raw/ subdir"
>>
>> so basically everything that touches existing code.
>
> I think "mtd: Add sanity checks in mtd_write/read_oob()" is also
> included since I cannot
> find it in nand/next branch of l2-mtd

Sorry, my mistake. it is in nand/next.

>
>>
>>>
>>> >>>>> I guess you would like to have the basic framework with Micron support
>>> >>>>> and generic SPI tested and stabilized first, before adding more code,
>>> >>>>> but to be able to test with our hardware I need Micron and FSL QSPI.
>>> >>>>
>>> >>>> I guess you mean Winbond not Micron. That's okay if those patches are
>>> >>>> posted after the initial series. All I need is reviews and tests from
>>> >>>> different parties, so that I'm less confident in merging the code.
>>>
>>> Yeah I meant Winbond of course. And I guess you meant "more confident".
>>
>> Yep.
>>
>>> Or that was just irony? Nevermind ;)
>>>
>>> >>>>> Some questions/flaws that occurred to me:
>>> >>>>>
>>> >>>>> * The W25M02GV chip has two dies of 128M each. My current driver only
>>> >>>>> makes use of the first die. The chip expects a die-select command to
>>> >>>>> switch between the two dies.
>>> >>>>> What would be the place to implement this?
>>> >>>>> Can I just add the command and issue it in
>>> >>>>> winbond_spinand_adjust_cache_op if luns_per_target > 1?
>>> >>>>
>>> >>>> It really depends when the die selection happens. I guess it happens in
>>> >>>> 2 places: when preparing a program/read operation and when doing the
>>> >>>> transfer to the in-chip cache. Anyway, the die information is already
>>> >>>> passed in the nand_pos object, so all you'll have to do is create a new
>>> >>>> hook to customize the SPI command when needed.
>>>
>>> The die selection is a separate SPI command and not integrated into the
>>> program/read/erase sequence.
>>> So I can't customize an existing op, but have to issue a new "die
>>> select" op.
>>
>> Okay.
>>
>>>
>>> >>>
>>> >>> I don't know whether we can do the the die switch in the generic NAND core
>>> >>> (drivers/mtd/nand/core.c). I'm not sure if chip->select_chip() in nand_base.c
>>> >>> does the same thing or not. If so, we can do the die switch before
>>> >>> read/write/erase
>>> >>> operation. And let spi nand core to implement a hook to support it.
>>> >>
>>> >> Actually, I'm trying to move away from this ->select_chip() approach in
>>> >> the raw NAND framework, simply because the controller might be able to
>>> >> parallelize operations (like 2 erase on 2 different dies, or one erase
>>> >> on one die, and a program on the other), and having this ->select_chip()
>>> >> done early in the chain prevents this kind of optimization.
>>> >>
>>> >> Anyway, the controller should now have all the necessary information to
>>> >> know which die an operation should be executed on, and if a specific
>>> >> command has to be sent to the device to select a specific die, it can
>>> >> be done in the NAND vendor specific code.
>>>
>>> But needing a die select op is quite common for any multi-die chips,
>>> isn't it?
>>
>> It is, it's just that some controllers are able to interleave
>> operations on multiple dies, so having  ->{select,unselect}_chip()
>> methods at the generic NAND level is not such a good idea, because that
>> means you'll have to serialize accesses, even if they could be done in
>> parallel.
>>
>>> So shouldn't there be an spinand_die_select_op in the SPI NAND core that
>>> is executed when necessary and skipped if there's only one die.
>>
>> Sure, I was arguing against a ->select_chip() at the generic NAND
>> level. That's something you can add in the SPI NAND framework.
>>
>>>
>>> > Got your point. It makes sense.
>>> >>
>>> >>>>> * The FSL QSPI controller has a lookup table that needs to be filled
>>> >>>>> with command sequences at the time of setup. Therefore the number of
>>> >>>>> dummy bytes for each command is fixed and in my current implementation
>>> >>>>> op->dummy_bytes is ignored.
>>> >>>>> That's not a problem if all chips need the same number of dummy bytes
>>> >>>>> for each command, but I guess that's not the case, as there is a
>>> >>>>> _spinand_get_dummy function.
>>> >>>>
>>> >>>> We should definitely expose that in a generic way, and on a
>>> >>>> per-operation basis, so that, after the detection step, the NAND
>>> >>>> controller can query this information.
>>>
>>> Ok, I might try this and see where it leads me.
>>>
>>> >>>>> * What is your plan for ECC and BBT? At least enabling the onchip ECC
>>> >>>>> will be necessary to be able to use the flash properly (e.g. with UBI),
>>> >>>>> or am I wrong?
>>> >>>>
>>> >>>> Well, if all SPI NAND chips are supporting ECC the same way and
>>> >>>> on-die ECC support is mandatory for SPI NANDs, then supporting that
>>> >>>> directly in the core is probably the best option. If, on the other
>>> >>>> hand, you have various implementations, and some SPI controllers have
>>> >>>> their own ECC engine that you can use with SPI NANDs, then it's
>>> >>>> probably a better idea to abstract ECC engine in the generic NAND layer.
>>> >>>
>>> >>> As far as I know, all the SPI NAND supports on-die ECC (at least all
>>> >>> the SPI NAND
>>> >>> I heard). But different chips may have different ECC layout in OOB
>>> >>> area. But I think
>>> >>> this cannot be a problem, we can handle this in vendor's file.
>>> >>
>>> >> Yep.
>>>
>>> Ok. If I have time I will think about how the ECC and OOB layout might
>>> be implemented. But I have not much experience here, so if anyone of you
>>> can propose something to get started, this would be great.
>>
>> I can definitely help there, and Peter should be able to give some
>> insights as well.
>
> Frieder.
>
> Actually the v5 patchset of SPI NAND framework from me[1] includes on-die ECC.
> You can have a reference (maybe patch 2 and patch 4 is enough).
> Of course v5 is quite different with the latest code, but I think you
> can get some idea from it.
>
>>
>>>
>>> >>>> For BBTs, I'd like to have a clean version of the nand_bbt logic that
>>> >>>> uses all of the helpers exposed by the generic NAND layer. I'd also
>>> >>>> like to simplify the code if possible.
>>> >>>>
>>> >>>>>
>>> >>>>> * Do you have any special test cases? What do you usually do to test the
>>> >>>>> code?
>>> >>>>
>>> >>>> Well, make sure all the mtd tests are passing (drivers/mtd/tests), and
>>> >>>> then, the next step is to test it with UBI+UBIFS. But honestly, I'm not
>>> >>>> so worried, this is new code, and we've isolated from the raw NAND
>>> >>>> layer, so if it's buggy or instable at the beginning it's not a big
>>> >>>> deal, it will be noticed and fixed for the next few releases.
>>> >>>>
>>> >>>>>
>>> >>>>> Thanks for your patience and best regards,
>>> >>>>
>>> >>>> No problem. Thanks for your work, and I'll try to be more active on
>>> >>>> this topic (I promised that several times, and failed it :-/).
>>>
>>> I hope, that as more people get interested in the topic, more people
>>> will join. Thanks in advance for your further work on this.
>>>
>>> >> So here are the next set of things to do if you want to move forward:
>>> >> 1/ Re-submit the preparation patches (those touching MTD core) and
>>> >>     review them (or find someone to review them)
>>> >> 2/ Add the missing doc to the code (I was planning on doing that, but
>>> >>     if you're in hurry you can take care of it), and add real commit
>>> >>     messages.
>>> >> 3/ Fix the authorship on patches (some were mainly written by you, but
>>> >>     during my rework authorship has been lost)
>>> >> 4/ Ask others to test and review the patches
>>> >
>>> > To be honest, I also feel bad to keep pushing you on this...
>>> > I will try to communicate with them to see if they can help us to do some review
>>> > or valudation task.
>>> > You already make the path clear, I will take the rest. If anything
>>> > unclear, I will come
>>> > back to discuss with you.
>>>
>>> I don't have any experience in reviewing kernel code and only little in
>>> submitting patches, but if I can be of any help let me know.
>>>
>>> As I have a certain use case and the hardware, I will also be happy to
>>> help testing.
>>
>> Testing and reporting issues is already helpful.
>
> I would like to thank you for your help in advance, Frieder.
>
>
> Thanks,
> Peter Pan
>
> [1] http://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=65489&state=9&q=v5&archive=&delegate=
>
>>
>> Thanks,
>>
>> Boris
