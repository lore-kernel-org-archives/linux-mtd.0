Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIC9X-0000aB-St
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 12:00:34 +0000
Received: by mail-ua0-x242.google.com with SMTP id i2-v6so8129882uah.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2018 05:00:21 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180514134607.5dfb8d51@bbrezillon>
References: <1526294977-32303-1-git-send-email-geert@linux-m68k.org>
 <20180514132324.595b63eb@bbrezillon>
 <CAMuHMdUSHc2o5zXbZje89jo2dxTYv8pzcVSz-gYWh7KdZKwQeA@mail.gmail.com>
 <20180514134607.5dfb8d51@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 14:00:19 +0200
Message-ID: <CAMuHMdVhAAGiGjGMCe26kyLAPqrvTfukADhipd8apk8UNBAXiA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Fix return type of __DIVIDE() when called with
 32-bit
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "Linux/m68k" <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Mon, May 14, 2018 at 1:46 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Mon, 14 May 2018 13:32:30 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, May 14, 2018 at 1:23 PM, Boris Brezillon
>> <boris.brezillon@bootlin.com> wrote:
>> > On Mon, 14 May 2018 12:49:37 +0200
>> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> >> The __DIVIDE() macro checks whether it is called with a 32-bit or 64-bit
>> >> dividend, to select the appropriate divide-and-round-up routine.
>> >> As the check uses the ternary operator, the result will always be
>> >> promoted to a type that can hold both results, i.e. unsigned long long.
>> >>
>> >> When using this result in a division on a 32-bit system, this may lead
>> >> to link errors like:
>> >>
>> >>     ERROR: "__udivdi3" [drivers/mtd/nand/raw/nand.ko] undefined!
>> >>
>> >> Fix this by casting the result of the 64-bit division to the type of the
>> >> dividend.
>> >>
>> >> Fixes: 8878b126df769831 ("mtd: nand: add ->exec_op() implementation")
>> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> >> ---
>> >> This fixes the root cause of the link failure seen with
>> >> m68k/allmodconfig since commit 3057fcef385348fe ("mtd: rawnand: Make
>> >> sure we wait tWB before polling the STATUS reg").
>> >>
>> >> An alternative mitigation was posted as "[PATCH] m68k: Implement
>> >> ndelay() as an inline function to force type checking/casting"
>> >> (https://lkml.org/lkml/2018/5/13/102).
>> >> ---
>> >>  include/linux/mtd/rawnand.h | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
>> >> index 5dad59b312440a9c..d06dc428ea0102ae 100644
>> >> --- a/include/linux/mtd/rawnand.h
>> >> +++ b/include/linux/mtd/rawnand.h
>> >> @@ -871,7 +871,7 @@ struct nand_op_instr {
>> >>  #define __DIVIDE(dividend, divisor) ({                                       \
>> >>       sizeof(dividend) == sizeof(u32) ?                               \
>> >>               DIV_ROUND_UP(dividend, divisor) :                       \
>> >> -             DIV_ROUND_UP_ULL(dividend, divisor);                    \
>> >> +             (__typeof__(dividend))DIV_ROUND_UP_ULL(dividend, divisor); \
>> >
>> > Hm, it's a bit hard to follow when you place the cast here. One could
>> > wonder why a cast to (__typeof__(dividend)) is needed since
>> > DIV_ROUND_UP_ULL() already returns a (__typeof__(dividend)) type.
>>
>> DIV_ROUND_UP_ULL() does not return __typeof__(dividend), but
>> unsigned long long.
>
> Except if you entered this branch, that means you passed an unsigned
> long long dividend (AKA u64), otherwise you would go in DIV_ROUND_UP().
> Am I missing something?

Sure, inside that branch, it does.
But the compiler considers the whole ternary operator construction, i.e.
both branches.

>> > How about:
>> >
>> >         /*
>> >          * Cast to type of dividend is needed here to guarantee that the
>> >          * result won't be an unsigned long long when the dividend is an
>> >          * unsigned long, which is what the compiler does when it sees a
>>
>> s/an unsigned long/32-bit/
>>
>> >          * ternary operator with 2 different return types.
>> >          */
>> >         (__typeof__(dividend))(sizeof(dividend) == sizeof(u32) ?        \
>
> To be completely safe and handle cases where dividend is an unsigned
> short or an unsigned, we should probably have:
>
>         (__typeof__(dividend))(sizeof(dividend) == sizeof(unsigned long long) ? \

"> sizeof(u32)"?

/me starts to think about uint128_t...


>                                DIV_ROUND_UP_ULL(dividend, divisor) :
>                                DIV_ROUND_UP(dividend, divisor));
>
>> >                                DIV_ROUND_UP(dividend, divisor) :        \
>> >                                DIV_ROUND_UP_ULL(dividend, divisor));
>>
>> Looks fine to me, too.
>>
>> > Actually, I'm not even sure we care about the truncation that could
>> > happen on an unsigned long long -> unsigned long cast because the
>> > delays we express here will anyway be hundreds of nanosecs/millisecs,
>> > so nothing close to the billions of nanosecs/millisecs you can express
>> > with an unsigned long.
>> >
>> > So, maybe we should just do:
>> >
>> >         (unsigned long)(sizeof(dividend) == sizeof(u32) ?               \
>> >                         DIV_ROUND_UP(dividend, divisor) :               \
>> >                         DIV_ROUND_UP_ULL(dividend, divisor));
>> >
>> > to make things more readable.
>>
>> That would break callers who pass a 64-bit dividend, and expect to receive
>> a 64-bit quotient back (on 32-bit systems).
>> Calling e.g. PSEC_TO_NSEC(1000000000000ULL) is valid, passing the
>> result to ndelay() isn't ;-)
>
> Well, theoretically, yes it's possible, in practice, we only ever pass
> u32 types to PSEC_TO_NSEC() and u64 types to PSEC_TO_MSEC(), so why
> bother.

True. But __DIVIDE() sounds too generic to add such unobvious limitations.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
