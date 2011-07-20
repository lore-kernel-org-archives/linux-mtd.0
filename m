Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjSVS-0006tf-4I
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 08:51:55 +0000
Date: Wed, 20 Jul 2011 10:51:42 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
Message-ID: <20110720085142.GA2377@pengutronix.de>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E24E804.10002@freescale.com>
	<20005.7677.145955.789329@ipc1.ka-ro>
	<4E252C51.8070900@freescale.com>
	<20005.21635.427202.49313@ipc1.ka-ro>
	<4E263AF2.60103@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <4E263AF2.60103@freescale.com>
Cc: linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
	linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>>>>I am debugging the DMA bug now. and I will send it out when i fix it.
> >>>>>
> >>>>What sort of DMA bug?
> >>>>
> >>>The DMA may time-out. :(
> >>>
> >>>The DMA time-out may occur in two situations:
> >>>[1] send a command DMA descriptor, see the nfc->send_command() functio=
n.
> >>>[2] read the non-ecc data from nand, see the nfc->read_data() function.
> >>>
> >>>I don't know why. Maybe caused by the timing, or something else.
> >I am confused. The send-command DMA timeout prevents any write for me.
> >You guys surely would have noticed if you have been bitten as well. Does
> >it depend on the NAND chip?
> I think It does not depend on the NAND chip.
> My test chip is Samsung K9G8G08U0M.
> Sometimes, I can run a long time while there is no DMA timeout occurring;
> Sometimes, the bug appears right away.

For me, the bug always happens right away. So, if you need logs or debug
output or can give me a pointer into some direction, I am glad to
assist.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4mlx4ACgkQD27XaX1/VRsavQCbBlB1WQ8zdVEfYv7oF5NkNG6k
y0UAnil8V+5dAnrNfJv1qGuf4pJc5WE6
=HOum
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
