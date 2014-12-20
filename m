Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2FdF-0003JI-LK
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 08:43:26 +0000
Message-ID: <54953675.1020102@rempel-privat.de>
Date: Sat, 20 Dec 2014 09:42:29 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
 "boris.brezillon@free-electrons.com >> Boris Brezillon"
 <boris.brezillon@free-electrons.com>, computersforpeace@gmail.com
Subject: should nand driver create ECC for a page after ERASE cmd?
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WO9M6jHT7Lxrurs8hOcUUX6AL6vcJn8We"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WO9M6jHT7Lxrurs8hOcUUX6AL6vcJn8We
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all,

i'm trying to pass mtd/tests for my driver.. on pagetest i fail on this
place:
http://lxr.free-electrons.com/source/drivers/mtd/tests/pagetest.c#L311

after ERASE cmd this test trying to read same page. Driver will report
ECC error on read, because erased page has no ECC data in OOB.

What is correct way to handle it?

Right now i think about fallowing scenarios:
- nand should write page filled with 0xFFs, to generate ECC. (i think it
is wrong)
- nand should check if ECC =3D=3D 0xFF.. and return other error number. (=
not
really good)
- write some oob filed to mark erased page?
- other variants?

in all cases it looks like it should be task of mtd or nand layer to
send needed request and not the task of a driver.

PS: i think it is a cause of "error -74 (ECC error) during ubiattach" in
my case.

--=20
Regards,
Oleksij


--WO9M6jHT7Lxrurs8hOcUUX6AL6vcJn8We
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSVNnUACgkQHwImuRkmbWkZugD9G9ufqVJAc3Sm8K12zki8pJ6j
xPXzcSuxjfvAikwz+DgBAIgpQP2ZjBZB/Ww/RSzBR8iZJiqEVYoNmAm84OrNPcDP
=d7ic
-----END PGP SIGNATURE-----

--WO9M6jHT7Lxrurs8hOcUUX6AL6vcJn8We--
