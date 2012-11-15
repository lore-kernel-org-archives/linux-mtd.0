Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYzge-0004LX-Bx
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 13:40:59 +0000
Message-ID: <1352986893.2221.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH for 3.7] mtd: nand: fix Samsung SLC detection regression
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 15 Nov 2012 15:41:33 +0200
In-Reply-To: <1352958390-15553-1-git-send-email-computersforpeace@gmail.com>
References: <1352958390-15553-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eiz43cbmLQnAklKq6AS0"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eiz43cbmLQnAklKq6AS0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-14 at 21:46 -0800, Brian Norris wrote:
> This patch fixes errors seen in identifying old Samsung SLC, due to the
> following commits:
>=20
>     commit e2d3a35ee427aaba99b6c68a56609ce276c51270
>     mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID
>=20
>     commit e3b88bd604283ef83ae6e8f53622d5b1ffe9d43a
>     mtd: nand: add generic READ ID length calculation functions

I've added this patch and the other fix to my l2 tree, and will bug
dwmw2 about merging this, before it is too late.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-eiz43cbmLQnAklKq6AS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpPENAAoJECmIfjd9wqK0BuAP/A1WAcCLsFqVPbCGTUPtz37U
GB82wL4afPL065VeaJ+Udt1U2Pu5a53zkYFAsgpisyndSaGpjjrr225Uq0Y9ZcXJ
WqJNMTQrKt587NYmggDeqW3gCjZQdwsHnY/P/c11agzCw1jo4t0YgZWHzRImyMIv
UeeSLiSmeLjUyTqYBPe8hbOBJJuAgI+PhUyHEZYqFCdGzCApyDK3Y2DKr3z3m71/
wSjkHEjYDEjgDqYZPRVYCklyzkc0AazpHzNT44p3aznA5T2QZd4fgYqovFSXsU8g
iyAoP/HG1g1YjFt9Yk9RkMXKj8mUh+dFfpB8/svd5NJvVQpAA6W5a28zmENhDkB3
VwIO5XKeNeHQsCDpDZyUhb5AHvKfEdRFsCk10+soKk1GUBiw5EHm4U+e2X872rkB
L+H/rM8X7nGkmVfln1JprVpXUQs/Yqg04hsT8nmTkyEgX8VGN1WP73C6m5ITP6aY
tBqr1gl7HrrrdmzhOMJqGRxzvA8HD6sOyv7nYzXuPXbJ9YC7o4GEIeS80TEzrT2/
bbME4GhceIF3YAaA3Nd2+0dp6VYpwTW9E9NBOcoE7VRATWDcb7TUxDdy9JylXrS7
yy7dmBImscKuuZqMtU3/qiFORoIwMSOhi/sKfJy9hqLZFtConkVvfg5Q9uxDurRW
LO5+r7cx+cor9AR57Zn9
=YAjI
-----END PGP SIGNATURE-----

--=-eiz43cbmLQnAklKq6AS0--
