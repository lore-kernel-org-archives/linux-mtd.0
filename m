Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3g4L-0006jV-TL
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2016 09:18:23 +0000
Received: by mail-lf0-x242.google.com with SMTP id o141so7506354lff.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2016 01:18:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161106190310.4894d3d7@bbrezillon>
References: <1478051526-7216-1-git-send-email-keguang.zhang@gmail.com>
 <20161102083613.443bcb10@bbrezillon>
 <CAJhJPsWcJiPjUfGmsHn7v2ODgj-0tb5XfqfyJVyr0gsbRxYPZA@mail.gmail.com>
 <20161102115728.52e8b187@bbrezillon>
 <CAJhJPsWttKnF2WhHmX6J9PuSgUw8F9Yqrmd6aX9Qez7xyubH7A@mail.gmail.com>
 <20161102205404.0611ca4c@bbrezillon>
 <CAJhJPsWZ77a33rhjfB0MagZuvJzAMFOtf2qi1HYy-1+5gd7v1w@mail.gmail.com>
 <20161106190310.4894d3d7@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 7 Nov 2016 17:17:58 +0800
Message-ID: <CAAyFORLa=ytBm8BdyA7BxTjajXvBmQAzO8CjrOjk3WJLw-KC9A@mail.gmail.com>
Subject: Re: [PATCH V4] mtd: nand: add Loongson1 NAND driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kelvin Cheung <keguang.zhang@gmail.com>, linux-mtd@lists.infradead.org,
 "peterpandong@micron.com" <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

First of all, I'm sorry for reply your mail late. I was quite busy with
other things for several month and somehow I missed your v2 patches...


On Mon, Nov 7, 2016 at 2:03 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> +Peter
>
> Hi Kelvin,
>
> On Thu, 3 Nov 2016 19:09:55 +0800
> Kelvin Cheung <keguang.zhang@gmail.com> wrote:
>
>> >
>> > > I doubt whether the MTD maintainer will be happy with this kind of MTD
>> > > driver.
>> > > After all, it is a NAND controller driver.
>> >
>> > Yes, it is a raw NAND controller driver, but one with a limited set of
>> > features.
>> > Letting the core think that this is a regular raw NAND controller
>> > driver is just wrong, and as I said, I want to stop this insanity.
>> > The nand_chip interface has been abused for too long, and it's one of
>> > the reason the NAND subsystem has become a pile of hardly maintainable
>> > hacks preventing support for advanced features in a generic way.
>> >
>> > There are probably a few things that could be re-used (like the SW ECC
>> > implementation), and that's the reason for the "interface-agnostic NAND
>> > framework" series I pointed to in my previous answer. So yes, there are
>> > better solutions than developing an MTD driver
>> >
>> > I got it now.
>> The Loongson1 is classified as interface-agnostic NAND, while others are
>> raw NANDs.
>
> Well, it's not really the case, since this controller is really
> interfacing with raw NANDs.
> The interface-agnostic framework is here to share NAND device
> functionalities (like BBT handling, soft ECC handling, ...) no matter
> the I/O interface.
> But it appears that your driver would be more easily implemented using
> this interface, and more importantly, it would not let the raw NAND
> framework think this controller is able to send any kind of raw NAND
> commands, which is the point I'm complaining about.
>
>>
>>
>> > >
>> > > >
>> > > > >
>> > > > >
>> > > > > > You may also want to have a look at [1]. I started to abstract
>> > away the
>> > > > > > NAND interface type to share some code between SPI NANDs and raw
>> > NANDs.
>> > > > > > By implementing this interface, you'll at least be able to re-use
>> > the
>> > > > > > BBT code.
>> > > > > >
>> > > > > > I'm really sorry to ask you that now, after you've reworked most
>> > of the
>> > > > > > driver to address my comments, but the more I look at it the more I
>> > > > > > feel it's just a big hack to make it fit in a framework that was
>> > not
>> > > > > > designed to support such "high-level" controllers.
>> > > > > >
>> > > > >
>> > > > > Since the driver of "high-level" controllers is still ongoing.
>> > > > > Could you please accept this patch for now?
>> > > >
>> > > > Sorry, but no. I'm okay helping you improve/develop what you need to
>> > > > support this controller, but I don't want to accept more hacky drivers
>> > > > that do not fit in the current NAND framework, and yours is falling in
>> > > > this case.
>> > > >
>> > >
>> > > Is there anything left I can do with my patch?
>> >
>> > There are several things you could try:
>> >
>> > 1/ Try to extend interface-agnostic framework to expose high level
>> >    functionality like
>> >    - reading/writing one of several pages
>> >    - erasing a block (already done)
>> >    - making SW ECC implementation generic enough to get rid of the
>> >      nand_chip specific aspects so that it can be re-used for SPI NANDs
>> >      or high-level NAND controllers (AFAICT, this shouldn't be to hard,
>> >      the SW implementations are already providing generic functions and
>> >      implementing nand_chip specific wrappers)
>> >    Once you have such an interface, you can start implementing generic
>> >    mtd_info hooks at the interface-agnostic NAND level.
>> >
>> > 2/ Try to directly implement the mtd_info hooks I am mentioning above.
>> >
>> > Of course I'd prefer solution 1 since it would benefit to everybody. I
>> > also understand you need to have access to the nand_ids table. But this
>> > should be rather simple, since it's completely independent from the
>> > nand_chip interface.
>> >
>>
>> OK, I will try solution 1.
>
> Great!
>
>>
>> >
>> > > BTW, what is status of "high-level" controllers drivers?
>> >
>> > Since no one worked on it, there's not much done here. But I really
>> > think it could be based on the interface-agnostic framework I started.
>> >
>>
>> I'd like to know when the patch set of interface-agnostic framework will be
>> merged,
>> Then, I can try solution 1.
>
> Actually, I started this work to help Peter support SPI NANDs without
> duplicating the BBT code, and I was expecting him to review/test this
> implementation, but I never hear back from him.

Although my loading is still high, I will try to finish your v2 patch
review and testing
in two weeks. For my SPI NAND patchset, I'll rebase it on your v2
patch, split it to
patch series and then send it out. But it will take some time.

Sorry for the late reply again.

Thanks,
Peter Pan
