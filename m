Date: Mon, 15 Aug 2011 10:29:35 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110815082935.GA18364@parrot.com>
References: <20110805135133.GA26981@pengutronix.de>
	<20110814081139.GD17063@parrot.com>
	<20040.45443.810005.525431@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20040.45443.810005.525431@ipc1.ka-ro>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2011 at 06:41:23AM +0100, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> Ivan Djelic writes:
> > On Fri, Aug 05, 2011 at 02:51:33PM +0100, Wolfram Sang wrote:
> > (...)
> > >=20
> > > problem overwriting all-0xff data in NAND [2]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > Although it occured only when writing JFFS2 images so far, this is a =
generic
> > > issue and needs to be fixed, right?
> > >=20
> > >=20
> > (...)
> > > [2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037104.h=
tml
> >=20
> > As explained in the thread linked above, this issue should be fixed in =
your
> > flashing tool, _not_ in your driver. The nand device you are using does=
 not
> > support programming pages multiple times in a row; pretending it does i=
n the
> >
> It's not a problem of the device (Samsung K9F1G08U0B in my case)! The
> problem is that the controller generates an ECC code that is non-FF
> for all-FF data, which JFFS2 cannot handle properly.

JFFS2 has nothing to do with it. JFFS2 does not assume it can program empty
pages and then reprogram them on a NAND flash device. You flashing method d=
oes.

If your BCH controller allows it, you could XOR the computed ECC bytes with=
 a
specific mask to make sure all-FF data have all-FF ecc. This is useful to a=
llow
reading erased blocks with ecc correction enabled.

But even so, you cannot work around the fact that NAND devices are different
=66rom NOR devices, in that they typically allow only a limited number of p=
artial
page programming operations (4 in your K9F1G08U0B).
If you implemented the mask trick described above and used it to allow
multiple page programming, you still would not track the number of partial
program operations on a given page, and expose yourself to nasty bugs (when
exceeding the number of specified partial operations); i.e. it could work on
some devices for a few operations, but not reliably on all devices for any
number of empty page programmings.

So the only real possibility is to avoid programming (physically) a page wh=
en
its target contents are empty (all-FF); this is not implemented at the driv=
er
level because:
- it is useless: none of the existing filesystems need this "feature"
- it would waste cpu cycles to check if target data is all-FF each time a p=
age
is programmed

Therefore... it is simply a matter of avoiding empty page programming, which
only happens in your flasher. See also the flashing guidelines [1] as per A=
rtem
suggestion.

BR,

Ivan

[1] http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

>=20
>=20
> Lothar Wa=C3=9Fmann
> --=20
> ___________________________________________________________
>=20
> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>=20
> www.karo-electronics.de | info@karo-electronics.de
> ___________________________________________________________
