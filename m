Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePOXu-0000Kx-Uq
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 08:07:13 +0000
Received: by mail-lf0-x236.google.com with SMTP id f20so5583740lfe.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2017 00:06:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171214085036.436b4fcf@bbrezillon>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon> <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
 <20171213222710.32d12514@bbrezillon>
 <CAAyFORJcT1abbo21iA4cetLKmF0zE4akFGFryxPpwPO+730LDQ@mail.gmail.com>
 <20171214085036.436b4fcf@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 14 Dec 2017 16:06:48 +0800
Message-ID: <CAAyFOR+=JwTRTm2MXVdMy7KRPsnV8LV4t71kHUh_s=+QOsVurA@mail.gmail.com>
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

On Thu, Dec 14, 2017 at 3:50 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Peter,
>
> On Thu, 14 Dec 2017 14:15:57 +0800
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> Hi Boris and Frieder,
>>
>> On Thu, Dec 14, 2017 at 5:27 AM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > Hi Frieder,
>> >
>> > On Tue, 12 Dec 2017 10:58:10 +0100
>> > Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
>> >
>> >> Hi Boris,
>> >>
>> >> I spent some time looking at and working with your latest SPI NAND code.
>> >> In my previous mail I said, that we have some working code for our 3.14
>> >> kernel based on the "mt29f_spinand" staging driver, but that was wrong
>> >> as I got things mixed up in my head.
>> >> Actually our codebase was an early version of Peter's code, so the
>> >> effort to port it to the latest framework code was not that big.
>> >>
>> >> I forked your repo and you can find my working tree at [1].
>> >
>> > Great, I'll try to have a look.
>> >
>> >>
>> >> What I did so far:
>> >>
>> >> * Rebase your patches on latest Linux 4.14.5
>> >
>> > Cool, rebasing on 4.15-rc1 would be even better, but I can do that if
>> > you don't have the time.
>> >
>> >>
>> >> * Add a driver for the Winbond W25M02GV SPI NAND chip, that we have on
>> >> some of our boards.
>> >
>> > Okay, that's actually a good thing to have tested with another chip,
>> > This way we can make sure the framework is generic enough.
>> >
>> >>
>> >> * Add a driver for the Freescale QSPI controller, derived from the
>> >> existing QSPI-NOR driver at drivers/mtd/spi-nor/fsl-quadspi.c.
>> >
>> > That's an interesting case as well, the generic NAND controller is
>> > probably the easiest implementation, and that's a good thing to have
>> > another controller.
>> >
>> >>
>> >> * Add a setup and setup_late op to the controller layer (see [3]). I
>> >> don't know if that makes sense, but at least the setup_late is needed
>> >> for the FSL QSPI driver, as it needs to know the size of the flash to
>> >> setup the memory mapping for the QSPI read operations.
>> >
>> > Hm, not sure what ->setup_late() is for, but I'll have a look.
>> >
>> >>
>> >> * A bit of testing and fixing two small bugs, which look like copy and
>> >> paste mistakes. See [2].
>> >
>> > Thanks, I'll squash the fixes in the original commit.
>> >
>> >>
>> >> * Running nandtest successfully on our hardware (i.MX6UL -> FSL-QSPI ->
>> >> W25M02GV)
>> >>
>> >> I hope this is of use while moving on.
>> >
>> > Definitely. I'd also like to have a review on the framework code if
>> > possible, but that can be done when posted on the ML.
>> >
>> >> I guess you would like to have the basic framework with Micron support
>> >> and generic SPI tested and stabilized first, before adding more code,
>> >> but to be able to test with our hardware I need Micron and FSL QSPI.
>> >
>> > I guess you mean Winbond not Micron. That's okay if those patches are
>> > posted after the initial series. All I need is reviews and tests from
>> > different parties, so that I'm less confident in merging the code.
>> >
>> >>
>> >> Some questions/flaws that occurred to me:
>> >>
>> >> * The W25M02GV chip has two dies of 128M each. My current driver only
>> >> makes use of the first die. The chip expects a die-select command to
>> >> switch between the two dies.
>> >> What would be the place to implement this?
>> >> Can I just add the command and issue it in
>> >> winbond_spinand_adjust_cache_op if luns_per_target > 1?
>> >
>> > It really depends when the die selection happens. I guess it happens in
>> > 2 places: when preparing a program/read operation and when doing the
>> > transfer to the in-chip cache. Anyway, the die information is already
>> > passed in the nand_pos object, so all you'll have to do is create a new
>> > hook to customize the SPI command when needed.
>>
>> I don't know whether we can do the the die switch in the generic NAND core
>> (drivers/mtd/nand/core.c). I'm not sure if chip->select_chip() in nand_base.c
>> does the same thing or not. If so, we can do the die switch before
>> read/write/erase
>> operation. And let spi nand core to implement a hook to support it.
>
> Actually, I'm trying to move away from this ->select_chip() approach in
> the raw NAND framework, simply because the controller might be able to
> parallelize operations (like 2 erase on 2 different dies, or one erase
> on one die, and a program on the other), and having this ->select_chip()
> done early in the chain prevents this kind of optimization.
>
> Anyway, the controller should now have all the necessary information to
> know which die an operation should be executed on, and if a specific
> command has to be sent to the device to select a specific die, it can
> be done in the NAND vendor specific code.

Got your point. It makes sense.

>
>>
>> >
>> >>
>> >> * The FSL QSPI controller has a lookup table that needs to be filled
>> >> with command sequences at the time of setup. Therefore the number of
>> >> dummy bytes for each command is fixed and in my current implementation
>> >> op->dummy_bytes is ignored.
>> >> That's not a problem if all chips need the same number of dummy bytes
>> >> for each command, but I guess that's not the case, as there is a
>> >> _spinand_get_dummy function.
>> >
>> > We should definitely expose that in a generic way, and on a
>> > per-operation basis, so that, after the detection step, the NAND
>> > controller can query this information.
>> >
>> >>
>> >> * What is your plan for ECC and BBT? At least enabling the onchip ECC
>> >> will be necessary to be able to use the flash properly (e.g. with UBI),
>> >> or am I wrong?
>> >
>> > Well, if all SPI NAND chips are supporting ECC the same way and
>> > on-die ECC support is mandatory for SPI NANDs, then supporting that
>> > directly in the core is probably the best option. If, on the other
>> > hand, you have various implementations, and some SPI controllers have
>> > their own ECC engine that you can use with SPI NANDs, then it's
>> > probably a better idea to abstract ECC engine in the generic NAND layer.
>>
>> As far as I know, all the SPI NAND supports on-die ECC (at least all
>> the SPI NAND
>> I heard). But different chips may have different ECC layout in OOB
>> area. But I think
>> this cannot be a problem, we can handle this in vendor's file.
>
> Yep.
>
>>
>> >
>> > For BBTs, I'd like to have a clean version of the nand_bbt logic that
>> > uses all of the helpers exposed by the generic NAND layer. I'd also
>> > like to simplify the code if possible.
>> >
>> >>
>> >> * Do you have any special test cases? What do you usually do to test the
>> >> code?
>> >
>> > Well, make sure all the mtd tests are passing (drivers/mtd/tests), and
>> > then, the next step is to test it with UBI+UBIFS. But honestly, I'm not
>> > so worried, this is new code, and we've isolated from the raw NAND
>> > layer, so if it's buggy or instable at the beginning it's not a big
>> > deal, it will be noticed and fixed for the next few releases.
>> >
>> >>
>> >> Thanks for your patience and best regards,
>> >
>> > No problem. Thanks for your work, and I'll try to be more active on
>> > this topic (I promised that several times, and failed it :-/).
>>
>> Boris,
>>
>> I think we need to move forward, MediaTek's engineer has already asked for
>> the status of the spi nand framework upstreaming, since they want to upstream
>> their SPI NAND controller driver. And Hisilicon also has a controller driver.
>> Since more and more platforms start to support SPI NAND, we'd better merge a
>> simple but well designed framework first. I will run your modified
>> version on Zedboard
>> with generic SPI controller this or next week.
>
> Then why are they not spending time reviewing the SPI NAND framework?
> You know I'm not paid to work on SPI NAND, unlike those engineers
> working for SoC/NAND vendors. While I agree being a maintainer implies
> doing part of the work on our spare time, what I don't like is when
> people that did not invest time in a specific feature ask for this
> feature to be implemented/released. This is not your case, you invested
> a lot of time in it, and that's the reason I feel bad when I can't spend
> the necessary time to make SPI NAND code ready for inclusion.
>
> So here are the next set of things to do if you want to move forward:
> 1/ Re-submit the preparation patches (those touching MTD core) and
>    review them (or find someone to review them)
> 2/ Add the missing doc to the code (I was planning on doing that, but
>    if you're in hurry you can take care of it), and add real commit
>    messages.
> 3/ Fix the authorship on patches (some were mainly written by you, but
>    during my rework authorship has been lost)
> 4/ Ask others to test and review the patches

To be honest, I also feel bad to keep pushing you on this...
I will try to communicate with them to see if they can help us to do some review
or valudation task.
You already make the path clear, I will take the rest. If anything
unclear, I will come
back to discuss with you.

Thanks
Peter Pan


>
> Regards,
>
> Boris
