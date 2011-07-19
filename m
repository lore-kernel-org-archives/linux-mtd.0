Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjAT5-000264-3a
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 13:36:19 +0000
Date: Tue, 19 Jul 2011 15:36:02 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
Message-ID: <20110719133602.GJ1951@pengutronix.de>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E24E804.10002@freescale.com>
	<20005.7677.145955.789329@ipc1.ka-ro>
	<4E252C51.8070900@freescale.com>
	<20005.21635.427202.49313@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sT9gWZPUZYhvPS56"
Content-Disposition: inline
In-Reply-To: <20005.21635.427202.49313@ipc1.ka-ro>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--sT9gWZPUZYhvPS56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > >> I am debugging the DMA bug now. and I will send it out when i fix it.
> > >>
> > > What sort of DMA bug?
> > >
> >=20
> > The DMA may time-out. :(
> >=20
> > The DMA time-out may occur in two situations:
> > [1] send a command DMA descriptor, see the nfc->send_command() function.
> > [2] read the non-ecc data from nand, see the nfc->read_data() function.
> >=20
> > I don't know why. Maybe caused by the timing, or something else.

I am confused. The send-command DMA timeout prevents any write for me.
You guys surely would have noticed if you have been bitten as well. Does
it depend on the NAND chip?

> Maybe you are missing this patch:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2011-April/049105.h=
tml
> I sent it in April, but apparently it has not been integrated in
> mainline or the pengutronix git.

Well, just resend them; might be worth trying Shawn's comment, too (if
that reset is really needed). BTW they didn't help for my case :(

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--sT9gWZPUZYhvPS56
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4liEIACgkQD27XaX1/VRtdeQCgrjNW1ZIcB3y3GjPtqNV5/Rol
zP4An1cydWBQzx8pN0nC0HxNttIXz3mw
=G6e/
-----END PGP SIGNATURE-----

--sT9gWZPUZYhvPS56--
