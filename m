Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaCUT-0005C7-5r
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 23:10:09 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] include/common.h: fix build against recent 0.9.33 uClibc
Date: Tue, 15 Apr 2014 19:09:45 -0400
Message-ID: <2055220.5Wt3obd1St@vapier>
In-Reply-To: <f4242477d038f71b8dce112047fae342878ebcf3.1397593003.git.baruch@tkos.co.il>
References: <f4242477d038f71b8dce112047fae342878ebcf3.1397593003.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1430243.Ui82vA7CMc";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart1430243.Ui82vA7CMc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tue 15 Apr 2014 23:16:43 Baruch Siach wrote:
> An implementation of rpmatch() was backported to the 0.9.33 branch of=

> uClibc. So the uClibc version check introduced in commit 50c9e11f7e
> (include/common.h: fix build against current uClibc) is not enough. R=
ename
> the local rpmatch() implementation to avoid collision.
>=20
> Cc: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  include/common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/common.h b/include/common.h
> index 3b1366e927c4..838dc757bdf1 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -107,7 +107,8 @@ extern "C" {
>  #if __UCLIBC_MAJOR__ =3D=3D 0 && \
>  =09=09(__UCLIBC_MINOR__ < 9 || \
>  =09=09(__UCLIBC_MINOR__ =3D=3D 9 && __UCLIBC_SUBLEVEL__ < 34))
> -static inline int rpmatch(const char *resp)
> +#define rpmatch __rpmatch

probably want to:
=09#undef rpmatch
=2Dmike
--nextPart1430243.Ui82vA7CMc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTTbw5AAoJEEFjO5/oN/WB9mUQAL8TfT2vWzrAksQxgyNMZmZy
Om2nIitBBpZi0L/H3PRHgfJah993fpqBpVTJgDuPTrOizN9XzCd5+IMf99yR/rY+
8pS6H5SbIY7yF/RQcZ+ri//UQUOeiuEqAp5O6Isf20OvOTTIWoQRsbKt+LJwug+a
EkYz9Zbdnj13CYv5Gq0PrzkzlZsqEmz0SgcjfdTwNbt4lMtNbgHyOJnFuC5JvXsP
Q7heiK+Rqmt5D29DBqI8CK8AJmA/aNlV5kamkt08CdJwREO0KZ+QPhxcWJNbY/A6
7l+q1SlBg9PHd2wMZm/TYQpU7XVwqdJrQDf/SP+hP3nGGTdoop4cmj965Nkgn4aU
12fdB9b34ZEVTkXrPbjHiiG47+24qboUcq3U5xs07AzSVyE8W8kFWGyULryvUrDz
Xbyxmfj3B8lQEhNMscurd0k8Bq+/09XcmUGVWCsRz4mgMDHO9JXQ86WFuUQSTPwh
smpTpVNymh7gxW6zS3r02t12xUJh1qXkYINDNRcgzzMywgQNH0orat+lZbNdkNl1
+4Kdkm7yZlM3y+Q6+f40bg2GO9+FCdAeaybvv+ITgFf1qWBCDnZSYwqfqRioBk68
l7ReFqPvOGPB/3tpeYg70ly0/wlF3/JzXP2jnP1RkMWuvVrCy7WWsI4gL5nyuq0y
IKMlL0fiU065CBmnaCJi
=t5P3
-----END PGP SIGNATURE-----

--nextPart1430243.Ui82vA7CMc--
