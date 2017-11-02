Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eAGc0-0007S5-Oy
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 14:37:05 +0000
Date: Thu, 2 Nov 2017 15:36:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Rosin
 <peda@axentia.se>, linux-mtd <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org
Subject: Re: sam9x5: MTD numbering changed
Message-ID: <20171102153621.677c6ae8@bbrezillon>
In-Reply-To: <1509632027.16695.5.camel@gmail.com>
References: <1509621436.16695.3.camel@gmail.com>
 <20171102133954.055ce285@bbrezillon>
 <1509632027.16695.5.camel@gmail.com>
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

On Thu, 02 Nov 2017 15:13:47 +0100
Richard Genoud <richard.genoud@gmail.com> wrote:

> Le jeudi 02 novembre 2017 =C3=A0 13:39 +0100, Boris Brezillon a =C3=A9cri=
t=C2=A0:
> > +Nicolas
> >=20
> > Hi Richard,
> >=20
> > On Thu, 02 Nov 2017 12:17:16 +0100
> > Richard Genoud <richard.genoud@gmail.com> wrote:
> >  =20
> > > Hi,
> > >=20
> > > I've got an at91sam9g35-cm based board, with 4 partition on the
> > > spi-
> > > dataflas and 5 partitions on the NAND flash.
> > > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > > bindings"),
> > > the NAND partitions were mtd0-4 and spi-dataflash partitions mtd5-
> > > 8.
> > >=20
> > > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > > bindings"),
> > > the spi-dataflash partitions are discovered before the NAND
> > > partitions.
> > > So NAND partition became mtd4-8 and spi-dataflash partition mtd0-3.
> > >=20
> > > This broke some script that relied on the mtd numbering.
> > >=20
> > > Updating those scripts to rely on the mtd device name instead of
> > > number=C2=A0is not really a problem. The real problem is when an older
> > > script using mtd numbering is run on the new system : I expect dead
> > > kittens everywhere ! =20
> >=20
> > Crap! That was one of the thing I was afraid of when changing the
> > binding: probe order has an impact on ids assigned to MTD devs, and
> > since things are not defined at the same place in the DT, it changes
> > the probe order.
> >  =20
> > >=20
> > > So, I'd like to know if there's a way to force the older numbering
> > > ? =20
> >=20
> > Reverting the patches is probably the easiest way (and it's easily
> > backportable). Now, if we want to switch to the new bindings at some
> > point we'll need to support DT aliases for mtd devs:
> >=20
> > aliases {
> > 	mtdX =3D &flashpartN;
> > 	mtdY =3D &flashdevM;
> > };
> >=20
> > The problem with this solution is that it only works if all
> > partitions
> > are defined in the DT, which is not always the case (they can be
> > defined
> > on the command line with mtdparts=3D). =20
> Yes, and if they are different from the ones declared in
> at91sam9x5cm.dtsi, they are likely defined with mtdparts=3D, since AFAIK,
> we can't remove a declared partitionning.
>=20
> I'll disable the ebi and switch back to the old binding in my dts for
> now.

There's another trick you can try: move the node definition around to
try to make the ECC and NAND controller drivers probe before the SPI
one.

It's ugly as hell, but should allow you to keep the new binding.
