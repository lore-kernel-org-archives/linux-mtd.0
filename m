Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQ11y-0004gi-1x
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 01:45:04 +0000
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
 [209.85.213.44]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id w551iUwY018349
 for <linux-mtd@lists.infradead.org>; Tue, 5 Jun 2018 10:44:30 +0900
Received: by mail-vk0-f44.google.com with SMTP id q135-v6so413689vkh.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2018 18:44:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1864836.G720OGCVI0@blindfold>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <20180604225117.61d2c269@bbrezillon> <38227338.JIUUFn9IOS@blindfold>
 <1864836.G720OGCVI0@blindfold>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Jun 2018 10:43:49 +0900
Message-ID: <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
Subject: Re: DENALI: can't detect NAND chip
To: Richard Weinberger <richard@sigma-star.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Philipp Rosenberger <p.rosenberger@linutronix.de>,
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

2018-06-05 7:01 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> Am Montag, 4. Juni 2018, 22:57:32 CEST schrieb Richard Weinberger:
>> Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:
>> > > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
>> > > is returned in both cases.
>> > > So this does not really look invalid to me. :)
>> >
>> > Did you try to put a scope on the RE or WE pin? The x2 factor looks too
>> > perfect to be just a coincidence.
>>
>> Not yet, but you are right the x2 factor is really interesting.
>
> The NFC uses two clocks, nand_x_clk and nand_clk.
> nand_clk is nand_x_clk / 4.
> In the device tree nand_clk is referenced, and therefore used to calculate
> the timings. So we might need to use the 200Mhz clock instead of the 50Mhz
> for the calculation.
>


Yes.


Strictly speaking, the Denali IP takes three clocks.

[1] clk :     core clock
[2] clk_x:    bus interface clock
[3] ecc_clk:  for ECC engine



Also in my SoCs (Socionext UniPhier),

clk = 50MHz,
clk_x = ecc_clk = 200MHz



In this case, the ->setup_data_interface hook
is interested in the frequency of [2] clk_x.

However, clk_x is not a core clock.
I admit this is confusing.


If we really want to make the DT-binding precise,
we can change the clock requirement like follows:

clock-names = "clk", "clk_x", "ecc_clk";
clocks = <...>, <...>, <...>;


This might be an annoying churn, though...


-- 
Best Regards
Masahiro Yamada
