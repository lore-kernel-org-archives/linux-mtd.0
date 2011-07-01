Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcWpk-0002j1-EB
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 06:04:09 +0000
Date: Fri, 1 Jul 2011 08:03:56 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Message-ID: <20110701060356.GA27039@pengutronix.de>
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
	<19980.36638.134045.743619@ipc1.ka-ro>
	<201107010022.26597.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <201107010022.26597.arnd@arndb.de>
Cc: s.hauer@pengutronix.de, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> If you really want to call out obsceneties, how about the fact that this
> driver comes with an 805 line patch to add a HAL for a single chip!
>=20
> Such abstractions should not be introduced as long as there is only
> a single instance of the hardware.

If I understood correctly, most if not all upcoming i.MX will have the GPMI
(mx50, mx6). Huang, do you already have a draft for the mx50-hal?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4NY0wACgkQD27XaX1/VRsuewCgm+mVMJPHU1M3+LdYYfYq1g31
gnoAnjcFetcZCQh28oQiUZcmTl8iw1jZ
=2JDc
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
