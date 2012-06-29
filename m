Message-ID: <1340969124.3070.155.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 29 Jun 2012 14:25:24 +0300
In-Reply-To: <20120627175234.GF18096@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <20120627175234.GF18096@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-T5j3DZAVHIvkmTGpiP44"
Mime-Version: 1.0
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-T5j3DZAVHIvkmTGpiP44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 19:52 +0200, Uwe Kleine-K=C3=B6nig wrote:
> I don't know about the sparse problems this introduces, but without this
> patch the mxc-nand driver is broken, so it should really go in before
> 3.5.

The problems, AFAIU, are that you cannot directly dereference __iomem
pointers, you always need to use helpers like 'readl()'. This patch
introduces the following warnings:

+drivers/mtd/nand/mxc_nand.c:281:33: warning: incorrect type in initializer=
 (different address spaces) [sparse]
+drivers/mtd/nand/mxc_nand.c:281:33:    expected unsigned int const volatil=
e [usertype] *s [sparse]
+drivers/mtd/nand/mxc_nand.c:281:33:    got void const volatile [noderef] <=
asn:2>*src [sparse]
+drivers/mtd/nand/mxc_nand.c:284 memcpy32_fromio() warn: side effect in mac=
ro '__raw_readl' doing 's++' [smatch]
+drivers/mtd/nand/mxc_nand.c:284:24: warning: incorrect type in argument 1 =
(different address spaces) [sparse]
+drivers/mtd/nand/mxc_nand.c:284:24:    expected void const volatile [noder=
ef] <asn:2>*<noident> [sparse]
+drivers/mtd/nand/mxc_nand.c:284:24:    got unsigned int const volatile [us=
ertype] * [sparse]
+drivers/mtd/nand/mxc_nand.c:290:27: warning: incorrect type in initializer=
 (different address spaces) [sparse]
+drivers/mtd/nand/mxc_nand.c:290:27:    expected unsigned int volatile [use=
rtype] *t [sparse]
+drivers/mtd/nand/mxc_nand.c:290:27:    got void volatile [noderef] <asn:2>=
*trg [sparse]
+drivers/mtd/nand/mxc_nand.c:294 memcpy32_toio() warn: side effect in macro=
 '__raw_writel' doing 't++' [smatch]
+drivers/mtd/nand/mxc_nand.c:294:17: warning: incorrect type in argument 1 =
(different address spaces) [sparse]
+drivers/mtd/nand/mxc_nand.c:294:17:    expected void const volatile [noder=
ef] <asn:2>*<noident> [sparse]
+drivers/mtd/nand/mxc_nand.c:294:17:    got unsigned int volatile [usertype=
] * [sparse]

The "volitile" should be also removed.

--=20
Best Regards,
Artem Bityutskiy

--=-T5j3DZAVHIvkmTGpiP44
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7ZCkAAoJECmIfjd9wqK0edkQAMdxkrks0KLnatYvfMCGoidB
9tlVhuKqRvwYIZJp8DOv3Fd/nDXBeGoF1k2vtXinhW9jxvup73/xuFFGVGbdNiUL
plpSqvtGxIPL4m68xiv0HK5aAY1w/C4jPwkKzvNYWjHx/vcJXPGWzAS92i/A09mY
OHsBOdAUFrE1nWehMC8NS++cmmXkHbRLjoCPfJmwAjWO948rNk78Cv9jTpysu6Br
pf+5GQa2kTEmhjXkDmgYylmyerUg5+l97BlpDsbFFI+Mdh5nxSwpHT4+s7Mp2Gm8
1GGeE4EEPFzWkaOqaVpFk2au5SQKX+zTkXUY7CJRuXbK5iNupPqTEulPuRt9/XOC
PdvvfGJmyPYs1ATaX0nZuy8NQawSANHx84mdTqtVxtcAxbfgtbORYSmWW0+sHpjg
H5nrzgq2SGDc5bpQuGO2MAkIOCqDKZvPe74KB1g6wNATg/vxyhWExwfi4flWwHiE
CjBj0RSM9wPWSchqIJ3sRrEPugXJOMvUIfg/O6MgfWJGN4Df/FJ5uaeQPqhmJ8vX
9IPZYrJsvRCeSbJTSwq8+S8KV71ntG5+uJgX5Ukt4Elxuzklx5VqBc92a2o7fxxN
YTLqMkreS8Tyyq90BCk6ddSjpGFr2oaaQLP+PsMACKrydEJPETyaeip2VZApe46j
9fPn89mmoSiHUyjZ7S36
=e50J
-----END PGP SIGNATURE-----

--=-T5j3DZAVHIvkmTGpiP44--
