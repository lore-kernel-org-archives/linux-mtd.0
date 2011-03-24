Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2fyZ-0006Hx-Qv
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 08:33:04 +0000
Date: Thu, 24 Mar 2011 09:32:44 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Jason Liu <liu.h.jason@gmail.com>
Subject: Re: [PATCH 5/7] add GPMI support for imx28
Message-ID: <20110324083244.GA2169@pengutronix.de>
References: <1300239773-4222-1-git-send-email-b32955@freescale.com>
	<1300239773-4222-6-git-send-email-b32955@freescale.com>
	<19848.39439.380861.195051@ipc1.ka-ro>
	<4D8964F4.3070104@freescale.com>
	<19850.2584.566366.251874@ipc1.ka-ro>
	<4D8AB490.30408@freescale.com>
	<19850.62451.678409.328798@ipc1.ka-ro>
	<AANLkTinjqAcCmQRdAxL+SS0LPVrRUpVBkEJmw0ZDccnq@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <AANLkTinjqAcCmQRdAxL+SS0LPVrRUpVBkEJmw0ZDccnq@mail.gmail.com>
Cc: linux@arm.linux.org.uk, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> If you do NAND support with many customers, you will find that
> currenly linux NAND driver
> (nand_base.c/nand_ids.c) provide very poor support for that.

Then what about improving that instead of doing a private layer?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk2LAawACgkQD27XaX1/VRu/DQCgq392jowweVgn4Lk4N2lhx1uJ
4sUAoMa3dtZVAS5tgxKcA3ddoKaF5H3w
=K4XE
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
