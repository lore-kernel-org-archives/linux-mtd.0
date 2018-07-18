Date: Wed, 18 Jul 2018 08:56:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Richard Weinberger
 <richard@nod.at>, Gregory CLEMENT <gregory.clement@bootlin.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>, Josh Wu
 <rainyfeeling@outlook.com>, Romain Izard <romain.izard.pro@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Peter Rosin <peda@axentia.se>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/3] mtd: atmel nand: fix build warning on 64-bit
Message-ID: <20180718085625.436958fc@xps13>
In-Reply-To: <20180717230839.3fc2264e@bbrezillon>
References: <20180709155730.2422841-1-arnd@arndb.de>
 <20180709155730.2422841-2-arnd@arndb.de>
 <0b4ee469-8c37-9002-9067-f37f8dde869e@microchip.com>
 <CAK8P3a3NbrRVC-7HW8NiNQw+E3n_-r746AFTc2dftagTYLYDtw@mail.gmail.com>
 <20180717230523.7005ca91@xps13>
 <20180717230839.3fc2264e@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
23:08:39 +0200:

> On Tue, 17 Jul 2018 23:05:23 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hi Arnd,
> >=20
> > Arnd Bergmann <arnd@arndb.de> wrote on Fri, 13 Jul 2018 12:16:09 +0200:
> >  =20
> > > On Fri, Jul 13, 2018 at 11:56 AM, Tudor Ambarus
> > > <tudor.ambarus@microchip.com> wrote:   =20
> > > > Hi, Arnd,
> > > >
> > > > On 07/09/2018 06:57 PM, Arnd Bergmann wrote:     =20
> > > >> +     nc->ebi_csa_offs =3D (uintptr_t)match->data;     =20
> > > >
> > > > I guess we should declare ebi_csa_offs as size_t, right?     =20
> > >=20
> > > Yes, that would make sense, though it doesn't change the behavior.
> > >    =20
> >=20
> > Do you plan to send a new version? I don't want to mess with
> > improvised casts :) =20
>=20
> This fix is already part of my COMPILE_TEST series (v2), and I don't
> thing declaring ->ebi_csa_offs as a size_t is useful.

I missed that, ok.

Thanks,
Miqu=C3=A8l
