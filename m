Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsCDT-00035W-Lg
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 11:49:40 +0000
Date: Tue, 31 Jan 2012 12:49:29 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120131114929.GN2471@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <4F27AA98.2090602@freescale.com>
 <20120131092412.GA2471@pengutronix.de>
 <201201311237.33997.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="4OpS+d6oOtUQaRm1"
Content-Disposition: inline
In-Reply-To: <201201311237.33997.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--4OpS+d6oOtUQaRm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Actually it's not board specific. You can run various bootloaders or vari=
ous=20
> bootstrap tools on any of those boards. Though pdata seems ok for the def=
ault=20
> case, maybe we should have a simple way to override this?

You mean you want to switch to/drop the BBT if you want to? On MX23,
this can be easily a very dangerous thing to do. What's the use case?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--4OpS+d6oOtUQaRm1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8n1UkACgkQD27XaX1/VRtJvACfQezQn4dRnEV/QDVttsnDN5WW
1BwAn3x50p3IuxMsb07uL4OLLLeif8Wp
=+NSn
-----END PGP SIGNATURE-----

--4OpS+d6oOtUQaRm1--
