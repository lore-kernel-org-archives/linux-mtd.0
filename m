Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFho-0008AR-Ev
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:40:41 +0000
Date: Sat, 29 Oct 2011 22:40:37 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] mtd: mark tests EXPERIMENTAL
Message-ID: <20111029204037.GB26851@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319533791-32605-2-git-send-email-w.sang@pengutronix.de>
	<1319920207.2126.19.camel@koala>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <1319920207.2126.19.camel@koala>
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index 4be8373..81d9b92 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -27,12 +27,15 @@ config MTD_DEBUG_VERBOSE
> > =20
> >  config MTD_TESTS
> >  	tristate "MTD tests support"
> > -	depends on m
> > +	depends on m && EXPERIMENTAL
>=20
> I am OK with this close, but I am not sure about the EXPERIMENTAL. I
> though this is used for the code which is considered to be "not ready"
> for real use, while the tests work well.

Well, yeah, it is not perfect, but the closest I could come up with
(EXPERT is a lot worse). My reasoning went a bit in the direction of
"you usually need the tests for experimental drivers".

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6sZMUACgkQD27XaX1/VRtpcQCgobTK0/gZ/zl2xqR2uJR3Ko6g
SoAAnRNVuC+lkpyu4cC3NJbkcfuUZ+oy
=QGDz
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
