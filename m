Message-ID: <1350308938.5769.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: atmel_nand: fix compile error when use
 avr32-atstk1006_defconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 15 Oct 2012 16:48:58 +0300
In-Reply-To: <1349678809-12092-1-git-send-email-josh.wu@atmel.com>
References: <1349678809-12092-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CLQMVTpiiQ94HBxnBTlT"
Mime-Version: 1.0
Cc: fengguang.wu@intel.com, egtvedt@samfundet.no, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, hskinnemoen@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CLQMVTpiiQ94HBxnBTlT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-08 at 14:46 +0800, Josh Wu wrote:
> fixed the following compile error when use avr32 config:
> drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
> drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of functio=
n 'writel_relaxed'
>=20
> Since in ARCH avr32, there is no macro "writel_relaxed" defined. In this =
patch we use macro "writel" instead.
>=20
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Why not to provide writel_relaxed() in AVR instead?

--=20
Best Regards,
Artem Bityutskiy

--=-CLQMVTpiiQ94HBxnBTlT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfBRKAAoJECmIfjd9wqK0YS8QAIJvehBVtYmkTWhaQFzI2SPo
0Bnp6l0l2N06gvy7e/NBSc4Vu6XbYSCCtastk7UlwW75puo4kVwlYZCVL4jtUGN+
V3daqJbFHcjcRyAwCDkxRlfSUTC9zaIcQ+RrfRZY3MV39608rlwmplNsThLvIOzS
0Onhlrnt8DKvo/WEf6JsYNKSij2YW5rNvtNPOxnzbUHZXp1U12xw13NuzK/9iQWw
vGU9jlUSMEiIRIp3A+csseci/KirmVnsqXW7UqZrOLbCiLl5QrG+uJSjagQNXKHI
URy7KVBJdl+qWdKU5R0FSxOSZpsar1BU+u8Gdbv10y8KY5NgCgU4jXuwR2F7bPIw
hN8RhD8uFs3zTMiOLqfVGRNq0zB3vMJI8X6ya8axkGqKImS7D1e5h2aE0m+SIX3f
O/Jpl/rnyhRvNlclvW61+mjCndEnGA6QQ5SAYR49Fp+zW5vrSLE7dnVqh+CnD7Qj
GXPKKne3wGWZ/ZinngDWPthn9h7zuXDxf3CNHlIQSbVanLlx/Aw+DBY2riRDUvMK
H68G9C97f9SnmelfFaF7lG/QIkXabQrftyPisuqqyS11nFsClIWblG8d9+ApxMk2
yMLkkEZq57hsqC+09q/uKJyAB9MWUIIynR6NIrw7r+WhTzkzm84Av61cPk9r4TZ2
cDNZd3pgoKsyLsCFaEEp
=H/SS
-----END PGP SIGNATURE-----

--=-CLQMVTpiiQ94HBxnBTlT--
