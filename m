Date: Thu, 1 Mar 2018 10:04:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Gregory Clement
 <gregory.clement@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Antoine Tenart
 <antoine.tenart@bootlin.com>, linux-arm-kernel
 <linux-arm-kernel-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
Message-ID: <20180301100446.0f61aaf9@xps13>
In-Reply-To: <20180227214245.4267448e@bbrezillon>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-6-miquel.raynal@bootlin.com>
 <20180222104618.1ff78b52@bbrezillon>
 <87efl66vow.fsf@belgarion.home>
 <20180227214245.4267448e@bbrezillon>
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

Hi Robert,

On Tue, 27 Feb 2018 21:42:45 +0100, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Hi Robert,
>=20
> On Tue, 27 Feb 2018 21:09:51 +0100
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>=20
> > Boris Brezillon <boris.brezillon@bootlin.com> writes:
> >  =20
> > > +Arnd and the LAKML
> > >
> > > Hi Miquel,
> > >
> > > Please try to Cc the LAKML and the arm-soc maintainers when you send =
DT
> > > changes.
> > >
> > > Arnd, Robert, I'd like to apply this patch through the MTD tree since
> > > it depends on patch 1 of this series ("mtd: nand: use Marvell reworked
> > > NAND controller driver with all platforms").
> > > Otherwise, I can leave it to Robert for 4.18.   =20
> >=20
> > This one looks conflict free, so I have no objection if you carry it th=
rough
> > your tree. =20
>=20
> Already prepared an immutable branch with all patches of this series
> for you to pull in the pxa tree:
>=20
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1=
b2:
>=20
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.infradead.org/linux-mtd.git nand/pxa3xx-removal
>=20
> for you to fetch changes up to fa4d26b6f00e2c3460c2cc070f467c74d163bf40:
>=20
>   MAINTAINERS: remove entry for deleted pxa3xx_nand driver (2018-02-23 22=
:12:15 +0100)
>=20

As you may know, this commit:

    mtd: nand: remove useless fields from pxa3xx NAND platform data

currently breaks linux-next build as I forgot to patch files in the
mach-mmp directory.

I sent a fix for that yesterday to linux-arm-kernel@ and Boris:

    arm: mmp: Fix build issue due to PXA NAND pdata structure changes

but maybe, it would be better to squash the fix directly in Boris'
immutable branch if you did not pull it already?

Thanks and sorry for the mistake,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
