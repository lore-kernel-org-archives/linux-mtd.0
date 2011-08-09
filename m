Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqis7-0002TS-JK
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 09:45:17 +0000
Date: Tue, 9 Aug 2011 11:45:09 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Koen Beel <koen.beel.barco@gmail.com>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110809094509.GC1923@pengutronix.de>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3F8087.6070206@freescale.com>
	<CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Could also be useful to make sure we test on the same HW as much as
> possible and are using the same source tree.
> HW I have:
> - mx23evk rev C1
> - mx23evk rev B2
> - own target hw using mx23 lqfp-128 chip and different type of ddr and na=
nd.

Actively used:

FSL MX28EVK Rev. D
Karo TX28-4020 with STK5

Could get:

two custom MX23 boards (though I don't think this will make a
difference)

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5BAaUACgkQD27XaX1/VRs/BwCgnu7iIH40Mq35D2LGun6BHfXb
AlkAoLv02g3KkPWGXZ8b2eSnIG5DDtpC
=zXgC
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
