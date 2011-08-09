Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqiT5-0001FT-H7
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 09:19:25 +0000
Date: Tue, 9 Aug 2011 11:19:06 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110809091906.GA1923@pengutronix.de>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3FA88E.4070804@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <4E3FA88E.4070804@freescale.com>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> >
> >ecclayout needs to be used to show that OOB is fully in use [1]
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >Needed to make it work for JFFS2 and to pass the mtd-testsuite. A driver=
 only
> >working with UBIFS is surely not ready for mainline.
> >
> It seems just modifying the ecclayout of GPMI-NAND can not fix the proble=
m.
> It should also change the code of JFFS2 and mtd.
>=20
> Some one ever posted a patch about this:
> http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html

This mail is about MLC. That's another issue. For SLC, ecclayout should
work, no?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5A+4oACgkQD27XaX1/VRvV7ACfXKM4YNJbSsP3Gs1sN3A+q/rr
tb4AniEfllJiTJkI3e/17PNQNYn6C2Sz
=Yb8J
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
