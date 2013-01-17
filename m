Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvpdP-0004iF-1E
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 13:35:59 +0000
Message-ID: <1358429847.2731.251.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 1/2] mtd/uclinux: support ROM and allow passing the
 base address
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Thu, 17 Jan 2013 15:37:27 +0200
In-Reply-To: <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-T+7E9Gwq2QVN9B7XO5Yy"
Mime-Version: 1.0
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-T+7E9Gwq2QVN9B7XO5Yy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-16 at 15:36 +0100, Uwe Kleine-K=C3=B6nig wrote:
> This allows to put the filesystem at a defined address in ROM allowing
> to save more precious RAM.
>=20
> I think it's safe to default to ROM because the intention of using the
> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> that mtd-rom doesn't.

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-T+7E9Gwq2QVN9B7XO5Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9/6XAAoJECmIfjd9wqK0vE4QAJPFxnY/zrbmuC1OtF8+M4w7
tAULqQ+APjy2Kd2fYdVfcabKekMd4BJow4ae7gnkOb+pCfk89VVZoD/J7w1fYX/i
7sdNV3N3yHBIoDP8s8gZ7y/LDK6kjaHNHVixzXTbrjNIMFwIyYK3iWYIaIY3vlwY
cOe4SxWB0RJUa8AE73ypKsHDwOSbBozWmDWJ1Cup52PluJakQtXXtdOph8gDN2xZ
VUhvG4P/3shxTtzmHpx+xAdPIN8TIGFRsWUPG/vWIpgx6SwmgyI6uAAjpVOQCW7r
4jds5rWG6IHQLq+wKx76qcJeOUj6Itm4U3sri4A/Qr9VZAkom2IVVgOgoRe8T6Sc
CBLsIwt0LvTQ8QuWHcisY6hK5+1EzW8afsHF9rFfXAMGuvgYNMgdOzF1qYQw0kbJ
j7NtdfLgQI6gIEfFHrbGh6h7NijMWWikfi9QMyPTttVe1kdDLRahLVQFd4mR7gR5
huJhl0rRCnaxJ+fwc5e1rNHRL+6beNLgaaEM8gquNqoB5v6INJVN3FSsBRd2JAoF
fejBxeTqyZXzarXt21SUutoyeGdKpJRK3vCSCh5Z/MCplBQO+7SNjy6aWzGlm0xt
Qh0qUNbWOMeySzzrw7cYlXKP3zPnOCVnuyWp9G1VXwKtuxOYxVmxX9L0Dgiy/tsn
xwbfxn0bJ8ZzuJGz2eSU
=2nsy
-----END PGP SIGNATURE-----

--=-T+7E9Gwq2QVN9B7XO5Yy--
