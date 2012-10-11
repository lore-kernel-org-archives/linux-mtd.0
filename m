Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMDas-0005VN-Hs
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 07:54:11 +0000
Message-ID: <1349942063.20594.56.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Thu, 11 Oct 2012 10:54:23 +0300
In-Reply-To: <1349882785.2552.1987.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
 <1349861452.20594.12.camel@sauron.fi.intel.com>
 <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
 <1349868630.20594.16.camel@sauron.fi.intel.com>
 <1349882785.2552.1987.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-khSh0T92zkcuHAt6VW0M"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-khSh0T92zkcuHAt6VW0M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 17:26 +0200, Marcus Prebble wrote:
> which was a tad confusing. Please find attached a new diff (based off
> yours) with a few minor suggested changes.

Do you want me to fold your patch in? Or you prefer to keep it as a
separate patch? In the latter case, please, send it as a patch, with
commit message, and signed-off-by.

--=20
Best Regards,
Artem Bityutskiy

--=-khSh0T92zkcuHAt6VW0M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdnsvAAoJECmIfjd9wqK0Z6QP/A1YvnExXC4XPGyWHU3fffrp
yc4PDbuffPaUBDEW+24yWj4U9IsOSbNQqIJblB0xxrpKEgcDBqF65/SQzv3H0NMR
d55AYkPX6184LMkOUstS6/rcZd0UuD70sMPU5Tt/NbzTBIfBDQNiu83X4sX3nOQP
9bf0Pv28bk/BIs+knkIjYKjx9X8aBIUmNG19Ogkijm1lXO7U8YeEjldzmdOi6VFm
erhodKw2Av20DQXfwZ94cvl3Vkqxgf/wynYsNxMGjNUMMtsGNsrbJAbqAwny0d4r
ZJmXcaQk1jq9WosTzLfGaWHdnTSzYpUWRx++1JoutvmxlNXg2klodBA7fND2WqD0
1v86bEBSu+SNWlwNmwPhO3X7CpaW7FbPdwyOVq6ATuH7ilqzUfGY4scr354yS/DR
Dg9otcy7sh4oMjYPgmhRA9tsCci06NI0sUdO0Yr2dgj+lPQKdzPt3qKlZyFFvd/k
d1tg+2aKWkcgDk1A5FNLqMp5cgQ1H/2XXO4w7er55naColCnlRfsXnmI/gkykEn2
RTFyMaQRNyKi7wGeiJHBMGeuJTf58AYJqT6GVzVjXjhq2KURrARZtecT0MG8oP8B
FJxc0JUVHw9TtN6q1CkCr62PTbDzylUFOqMdVQcBa3l6WZQq8dZIPZsYo27bjKJ+
lTod8B+kLEqyWYEix0PS
=ytXX
-----END PGP SIGNATURE-----

--=-khSh0T92zkcuHAt6VW0M--
