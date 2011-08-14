Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QsfTc-00029g-TH
	for linux-mtd@lists.infradead.org; Sun, 14 Aug 2011 18:32:01 +0000
Date: Sun, 14 Aug 2011 20:31:48 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110814183148.GA22576@pengutronix.de>
References: <20110805135133.GA26981@pengutronix.de>
	<20110814081139.GD17063@parrot.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20110814081139.GD17063@parrot.com>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > problem overwriting all-0xff data in NAND [2]
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Although it occured only when writing JFFS2 images so far, this is a ge=
neric
> > issue and needs to be fixed, right?
> >=20
> >=20
> (...)
> > [2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037104.html
>=20
> As explained in the thread linked above, this issue should be fixed in yo=
ur

Yup, Huang pointed me already to the part I got wrong.

Thanks.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5IFJQACgkQD27XaX1/VRu/4gCgiwhOI+jvRqvTR86sjfslAbNA
IwQAoLrwdMjWTSBfgohipy567REsyT+1
=lvpR
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
