Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AH73B-00086J-Hs
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 19:41:13 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1067974394.6281.1886.camel@tubarao>
Mime-Version: 1.0
Date: 04 Nov 2003 12:33:14 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-ZgrhhGK+mkwKc0xgfY2z"
Subject: broken cfi_cmdset_0001.c
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZgrhhGK+mkwKc0xgfY2z
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

A while ago I committed an "improvement" to cfi_cmdset_0001.c that would
skip writing a cfi_word if it was identical to what was already
written.  Apparently, even though I thought I had, I didn't test this.=20
This resulted in cfi_cmdset_0001.c r1.131 being horribly broken.  Please
use r1.130 or r1.132.

My apologies.

--=20
Thayne Harbaugh
Linux Networx

--=-ZgrhhGK+mkwKc0xgfY2z
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/p/76fsBPTKE6HMkRAiHnAJ0diUCcCGSnYUVLoyLD3sHNysa0HwCeMZ0o
12Sj4Va+JXh3Kz1cmaDs16c=
=Ce05
-----END PGP SIGNATURE-----

--=-ZgrhhGK+mkwKc0xgfY2z--
