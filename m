Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcYfw-00055s-J2
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 08:02:09 +0000
Date: Fri, 1 Jul 2011 10:01:58 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Message-ID: <20110701080158.GB1922@pengutronix.de>
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
	<19980.36638.134045.743619@ipc1.ka-ro>
	<201107010022.26597.arnd@arndb.de>
	<20110701060356.GA27039@pengutronix.de>
	<4E0D7CE9.2030209@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <4E0D7CE9.2030209@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, s.hauer@pengutronix.de,
	thierry.nolf.barco@gmail.com, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
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


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2011 at 03:53:13PM +0800, Huang Shijie wrote:
> Hi:
> >Hi Arnd,
> >
> >>If you really want to call out obsceneties, how about the fact that this
> >>driver comes with an 805 line patch to add a HAL for a single chip!
> >>
> >>Such abstractions should not be introduced as long as there is only
> >>a single instance of the hardware.
> >If I understood correctly, most if not all upcoming i.MX will have the G=
PMI
> >(mx50, mx6). Huang, do you already have a draft for the mx50-hal?
> >
> I have finished the code for mx50's GPMI.
> And I am coding for the MX6's GPMI recently.
>=20
> I need a separate mx50-hal (or mx60-hal) to make the code tidy.
> The MX50 and mx60 support ONFI NAND and TOGGLE nand(which mx23/mx28
> do not support),
> they need a long code to initialize the TIMING register. What's
> more, the READ/WRITE functions
> are different from the mx23/mx28.
>=20
> Frankly speaking, I can merge the mxs-hal.c file to the gpmi-nfc.c,
> but don't you think it too
> messy?

Is it possible to post the mx50 code (as RFC with a note saying that it
is not ready yet and is not intended to be merged) so we can see better?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4NfvYACgkQD27XaX1/VRuk7gCbBJY2I5EJXoXJdFjnmR5gIXgA
j0kAn3UPCP6Sw4q5Dr5AgwmBy4o6Kb0u
=qWc1
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
