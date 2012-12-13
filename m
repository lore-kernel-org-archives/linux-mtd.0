Message-ID: <1355398862.3400.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Thu, 13 Dec 2012 13:41:02 +0200
In-Reply-To: <20121212160108.GA2607@pengutronix.de>
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
 <1355325103.3400.2.camel@sauron.fi.intel.com>
 <20121212160108.GA2607@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JWPyXJ47q5fM3+YJsuJY"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>,
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


--=-JWPyXJ47q5fM3+YJsuJY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-12 at 17:01 +0100, Wolfram Sang wrote:

> > If you believe this is suitable for stable, please let me know.
>=20
> I strongly believe that.

OK, added

Cc: stable@vger.kernel.org

--=20
Best Regards,
Artem Bityutskiy

--=-JWPyXJ47q5fM3+YJsuJY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQyb7OAAoJECmIfjd9wqK0+z0P/2mKNvXb2WyZ95MJRN/8OXB6
yTnY0DXv3KWxzgug8RjfcmVJNsoeMVehD1BUHARqS3RKczoP8PExOaHg78V491Ii
Esv/GVwHv5mJh+A+Uqjrexrbi5vhFJKXnbQAIVCqINeX7M6qOSOn84YrM/nXlEgJ
TVGmHDuTmJKOEdUmpvDBdCe0fvRr0UNVS9M5mAwGfgOZnK2j8linZciBJuThBggc
MMBxnU6H76FHNYAULg2c/o/FIN8d3OoumKsKaqYECr6X5Le2vnUhtSvtw2y6MmHZ
xQdop0Xkfoah+P4k+YTIoQDGkgXBDVU47Mrnci96XPYTxCj0FhsMTgrdrdjL8LtZ
MZtHWpN1+xQv7qvkZeceYyuW3kyajv7o14w37GBAUwts/a61sNi6OC77uTwQ5JeW
k5k5NH1HbI2nSUHfh4UDcUcfBcb2iSSYsB5uCzEtLTZGGlrcR9oB7K9/wrjYVkn/
vS5QSaeFEyO3lEEsYAeEUW5o9dt1oTvNX5Y3N5lrMFzwjLd56IrZR3bJr/R8kkb+
Vdyv1/ZZX5oAE/AqTTq9y8yCfpSw2LR0kWUeEqHBaARPeyIcQuII9rLHNiXyLfPy
fU/cBvdJ3lPuAEhfrdxjl/pxky9t26lBK40eOXtb74GLthXzC8k8Qux37Rk5XPoV
Ld2Mf47SjV4A1neXv7Bt
=+ahH
-----END PGP SIGNATURE-----

--=-JWPyXJ47q5fM3+YJsuJY--
