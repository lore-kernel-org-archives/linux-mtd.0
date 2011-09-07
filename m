Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1FeJ-0003o3-Fd
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 10:46:33 +0000
Date: Wed, 7 Sep 2011 11:59:07 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v11 1/3] MTD : add the common code for GPMI-NAND
	controller driver
Message-ID: <20110907095907.GB1912@pengutronix.de>
References: <1314616381-11615-1-git-send-email-b32955@freescale.com>
	<1314616381-11615-2-git-send-email-b32955@freescale.com>
	<20110905151752.GA10987@pengutronix.de>
	<4E65F69D.5010808@freescale.com>
	<20110906141708.GJ2610@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <20110906141708.GJ2610@pengutronix.de>
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2011 at 04:17:08PM +0200, Wolfram Sang wrote:
>=20
> > Should i wait for your test result, and send out the new version v12?
> > or I send out the new version first, and then you test it again?
>=20
> I'd suggest you send V12 and I will test it when NAND is on my list
> again. I need to bring up this board first before I can do further
> testing.

Maybe you could also remove the debug log level mechanisms? We have
DYNAMIC_DEBUG to select debug output these days...

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5nQGsACgkQD27XaX1/VRvHWwCggFxoh1iaibl4SXYxzj2gV89W
rc0AoKdoOGye1IKRWML5Ia55lPuqQEyD
=QDYy
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
