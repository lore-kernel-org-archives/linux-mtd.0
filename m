Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOTN3-0007If-VO
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 13:09:14 +0000
Message-ID: <1350479369.5769.153.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Date: Wed, 17 Oct 2012 16:09:29 +0300
In-Reply-To: <507DD09C.6050600@gmail.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
 <1349954577.12014.13.camel@sauron.fi.intel.com>
 <507DD09C.6050600@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-duizr8Wuofclj7EueSSn"
Mime-Version: 1.0
Cc: arnd@arndb.de, dmanna@micron.com, lporzio@micron.com,
 linux-mtd@lists.infradead.org, valibert@micron.com, svenkatr@ti.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-duizr8Wuofclj7EueSSn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-16 at 23:24 +0200, Vincenzo Aliberti wrote:
> The only Warning is
> WARNING: line over 80 characters
> #605: FILE: include/uapi/mtd/mtd-abi.h:112:
> +#define MTD_CAP_PCM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
>=20
> But in the file include/uapi/mtd/mtd-abi.h there is already the raw:
> #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)

You can ignore this warning.

--=20
Best Regards,
Artem Bityutskiy

--=-duizr8Wuofclj7EueSSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfq4JAAoJECmIfjd9wqK0jjwP/jNBAnUX5C9J7QujegEuCwEW
DSA6dOE6lR/fvyg5yNMoELvGMmzONXx5lASy9qei+JvEvI1J2WkfFdpJopoKsDrH
CxwfuGUwparevyjKRxQc3DDft2Ax5N99p74rjtBh3unrP7eUbFSd4J2uBU34yj1H
gSUKJwC9hy/tuoe12xIfKowtjQJJ7ZdWgaauSZ9TxVheC00oXQE2WGa30VbXO1+q
TBhOWAPL8FcTK7D3tTBHAOvEwA059q+5vfQhVuoqrjAH9LBmCVRXYWfLNYvTsiLZ
sZGNIDMTWpFDFhWQp5FxHZqnhtpllXyFNSW1dL6+TpmpDIXvKbYG9NW93u2ZGn8N
5G6w26cy7QlmFtk9ixISQwugH45Kmwz1ahfKQ4En4hjs8h89CgdUT7Uzz4AAmHXZ
bBS5QPtpAhz8XDlfdbAY1Bej82tDfsv0qZuqJ3SUQ5NQaEuzmD3N7WO8tZUEBACm
aAynt1a6REOL2DkDwK4NelU52JH3b+hD/qYMDUSTuRKRl2BDFDqg8aazeS0OTRup
QPprKhi4O/zv0gvRZ02xhLWcK4uB+jfxpVUWFlDkOUR7cproGoGxUawuhxdgibr/
C9Ni+0+xLhq+5dRPwAoQuXuCn4n/y74tGMclZbStEuHCxm6Vj7dNzyApo2eaDw5j
y9mGEz1q0O9XmpnsV3Dv
=b48n
-----END PGP SIGNATURE-----

--=-duizr8Wuofclj7EueSSn--
