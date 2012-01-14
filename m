Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5Pw-0005hf-4c
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:21:16 +0000
Received: by iakl21 with SMTP id l21so7070876iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 07:21:15 -0800 (PST)
Message-ID: <1326554573.14299.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/15] drivers/mtd/onenand/samsung.c: add missing iounmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Jan 2012 17:22:53 +0200
In-Reply-To: <1326362117-29371-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1326362117-29371-3-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-T9C2Iw53NBO31oPSPIx5"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-T9C2Iw53NBO31oPSPIx5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-12 at 10:55 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Add missing iounmap in error handling code, in a case where the function
> already preforms iounmap on some other execution path.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-T9C2Iw53NBO31oPSPIx5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEZ3NAAoJECmIfjd9wqK0WDAQAM+B9KNeDj1a8+yUPuSTcm54
zLKKSwk6IoIHjVLEY+phkQTyhsnmCF8aZEo7wFwJ1x1TITILx474DpG7xOhj+VS2
aE0Kkjuzmgx5pimqdIORo61EL101Ym8lBB73G9KPtyqX8wqMcvAwAd7/Q1bumqXv
8BoufXR7sI0V37uQPZii39kiz8/2ZDP69fI2M3syOymZcBT2/FFG5/Dcyoxn1Mw3
krz6U2P/SF6rjYXcbXXnO+VLjQkM4P0y3r9j3AJdeX6D6OnpUeYW+aBJnUFMEBuv
wh63uB0ZZnKEMon2WbIRpPqitUFOibbQZ/g2Gc+8AxvmO+YaX3M8ZKjwtinQG3Dm
SFMTNM28ZBWnvmZjMehnMs7rIjJ1E7ufdvLg1glcIyY8iCpZN13tlCZtMyLoJMzD
WivgI/DlZxRodVFM8uIHcmTlqEDOD1eSHiPf1uKrWuIFZgbDR5jO1x3/l8jjvMyg
sU1MnZ0VcXORNi8zRA01Shcy0lOD+PhPcHSHPNbQrSkMDLsqDOIX/FaFki7UbC8Z
DvnhIRv4KCC73iL6cy87ZuJwe7SHyQ1uPyzQX6PxHYyoLJMhh08QuSZCEyY+pi33
NKg3gojsh+JxQLgH5hdtytdvKPOzcWn3q+MPZfpQEqpSWke7tQlIK+LjUf8FD1WW
rYNiphyBakDc89Wz+8yb
=uOYz
-----END PGP SIGNATURE-----

--=-T9C2Iw53NBO31oPSPIx5--
