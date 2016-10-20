Date: Thu, 20 Oct 2016 19:06:02 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/8] ARM: gr8: Add the UART3
Message-ID: <20161020170602.mkk3cp2om2xbtmen@lukather>
References: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
 <b62c8661eb3c2d72e61511794a3ab1b43f005805.1476951078.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65iR=mZyCQrF64HOku5Sq7fNKGhV=Yy3zUFYzB=4ozkWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w77hcz4kzl6tsv44"
Content-Disposition: inline
In-Reply-To: <CAGb2v65iR=mZyCQrF64HOku5Sq7fNKGhV=Yy3zUFYzB=4ozkWg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--w77hcz4kzl6tsv44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 10:06:47PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 20, 2016 at 4:12 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The GR8 has access to the UART3 controller, which was missing in the
> > DTSI. Add it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w77hcz4kzl6tsv44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCPl1AAoJEBx+YmzsjxAgCMwQALkmvO3TtBGDRRUjs5i8xwC7
LcNYji7Y8FZx2qA0f3e1tCgV1Lx/yNTMwkm76atG2PnmaT3FH2FGtttc33oC1/Tm
jsMNqiWJ4bl2RpJFrDYFtLfO9vf7V0dk4bTx4ukTn1T33F58kueH2LvXygEB43OA
60XEukj2QgzCtBxq+TTuK0kq8MM2p8jcz9eojQUzVDU2QIj5X+AtDiBUch92vHF6
aWV6g5eHQYO7omNyYCNl42Fp8F3SVXdB/dcCW9CH6RioOD4BCqwvthslX90PCq5S
MRC2jHztR1OMflllVXFDCfvYD0WGzDwd1953r6G0EQv5xiXlfQVuUJ4PC3X+ehPb
xcXlO4Et03jQ06eBSUeGs2GF48g7xQwyJuAhq4tgua2UXbUAm5FQq2UQLp2j6lQR
+/XDKbthET6PSZ/vEBTIANRZizsvl80Sz8Z7ggyLKZPApoK0JzpplCc50mSzl/pK
6Qi4FhHNmQyp8LAAf6h7pf4IDppkb/wLrIE3FGhytvmXERrw2OEY0fbsfagzZ1Va
G9fz0DZm8rfMxhHJpOYyO/czmY84kRjz02kmkSqaUDPEkx2AzR8JtBg/QNzexTYQ
fkZUBV0hODzia29RjMuHvyIHS5/s2RGJdetxYvGpzxEjl1RwyJmBWKvEhc9SrhiQ
zWVtSY9ft/9f0XXRavjY
=nqrt
-----END PGP SIGNATURE-----

--w77hcz4kzl6tsv44--
