Message-ID: <1336738300.2625.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Fri, 11 May 2012 15:11:40 +0300
In-Reply-To: <1336561255-30905-1-git-send-email-josh.wu@atmel.com>
References: <1336561255-30905-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WKXhgVLddzqvv9fm5WEp"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
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


--=-WKXhgVLddzqvv9fm5WEp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 19:00 +0800, Josh Wu wrote:
> The Programmable Multibit ECC (PMECC) controller is a programmable binary
> BCH(Bose, Chaudhuri and Hocquenghem) encoder and decoder. This controller
> can be used to support both SLC and MLC NAND Flash devices. It supports t=
o
> generate ECC to correct 2, 4, 8, 12 or 24 bits of error per sector of dat=
a.
>=20
> To use this driver, the user needs to pass in the correction capability a=
nd
> the sector size.
>=20
> This driver has been tested on AT91SAM9X5-EK and AT91SAM9N12-EK with JFFS=
2,
> YAFFS2, UBIFS and mtd-utils.
>=20
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

The patch is really big - please, split it on more smaller patches.
Besides, it does not compile for me:

ERROR: "of_flat_dt_is_compatible" [drivers/mtd/nand/atmel_nand.ko] undefine=
d!
ERROR: "of_get_flat_dt_root" [drivers/mtd/nand/atmel_nand.ko] undefined!
make[2]: *** [__modpost] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-WKXhgVLddzqvv9fm5WEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrQH8AAoJECmIfjd9wqK0aqIQAJ60xLAhx9STaRMStA7ZuGct
qNLfEcOKhgTW/WJPlGViIDMFr+hglQNDZUjC6uXZT/DARMrgx+YwXoE99t46HJNQ
WCYzjLyUCULdtcnMnqQO5SzCxCJmi6Sy4Wi778QjXo6uzcFMGNyg3hN9rRewozO7
/C0ivN8MygQuT9d8vZc5pw7vf3bGh4XQ5qY72roXPc6NyOQ2nhyttfen45Smek6j
JxNOktOjvltsQfwYyWp/qYY6+D21Jde0JJO3rs4sZIiyyBrwSR5esPPT8FD2iEgN
qwkDuvKrsDn3Tn7IsFXgUDQzwR2Ha1CtGgi8SipEY/Il74JCEnuzG4LNHvTjImL5
acqvolE4nbtwLfI8DPAmuLPkzJ4uZc+Nx+rjQekwP/+4ZgNc/j1NDKOwZoshSmsq
oi8UlEkBvkEUZfbpL5QdidKDyftwOObS4f53WcPTPkV3cSMEsVxi6HfWL34U0m0N
hkq0mv3rp7DxNLs0LbiRtkVUaPQ9EeDatMZAPP4G7Y4FgRn7kDsIEZ9vRLu2JFON
PWm8L5k5XDVL8ffGYu3/WVTfVGEnxYnHQV02cuUeRmjwSGPMYFECo8HZpEWmUw1o
TFL4iFMTz3H3N/7OSJWJoU5d/Z6nbEmKmxrsKyYNADYgm0l1+xnACOnEFSn7A3gB
g1unxrSX8FwQ8dkQJDVV
=A2fx
-----END PGP SIGNATURE-----

--=-WKXhgVLddzqvv9fm5WEp--
