Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URXGZ-0005Ts-49
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 00:27:28 +0000
Message-ID: <1365985630.2783.90.camel@deadeye.wl.decadent.org.uk>
Subject: [stable] mtdchar: fix offset overflow detection
From: Ben Hutchings <ben@decadent.org.uk>
To: stable@vger.kernel.org
Date: Mon, 15 Apr 2013 01:27:10 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-auWIEDmdHRDwG+KwV5zH"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brad Spengler <spender@grsecurity.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sasha Levin <levinsasha928@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-auWIEDmdHRDwG+KwV5zH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Brad Spengler pointed out this fix from 3.6 was missing from the earlier
stable branches:

commit 9c603e53d380459fb62fec7cd085acb0b74ac18f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Sep 8 12:57:30 2012 -0700

    mtdchar: fix offset overflow detection

It looks cleanly cherry-pickable, although I haven't yet tested this.

Ben.

--=20
Ben Hutchings
The first rule of tautology club is the first rule of tautology club.

--=-auWIEDmdHRDwG+KwV5zH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUWtJXue/yOyVhhEJAQoCyQ//ZxVOrdyeu/lesofRq4qaxzgb9Hwh7NXK
yALObuOlhH3Xbr01o+dgNjT1llsKateO386j3WAkSLIo+714mzjGrqsZagyx9mxo
lRzbhDjCbNOsP6ZCq3hsS45e6EwWocTYPMTgZ57J/Fatz8qCWP65Tc+OYUf9dzEC
oCHpXJ3RcbSEzLtxpLi92UZOvm8uw4Xn2bF9HbY05NkTqXXKWIHdaN9N9x6u9hip
aGs3TJK0vhq9wzbSF+JkdSm3XCVHsvLWlJKomibHbY6SDjff66cUpknyCwCcaS5q
L+v+pktxlWHOaEWgLsfFO86NQtRrNsDyMPcrHm954ceY638E8enNJBuojAuHX+iL
itLWyX1U3cZFkYj6ayeQF4m8H/ehcEehCHNrm2gVv8ncEYl0idcAgZW0Jem0EyW/
hHAjhCLARscdFY5TZyJiGNkjhrkdSFCHKsxV+QfPdddRZn3fH84DEH34PlSGh23L
Rk/CpzcWL8W0dCLJJF8r1lRVNVcUHd+mHldgYczs5a7PgQkEorQg4O7tzpqYifiT
BkgU3DQaL4Ip/xCnMIRwoQESJyLQibql20iJBB3OFdPaWSc7FxFSnR4bmpyST3wd
EqZWPLx7U2GTsqweYKUXXsF4307/O4NOuKXx1BXUROD1uNALyZtzXTqnNkhlbwuc
xc9QVL4zz14=
=CYpv
-----END PGP SIGNATURE-----

--=-auWIEDmdHRDwG+KwV5zH--
