Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKQg8-0006Vo-RA
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2003 23:15:09 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1068764764.14277.21.camel@tubarao>
Mime-Version: 1.0
Date: 13 Nov 2003 16:06:04 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-IZzn61O426o9irwOnwmg"
Subject: license needed in map_funcs.c
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IZzn61O426o9irwOnwmg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

drivers/mtd/maps/map_funcs.c needs an appropriate MODULE_LICENSE()
entry.  I'd just throw in MODULE_LICENSE("GPL"), but I don't want to
make an assumption about code I haven't authored.

--=20
Thayne Harbaugh
Linux Networx

--=-IZzn61O426o9irwOnwmg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/tA5cfsBPTKE6HMkRAqjOAJ908Ft6spctQn69+J9w9vjYA/n0HgCdGXNA
QqOgff5u0wy8c6Cycf5m4GU=
=bhRM
-----END PGP SIGNATURE-----

--=-IZzn61O426o9irwOnwmg--
