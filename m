Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeO4A-0005ol-06
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 09:06:42 +0000
Date: Wed, 6 Jul 2011 11:06:37 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: =?iso-8859-15?Q?J=FCrgen?= Lambrecht <juergen.lambrecht@gmail.com>
Subject: Re: [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block
	Indicator, and use for imx27pdk nand support.
Message-ID: <20110706090637.GA2117@pengutronix.de>
References: <1309872828-13942-1-git-send-email-J.Lambrecht@televic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <1309872828-13942-1-git-send-email-J.Lambrecht@televic.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +	temp1 =3D *((volatile unsigned short*)(host->main_area0 + 0x7D0));
> +	temp2 =3D *((volatile unsigned short*)(host->main_area0 + 0x834));
> +	new_temp1 =3D (temp1 & 0xFF00) | (temp2 >> 8);
> +	temp2 =3D (temp2 & 0x00FF) | (temp1 << 8);
> +	*((volatile unsigned short*)(host->main_area0 + 0x7D0)) =3D new_temp1;
> +	*((volatile unsigned short*)(host->main_area0 + 0x834)) =3D temp2;

Please use proper io-accessors and no magic values in V2.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4UJZ0ACgkQD27XaX1/VRvKYACgjuDdKz22hLeWau3GNQbuROtI
xVUAnRrRZFDEg2JIzU+JFquAxbvxvEqa
=CM8I
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
