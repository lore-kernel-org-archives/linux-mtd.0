Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3XGX-0004wP-HL
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 19:03:58 +0000
Received: by bkcji2 with SMTP id ji2so2305620bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 12:03:56 -0700 (PDT)
Message-ID: <1345489433.1789.2.camel@kyv>
Subject: Re: [PATCH v3 2/6] UBI: change CONFIG_MTD_UBI_BEB_LIMIT range
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 22:03:53 +0300
In-Reply-To: <1345478416-23900-3-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-3-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rN7v6jA5gZedlvUgsOVY"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rN7v6jA5gZedlvUgsOVY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> There's no reason to limit MTD_UBI_BEB_LIMIT to 256 (25%), let's set it
> to 768 (75%) this should be enough.
> And the lower bound can be 0, no reason to forbid it (even if it will be
> reserved for test purpose only I guess).
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

I've folded this patch into
"UBI: use the whole MTD device size to get bad_peb_limit"
instead. Yes, I know that value 0 is not handled at that point, but I
think it is not a big problem (AKA good enough). Certainly not worth a
separate patch.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-rN7v6jA5gZedlvUgsOVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMooZAAoJECmIfjd9wqK0pnEQAKTKyy+seglPuAQy2IhdsNgc
peOBGDjTxJBCqOizb5pzbOtituJHlD9i2M1qZJR85hxcPJsfcW/4fmNKL09iSFuk
+wSzkqfp69Tmy8cdd8MC7kNl3AEsb/EHIFC9IEmfavykCGael5vXF7CTY0Imam8W
l1yrOD92twnnj8g9vheeulaP7OouGGYZ0Q3CDCnrkzyYrJziIz7fqEoHpWdp6UzB
AQuP7hSi5T/pL7ZksBwXYvDf7nq8cFU4K3T/kFThCVDctzeepwd9JT0Gi+tr7d35
t0vvPTUmKYQS+Lu+60imF0w8HoFe4AtQHMpjGBp6zPjhZ7JU3SyQpP3+I4y4U9IO
i74iI8sBLSkEVn2DSG8S/cSCvyr3KQMj5xk+P72PmlIbmqliNGMPkyUcEPyk2PIR
zuabCOEAoFve/DikFMJpQtQaqGLXpn2/08m6gr4bauToHTyG587pVJY07SVL41CK
7hRaRZGDwDL2WazzMJcnXZf03TirzThli3Kv7vZ/7Ux5aoWVg/fnA4S+Ea9TaohF
yuCjUoULnB2OsHUgR4eAlIBj8l+x48cGJbX6eE0d82AKYb9gk5YZHzGQnVoMCsFf
Ltpzq2bF2vt9kzWF6xJhJqhBDn7937ftl9oBD3UAK0PdXiqPxKc2JnqBEdTqB7D7
nWj9QIAuUxLALHomlfo7
=NZkF
-----END PGP SIGNATURE-----

--=-rN7v6jA5gZedlvUgsOVY--
