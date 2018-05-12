Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHUnL-00019C-RL
 for linux-mtd@lists.infradead.org; Sat, 12 May 2018 13:42:46 +0000
Date: Sat, 12 May 2018 15:42:23 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@bolin.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for reading ooblayout from
 device tree
Message-ID: <20180512154223.3b81c7f7@bbrezillon>
In-Reply-To: <20180512115551.56C6E20787@mail.bootlin.com>
References: <20180512115551.56C6E20787@mail.bootlin.com>
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

On Sat, 12 May 2018 08:55:40 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Boris,
>=20
> Le 12 mai 2018 02:55, Boris Brezillon <boris.brezillon@bootlin.com> a =C3=
=A9crit :
> >
> > Hi Paul,=20
> >
> > On Fri, 11 May 2018 23:29:12 +0200=20
> > Paul Cercueil <paul@crapouillou.net> wrote:=20
> > =20
> > > By specifying the properties "mtd-oob-ecc" and "mtd-oob-free", it is=
=20
> > > now possible to specify from devicetree where the ECC data is located=
=20
> > > inside the OOB region.  =20
> >
> > Why would we want to do that? I mean, ECC/free regions are ECC=20
> > controller dependent (and NAND chip dependent for the OOB size part),=20
> > so there's no reason to describe it in the DT. And more importantly,=20
> > people are likely to get it wrong.=20
> >
> > I'm curious, why do you need that?  =20
>=20
> Good question.
>=20
> The reason is that some SoCs have no ECC controller.
> The various boards for these SoCs then all use a different layout.

Okay. Still think defining the layouts in the DT is a bad idea. We
can add a jz4740 specific property to define the layout id
(ingenic,nand-oob-layout =3D <layout-id>), but not a generic way to
define custom layouts for all kind of NAND controller.

>=20
> My motivation is to get rid of this (move it to devicetree):
> https://elixir.bootlin.com/linux/latest/source/arch/mips/jz4740/board-qi_=
lb60.c#L93
> And enable the support of other boards with custom OOB layouts.

Can you list the different layouts you have? I'm pretty sure there's a
pattern. Maybe we can even deduce the layout from the page size or OOB
size.
