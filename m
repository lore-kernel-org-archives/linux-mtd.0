Date: Fri, 24 Feb 2017 10:51:05 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?iso-8859-1?Q?H=E5vard?= Skinnemoen <hskinnemoen@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170224095105.s4svpysgju3uhb3z@piout.net>
References: <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
 <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
 <20170221171438.e5hvruoixafpcdps@piout.net>
 <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
 <20170224081430.GB19663@samfundet.no>
 <20170224092742.3ce205e2@bbrezillon>
 <20170224085209.GA27812@samfundet.no>
 <20170224095509.777da771@bbrezillon>
 <20170224090435.GA11313@samfundet.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170224090435.GA11313@samfundet.no>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24/02/2017 at 10:04:35 +0100, Hans-Christian Noren Egtvedt wrote:
> Around Fri 24 Feb 2017 09:55:09 +0100 or thereabout, Boris Brezillon wrote:
> > On Fri, 24 Feb 2017 09:52:09 +0100
> > Hans-Christian Noren Egtvedt <egtvedt@samfundet.no> wrote:
> >> OK, I will try to prepare it during the weekend.
> >> 
> >> Any reason to wait for 4.11-rc1? AFAIK Linus prefers the larger changes
> >> before he starts tagging rc's.
> >> 
> > 
> > Oh, so you want to queue it for 4.11, that's even better.
> 
> Perhaps I misunderstood you, by after 4.11-rc1 you mean queue it for 4.12?
> 
> I will see what I get around to do in the weekend, it should be pretty
> straightforward, just want to make sure we remove all the bits.
> 

I think the main task is removing arch/avr32 and update MAINTAINERS
(don't forget to add yourself to CREDITS) and Documentation/ anything
else will have to go through the driver maintainers tree.

If you feel like it, you can also prepare patches for the avr32 only
drivers. I'll be happy to help with the individual drivers if you can't
find the time to do it. We will definitively take care of the shared
avr32/at91 drivers.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
