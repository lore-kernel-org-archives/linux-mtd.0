Date: Fri, 24 Feb 2017 10:21:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Cc: =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinnemoen@gmail.com>, Alexandre
 Belloni <alexandre.belloni@free-electrons.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Richard Weinberger <richard@nod.at>, "open
 list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh
 Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala
 <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170224102103.26b38341@bbrezillon>
In-Reply-To: <20170224090435.GA11313@samfundet.no>
References: <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
 <20170221162133.jch6yzpotj4s7zob@piout.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Feb 2017 10:04:35 +0100
Hans-Christian Noren Egtvedt <egtvedt@samfundet.no> wrote:

> Around Fri 24 Feb 2017 09:55:09 +0100 or thereabout, Boris Brezillon wrot=
e:
> > On Fri, 24 Feb 2017 09:52:09 +0100
> > Hans-Christian Noren Egtvedt <egtvedt@samfundet.no> wrote: =20
> >> Around Fri 24 Feb 2017 09:27:42 +0100 or thereabout, Boris Brezillon w=
rote: =20
> >> > On Fri, 24 Feb 2017 09:14:30 +0100 Hans-Christian Noren Egtvedt <egt=
vedt@samfundet.no> wrote:   =20
> >> >> Around Thu 23 Feb 2017 21:18:13 -0800 or thereabout, H=C3=A5vard Sk=
innemoen wrote:   =20
> >> >> > On Tue, Feb 21, 2017 at 9:14 AM, Alexandre Belloni
> >> >> > <alexandre.belloni@free-electrons.com> wrote:     =20
> >> >> >> On 21/02/2017 at 18:43:35 +0200, Andy Shevchenko wrote:     =20
> >>=20
> >> <snipp>
> >>  =20
> >> >> >> If nobody complains about the 4.10 breakage, You'll have plenty =
of time
> >> >> >> to remove it for 4.12     =20
> >> >> >=20
> >> >> > I'm fine with that, but I haven't put much effort into keeping it
> >> >> > alive lately. If Hans-Christian agrees, I'm willing to post a pat=
ch to
> >> >> > remove it, or ack someone else's patch.     =20
> >> >>=20
> >> >> Then lets plan this for 4.12, either you H=C3=A5vard whip up a patc=
h or I can
> >> >> eventually do it.
> >> >>=20
> >> >> I can push it through the linux-avr32 git tree on kernel.org.
> >> >>    =20
> >> >=20
> >> > Can you do that just after 4.11-rc1 is released and provide a topic
> >> > branch I can pull in my nand/next branch, so that I can rework this
> >> > patch and drop all the pdata-compat code (as suggested by Andy).   =
=20
> >>=20
> >> OK, I will try to prepare it during the weekend.
> >>=20
> >> Any reason to wait for 4.11-rc1? AFAIK Linus prefers the larger changes
> >> before he starts tagging rc's.
> >>  =20
> >=20
> > Oh, so you want to queue it for 4.11, that's even better. =20
>=20
> Perhaps I misunderstood you, by after 4.11-rc1 you mean queue it for 4.12?

Yep, that's what I understood from your previous answer where you said
'Then lets plan this for 4.12, either you H=C3=A5vard whip up a patch or I
can eventually do it.'. If you queue it for 4.12, you'll probably want
to base your patch on 4.11-rc1 to make sure it does not conflict with
changes pulled by Linus during the merge window.

OTOH, if you want to remove avr32 support in 4.11 (which would make
things easier for me ;-)), you still have one week before the end of
the merge window.

>=20
> I will see what I get around to do in the weekend, it should be pretty
> straightforward, just want to make sure we remove all the bits.
>=20

Okay.
