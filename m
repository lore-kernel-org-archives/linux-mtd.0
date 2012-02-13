Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwx64-0007Xe-On
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 14:41:43 +0000
Date: Mon, 13 Feb 2012 15:41:26 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH] mtd/gpmi : add gpmi support for mx6q
Message-ID: <20120213144126.GB9537@pengutronix.de>
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>
 <1329134454.22240.114.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <1329134454.22240.114.camel@sauron.fi.intel.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Please, let me know how I can compile-test this. This diver depends on
> imx23 or imx28 and I cannot find a defconfig for these. When I select
> MXS platform the compilation fails. Could you please describe some way
> to generate a compilable configuration which would include this driver
> as well, or send me the defconfig file.

I can't tell about MX6, but the defconfig for mx23/28 is called
mxs_defconfig.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk85IRYACgkQD27XaX1/VRuiUQCdHk16URJ7I6uztpdMPpgu3+eK
QxQAnixCCUr6l42BWPxmolvTc/TcNIt7
=Bi+J
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
