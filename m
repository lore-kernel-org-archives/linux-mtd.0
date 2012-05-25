Message-ID: <1337964907.30969.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd mxc_nand: move ecc strengh setup before
 nand_scan_tail
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 May 2012 19:55:07 +0300
In-Reply-To: <1337955762-19157-2-git-send-email-s.hauer@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <1337955762-19157-2-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7AhIWqJ7X8Jqiiq47ekF"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7AhIWqJ7X8Jqiiq47ekF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 16:22 +0200, Sascha Hauer wrote:
> Since this commit:
>=20
>   commit 6a918bade9dab40aaef80559bd1169c69e8d69cb
>   Author: Mike Dunn <mikedunn@newsguy.com>
>   Date:   Sun Mar 11 14:21:11 2012 -0700
>=20
>      mtd: flash drivers set ecc strength
>=20
> The mxc_nand driver fails with:
>=20
> Driver must set ecc.strength when using hardware ECC
>=20
> This is because nand_scan_tail checks for correct ecc strength
> settings, so we must set them up before nand_scan_tail.

Pushed this one to l2-mtd.git as well, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-7AhIWqJ7X8Jqiiq47ekF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv7lrAAoJECmIfjd9wqK0SpsP/3uOyb1qeMwTdGrzo0tXrMiu
WLPayv1eNXUqJYfor7ZTuPINW20IoUxIvRujEnM9b/FuOkNXI0HxC1ItmLmbyHeL
Gjxl3cXsXeud6aRHy8jAJ1uAaCnLdxRMOeeRfAPYJKm50LxaAs7PXqrOqI0ODN9A
OX7v7fWC/+9oFGD8gI9xg7lhQhQsovEcPC42BUv4osXlUNl132jsC+ipYdmniVtR
kdYEcXYE+OC4MVkgDmqdPATjuKmSCg2ZmMsXDRo4ksD7GiRs3g30qQBNHhR+eS6d
YgcByD4L2guBTUVBzKshDrCDTt2ubnEew8LwnKGyux06k9fiTblRXoq41GFqdfHH
XwDT3itpAF+nkCeZ6RJZTblcEIELsZ26ROpXfjSpwJogHXJevRt1GjyiAxVojxYb
HRkoZ1b/yxGgsHN7kCxqRjK4J8yO3N2jA6ZEramopix8JiNybHNuADC3LcK7pNvg
yqHitRo6hqw1ZvdFzacTDNoCNsmVpJRzIoQ7tehvg/lw9e6iSD3PH7cgNfY8/AUI
orzE8NUsGHSgDNldC7NFzIGHY6H8kJ84degoJPjeHhkkUQcnRGe2i2cKSSFuQc5r
XQOOmaurDBPPAv475tXCeORdDkaqTGffonE0U9VOZZGq1aru4Ciji4OzAGzlZ0su
Jnxn598L2shl3vx4V49w
=m9RB
-----END PGP SIGNATURE-----

--=-7AhIWqJ7X8Jqiiq47ekF--
