Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSfYx-0005aH-4O
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 09:26:05 +0000
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
 [209.85.213.45]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id w5C9PZll013196
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 18:25:36 +0900
Received: by mail-vk0-f45.google.com with SMTP id s187-v6so13966845vke.9
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 02:25:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2538157.EbBc2oB3DW@blindfold>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
 <20180605093627.03ee6a95@bbrezillon> <2538157.EbBc2oB3DW@blindfold>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Jun 2018 18:24:54 +0900
Message-ID: <CAK7LNARhtN8QhY_2=24dS4GwyAtcyBoK=hjnKoMtxDt+QgEkgg@mail.gmail.com>
Subject: Re: DENALI: can't detect NAND chip
To: Richard Weinberger <richard@sigma-star.at>
Cc: Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2018-06-12 18:21 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> Am Dienstag, 5. Juni 2018, 09:36:27 CEST schrieb Boris Brezillon:
>> On Tue, 5 Jun 2018 10:43:49 +0900
>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>> > 2018-06-05 7:01 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
>> > > Am Montag, 4. Juni 2018, 22:57:32 CEST schrieb Richard Weinberger:
>> > >> Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:
>> > >> > > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
>> > >> > > is returned in both cases.
>> > >> > > So this does not really look invalid to me. :)
>> > >> >
>> > >> > Did you try to put a scope on the RE or WE pin? The x2 factor looks too
>> > >> > perfect to be just a coincidence.
>> > >>
>> > >> Not yet, but you are right the x2 factor is really interesting.
>> > >
>> > > The NFC uses two clocks, nand_x_clk and nand_clk.
>> > > nand_clk is nand_x_clk / 4.
>> > > In the device tree nand_clk is referenced, and therefore used to calculate
>> > > the timings. So we might need to use the 200Mhz clock instead of the 50Mhz
>> > > for the calculation.
>> > >
>> >
>> >
>> > Yes.
>> >
>> >
>> > Strictly speaking, the Denali IP takes three clocks.
>> >
>> > [1] clk :     core clock
>> > [2] clk_x:    bus interface clock
>> > [3] ecc_clk:  for ECC engine
>> >
>> >
>> >
>> > Also in my SoCs (Socionext UniPhier),
>> >
>> > clk = 50MHz,
>> > clk_x = ecc_clk = 200MHz
>> >
>> >
>> >
>> > In this case, the ->setup_data_interface hook
>> > is interested in the frequency of [2] clk_x.
>> >
>> > However, clk_x is not a core clock.
>> > I admit this is confusing.
>> >
>> >
>> > If we really want to make the DT-binding precise,
>> > we can change the clock requirement like follows:
>> >
>> > clock-names = "clk", "clk_x", "ecc_clk";
>>
>> How about:
>>
>> clock-names = "nand", "nand_x", "ecc";
>>
>> The clk prefix/suffix is really redundant here.
>>
>> > clocks = <...>, <...>, <...>;
>>
>> If the IP really takes 3 different clks in input, then it should be
>> represented like that.
>>
>> >
>> >
>> > This might be an annoying churn, though...
>> >
>> >
>>
>> I guess you're talking about backward compat with existing dtb. This
>> should be a problem, and we can even fix the Richard's problem for
>> those dtbs if we hardcode the nand_x_clk rate to 200Mhz when nand_x_clk
>> is missing (see below).
>
> [...]
>
> Masahiro, which fix do you prefer?
>
> We could also just fix the dts file.
> e.g.
> commit c0097d0b498bdefb427c352d615432e97f1998aa
> Author: Richard Weinberger <richard@nod.at>
> Date:   Tue Jun 12 11:16:22 2018 +0200
>
>     arm: dts: socfpga: Use right denali clock
>
>     To calculate the timing parameters a 200MHz clock is needed, in case of
>     socfpga this is nand_x_clk and not nand_clk.
>
>     Cc: stable@kernel.org
>     Fixes: 1bb88666775e ("mtd: nand: denali: handle timing parameters by setup_data_interface()")
>     Signed-off-by: Richard Weinberger <richard@nod.at>
>
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 486d4e7433ed..8fbddc2a5c33 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -754,7 +754,7 @@
>                         reg-names = "nand_data", "denali_reg";
>                         interrupts = <0x0 0x90 0x4>;
>                         dma-mask = <0xffffffff>;
> -                       clocks = <&nand_clk>;
> +                       clocks = <&nand_x_clk>;
>                         status = "disabled";
>                 };
>
> Thanks,
> //richard
>


I almost finishing the denali driver update.
I am now writing commit log.   Will post it soon.

(By taking care of the backward compatibility in the driver,
you do not need to rush to fix your DT.)



-- 
Best Regards
Masahiro Yamada
