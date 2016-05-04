Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axljo-0004Cp-4l
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 01:36:28 +0000
Received: by mail-lf0-x244.google.com with SMTP id m101so4099197lfi.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2016 18:36:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160419093424.27cfc585@bbrezillon>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-3-git-send-email-peterpandong@micron.com>
 <20160325093519.34c3f7fa@bbrezillon>
 <CAAyFORKJzXTSgXvHgNe=AtExs8_9sVNEYMRefYLXDqG7-u-yRg@mail.gmail.com>
 <20160418094444.152042ee@bbrezillon>
 <CAAyFORL_Pqz34-tgz7aBQ3au9RzZwJs6DA-8ROJxK0xtMZnp_Q@mail.gmail.com>
 <20160419093424.27cfc585@bbrezillon>
Date: Wed, 4 May 2016 09:36:05 +0800
Message-ID: <CAAyFORKWTKmBZNx22NaOwHUzH+FW34PNxMuEqejXvBSwru9FoA@mail.gmail.com>
Subject: Re: [PATCH 02/11] mtd: nand_bbt: introduce BBT related data structure
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Jiancheng Xue <xuejiancheng@huawei.com>, Peter Pan <peterpandong@micron.com>
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

On Tue, Apr 19, 2016 at 3:34 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Peter,
>
> On Tue, 19 Apr 2016 08:40:40 +0800
> Peter Pan <peterpansjtu@gmail.com> wrote:
>>
>> >
>> >> So it's true, it
>> >> should still be numchips in nand_bbt.c?  I just came out this question when
>> >> making v4. :)
>> >
>> > BTW, I have something for you [1]. I started to move things around to
>> > allow spinand and onenand layers to lie under drivers/mtd/nand/, and I
>> > wonder if we shouldn't do this move before reworking the nand_bbt code
>> > to make it generic.
>> > Note that this rework is not finished yet, but it gives a rough idea of
>> > what I'd like to see.
>>
>> I saw you also rework BBT in your git tree, which is a bit duplicate
>> with my BBT patch,
>> so should I continue my BBT patch by join part of your BBT rework code
>> or continue
>> your git tree ?
>
> Well, if you ask me what I'd prefer, it's clearly the 2nd solution.
> Note that my branch should just serve as a reference of what I expect,
> it just a pile of rework that should probably be reordered and cleaned
> up.
>
> Here's the sequencing I'd like to see:
>
> 1/ Move include/linux/mtd/nand.h into include/linux/mtd/rawnand.h and
>    move all files under drivers/mtd/nand/ into
>    drivers/mtd/nand/rawnand (including nand_bbt.c). This can be done in
>    several patches
>
> 2/ Add the generic nand layer (include/linux/mtd/nand.h and
>    drivers/mtd/nand/core.c). In my version I put everything in
>    include/linux/mtd/nand.h, but maybe we'll need a few functions to be
>    defined in drivers/mtd/nand/core.c.
>
> 3/ Create a rawnand_device structure inheriting from nand_device, and
>    then make nand_chip inherit from rawnand_device. Patch the
>    nand_base.c code to initialize all the nand_device fields properly,
>    so that we'll be ready to switch to the generic BBT code.
>
> 4/ Modify the nand_bbt.c code to make use of the generic NAND interface
>    instead of the MTD and rawnand one (this implies identifying all the
>    generic helpers you might need, and implementing them in
>    include/linux/mtd/nand.h or drivers/mtd/nand/core.c).
>
> 5/ Move drivers/mtd/nand/rawnand/nand_bbt.c into
>    drivers/mtd/nand/bbt.c
>
> 6/[optional] Implement your spinand layer in drivers/mtd/nand/spinand
>
> I know I'm asking a lot, especially given that you already spent a lot
> of time iterating on this BBT rework series. But your goal is to move
> mt29f driver out of staging, and you'll need to do the generic NAND
> layer to achieve that, so I'd really prefer having the BBT code use
> this generic layer instead of directly using the MTD API + an extra set
> of NAND specific structs (like the nand_chip_layout_info one).

Yes, I want to upstreaming my SPI NAND frameworks and it's indeed better
to have a nand core. In fact, I already finished a SPI NAND framework with
the BBT patch I sent which is directly under MTD (don't have a NAND core layer).

Actually, I'm interested in this NAND framework refining work. And I
know you already
gave a speech on ELC about this. But due to the resource limitation, I may not
to do all of the things. So how about I continue my BBT patch with
your NAND refining
ideas. I'll try to make the BBT patch compatible with the refining
work. What do you
think?

Thanks,
Peter Pan
