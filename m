Message-ID: <1342595359.31927.11.camel@brekeke>
Subject: Re: [PATCH 1/5] ubi: introduce ubi->bad_peb_limit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 10:09:19 +0300
In-Reply-To: <1341389164-24409-2-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-2-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WpSzEhbJN1ZrP15UtFd3"
Mime-Version: 1.0
Cc: Russell King <linux@arm.linux.org.uk>,
 Richard Genoud <richard.genoud@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WpSzEhbJN1ZrP15UtFd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:06 +0300, Shmulik Ladkani wrote:
> Introduce 'ubi->bad_peb_limit', which specifies an upper limit of PEBs
> ubi expects to go bad.
> Currently, it is initialized to a fixed percentage of total PEBs in the
> ubi device (configurable via CONFIG_MTD_UBI_BEB_LIMIT).
>=20
> The 'bad_peb_limit' is intended to be used for calculating the amount of
> PEBs ubi needs to reserve for bad eraseblock handling.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Created branch "beb" and pushed this patch there with minor amendments
(see diff below). Let's use this branch in UBI tree for this work and
merge it as soon as it is ready.

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index c33e25b..dee90b7 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -668,13 +668,12 @@ static int io_init(struct ubi_device *ubi)
                ubi->bad_allowed =3D 1;
                if (CONFIG_MTD_UBI_BEB_LIMIT > 0) {
                        int percent =3D CONFIG_MTD_UBI_BEB_LIMIT;
-                       int beb_limit;
+                       int limit =3D mult_frac(ubi->peb_count, percent, 10=
0);
=20
-                       beb_limit =3D mult_frac(ubi->peb_count, percent, 10=
0);
-                       /* round it up */
-                       if (mult_frac(beb_limit, 100, percent) < ubi->peb_c=
ount)
-                               beb_limit++;
-                       ubi->bad_peb_limit =3D beb_limit;
+                       /* Round it up */
+                       if (mult_frac(limit, 100, percent) < ubi->peb_count=
)
+                               limit +=3D 1;
+                       ubi->bad_peb_limit =3D limit;
                }
        }

--=20
Best Regards,
Artem Bityutskiy

--=-WpSzEhbJN1ZrP15UtFd3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBmEfAAoJECmIfjd9wqK0L8oP/2ZFc7DJ6B0tNy1WK+SCIqb6
OfiBMepSM1g2hxohgovjIQPw+xWJF7vno+zwFbDobha0NBf8r/8/glQS3LCluONa
nz8I3zPakamDE9zYQrlPsI+hZv8DWxiRFbfeNy0c304S9sinfhnAyACGfEQwmJia
yqdNp4XZgcDch5Cswu57f6Gtzk8s2PjIpWzpwO6Iquq6fKQ1hNrZ06qcFbnNbuGP
M9/iM7N6j3QxTJYGy8fOvCKIOA0LzfBP0erj1YbVlKcuvMiFU8Xdk3x1yfGZ9iPN
ErAdFhcmZHk6AvzxucMfvp+cE5VieFox1Qx3rPvlUl8S9RO5AYUUfpLNLR/JKOeB
YgybHkqqRQIMcOOi4V63mlXuDvJOey76BEfmW//oIVaLnYawsBEKnaI4TFZ+WGl6
/VnoS7YjYFC0kS8BqS9FqtWen0RJDW6cRNxX+b0OPQYoXfmozPD7Ys2hqix9Wj7S
Qm3LhixiJeJC4yGIs8Vv3QG3vRNpw/mkiW6H5BtIgXm+mo5yWhGZhZFLjm7HzX0R
YRBJEfflX0UraSL9I04WGVX3v7DphQl1JhgniUsiR5cSjGWb8qDjDkRB9TjlCmGY
Lo0yzR4kHmS8kf4Q72BGSb8rIXM0IZcCQ9yK/YAwf+mgxE7WzfY8vmZ+AgPDvg4u
9pmbK0sAWqbaz0wHKCWQ
=yXbr
-----END PGP SIGNATURE-----

--=-WpSzEhbJN1ZrP15UtFd3--
