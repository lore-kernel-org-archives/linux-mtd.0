Message-ID: <1340898021.3070.123.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v12 0/2] MTD: at91: Add PMECC support for at91 nand
 flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 28 Jun 2012 18:40:21 +0300
In-Reply-To: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
References: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c3RomT6FRXGvt0lLt7nt"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, richard.genoud@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-c3RomT6FRXGvt0lLt7nt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-28 at 16:21 +0800, Josh Wu wrote:
> Those patches is based on the l2-mtd.git three.
>=20
> Since there are two patches of v11 already pushed, so this version v12 on=
ly includes the left two patches.
> which includes the modification according to Richard Genoud's review sugg=
estion.
>=20
> Changes since v11,
> 	add documentation for atmel nand reg parameter and one example for PMECC=
 support.
> 	fix the bug: no error reported when fail to get resoures of PMECC ERRLOC=
 or ROM.
> 	fix the bug: no correction when ecc data has bit flipped.
> 	add clearer debug information for data correction.
>=20
> Josh Wu (2):
>   MTD: at91: add dt parameters for Atmel PMECC
>   MTD: at91: atmel_nand: Update driver to support Programmable Multibit
>     ECC controller
>=20
>  .../devicetree/bindings/mtd/atmel-nand.txt         |   40 +-
>  drivers/mtd/nand/atmel_nand.c                      |  801 ++++++++++++++=
+++++-
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  114 ++-
>  3 files changed, 951 insertions(+), 4 deletions(-)

Aiaiai is not 100% happy, could you take a look?

dedekind@blue:~/git/maintaining$ ../aiaiai/aiaiai-concat-mboxes ~/tmp/wu* |=
 ./verify ../l2-mtd/ atmel_nand
Tested the patch(es) on top of the following commits:
9328bb5 Quick fixes - applied by aiaiai
ea3b6ef mtd: fix bogus inequation
0960e57 mtd: move mtd_read_oob() definition out of mtd.h
0560176 mtd: nand_bbt: refactor check_pattern_no_oob()

---------------------------------------------------------------------------=
-----

Successfully built configuration "arm-at91cap9_defconfig,arm,arm-unknown-li=
nux-gnueabi-", results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/atmel_nand.c: In function 'pmecc_correct_data':
+drivers/mtd/nand/atmel_nand.c:680:38: warning: variable 'ecc_size' set but=
 not used [-Wunused-but-set-variable]
+drivers/mtd/nand/atmel_nand.c:480:32: error: bad constant expression [spar=
se]
+drivers/mtd/nand/atmel_nand.c:488:35: error: bad constant expression [spar=
se]
+drivers/mtd/nand/atmel_nand.c:633:32: error: bad constant expression [spar=
se]
+drivers/mtd/nand/atmel_nand.c:635:35: error: bad constant expression [spar=
se]

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-c3RomT6FRXGvt0lLt7nt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7HrlAAoJECmIfjd9wqK0FH8P/A6J+38QMCQ9TQmUkPTtRtOw
tdLo/I1F6bJedp1k9H4a2VSJOZ/5oGvC4blpZeBI90OXrq/veuhdYnEkeSOqhZX0
Vbn2UvFHTpfD6yRJXglYBY/i2t/R3ptA0wVZfZyu+7Qe4tWPuIx+ISuteusEKZz8
q/pVpoZaaunmIdBa6trkuRosJHJwPmsFBT4eFJUHCR4P6AHNeCp0FIRcMBzBxvWx
WUIek//i4iRGspkwhDSVk/2jYWEsdvtACWXYaPCWY4N8EVYbFEaw631Fd0D991Z3
vNW7/f+nbhNSvwf2Gc6TvW8t8jJRJxL1odDLO/5+tGPQxxExG6EcfO5Kj+dlMvEC
ClTrSt/b2cyBg+sHy217wqjFc+gd4aZ8vZU96zC7+iMoVy5V9IfRyBFTUKzYB02p
zsh5su8VPfGrwy7ztfdS/6xw9f5bZ0DNqMfuE0jxriv2SmXJ8xVSZ7XFzBNXbwbe
TLGDRBZmSuZ1Aw4mQyawPFguXpQjMIApflX2GZHWotL8ink2zG2a8IMEX5wCzl7h
HGfA4bBzVIsByo4vOG//oefz62wargx1qYNHozLv3XKHCgV+iZjXFyOCqKK6OmZb
pSTkqBQAVVzmBdQD0PYYk+OxTg1pd6ZnfdN3rr9QbvzQdgsx/pCNGUPDyP5vhLny
Qsh00Y/w2+OEkw/Qukf5
=d4BX
-----END PGP SIGNATURE-----

--=-c3RomT6FRXGvt0lLt7nt--
