Message-ID: <1354545316.11583.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] MTD: at91: atmel_nand: return bit flips for the
 PMECC read_page()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 03 Dec 2012 16:35:16 +0200
In-Reply-To: <1354013431-13598-1-git-send-email-josh.wu@atmel.com>
References: <1354013431-13598-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kGMSG3dMEIJ0isTpnFiY"
Mime-Version: 1.0
Cc: plagnioj@jcrosoft.com, mikedunn@newsguy.com, linux-mtd@lists.infradead.org,
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


--=-kGMSG3dMEIJ0isTpnFiY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-27 at 18:50 +0800, Josh Wu wrote:
> This patch fix pmecc's read_page() to return maximum number of bitflips, =
0 if uncorrectable.
>=20
> In the commit: 3f91e94f7f511de74c0d2abe08672ccdbdd1961c ("mtd: nand: read=
_page() returns max_bitflips ()"),
> The ecc.read_page() is changed to return the maximum number of bitflips.
> And when meet uncorrectable bitflips it needs to return 0.
>=20
> See the comment in nand.h:
>  * @read_page:	function to read a page according to the ECC generator
>  *		requirements; returns maximum number of bitflips corrected in
>  *		any single ECC step, 0 if bitflips uncorrectable, -EIO hw error
>=20
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-kGMSG3dMEIJ0isTpnFiY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvLikAAoJECmIfjd9wqK0HWoP/iR95mCX8HZR7CSB0enyf9zq
HIkcT9Xix7eBqMZPkeFFj1bSGa3rlefxn4yQKUHBDGwV1/HCpb5sEVIT6B2frUfG
3JN+JiUxMRyxvNJ47HvBJ2kqwJLna7jpsKzgPQTvNiClPsOIFALQnq6JIWal9gRC
MpYKcfoDedg9DC7Z+rY2rZUm/WHq2YjPOfesYLO+unRZQ1ijHX1B6+SltG8fk6B8
lJ/qMIpmWRyJKAYjEqbmqt7F2DwxxcVJa0+03NWddOqN7IMmneWGZHSzQAgETQP7
M1+ocm2NYSMqbsGp606rDw11+OQcDIXFTJNxLiv/aIYEIVIsbfETGodnDldxSE1S
+xZ6XyEts6ZZfmEY8fRxsnAbJyPAGfq8P6h7zHOhB0U7R3CtwNBrw2m2mgAndyf1
0DcU6gmevrrr66DXflK3TaD5zqLRCF+D/DHrC2gBMohzzlydh710cA1H9etL2g5/
opd2rZScbDGQCH1iEEH+PW/AnwVwaHFPnMY/gE4JuFpE+396epNhoM3oV6xw/UDI
tcTYhewAujFkpcnGWvVavcofed1KCElLrVGLcPqncyD3mlPV3/JoMY5QmdmXjhqb
esQS5MYULIInV930DlN1SvlChoQ/YJqdxhMGexXP1WnIn7gOQTLJoQdwIiw1xFXL
8czTrWIEkj8IjSJEnY5h
=xdd9
-----END PGP SIGNATURE-----

--=-kGMSG3dMEIJ0isTpnFiY--
