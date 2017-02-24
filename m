MIME-Version: 1.0
In-Reply-To: <20170224095105.s4svpysgju3uhb3z@piout.net>
References: <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
 <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
 <20170221171438.e5hvruoixafpcdps@piout.net>
 <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
 <20170224081430.GB19663@samfundet.no> <20170224092742.3ce205e2@bbrezillon>
 <20170224085209.GA27812@samfundet.no> <20170224095509.777da771@bbrezillon>
 <20170224090435.GA11313@samfundet.no>
 <20170224095105.s4svpysgju3uhb3z@piout.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Feb 2017 13:43:12 +0200
Message-ID: <CAHp75VfPEK=mgD7+b6Y=5_AywwOJ3Y1V6usP-japhGWg4A_O8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?Q?H=C3=A5vard_Skinnemoen?= <hskinnemoen@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Josh Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 24, 2017 at 11:51 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 24/02/2017 at 10:04:35 +0100, Hans-Christian Noren Egtvedt wrote:
>> Around Fri 24 Feb 2017 09:55:09 +0100 or thereabout, Boris Brezillon wrote:
>> > On Fri, 24 Feb 2017 09:52:09 +0100
>> > Hans-Christian Noren Egtvedt <egtvedt@samfundet.no> wrote:

> I think the main task is removing arch/avr32 and update MAINTAINERS
> (don't forget to add yourself to CREDITS) and Documentation/ anything
> else will have to go through the driver maintainers tree.
>
> If you feel like it, you can also prepare patches for the avr32 only
> drivers. I'll be happy to help with the individual drivers if you can't
> find the time to do it. We will definitively take care of the shared
> avr32/at91 drivers.

I can do for the drivers where DW DMA is involved (sound/soc/,
drivers/dma/dw/) since it's my main concern wrt avr32.

-- 
With Best Regards,
Andy Shevchenko
