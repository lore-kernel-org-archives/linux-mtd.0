Message-ID: <1358252760.2731.133.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] MTD: at91: atmel_nand: for PMECC, add code to
 choose the ecc bits and sector size according to the ONFI parameter ECC
 requirement.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Tue, 15 Jan 2013 14:26:00 +0200
In-Reply-To: <1355912840-29501-2-git-send-email-josh.wu@atmel.com>
References: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
 <1355912840-29501-2-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-myoLeFwOo5SpjnJzsNDs"
Mime-Version: 1.0
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-myoLeFwOo5SpjnJzsNDs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I cannot compile this patch:

ERROR (phandle_references): Reference to non-existent node or label "pinctr=
l_ssc0_tx"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/at91sam9g20ek.dtb] Error 2


On Wed, 2012-12-19 at 18:27 +0800, Josh Wu wrote:
> This patch will check NAND flash's ecc minimum requirement in ONFI parame=
ter. If it is equal or smaller than pmecc-cap in dtsi, then use ecc_bits in=
 ONFI. otherwise, return an error since pmecc-cap in dtsi don't meet the ec=
c minimum reqirement.
>=20
> This patch also check sector size (codeword) requirement in ONFI. If it i=
s equal or bigger than sector_size in dtsi, then use the one of ONFI. other=
wise return error.
>=20
> Currently we don't support to read the ECC parameter in ONFI extended par=
ameter page. So in that case we just use the value specified in dts.
>=20
> For non-ONFI nand flash, we assume the minimum ecc requirement is 2bits i=
n 512 bytes.
>=20
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Please, wrap the lines like kernel developers usually do.

--=20
Best Regards,
Artem Bityutskiy

--=-myoLeFwOo5SpjnJzsNDs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9UrYAAoJECmIfjd9wqK0b7YP/2/vLGfJ43WHkUJkGM/6na+A
qlKJJ2qnpkUMzbLYUpmTuP57Ob+o/RckwXb+ywMHEADtjAW8i250FHfqeuhTgRAl
8qZr+b3P800KdVeMIxseRIndh/+HGdB2eE0gv1DxVYGA4GQYrpLXqH86gYomoy2C
sL1V2sIGcQmqcBDLGYdPuAG/aBLg4yjCmHhBLENEA/qBlMHI3ve/DBxxyZ9AO8rJ
3ieTo/orDM6BU6OPtjssbGWgVrqfxXpUBYrP6nnQljtwjWcShSVcw4HqS9ReYDbl
uvoc/VAsz3ug4gXbZV9/1TBYr7Enc6gFqc1dWXOdbD5johhW2UGr2w4NAXsOdesa
eHUe1hUxELfU4orCDP82fGmZihPQFFau1qlZ8Ef4i9qoQ2ZdIEqlVV5A2r1EYHU7
Y+2pM3fvysKZEgY/gmECxdLByW+LSSsoFUmMG6he9ejJplgxaxEoJhh7QCbhIS1e
8YynfVLRds6B0J96vtXeXuIMC1J6wmrGHJ1AyMBqRKLfowWPQjTPQqIYdeiaKH4U
YiO0yrud1fvwfxwC+WawsP0YpfU1GbXRRnr+CWxinjni8pHp/vOh7QQDKOVXbnoz
Mwv2gKjfTgM943uMSHvAt8TAQ6VxilgRSpax+MhNJddiXz7GqlbsmzJUAYGw3bn1
16kcYBmaQRwRsf5zqmKa
=3q0Y
-----END PGP SIGNATURE-----

--=-myoLeFwOo5SpjnJzsNDs--
