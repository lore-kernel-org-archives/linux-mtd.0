Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZGTl-0000K6-2K
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 07:36:45 +0000
Message-ID: <1353051431.3618.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] ubi-test/io_update: ubi_leb_change_start() no
 longer uses 'dtype'.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Fri, 16 Nov 2012 09:37:11 +0200
In-Reply-To: <BLU0-SMTP90A53F512B3AC4BEA5374B8640@phx.gbl>
References: <BLU0-SMTP90A53F512B3AC4BEA5374B8640@phx.gbl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KCUr++VAmamcZyw29vro"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KCUr++VAmamcZyw29vro
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-05 at 12:38 -0500, Bill Pringlemeir wrote:
> This will not compile for me (due to bit rot?).  Maybe the program is
> never used?
>=20
> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>

It was used, but recently the dtype stuff was removed and the test was
not amended. Thanks, pushed to mtd-utils.git.

--=20
Best Regards,
Artem Bityutskiy

--=-KCUr++VAmamcZyw29vro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpe0nAAoJECmIfjd9wqK0MWQP/2SPMU8rWg5SdhuzzdmbPWeV
UUXsBwobQluh5ixOADWzWmW4A5n8ajndYfBgUOIcnwJ2qhasyfiUjJy8zETOVOv9
uzXW3/eFz7W34g8C9opLfmQQNSfxrA7+za6COvB/j3ZYW7S5MFi/I5bRKdmqi9YG
iIFYNcmhlGUd/JUEojnN7CymqoeH6CqTTxfWkZpjsfI7DRyUw9gP8mPs7kbGLbLK
ya8hLRLE9COftvuIQTFx+pEhyQoP6BH51bAfdTKDhYS6P33lA2IKhUsQoEvsS9J/
2aJ5u+AWHkizrL+TlcEgbwbPz2rreFILXcd1+X6/h1Dpu1JtgufeaX4yNLNjJhQH
Q/jJQTlymq3RrPdmYBKZoA6BfcQRE3jmVBioMblpWcPrNcrigRUh2SGXjEZwo0Fz
0hPzHREl0gE8eJN42iObgZwPWsXwrV6OgEmA2e8ax6achLi432DvtseQ2EzErIEs
E7xPaLLbTtW9p6TEm1lIp9WoyBcLp27bwSUyjWgnm6DM326soHxVIKG/0zgjN98M
ybKy/m/DL0ANu078kply7oOGXbx/5oGKjufKX8AZe14blOZr4aOhy3cZsUufG+aY
B0+Cj8nlK5GG4vpbrRsLgShVfmWUVjUUzZcCS/ZIGWekQWdx1efJ8kq3rI9wFnRi
GigwTWv+gpU+vOa38ISQ
=YnX4
-----END PGP SIGNATURE-----

--=-KCUr++VAmamcZyw29vro--
