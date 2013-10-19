Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXLrT-0006on-VX
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 02:01:52 +0000
Received: by mail-bk0-f43.google.com with SMTP id mz13so18720bkb.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 19:01:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5260DA32.4090502@freescale.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
 <5260DA32.4090502@freescale.com>
Date: Fri, 18 Oct 2013 19:01:26 -0700
Message-ID: <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 17, 2013 at 11:50 PM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2013=C4=EA08=D4=C227=C8=D5 17:29, Huang Shijie =D0=B4=B5=C0:
>> Current gpmi-nand driver only supports one chips. But we may meet
>> some embarrassing situation, such as Micron MT29F32G08QAA.
>> This nand chip has two DIEs internally. Each die has its own chip select=
 pin,
>> so this chip acts as two nand chips.
>>
>> If we only scan one chip, we may find that we only get 2G for this chip,
>> but in actually, this chip's size is 4G.
>>
>> So scan two chips by default.
>>
>> In order to support two nand chips, we have to do the following:
>>    1.) Decouple the chip select from the DMA channel,
>>        We can use the dma 0 to access all the nand chips.
>>
>>    2.) fix the wrong method of checking the ready/busy status.
>>       In the imx6, all the ready/busy pins are binding together, we
>>       should check ready/busy status of chip 0 for the all the chips.
>>
>> Tested this patch set with MT29F32G08QAA.
>>
>> To Brian:
>>       My "better" solution was proved to be a bad idea. So i resend this
>>       patch set again.
>>
>> v1 --> v2:
>>       [0] rebase on the latest l2-mtd tree.
>>
>> Huang Shijie (4):
>>   mtd: gpmi: decouple the chip select from the DMA channel
>>   mtd: gpmi: use DMA channel 0 for all the nand chips
>>   mtd: gpmi: scan two nand chips
>>   mtd: gpmi: imx6: fix the wrong method for checking ready/busy
>>
>>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   13 +++++++++++++
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    7 +++----
>>  drivers/mtd/nand/gpmi-nand/gpmi-regs.h |    3 +++
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>>
> Hi Artem & Brian:
> Could you please merge this patch set?
> it seems you have missed this patch set.

Yes, I seem to have overlooked this set. I think it must have come in
parallel with your MLC patch set, so I delayed it until the MLC patch
set settled down?

Anyway, I'll revisit this soon. But I probably need to take care of
your mtd-utils updates first, since they should go along with the MLC
patch set.

And on top of that (to update the world on daily status), I seem to be
tripping over some UBIFS bugs that are inhibiting the validation I'm
trying to do for some new hardware. So, I'm all-around pretty busy!
I'll get myself together next week, hopefully.

In the meantime, other people's code could use some extra eyes. I know
Ezequiel just sent out a 27 (!) patch series today. There's also the
pending cmdline.c patch from months ago, where Cai Zhiyong wanted to
migrate our command line partition parser to a common
block/cmdline-parser.c. Part of her work (for block devices) is
upstream already, and part has just sat on our mailing list without
eyes to test it...

See: http://lists.infradead.org/pipermail/linux-mtd/2013-August/048101.html

And finally, I believe Tim Harvey has just reported ECC regressions
for GPMI NAND on some of your code that made it into 3.12 so far. That
issue is probably more urgent than new features.

Brian
