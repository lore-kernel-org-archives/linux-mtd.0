Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QfGOc-00048O-Du
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 19:07:27 +0000
Date: Fri, 8 Jul 2011 21:07:22 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 1/4] ARM: mxs: add GPMI-NAND support for imx23/imx28
Message-ID: <20110708190722.GA16490@pengutronix.de>
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <1310102885-4102-2-git-send-email-b32955@freescale.com>
Cc: arnd@arndb.de, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Huang,

> diff --git a/arch/arm/mach-mxs/include/mach/gpmi-nand.h b/arch/arm/mach-m=
xs/include/mach/gpmi-nand.h
> new file mode 100644
> index 0000000..f1cf565
> --- /dev/null
> +++ b/arch/arm/mach-mxs/include/mach/gpmi-nand.h

I am also mostly happy with it now :)

Assuming the above file will be needed by mx50/mx6, too, would it make sens=
e to
put it to include/linux/mtd/gpmi-nand.h right from the beginning?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4XVWoACgkQD27XaX1/VRtlWQCgxlUMSYZqcqgzQQNrhI7UyniY
RSsAoJZeW6wT82zxn0QORBJglkiGH+gv
=bYGJ
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
