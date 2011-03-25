Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q397B-0002Q5-F5
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 15:39:54 +0000
Date: Fri, 25 Mar 2011 16:39:48 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [ PATCH V2  0/7] add the GPMI controller driver for IMX23/IMX28
Message-ID: <20110325153948.GE3302@pengutronix.de>
References: <1301048581-21321-1-git-send-email-b32955@freescale.com>
	<19852.46690.924051.229009@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <19852.46690.924051.229009@ipc1.ka-ro>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Further the 'RSVD' entries should be removed from the register
> definitions (even if they are generated from the XML).

Even more, all unused defines should go.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk2Mt0QACgkQD27XaX1/VRvJfwCgiuOdpdCPkPAT/w28axdhNyQR
JzMAoL3ZKzG16AOID1dfmSXYyqdxVzsT
=la9+
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
