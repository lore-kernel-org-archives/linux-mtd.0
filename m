Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUzZd-0002Z3-HV
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 12:12:54 +0000
Received: by lbbgg6 with SMTP id gg6so1549169lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 05:12:50 -0700 (PDT)
Message-ID: <1337256768.2564.7.camel@koala>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 17 May 2012 15:12:48 +0300
In-Reply-To: <1337201522-86521-2-git-send-email-richard@nod.at>
References: <1337201522-86521-1-git-send-email-richard@nod.at>
 <1337201522-86521-2-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-usE+qSLH5LsVUpYCnsTY"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-usE+qSLH5LsVUpYCnsTY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 22:51 +0200, Richard Weinberger wrote:
> The fastmap mechanism needs to read the next sequence nummber
> directly.
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>

Created a "fastmap_v6" branch and put this stuff there.

--=20
Best Regards,
Artem Bityutskiy

--=-usE+qSLH5LsVUpYCnsTY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtOtAAAoJECmIfjd9wqK01DoP/3EsIyNWbH9Zl4QeRaMU1nxX
mKbudpc+rj8n15kbu5eBgkYiciIks0Gso03sga+2Pdh1N2Iu9dw20n6+GSZs8HfS
GQ460VdTaXb5TDFcDn9ho195fkV4rZPlbc8s+BUKMGW4e4IL8B7zSdVG6clh2Hkc
dnQYC1RjoDwyg86XxyL87qZEf5t9QYGkZTUVsrjzk149u6zjqjBTum2G8Xtvusur
ZIbV+zpr4Zj6ljQWL4CVJxAZHaNgQN4OVGYBH29yCvgY5UKM5ophynVYScLygx7P
pkrnu8zqBi927E9vTbFujCRl+K/C4w0Yil7dKn41GSrGLzOnlKskm2WgVM1fR2cn
TJSoxVwpcaJq5yVhOyOs1nKcVkAzMT4cfDkJWK2Ha8DZm80F7vnVpFRu6Lcn/svx
2zCqwKHOhYMdqlGCWEZG7A2z+sJh72Kwimrafl0tpsAlqBfCJadmZVGEqDZo0le4
3R6a26x+hVZ7TSwVoqtWUoRAX9cWTHHrxi17aROpNMCvNykp9ivJSLJn9n1Qieav
NrnGwbs+E5HjFk5r8/0RrFxiniLV2MceSAo3CdDbwI7aZxNVRto+PyifNdOyVyWJ
jyxNBDnFTOqvEnvFX5GcK4ff9jl+WzdcA/cmj8sRQGXmu6nxJabM3tcEWP+pAhiW
TCVYN+7dpruEI5GBhtgN
=7o/o
-----END PGP SIGNATURE-----

--=-usE+qSLH5LsVUpYCnsTY--
