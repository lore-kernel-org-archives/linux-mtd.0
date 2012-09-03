Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8YS9-0002HI-H7
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 15:20:42 +0000
Message-ID: <1346685918.3061.66.camel@sauron.fi.intel.com>
Subject: RE: [PATCH] Test for multi-bit error correction
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>, Akinobu Mita
 <akinobu.mita@gmail.com>
Date: Mon, 03 Sep 2012 18:25:18 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 ,<1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zDQZ7BWQVxXNPV8aE/Zp"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zDQZ7BWQVxXNPV8aE/Zp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-31 at 08:59 +1000, Iwo Mergler wrote:
> This tests ECC biterror recovery on a single NAND page. Mostly intended
> to test ECC hardware and low-level NAND driver.
>=20
> There are two test modes:
>=20
>     0 - artificially inserting bit errors until the ECC fails
>         This is the default method and fairly quick. It should
>         be independent of the quality of the FLASH.
>=20
>     1 - re-writing the same pattern repeatedly until the ECC fails.
>         This method relies on the physics of NAND FLASH to eventually
>         generate '0' bits if '1' has been written sufficient times. Depen=
ding
>         on the NAND, the first bit errors will appear after 1000 or
>         more writes and then will usually snowball, reaching the limits
>         of the ECC quickly.
>=20
> The test stops after 10000 cycles, should your FLASH be exceptionally
> good and not generate bit errors before that. Try a different page
> offset in that case.
>=20
> Please note that neither of these tests will significantly 'use up' any F=
LASH
> endurance. Only a maximum of two erase operations will be performed.
>=20
> Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
> ---
>  drivers/mtd/tests/Makefile          |    1 +
>  drivers/mtd/tests/mtd_nandbiterrs.c |  460 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 461 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/tests/mtd_nandbiterrs.c
>=20
> diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
> index b44dcab..bd0065c 100644
> --- a/drivers/mtd/tests/Makefile
> +++ b/drivers/mtd/tests/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_MTD_TESTS) +=3D mtd_stresstest.o
>  obj-$(CONFIG_MTD_TESTS) +=3D mtd_subpagetest.o
>  obj-$(CONFIG_MTD_TESTS) +=3D mtd_torturetest.o
>  obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandecctest.o
> +obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandbiterrs.o
> diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_=
nandbiterrs.c
> new file mode 100644
> index 0000000..94e908e
> --- /dev/null
> +++ b/drivers/mtd/tests/mtd_nandbiterrs.c
> @@ -0,0 +1,460 @@
> +/*
> + * (C)2012 NetCommWireless
> + * Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
> + *
> + * Test for multi-bit error recovery on a NAND page This mostly tests th=
e
> + * ECC controller / driver.
> + *
> + * There are two test modes:
> + *
> + *	0 - artificially inserting bit errors until the ECC fails
> + *	    This is the default method and fairly quick. It should
> + *	    be independent of the quality of the FLASH.
> + *
> + *	1 - re-writing the same pattern repeatedly until the ECC fails.
> + *	    This method relies on the physics of NAND FLASH to eventually
> + *	    generate '0' bits if '1' has been written sufficient times.
> + *	    Depending on the NAND, the first bit errors will appear after
> + *	    1000 or more writes and then will usually snowball, reaching the
> + *	    limits of the ECC quickly.
> + *
> + *	    The test stops after 10000 cycles, should your FLASH be
> + *	    exceptionally good and not generate bit errors before that. Try
> + *	    a different page in that case.

So basically you test that ECC works, and you are trying to be
independent on the NAND HW and the ECC type. Right?

How about mtd_nandecc test? How is it different? Do we need 2 tests?
Why?

Akinobu - you recently sent a large patch-set for mtd_nandecctest, could
you please also comment on the above questions?

Basically, I would like to understand why we need 2 tests, and if we
really need 2, have the differences be documented, at least in the
commentaries.

--=20
Best Regards,
Artem Bityutskiy

--=-zDQZ7BWQVxXNPV8aE/Zp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRMveAAoJECmIfjd9wqK0RmkP/2lPIO3O4oBdcdx1U05VNhXE
HXlp1w/d4Xm2EQiF/qHkk0QMENLq0YTWz48AoF08XTVHmBw1wF7vJuHf9XSICR8C
zxIpqKTNyortuyArtcT9+42+ylDoCZWwPg48OeOFfuA+Ezdg/SDtwbxSei5QuErH
Uonn/kTdA2YuuOmSqXBBxvNdxVeadXkOA4a+1bEYi3/ErpUUjB63dUCTZJ/GEe+K
J1GxnHPQb2c9q2/ewbAbNMflP8TKAUDJFJA8OzoXAX6FRwJ6+2SDUKv0zdVuBaMI
Wng3PEVhnFprHqw+PTauf96pfsuulDlo3IcuNRrjCc8Bm3dqpraFgPaL+QsAZ0w2
IrGfygUxrdV4L8lY/+Vwi1Etk/7ZNVaxVuqZhc33GjZ3fVB7bjJLOnwJdMCSUeJn
IF0USWfOhpBnvmwl9Z989T9Y7yLqMYPOCp8Xi7AgKJIupCKSjAi8HIMwpILPRFJ/
7iQCnehrSGB8prJfsA5JW6APWwRwnkRLArv5M3UNtPOuHWM3sr0icYq4nx7pZCCp
FnhI1FL36NIqeWRbrCJJOOA52kW7Cs7jme5jkqas9pC3nhC1wxbf5IeAGbn0qLGF
dRe926e1CZZFJt/zRbwIhdUO31+QFuR9p2/MjhDwS12Hc0b26pwVDdfGZ/mdz/z3
22ATCWQUHXtxfCw04Kqb
=QwG0
-----END PGP SIGNATURE-----

--=-zDQZ7BWQVxXNPV8aE/Zp--
