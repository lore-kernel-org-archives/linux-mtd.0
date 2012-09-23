Message-ID: <1348405309.1889.3.camel@kyv>
Subject: Re: [PATCH v2] mtd: atmel_nand: fix the compile error which miss
 label "err_ecc_ioremap".
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Sun, 23 Sep 2012 16:01:49 +0300
In-Reply-To: <1348404075.1889.1.camel@kyv>
References: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
 <1348404075.1889.1.camel@kyv>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SctL47tcBVjWnV3MyKN7"
Mime-Version: 1.0
Cc: vikram186@gmail.com, plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SctL47tcBVjWnV3MyKN7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-23 at 15:41 +0300, Artem Bityutskiy wrote:
> On Tue, 2012-09-11 at 15:10 +0800, Josh Wu wrote:
> > Add err_ecc_ioremap label to fix following errors:
> > ---8<---=20
> >   CC      drivers/mtd/nand/atmel_nand.o
> > drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
> > drivers/mtd/nand/atmel_nand.c:1423: error: label 'err_ecc_ioremap' used=
 but not defined
> > make[3]: *** [drivers/mtd/nand/atmel_nand.o] Error 1
> > make[2]: *** [drivers/mtd/nand] Error 2
> > make[1]: *** [drivers/mtd] Error 2
> > make: *** [drivers] Error 2
> > --->8---
>=20
> Pushed to l2-mtd.git, thanks!

Actually squashed it into the bogus patch.

--=20
Best Regards,
Artem Bityutskiy

--=-SctL47tcBVjWnV3MyKN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXwg9AAoJECmIfjd9wqK0E/0P/i8i4z1thhw3G6PJKSbgtjgn
k9LJJk2IOCj7wqo6thsCsKzRrpkKb+kBdUK4I4sKmolJOreG3unFTtcPI2eaPpm/
mTrCDQJDwePfnhom+W7JgDeet3o4N2RPisNlr/M5gS11VN3a7NVl7bM61YikNDqG
y2ZovhdG+6VkzYV/eqCHXlYZIzr0EGbfCaIlqFD2yxymU0vhGvpXmJNevGukfkU7
X12F5YYFOsANF5F19k/yGn+yM+9btfK0pfuSUhiyXto9JSBjGN6l44pSchPbGdaq
ap+7JBI4bgAkSNy14+wEg+6zLn9ZK0WYOcPKCzqOdIy0WMfc/mRqHgNjkcsEYpH7
MQRzUKpx17fviYyhvzi8SpVU6dkk1bIKCaDb/vaQf/bLtDJAykGnZWM+ZPJ0Yj8w
o2IAd+ifXZF5NJqixZytqb+eZ3E615tzv2xdxXmRylJxW3lGxBijB0VDVdj9jkWq
aSTBKWeIbQsGc8AYt9Dyk3PYSlKpE75GHov/3o2P6S+hkPjlAShvE+0qAJoygwaX
UDuVHLA2d0/gm32tQXQMgxGpznnWA3KScpoIpCc2/vr1983Qyn5Ah4bCdMg5WAq4
ApxCI0jm8RUyeJ9XEfH0AgyRVVrWmwYjeK7t2/HkYtNcOxQN4WrOIL9M4W6mwclS
7IBINHqiaBJhvOGHs+Rz
=x9Mi
-----END PGP SIGNATURE-----

--=-SctL47tcBVjWnV3MyKN7--
