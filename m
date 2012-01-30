Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrr8p-0003jF-Qo
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 13:19:29 +0000
Date: Mon, 30 Jan 2012 14:19:13 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130131913.GE15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130104428.GB15596@pengutronix.de>
 <4F267F21.1030204@freescale.com>
 <201201301324.13962.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline
In-Reply-To: <201201301324.13962.marek.vasut@gmail.com>
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


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The mainline incarnation of this should be able to work with the BBT just=
 fine.=20
> You can give it a go, mx28evk (the freescale kit) is supported.

Did you test? I can't find any NO_OOB option in the code. Not that you
lose the BBTs...

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mmNEACgkQD27XaX1/VRuU9gCfT+mtCAfj2Lf85PhzcYhsdsV2
J0UAn3HJrblkOuaMpQlDAW0Gu0UpJprK
=b/bD
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
