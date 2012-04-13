Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIiNg-00031C-CF
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 15:25:49 +0000
Message-ID: <1334330926.2544.88.camel@sauron.fi.intel.com>
Subject: Re: Alternative License for Parts of MTD?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Date: Fri, 13 Apr 2012 18:28:46 +0300
In-Reply-To: <4F883513.4000301@embedded-brains.de>
References: <4F883513.4000301@embedded-brains.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-N7JPwCnShbbpVKlimH97"
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-N7JPwCnShbbpVKlimH97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-04-13 at 16:15 +0200, Sebastian Huber wrote:
> Hello,
>=20
> I work with the real-time operating system RTEMS (http://www.rtems.com). =
 The=20
> license of this system is GPL with an exception that allows static linkin=
g=20
> without restrictions:
>=20
> http://www.rtems.com/license/LICENSE
>=20
> This is very similar to the eCos license:
>=20
> http://ecos.sourceware.org/license-overview.html
>=20
> RTEMS has currently no framework for flash devices.  It would be nice if =
we can=20
> use parts of the MTD system, e.g. the header files and device independent=
=20
> support routines like "drivers/mtd/nand/nand_base.c".  Is it possible to=
=20
> release parts of the MTD code under the RTEMS or eCos license, or would y=
ou=20
> categorically refuse this?

Irrespectively of what random people in the mailing list think, this is
a question to layers. And I guess you'd need to have permission of all
copyright holders, which I guess all people who contributed, and this is
practically impossible to do. But I do not know for sure whether this is
correct or not :-)

--=20
Best Regards,
Artem Bityutskiy

--=-N7JPwCnShbbpVKlimH97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiEYuAAoJECmIfjd9wqK0i0sP/0FnWepb35yWa8myJ1+jBxU1
mpZXJG/4Iw/n1FV62ImH9T02qYR9LcOSe1kkld7r+pePFuIk6eDZidAAZ6dCqokg
bDUC2wEE9IC+TONi/6GtBwL1vtWAtkwxmGzIx0nFXTP6kb5FE2AugEsPgyh5Cy7B
2kXhLmjeiUpCXabyO7vywSKF78Lc6R5VRlKCVzxQc7+s7CEZT5PZAg5bALBqpfw8
XNvNVV32Re+VFe1pfzmeKSlfGUI33LGbikjH6Y72xZeUTxmdxSSoAoRani7K65Xr
h7ihVwe+YSApmE/zyxBvt7C+1HGeNjWeyFZRoQ0D3/1zJq2E2ed1/XBjDuBDOFmR
FLXXNLRHdplI3c4WoBX4XfEFh4iUBfwX1+q/P31UmJRiNALBpwjy59I9lFk6a9eb
KgNo+eX4L06VMneNevQvU20zwbzkhmGdTLCd88EoYRcTwRCtoaAPM+uowM6oqm9w
YLbPD2Jm7YOxEgwjz9SM6dnnhMINFqBwlOZN1WJfs5g0gGQONBard6Lti6yQQRHB
pTdKluTPEL8zifZHA2xKJVOYsMC3RNpG8AMyzhjH0vlaO746+sfHiTIZyV3b4LS9
ummlqZEAGZxTqCCyb6wJmt6YQDdKPxbAOS9p4aBwljgqR5Y0o6HygZJa+IxBhe7W
YgX3WddFmDcXpgOf3u81
=LZjs
-----END PGP SIGNATURE-----

--=-N7JPwCnShbbpVKlimH97--
