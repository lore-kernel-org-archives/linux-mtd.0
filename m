Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsOmx-0005Jm-CC
 for linux-mtd@lists.infradead.org; Thu, 14 Sep 2017 07:42:24 +0000
Received: by mail-qk0-x22a.google.com with SMTP id r141so5594369qke.2
 for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2017 00:41:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170913170310.grfv7j5xvh7chjdo@piout.net>
References: <20170908153604.28383-1-romain.izard.pro@gmail.com>
 <20170908153604.28383-4-romain.izard.pro@gmail.com>
 <b0c7e816-4a7c-609d-2bc7-281fc6ca751d@microchip.com>
 <20170913170310.grfv7j5xvh7chjdo@piout.net>
From: romain izard <romain.izard@mobile-devices.fr>
Date: Thu, 14 Sep 2017 09:41:36 +0200
Message-ID: <CAGkQfmOZBi4tzUSEAD7J+w_v+pZ_yFgPRBaYaLnW-ptFZO0rvg@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] clk: at91: pmc: Support backup for programmable
 clocks
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Thierry Reding <thierry.reding@gmail.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-09-13 19:03 GMT+02:00 Alexandre Belloni
<alexandre.belloni@free-electrons.com>:
> On 13/09/2017 at 14:29:35 +0200, Nicolas Ferre wrote:
>> On 08/09/2017 at 17:35, Romain Izard wrote:
>> > From: Romain Izard <romain.izard@mobile-devices.fr>
>> >
>> > Save and restore the System Clock and Programmable Clock register for
>> > the backup use case.
>>
>> "System Clock" seems to be handled in another patch.
>>
>> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
>> > ---
>> >  drivers/clk/at91/pmc.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
>> > index 07dc2861ad3f..5421b03553ec 100644
>> > --- a/drivers/clk/at91/pmc.c
>> > +++ b/drivers/clk/at91/pmc.c
>> > @@ -66,6 +66,7 @@ static struct
>> >     u32 pcr[PMC_MAX_IDS];
>> >     u32 audio_pll0;
>> >     u32 audio_pll1;
>> > +   u32 pckr[3];
>>
>> Some products have different numbers of PCK (only 2 on at91sam9x5 for
>> instance)...
>>
>
> My opinion is that it will be time to change that when multiple SoCs will
> need to save their registers.
>
For the next version, I'll add a #define. But as this code requires a
device tree node with the compatible string "atmel,sama5d2-pmc", I believe
that we can ignore other chips for now.


-- 
Romain Izard
