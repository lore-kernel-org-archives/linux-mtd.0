Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLvij-0007ej-At
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 12:49:06 +0000
Message-ID: <1349873358.20594.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: Simplify parse_cmdline_partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 10 Oct 2012 15:49:18 +0300
In-Reply-To: <20120923095229.5d0c6806@pixies.home.jungo.com>
References: <20120923095229.5d0c6806@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xtGdxSqKgJ08fmJxPA0Y"
Mime-Version: 1.0
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xtGdxSqKgJ08fmJxPA0Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-23 at 09:52 +0200, Shmulik Ladkani wrote:
> From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
>=20
> Simply 'parse_cmdline_partitions': the outer loop iterating over
> 'partitions' is actually a search loop, it does not execute the inner
> loop for each partition, only for the matched partition.
>=20
> Let's break when search is successful, and move all inner code (relevant
> only for the matched partition) outside of the outer loop.
>=20
> Resulting code is much more readable, and makes the indent level sane.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-xtGdxSqKgJ08fmJxPA0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdW7OAAoJECmIfjd9wqK0QqAQALKPmBx4HoZg6hgCMft5GXq0
Sh4NiR62icO5xUbA9lCTfPlmgFC+7nUA5Pi+xZfQPcVvyyJiJcnIUNTbx1+2zhtD
m8bq4gYS/ueFpb5ie6d7B7oEOaOSviOezmTKMURLOAzQ8NFyyzbkncAZUvZeaRnt
6uchTIiCYfzu1AhafOtCfaSmOdg5oJos2mjyDeWmLWUrjSNIuS4wyWC9r00ao2f4
MvPsHGEIP01Yck3ZGm+f1IqHLBpINFUGSj1cLBGarky3sAyHsNFVo+T04IKaKYPT
YlQESbRgzq4hJohvHCFU8wBK42JSNShfO3pCOYKWUiI4z6xn4dbFRGfPzQpWFNkX
IHqkez68Du+83uNFhEzx397v0zKhws+UG/cBPHUpWOWNQzzSDxwDFfpmbt8uJGuN
SxgrtwdXmCA0fNitecKSK+U5QerdEJ8DWrqYLH+ZmTqpL3MSY77yKJT9Q5D1UmSw
CxhwmH32wu/CqWOTC6sCm3Rau6Ddb9urRYcxFPmE8T6vENss1Iq+YQstCUSkLhqU
H7plx3yRpi3DkxPlo3T1bhRE2uCl/DBfraYBgpncuuavZd6yHBcdq8TFrrM3oaoz
H0ENSjK9TzxiPQE0AYAlGj7LM8s2EC+3ivVJHOgUKdLlf/+TYQ5M9EAjUJWOj3Kk
oKQQUohb8gQQet70SEIN
=jEVo
-----END PGP SIGNATURE-----

--=-xtGdxSqKgJ08fmJxPA0Y--
