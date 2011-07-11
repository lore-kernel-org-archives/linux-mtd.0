Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QgEE0-0001VC-9v
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2011 11:00:29 +0000
Date: Mon, 11 Jul 2011 13:00:24 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 0/4] add the GPMI-NAND support for imx23/imx28
Message-ID: <20110711110024.GB11153@pengutronix.de>
References: <1310371266-10704-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <1310371266-10704-1-git-send-email-b32955@freescale.com>
Cc: arnd@arndb.de, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 11, 2011 at 04:01:02PM +0800, Huang Shijie wrote:

> The general-purpose media interface(GPMI) controller is a flexible interf=
ace
> to up to several NAND flashs.
>=20
> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelera=
tor.
>=20
> With the help of BCH, the GPMI controller can choose to do the hardware E=
CC or
> not.
>=20
> v6 --> v7:
> 	[0] rename RES_SIZE to GPMI_NAND_RES_SIZE.
> 	[1] move gpmi-nand.h to `include/linux/mtd/` directory.
> 	[2] remove comment for new pad control.
> 	[3] others

Could you also post a driver which is adapted to all these changes?
The series looks good now; still I want to test it a little just to make
sure...

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4a18gACgkQD27XaX1/VRsCUQCfeXzR64/uz3n97nbdrTGxH86+
3lUAmweRWjZlouL+9cdGiuu8gz4CzNhH
=CQJw
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
