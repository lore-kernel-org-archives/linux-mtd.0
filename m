Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbBrS-0003YG-SC
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 15:05:13 +0000
Message-ID: <1353510354.2701.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: sm_ftl: Remove unused kthread stuff
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 21 Nov 2012 17:05:54 +0200
In-Reply-To: <1352565322-8731-1-git-send-email-elezegarcia@gmail.com>
References: <1352565322-8731-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Hlq0dZriq4Lt/KqFBiL2"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Hlq0dZriq4Lt/KqFBiL2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-10 at 13:35 -0300, Ezequiel Garcia wrote:
> This driver uses workqueues, not kthreads.
> Remove kthread header and thread related comment.
>=20
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Aiaiai [1]!=20

Aiaiai found out that this breaks the build!

drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]

Include <linux/err.h> instead, I guess.

[1] git://git.infradead.org/users/dedekind/maintaining.git
    git://git.infradead.org/users/dedekind/aiaiai.git

--=20
Best Regards,
Artem Bityutskiy

--=-Hlq0dZriq4Lt/KqFBiL2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrO3SAAoJECmIfjd9wqK0i6kP/ReqBvCfo5+OzpaGag85WFRR
mtwv71yx2JFAZQeo49r/krBh14sG61MAZLBh7koNYfhcNZM0Xb1XYR6Gje9fKPkz
D9oCC4uP8YT83JwcMHf4CS8a6h3eDXbDHFrKDkNvN/E3GZZYo5k1TPyEA1V9fF6T
kpLO23VnHpr4EUZ0KMbCXF6pwIOuNHdcbzUlfO4D7/s2ujRXVObHhUmsQqOJwxzD
yMTqIAk3dw/Xhpc/moMBdJAEvB/tEhYlKqok+u+kd/BsxKllD/P9h/Pvse3oVGgM
SIXV25cGRcD+0nXSq/xk3zAsJocuVo2DQhgL+bvjgfr86w7iEvJX56ws7kk8nhL7
wXPMsxffHcTGMdBCMz6uVAwvq81LZPfmTZYDVTFrt9whKFsfTbSxUJwSkeaPWHNN
/gRDCHXJy4+s64nWlw9vKrqKj4gl109p0+W6bh7B6t0xSwEVMTO6TQ0Lfsm7eNMf
a4dSSCSl8KFjMIEGspRf030C4AqaBB9se2RLNqGBOx7FxTIhHvr6wd9d2r/fUa/Z
LIlhLcV/fQyZY8BLWUSLoySYdVHjmLvns8dvXE9I7eVm6dKbe1HNYlXhEpsC5Z0h
cXyiAPpKRnIJOjXtyFuAE37BPMHlW8CK+eMKSPQGd6i2x4ojoWhuxb5p9kvhr4Fl
bMnycs0X6PEt+/o4KsSp
=05J4
-----END PGP SIGNATURE-----

--=-Hlq0dZriq4Lt/KqFBiL2--
