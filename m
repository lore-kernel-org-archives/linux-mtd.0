Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMFpi-0002m7-Dk
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 10:17:39 +0000
Message-ID: <1349950670.12014.3.camel@sauron.fi.intel.com>
Subject: Re: nand/denali: split the driver into 3 parts: generic, PCI and DT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: dinguyen@altera.com
Date: Thu, 11 Oct 2012 13:17:50 +0300
In-Reply-To: <1348765086-27286-1-git-send-email-dinguyen@altera.com>
References: <1348765086-27286-1-git-send-email-dinguyen@altera.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oBbAlu2Oe9W/qpBv5Ryc"
Mime-Version: 1.0
Cc: dinh.linux@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oBbAlu2Oe9W/qpBv5Ryc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-27 at 10:58 -0600, dinguyen@altera.com wrote:
> Hello,
>=20
> The following 2 patches attempts to make the current Denali NAND controll=
er,=20
> which is PCI-based, to be both PCI and device tree drivers.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-oBbAlu2Oe9W/qpBv5Ryc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdpzOAAoJECmIfjd9wqK05V8P/AtCIkFayWCPaPHwv6LWeqhN
qWNMnCG+iItXYuuDmMZF8AWr532PjcKkdlho0AehzlcRSvbYDO/4168ggp2gREYG
wvH2OYR21Ii2n4UHDntB7Sn9LoQgQ1sbSqnkYs8tCbF8wAx+IlbgwnFu4uUhII8i
uWGWUm7th6z8463wj/FYFKQEjVq/T7pmBAD29LY9MfSBvG+cU6w+4Xdv/k4hTLRW
ozFOcwYBUxN0gR82tClM00jcaSk1z7W9MoeW35gWg5/PCUTA9ooYS0F73qctmFrw
/0VUJEveAjOzOHUBKdG2vp4TK0a/dmgj97WVfjDq7xUGZGM8roX6G+KeaRqTEvX1
cRaX+d+7RERnRFeHCC++PJTT8Fj9BMY7UWt/o5AW3eDx+iMWaCMmIN5uBwNLaRNl
1wSh1JWHkzhiV8wpByGYNY9RVsjp/IpIE7UA6RsD9Mo8hsnEcRFTGLWBN55TlY5w
vhNGeByrUnzFIgbv7tTFUklKOhi7BOCvsC2LM+DzJXsUWfjsT6dSfrorj5yIDRSE
co/OKuEwTGvD4epxQn+nYulm2/VVbE0UQzNQaK3VVlxFVN0rDTDtT9DF5eibBwAp
aI92gjAkAkw3O5r8VHo7W7LedcOuRHXKQ/EcRYw/nREW4C7aU6YunQzrUnAZOE/h
BGlM0z8vUFtW/XksaYRc
=f5v6
-----END PGP SIGNATURE-----

--=-oBbAlu2Oe9W/qpBv5Ryc--
